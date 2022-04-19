// TO DO
// -RPM ve ticksi array olarak tanımla
// -transform rad-deg, terimsel yaz
// -yaw fix yaz 34 deg = -606 deg??

#include "ros/ros.h"
#include "std_msgs/String.h"
#include "geometry_msgs/Pose.h"
#include "geometry_msgs/PoseStamped.h" //robot_pose
#include "geometry_msgs/Point.h"
#include "geometry_msgs/Vector3.h"
#include "geometry_msgs/Quaternion.h"
#include "geometry_msgs/TwistStamped.h" 
#include "sensor_msgs/JointState.h" //wheel_states
#include "nav_msgs/Odometry.h"
#include "odom/rpm.h"
#include "odom/reset_odom.h"
#include <tf/transform_datatypes.h>
#include <tf/LinearMath/Quaternion.h>
#include <tf/LinearMath/Matrix3x3.h>

#include <sstream>
#include <vector>
#include <string>
#include <bitset>

class Odom {
public:
	Odom() {
		this->bag_reader 	= this->n.subscribe("robot/pose", 1000, &Odom::poseCallback, this);
		this->sensor_reader = this->n.subscribe("wheel_states", 1000, &Odom::wheelCallback, this);
		this->velocity_pub  = this->n.advertise<geometry_msgs::TwistStamped>("cmd_vel", 1000);
		this->odom_pub = this->n.advertise<nav_msgs::Odometry>("odom",1000);
		this->service = n.advertiseService("reset_odom", &Odom::resetCallback, this);

		this->wheel_radius = 0.07;
		this->base_l = 0.2;
		this->base_w = 0.169;
		this->gear_ratio = 5;
		this->ticks_per_motor_rotation = 42; 
		this->TPR = ticks_per_motor_rotation * gear_ratio;
		this->pi = 3.14159274101257324219;

		this->x   = 0;
		this->y   = 0;
		this->yaw = 0;

		this->vx  = 0;  //[m/s]
		this->vy  = 0;  //[m/s]
		this->vth = 0; //[rad/s]

		this->odom_x   = -0.019;
		this->odom_y   = 0.515;
		this->odom_yaw = -2.2061696;

		this->time_prev = 0;

		this->last_ticks[0] = 0;
		this->last_ticks[1] = 0;
		this->last_ticks[2] = 0;
		this->last_ticks[3] = 0;

		this->last_rpm[0] = 0;
		this->last_rpm[1] = 0;
		this->last_rpm[2] = 0;
		this->last_rpm[3] = 0;
	}

	void main_loop() {
		ros::Rate loop_rate(10);

		while (ros::ok()) {

			//printf("\nRobot orientated at %.3lf degrees", yaw);
			//printf("\n");
			//printf("\nFront ticks reading: (%.3lf, %.3lf) ", ticks[0] , ticks[1]);
			//printf("\nRear rpm reading: (%.3lf, %.3lf) ", rpm[2], rpm[3]);
			//printf("\n");

			ros::spinOnce();

			loop_rate.sleep();
		}
	}

	bool resetCallback(odom::reset_odom::Request &req, odom::reset_odom::Response &res) {

 	   res.old_x = this->odom_x;
 	   this->odom_x = req.new_x;

 	   res.old_y = this->odom_y;
 	   this->odom_y = req.new_y;

 	   res.old_yaw = this->odom_yaw;
 	   this->odom_yaw = req.new_yaw;

	  
	   return true;
	}

	void poseCallback(const geometry_msgs::PoseStamped::ConstPtr& msg) {

		this->x = msg->pose.position.x;
		this->y = msg->pose.position.y;
		
		geometry_msgs::Quaternion quats;
		quats = msg->pose.orientation;
		tf::Quaternion q;
		tf::quaternionMsgToTF(quats, q);
		double r, p, y;
		tf::Matrix3x3(q).getRPY(r, p, y);
		this->yaw = y; //transform rad-deg
	}

	void wheelCallback(const sensor_msgs::JointState::ConstPtr& msg) {
		this->rpm[0] = msg->velocity[0];
		this->rpm[1] = msg->velocity[1];
		this->rpm[2] = msg->velocity[2];
		this->rpm[3] = msg->velocity[3]; 

		this->ticks[0] = msg->position[0];
		this->ticks[1] = msg->position[1];
		this->ticks[2] = msg->position[2];
		this->ticks[3] = msg->position[3]; 

		this->time_curr =  msg->header.stamp.sec + msg->header.stamp.nsec*1e-9 - 1648570565.556021;
		this->Ts = (this->time_curr - this->time_prev);
		this->time_prev = this->time_curr;

		computeWheelVelocity(ticks);

		this->last_rpm[0] = rpm[0];
		this->last_rpm[1] = rpm[1];
		this->last_rpm[2] = rpm[2];
		this->last_rpm[3] = rpm[3];
		
		printf("\n");

	}

	void computeWheelVelocity(float curr_ticks[4]){ 
		int rpm_switch = 0;

		if (rpm_switch == 0){
			this->dx_fl = 2 * pi * wheel_radius * (curr_ticks[0]-last_ticks[0])/TPR; 
			this->dx_fr = 2 * pi * wheel_radius * (curr_ticks[1]-last_ticks[1])/TPR;
			this->dx_rl = 2 * pi * wheel_radius * (curr_ticks[2]-last_ticks[2])/TPR;
			this->dx_rr = 2 * pi * wheel_radius * (curr_ticks[3]-last_ticks[3])/TPR;

			this->v_fl = dx_fl/Ts;
			this->v_fr = dx_fr/Ts;
			this->v_rl = dx_rl/Ts;
			this->v_rr = dx_rr/Ts;

		} else
		if (rpm_switch == 1){
			this->v_fl = 2 * pi * wheel_radius * (rpm[0]-last_rpm[0]) / 60; 
			this->v_fr = 2 * pi * wheel_radius * (rpm[1]-last_rpm[1]) / 60; 
			this->v_rl = 2 * pi * wheel_radius * (rpm[2]-last_rpm[2]) / 60; 
			this->v_rr = 2 * pi * wheel_radius * (rpm[3]-last_rpm[3]) / 60;

			this->dx_fl = v_fl*Ts;  
			this->dx_fr = v_fr*Ts; 
			this->dx_rl = v_rl*Ts; 
			this->dx_rr = v_rr*Ts;
	
		}

		this->w_fl = v_fl/wheel_radius;	//((curr_ticks[0]-last_ticks[0])/TPR) * (2*pi/60) * wheel_radius; // [rad/s]
		this->w_fr = v_fr/wheel_radius;	//((curr_ticks[1]-last_ticks[1])/TPR) * (2*pi/60) * wheel_radius;
		this->w_rl = v_rl/wheel_radius; //((curr_ticks[2]-last_ticks[2])/TPR) * (2*pi/60) * wheel_radius;
		this->w_rr = v_rr/wheel_radius; //((curr_ticks[3]-last_ticks[3])/TPR) * (2*pi/60) * wheel_radius;
		
		//printf("\nV: [%f, %f, %f, %f]", v_fl, v_fr, v_rl, v_rr);
		//printf("\nw: [%f, %f, %f, %f]", w_fl, w_fr, w_rl, w_rr);

		computeRobotVelocity(v_fl, v_fr, v_rl, v_rr);

	}

	void computeRobotVelocity(float v_fl, float v_fr, float v_rl, float v_rr){
		int odom = 1;
		float v_left = v_fl + v_rl;
		float v_right = v_fr + v_rr;

		this->vx = (v_fl + v_fr + v_rl + v_rr)/4;
		this->vy = (-v_fl + v_fr + v_rl - v_rr)/4;
		this->vth = (-v_fl + v_fr - v_rl + v_rr)/(4*(base_l+base_w));

		this->twist_msg.twist.linear.x = vx;
		this->twist_msg.twist.linear.y = vy;
		this->twist_msg.twist.angular.z = vth;

		velocity_pub.publish(twist_msg);

		if(odom == 0){
			computeEulerOdometry();
		} else{
			computeRKOdometry();
		}
		
	}

	void computeEulerOdometry(){
		float new_odom_x, new_odom_y, new_odom_yaw;

		new_odom_yaw = odom_yaw + vth*Ts;
		new_odom_x = odom_x + vx*Ts*cos(odom_yaw) + vy*Ts*sin(odom_yaw);
		new_odom_y = odom_y + vx*Ts*sin(odom_yaw) + vy*Ts*cos(odom_yaw);

		odom_x = new_odom_x;
		odom_y = new_odom_y;
		odom_yaw = new_odom_yaw;

		tf::Quaternion q;
		q.setRPY(0, 0, odom_yaw);
		q = q.normalize();

		this->odom_msg.pose.pose.position.x = odom_x;
		this->odom_msg.pose.pose.position.y = odom_y;
		this->odom_msg.pose.pose.orientation.x = q[0];
		this->odom_msg.pose.pose.orientation.y = q[1];
		this->odom_msg.pose.pose.orientation.z = q[2];
		this->odom_msg.pose.pose.orientation.w = q[3];

		odom_pub.publish(odom_msg);

		printf("\nRobot is at [%.3lf, %.3lf, %.3lf deg]", x, y, yaw*57.2958);
		printf("\nRobot calc at [%.3lf, %.3lf, %.3lf deg]", odom_x, odom_y, odom_yaw*57.2958);
	}

	void computeRKOdometry(){
		float new_odom_x, new_odom_y, new_odom_yaw;

		new_odom_yaw = odom_yaw + vth*Ts;
		new_odom_x = odom_x + vx*Ts*cos(new_odom_yaw);
		new_odom_y = odom_y + vx*Ts*sin(new_odom_yaw);

		odom_x = new_odom_x;
		odom_y = new_odom_y;
		odom_yaw = new_odom_yaw;

		tf::Quaternion q;
		q.setRPY(0, 0, odom_yaw);
		q = q.normalize();

		this->odom_msg.pose.pose.position.x = odom_x;
		this->odom_msg.pose.pose.position.y = odom_y;
		this->odom_msg.pose.pose.orientation.x = q[0];
		this->odom_msg.pose.pose.orientation.y = q[1];
		this->odom_msg.pose.pose.orientation.z = q[2];
		this->odom_msg.pose.pose.orientation.w = q[3];

		odom_pub.publish(odom_msg);

		printf("\nRobot is at [%.3lf, %.3lf, %.3lf deg]", x, y, yaw*57.2958);

		printf("\nRobot calc at [%.3lf, %.3lf, %.3lf deg]", odom_x, odom_y, odom_yaw*57.2958);
	}

	

private:
	ros::NodeHandle n;
	ros::Subscriber bag_reader;
	ros::Subscriber sensor_reader;
	ros::Publisher velocity_pub;
	ros::Publisher odom_pub;
	ros::ServiceServer service;

	geometry_msgs::TwistStamped twist_msg;
	odom::rpm rpm_msg;
	nav_msgs::Odometry odom_msg;

	float TPR, wheel_radius, base_l, base_w, gear_ratio, ticks_per_motor_rotation, pi;
	float Ts, time_prev, time_curr;
	
	float x, y, yaw;
	float vx, vy, vth;
	float odom_x, odom_y, odom_yaw;

	float ticks[4], last_ticks[4];
	float rpm[4], last_rpm[4];
	float dx_fl, dx_fr, dx_rl, dx_rr;
	float v_fl,v_fr, v_rl, v_rr;
	float w_fl,w_fr, w_rl, w_rr;
	float rpm_fl, rpm_fr, rpm_rl, rpm_rr;

};


int main(int argc, char **argv) {
	ros::init(argc, argv, "odom_node");
	
	Odom my_odom;

	my_odom.main_loop();

	return 0;
}