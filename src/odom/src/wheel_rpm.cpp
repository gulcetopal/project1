#include "ros/ros.h"
#include "std_msgs/String.h"
#include "geometry_msgs/Quaternion.h"
#include "geometry_msgs/TwistStamped.h" 
#include "sensor_msgs/JointState.h" //wheel_states
#include "nav_msgs/Odometry.h"
#include "odom/rpm.h"

#include <sstream>
#include <string>
#include <bitset>

class RPM {
public:
	RPM() {
		this->rpm_pub  = this->n.advertise<odom::rpm>("wheels_rpm", 1000);
		this->vel_reader = this->n.subscribe("cmd_vel", 1000, &RPM::velocityCallback, this);
		this->time_reader = this->n.subscribe("wheel_states", 1000, &RPM::timestampCallback, this);

		this->pi = 3.14159274101257324219;

		this->time_prev = 0;

		this->wheel_radius = 0.07;
		this->base_l = 0.2;
		this->base_w = 0.169;

		this->rpm_fl = 17313;
		this->rpm_fr = 11359;
		this->rpm_rl = 15421;
		this->rpm_rr = 13209;

		this->time_init = 0;
	}

		void timestampCallback(const sensor_msgs::JointState::ConstPtr& msg) {

		if (time_init == 0){
			this->time_const = msg->header.stamp.sec + msg->header.stamp.nsec*1e-9;

			time_init = 1;
			printf("\nTime initialized: %lf", time_const);
		}

		this->time_curr =  msg->header.stamp.sec + msg->header.stamp.nsec*1e-9 - 1649348542.376624;
		this->Ts = (this->time_curr - this->time_prev);
		this->time_prev = this->time_curr;

	}

		void velocityCallback(const geometry_msgs::TwistStamped::ConstPtr& msg){
		//calculate RPMS from v,w
		float vfl, vfr, vrl, vrr;

		vfl = (-base_l - base_w)*msg->twist.angular.z + msg->twist.linear.x - msg->twist.linear.y; 
		vfr = (+base_l + base_w)*msg->twist.angular.z + msg->twist.linear.x + msg->twist.linear.y; 
		vrl = (-base_l - base_w)*msg->twist.angular.z + msg->twist.linear.x + msg->twist.linear.y;
		vrr = (+base_l + base_w)*msg->twist.angular.z + msg->twist.linear.x - msg->twist.linear.y;

		this->rpm_fl = rpm_fl + vfl*Ts/(2*pi*wheel_radius)/(2*pi/60);
		this->rpm_fr = rpm_fr + vfr*Ts/(2*pi*wheel_radius)/(2*pi/60);
		this->rpm_rl = rpm_rl + vrl*Ts/(2*pi*wheel_radius)/(2*pi/60);
		this->rpm_rr = rpm_rr + vrr*Ts/(2*pi*wheel_radius)/(2*pi/60);

		this->rpm_msg.rpm_fl = rpm_fl;
		this->rpm_msg.rpm_fr = rpm_fr;
		this->rpm_msg.rpm_rl = rpm_rl;
		this->rpm_msg.rpm_rr = rpm_rr;

		rpm_pub.publish(rpm_msg);
	}

private:
	ros::NodeHandle n; 
	ros::Subscriber vel_reader;
	ros::Subscriber time_reader;
	ros::Publisher rpm_pub;
	odom::rpm rpm_msg;

	float Ts, time_prev, time_curr, time_const, time_init;
	float rpm_fl, rpm_fr, rpm_rl, rpm_rr;
	float wheel_radius, base_l, base_w, pi;
};


int main(int argc, char **argv) {
	ros::init(argc, argv, "rpm_node");
	
	RPM my_rpm;

	ros::Rate loop_rate(10);

		while (ros::ok()) {

			ros::spinOnce();

			loop_rate.sleep();
		}

	return 0;
}