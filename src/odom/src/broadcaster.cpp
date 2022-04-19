#include "ros/ros.h"
#include "nav_msgs/Odometry.h"
#include "geometry_msgs/PoseStamped.h"
#include <tf/transform_broadcaster.h>

class TfBroad {
public:
  TfBroad() {
    this->sub = n.subscribe("/odom", 1000, &TfBroad::callback, this);
    this->bag_reader  = n.subscribe("robot/pose", 1000, &TfBroad::realCallback, this);
  } 

  void callback(const nav_msgs::Odometry::ConstPtr& msg) {
    // set x,y
    transform.setOrigin( tf::Vector3(msg->pose.pose.position.x, msg->pose.pose.position.y, 0) );

    // set theta
    geometry_msgs::Quaternion quats;
    quats = msg->pose.pose.orientation;
    tf::Quaternion q;
    tf::quaternionMsgToTF(quats, q);
    transform.setRotation(q);

    // send transform
    br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "world", "base_link"));
  }

  void realCallback(const geometry_msgs::PoseStamped::ConstPtr& msg) {
    // set x,y
    transform_real.setOrigin( tf::Vector3(msg->pose.position.x, msg->pose.position.y, 0) );

    // set theta
    geometry_msgs::Quaternion quats2;
    quats2 = msg->pose.orientation;
    tf::Quaternion q2;
    tf::quaternionMsgToTF(quats2, q2);
    transform_real.setRotation(q2);
    br.sendTransform(tf::StampedTransform(transform_real, ros::Time::now(), "world", "base_link_real"));
  }

private:
  ros::NodeHandle n; 
  tf::TransformBroadcaster br;
  tf::Transform transform;
  tf::TransformBroadcaster br_real;
  tf::Transform transform_real;
  ros::Subscriber sub;
  ros::Subscriber bag_reader;
};


int main(int argc, char **argv) {
  ros::init(argc, argv, "tf_broadcast");
  TfBroad my_tf_broadcaster;
  ros::spin();
  return 0;
}
