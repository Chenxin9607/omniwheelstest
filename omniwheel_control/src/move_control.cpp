#include <iostream>
#include <cmath>
#include "ros/ros.h"
#include "std_msgs/String.h"
#include "geometry_msgs/Twist.h"
#include "omniwheel_control/move_base.h"


long double L; // L means the R of the cell, which is equal to the leegth from center of the cell to the wheel 
long double sqrt3;

struct Request
{
  long double x;
  long double y;
  long double theta;
} ;

struct Response
{
  long double v_left;
  long double v_right;
  long double v_back;
};


struct Request r_from_key;
struct Response r_to_sock;

extern ros::Publisher pub;


bool inverseMobile(struct Request &request, struct Response &response) 
{
  long double V__m_x2 = - request.x / 2.0L;
  long double sqrt3V__m_y2 = (sqrt3 * request.y) / 2.0L;
  long double Lomega_p = L * request.theta;
  // long double Lomega_p = request.theta;
  response.v_left  = -(V__m_x2 - sqrt3V__m_y2 + Lomega_p);//below 3 add mnius and trans them to cell not a smartcar 
  response.v_back  = -(request.x        + Lomega_p);
  response.v_right = -(V__m_x2 + sqrt3V__m_y2 + Lomega_p);
  return true;
}


// void cmd_velCallback(const geometry_msgs::Twist& twist)   //callback函数，收到msg时调用
// {

//     // ros::Publisher pub;
//     //在回调函数中发布消息
//     //（1）把函数写成类的形式，把需要的一些变量在类中声明为全局变量。
//     //（2）在函数中，把回调函数需要调用的变量声明为全局变量。也可以解决这个问题。
//     teleop_twist_keyboard_cpp::move_base msg;

//     r_from_key.x = twist.linear.x;
//     r_from_key.y = twist.linear.y;
//     r_from_key.theta = twist.angular.z;

//     inverseMobile(r_from_key, r_to_sock);
//     msg.v_back = r_to_sock.v_back;
//     msg.v_right = r_to_sock.v_right;
//     msg.v_left =  r_to_sock.v_left;
       

//     ROS_INFO_STREAM("\nv_left:"<<r_to_sock.v_left<<"\nv_back:"<<r_to_sock.v_back<<"\n"
//     <<"v_right:"<<r_to_sock.v_right);
//     pub.publish(msg);
//     // ros::spinOnce();
// }

class SubscribeAndPublish
{
public:
  SubscribeAndPublish()
  {
    //Topic you want to publish
    pub_ = n_.advertise<omniwheel_control::move_base>("/vel", 1);
 
    //Topic you want to subscribe
    sub_ = n_.subscribe("cmd_vel", 1, &SubscribeAndPublish::callback, this);
  }
 
  void callback(const geometry_msgs::Twist& twist)
  {

    omniwheel_control::move_base msg;

    r_from_key.x = twist.linear.x;
    r_from_key.y = twist.linear.y;
    r_from_key.theta = twist.angular.z;

    inverseMobile(r_from_key, r_to_sock);
    msg.v_back = r_to_sock.v_back;
    msg.v_right = r_to_sock.v_right;
    msg.v_left =  r_to_sock.v_left;
       

    // ROS_INFO_STREAM("\nv_left:"<<r_to_sock.v_left<<"\nv_back:"<<r_to_sock.v_back<<"\n"
    // <<"v_right:"<<r_to_sock.v_right);
    pub_.publish(msg);
  }
 
private:
  ros::NodeHandle n_; 
  ros::Publisher pub_;
  ros::Subscriber sub_;
 
};//End of class SubscribeAndPublish


int main(int argc, char **argv) 
{
//     std::cout << "Hello, world!" << std::endl;


    using namespace std;

    // extern ros::Publisher pub;
    sqrt3 = std::sqrt(3.0L);
    // L = 0.15; //TODO:adjust
    L = 66.6667;//(mm)
    //init-val
    r_from_key.theta = 0;
    r_from_key.x = 0;
    r_from_key.y = 0;
    
    r_to_sock.v_back = 0;
    r_to_sock.v_right = 0;
    r_to_sock.v_left = 0;
    

    inverseMobile(r_from_key, r_to_sock);
    
    // cout<<"v_back:" <<r_to_sock.v_back<<"\n"<<endl;
    // cout<<"v_right:"<<r_to_sock.v_right<<"\n"<<endl;
    // cout<<"v_left:" <<r_to_sock.v_left<<"\n"<<endl;
    ros::init(argc, argv, "vel_split");

    // ros::NodeHandle n;
    // ros::Publisher pub = n.advertise<teleop_twist_keyboard_cpp::move_base>("vel", 1);
    // // ros::Subscriber sub = n.subscribe("cmd_vel", 1, cmd_velCallback);
    // ros::Subscriber sub = n.subscribe("cmd_vel", 1, &cmd_velCallback, this);
    SubscribeAndPublish SAPObject;

    
    ros::spin();
    return 0;
}
