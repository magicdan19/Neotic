#ifndef INIT_ROS_H
#define INIT_ROS_H

/*** Set up the ros node and publisher   ********/
ros::NodeHandle nh;
std_msgs::Int16 left_thicks_msg;
std_msgs::Int16 right_thicks_msg;
std_msgs::Float32 volt_msg;
std_msgs::Float32 amp_msg;
sensor_msgs::Temperature temp_msg;
sensor_msgs::Imu imu_msg;
sensor_msgs::Range range_msg;
std_msgs::String EtatDesRelais;


/*
 * à faire plus tard
 * 
 * std_msgs::Int8 cm_D_msg;
 * std_msgs::Int8 cm_C_msg;
 * std_msgs::Int8 cm_G_msg;
 */

//publication - publisher
ros::Publisher pub_volt("volt", &volt_msg);
ros::Publisher pub_amp("amp", &amp_msg);
ros::Publisher pub_temp("temp", &temp_msg);
ros::Publisher pub_left_ticks("left_ticks", &left_thicks_msg);
ros::Publisher pub_right_ticks("right_ticks", &right_thicks_msg);
ros::Publisher imuPub("imu", &imu_msg);
ros::Publisher RelaisState("Etat", &EtatDesRelais);
ros::Publisher pub_range1("ultrasound_1", &range_msg);

/*
 * À faire pour plus tard
 * 
 * ros::Publisher pub_cm_D("dist_d", &cm_D_msg);
 * ros::Publisher pub_cm_C("dist_c", &cm_C_msg);
 * ros::Publisher pub_cm_G("dist_g", &cm_G_msg);
 * 
 * 
 * 
 * 
 */




#endif
