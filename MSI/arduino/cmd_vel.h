#ifndef CMD_VEL_H
#define CMD_VEL_H

#include <string>

const byte CMD_VEL_PUBLISH_FREQUENCY = 20;  //ms

// How much the PWM value can change each cycle
const int PWM_INCREMENT = 25;
// Number of ticks per wheel revolution. We won't use this in this code.
const int TICKS_PER_REVOLUTION = 80;
 
// Wheel radius in meters
const double WHEEL_RADIUS = 0.110;
 
// Distance from center of the left tire to the center of the right tire in m
const double WHEEL_BASE = 0.445;
 
// Number of ticks a wheel makes moving a linear distance of 1 meter
// This value was measured manually.
const double TICKS_PER_METER = 115.381778047; // Originally 2880
 
// Proportional constant, which was measured by measuring the 
// PWM-Linear Velocity relationship for the robot.
const int K_P = 225;
 
// Y-intercept for the PWM-Linear Velocity relationship for the robot
const int b = 100;
 
// Correction multiplier for drift. Chosen through experimentation.
const int DRIFT_MULTIPLIER = 120;
 
// Turning PWM output (0 = min, 255 = max for PWM values)
const int PWM_TURN = 200;
 
// Set maximum and minimum limits for the PWM values
const int PWM_MIN = 20; // about 0.1 m/s
const int PWM_MAX = 255; // about 0.172 m/s
 
// Set linear velocity and PWM variable values for each wheel
double velLeftWheel = 0;
double velRightWheel = 0;
double pwmLeftReq = 0;
double pwmRightReq = 0;
double dx = 0;
double dr = 0;
 
// Record the time that the last velocity command was received
double lastCmdVelReceived = 0;
void printF(double val);
float mapPwm(float x, float out_min, float out_max);

/////////////////////// Motor Controller Functions ////////////////////////////
 
// Calculate the left wheel linear velocity in m/s every time a 
// tick count message is rpublished on the /left_ticks topic. 
void calc_vel_left_wheel(){
   
  // Previous timestamp
  static double prevTime = 0;
   
  // Variable gets created and initialized the first time a function is called.
  static int prevLeftCount = 0;
 
  // Calculate wheel velocity in meters per second
  velLeftWheel = left_ticks_encoder/TICKS_PER_METER/((millis()/1000)-prevTime);
 
  // Keep track of the previous tick count
  prevLeftCount = left_ticks_encoder;
 
  // Update the timestamp
  prevTime = (millis()/1000);
}

// Calculate the right wheel linear velocity in m/s every time a 
// tick count message is published on the /right_ticks topic. 
void calc_vel_right_wheel(){
   
  // Previous timestamp
  static double prevTime = 0;
   
  // Variable gets created and initialized the first time a function is called.
  static int prevRightCount = 0;
 
   // Calculate wheel velocity in meters per second
  velRightWheel = right_ticks_encoder/TICKS_PER_METER/((millis()/1000)-prevTime);
 
  prevRightCount = right_ticks_encoder;
   
  prevTime = (millis()/1000);
 
}


//////////////////////////  PWM  ////////////////////////////////
// Take the velocity command as input and calculate the PWM values.
void calc_pwm_values(const geometry_msgs::Twist& cmdVel) {

  dx = cmdVel.linear.x;
  dr = cmdVel.angular.z;

  if(dx == 0 || dr == 0){ // pivote sur lui même OU demande d'avancer en ligne droite et reculer
    pwmLeftReq  = dx - dr;
    pwmRightReq = dx + dr;
  }
  else{
    // 1- 0.2225 = 0.7775
    pwmLeftReq = dx - dr * 0.445 / 2;
    // 1 + 0.2225 = 1.2225
    pwmRightReq = dx + dr * 0.445 / 2;
  }
  
  
  pwmLeftReq  = K_P * pwmLeftReq  ;
  pwmRightReq = K_P * pwmRightReq ;

  //s'assurer que la velocité de soit jamais plus que 255
  if (pwmLeftReq >  255) pwmLeftReq =    255;
  if (pwmLeftReq < -255) pwmLeftReq =   -255;

  if (pwmRightReq >  255) pwmRightReq =  255;
  if (pwmRightReq < -255) pwmRightReq = -255;  

  moteur(pwmLeftReq, pwmRightReq);
}


ros::Subscriber<geometry_msgs::Twist> subCmdVel("cmd_vel", &calc_pwm_values );

void exec_cmd_vel(MillisTimer &mt) {
  nh.spinOnce();
  
  calc_vel_right_wheel();
  calc_vel_left_wheel();
}

void init_cmd_vel(){
  
  timer_cmd_vel.setInterval(CMD_VEL_PUBLISH_FREQUENCY);
  timer_cmd_vel.expiredHandler(exec_cmd_vel);
  timer_cmd_vel.setRepeats(0);
  timer_cmd_vel.start();
  
  nh.subscribe(subCmdVel);
  nh.spinOnce();
}

void printF( double val){

  char msg[sizeof(double)];
  dtostrf(val, 10, 5, msg);
  nh.loginfo(msg);
  /*  
  /////////////////////// 
  nh.loginfo("pwmLeftReq");
  printF(pwmLeftOut);
  nh.loginfo("pwmLeftReq");
  printF(pwmRightOut);*/

}
#endif
