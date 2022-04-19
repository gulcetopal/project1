#include "ros/ros.h"
#include "odom/reset_odom.h"


int main(int argc, char **argv)
{
  ros::init(argc, argv, "reset_client");
  if (argc != 4)
  {
    ROS_INFO("usage: reset_client new_x new_y new_yaw");
    return 1;
  }

  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<odom::reset_odom>("reset_odom");
  
  odom::reset_odom srv;
  srv.request.new_x = atoll(argv[1]);
  srv.request.new_y = atoll(argv[2]);
  srv.request.new_yaw = atoll(argv[3]);
  if (client.call(srv))
  {
    ROS_INFO("Odometry is reset to: \nPosition: [%lf, %lf] \nHeading: %lf deg",(float)srv.request.new_x, (float)srv.request.new_y, (float)srv.request.new_yaw);
  }
  else
  {
    ROS_ERROR("Failed to call service reset");
    return 1;
  }

  return 0;
}
