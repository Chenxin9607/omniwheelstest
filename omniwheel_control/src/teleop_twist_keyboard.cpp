#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include "omniwheel_control/num.h"
#include <stdio.h>
#include <unistd.h>
#include <termios.h>
// #include "std_msgs/Int8.h"
#include <map>

// Map for movement keys
std::map<char, std::vector<float>> moveBindings
{
  {'i', {1, 0, 0, 0}},
  {'o', {1, 0, 0, -1}},
  {'j', {0, 0, 0, 1}},
  {'l', {0, 0, 0, -1}},
  {'u', {1, 0, 0, 1}},
  {',', {0, -1, 0, 0}},
  {'.', {-1, 0, 0, 1}},
  {'m', {-1, 0, 0, -1}},

  {'O', {1, -1, 0, 0}},
  {'I', {0, 1, 0, 0}},
  // {'I', {1, 0, 0, 0}},  
  {'J', {1, 0, 0, 0}},
  {'L', {-1, 0, 0, 0}},
  {'U', {1, 1, 0, 0}},
  {'<', {-1, 0, 0, 0}},
  {'>', {-1, -1, 0, 0}},
  {'M', {-1, 1, 0, 0}},
  {'t', {0, 0, 1, 0}},
  {'b', {0, 0, -1, 0}},
  {'k', {0, 0, 0, 0}},
  {'K', {0, 0, 0, 0}},
  {'D', {0, 0, 0, 1}},
  {'F', {0, 0, 0, -1}}
};

// Map for speed keys
std::map<char, std::vector<float>> speedBindings
{
  {'q', {1.1, 1.1}},
  {'z', {0.9, 0.9}},
  {'w', {1.1, 1}},
  {'x', {0.9, 1}},
  {'e', {1, 1.1}},
  {'c', {1, 0.9}}
};

// Reminder message
const char* msg = R"(

Reading from the keyboard and Publishing to Twist!
---------------------------
Moving around:
   u    i    o
   j    k    l
   m    ,    .

For Holonomic mode (strafing), hold down the shift key:
---------------------------
   U    I    O
   J    K    L
   M    <    >

t : up (+z)
b : down (-z)

anything else : stop

q/z : increase/decrease max speeds by 10%
w/x : increase/decrease only linear speed by 10%
e/c : increase/decrease only angular speed by 10%

1,2,3,4,5,6,7 to switch the number of the cell to control

CTRL-C to quit

)";

// Init variables
// float speed(0.5); // Linear velocity (m/s)
float speed(500);//linear velocity(mm/s)
float turn(1.0); // Angular velocity (rad/s)
float x(0), y(0), z(0), th(0); // Forward/backward/neutral direction vars
char key(' ');
unsigned char cell_number(1);


// For non-blocking keyboard inputs
int getch(void)
{
  int ch;
  struct termios oldt;
  struct termios newt;

  // Store old settings, and copy to new settings
  tcgetattr(STDIN_FILENO, &oldt);
  newt = oldt;

  // Make required changes and apply the settings
  newt.c_lflag &= ~(ICANON | ECHO);
  newt.c_iflag |= IGNBRK;
  newt.c_iflag &= ~(INLCR | ICRNL | IXON | IXOFF);
  newt.c_lflag &= ~(ICANON | ECHO | ECHOK | ECHOE | ECHONL | ISIG | IEXTEN);
  newt.c_cc[VMIN] = 1;
  newt.c_cc[VTIME] = 0;
  tcsetattr(fileno(stdin), TCSANOW, &newt);

  // Get the current character
  ch = getchar();

  // Reapply old settings
  tcsetattr(STDIN_FILENO, TCSANOW, &oldt);

  return ch;
}

int main(int argc, char** argv)
{
  // Init ROS node
  ros::init(argc, argv, "teleop_twist_keyboard");
  ros::NodeHandle nh;

  // Init cmd_vel publisher
  ros::Publisher pub = nh.advertise<geometry_msgs::Twist>("cmd_vel", 1);
  ros::Publisher pub_1 = nh.advertise<omniwheel_control::num>("cell_number", 1);


  // Create Twist message
  geometry_msgs::Twist twist;
  omniwheel_control::num cell;

  printf("%s", msg);
  printf("\rCurrent: speed %f\tturn %f | Awaiting command...\r", speed, turn);

  while(true){

    // Get the pressed key
    key = getch();

    // If the key corresponds to a key in moveBindings
    if (moveBindings.count(key) == 1)
    {
      // Grab the direction data
      x = moveBindings[key][0];
      y = moveBindings[key][1];
      z = moveBindings[key][2];
      th = moveBindings[key][3];

      printf("\rCurrent: speed %f\tturn %f | Last command: %c   ", speed, turn, key);

      twist.linear.x = x * speed;
      twist.linear.y = y * speed;
      twist.linear.z = z * speed;

      twist.angular.x = 0;
      twist.angular.y = 0;
      twist.angular.z = th * turn;

      

      // Publish it and resolve any remaining callbacks
      pub.publish(twist);
    }
    // else if (key == '1' || key == '2')
    // {
    //     if (key == '1')
    //     {
    //         if (cell_number < 4) cell_number+=1;
    //     }
    //     else 
    //     {
    //         if (cell_number > 1) cell_number-=1; 
    //     }


    // }

    // Otherwise if it corresponds to a key in speedBindings
    else if (speedBindings.count(key) == 1)
    {
      // Grab the speed data
      speed = speed * speedBindings[key][0];
      turn = turn * speedBindings[key][1];

      printf("\rCurrent: speed %f\tturn %f | Last command: %c   ", speed, turn, key);

      twist.linear.x = x * speed;
      twist.linear.y = y * speed;
      twist.linear.z = z * speed;

      twist.angular.x = 0;
      twist.angular.y = 0;
      twist.angular.z = th * turn;

      

      // Publish it and resolve any remaining callbacks
      pub.publish(twist);      
      
    }

    // Otherwise, set the robot to stop
    else if (key == '1' || key == '2' || key == '3' || key == '4'|| key == '5'|| key == '6'|| key == '7')
    {
      switch (key){
        case '1': cell_number = 1;break;
        case '2': cell_number = 2;break;
        case '3': cell_number = 3;break;
        case '4': cell_number = 4;break;
        case '5': cell_number = 5;break;
        case '6': cell_number = 6;break;
        case '7': cell_number = 7;break;
        default: break;
      }
    }
    else
    {
      x = 0;
      y = 0;
      z = 0;
      th = 0;

      // If ctrl-C (^C) was pressed, terminate the program
      if (key == '\x03')
      {
        // printf("\n\n                 .     .\n              .  |\\-^-/|  .    \n             /| } O.=.O { |\\\n\n                 CH3EERS\n\n");
        printf("\n");
        break;
      }

      printf("\rCurrent: speed %f\tturn %f | Invalid command! %c", speed, turn, key);
    }

    // Update the Twist message
    // twist.linear.x = x * speed;
    // twist.linear.y = y * speed;
    // twist.linear.z = z * speed;

    // twist.angular.x = 0;
    // twist.angular.y = 0;
    // twist.angular.z = th * turn;

    

    // // Publish it and resolve any remaining callbacks
    // pub.publish(twist);
    // cell = cell_number;
    cell.cell = cell_number;
    pub_1.publish(cell);
    ros::spinOnce();
  }

  return 0;
}
