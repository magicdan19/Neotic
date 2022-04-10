//#define USBCON
//#define USE_USBCON
#define __STM32F1__
//#define F_CPU
///home/dan/snap/arduino/61/.arduino15/packages/OpenCR/hardware/OpenCR/1.4.19/libraries/turtlebot3_ros_lib

// propiétés du robot
const float wheel_diameter = 0.220;
const double wheel_separation = 0.445; //distance entre les roues
const double encoder_tick_by_tour = 80; 
const int tick_second = 40; 
const float track_width  = 0.445;      
const float meterPerTick = 0.00866688;  // (PI * wheel_diameter) / encoder_tick_by_tour
const float tickPerMeter = 115.381778047; // ((1 metre / (PI * wheel_diameter = 0.693350383)= ) * encoder_tick_by_tour = 28.937226)
const float max_velocity = 0.3466752 ; // tick_second * meterPerTick

#include <math.h>
#include <Arduino.h>
#include <ros.h>
#include <ros/time.h>
#include "Wire.h"
#include "ACS712.h"
#include <std_msgs/Int8.h>
#include <std_msgs/Int16.h>
#include <std_msgs/Float32.h>
#include <std_msgs/String.h>
#include <sensor_msgs/Temperature.h>
#include <sensor_msgs/Imu.h>
#include <sensor_msgs/Range.h>
#include <geometry_msgs/Twist.h>
//#include <geometry_msgs/Vector3Stamped.h>
//#include <tf/tf.h>
//#include <tf/transform_broadcaster.h>
//#include <nav_msgs/Odometry.h>

#include <avr/dtostrf.h>
#include "init_ros.h"
#include "frequence.h"
#include "get_imu.h"
#include "motors.h"
#include "batterie.h"
#include "get_encoder.h"
#include "cmd_vel.h"
#include "get_relais.h"
//#include "get_ACS712.h"
//#include "get_DHT.h"
//#include "get_sonar.h"

#define FIRMWARE_VER "0.1.2"

void setup() {  
  Serial2.begin(9600);  // sert pour enovyer message au controller de moteur
  nh.getHardware()->setBaud(115200);  // vitesse de connexion entre ROS et Arduino (OpenCR)
  nh.initNode();
  nh.subscribe(subCmdVel);  
  init_imu();
  init_encoder();
  init_batterie();
  init_cmd_vel();
  init_relais();
 /* while (!nh.connected())
  {
    nh.spinOnce();
  }*/
}

void loop() {
  
  timer_IMU.run();
  nh.spinOnce();
  timer_BATTERIE.run();
  nh.spinOnce();
  RelaisState.publish( &EtatDesRelais );
  nh.spinOnce();
  timer_cmd_vel.run();
  nh.spinOnce();


}

/*
 * 
 * HAL_GPIO_WritePin(GPIOB, GPIO_PIN_14, (GPIO_PinState)0);
 */
                          /**** debug   *******
                          nh.loginfo("***____________ debug _________***");
                          char msg[sizeof(double)];
                        
                          nh.loginfo("Intrant");
                          dtostrf(tickRate, 10, 5, msg);
                          nh.loginfo(msg);
                          dtostrf(diffTicks, 10, 5, msg);
                          nh.loginfo(msg);*/
