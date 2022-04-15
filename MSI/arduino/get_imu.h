#ifndef GET_IMU_H
#define GET_IMU_H

#include <IMU.h>
cIMU    IMU;
const byte IMU_PUBLISH_FREQUENCY = 50;  //hz

uint8_t   err_code;
float rpy[3];
float gyroRaw[3];
float accRaw[3];
static uint32_t imu_time = 0;
const byte ACCEL_FACTOR = 1;   // (ADC_Value / Scale) * 9.80665            => Range : +- 2[g]
const byte GYRO_FACTOR  = 1;       // (ADC_Value/Scale) * (pi/180)             => Range : +- 2000[deg/s]
const byte MAG_FACTOR   = 1;

void publish_imu(MillisTimer &mt);

void calibrate_imu(){

  IMU.SEN.acc_cali_start();
  while( IMU.SEN.acc_cali_get_done() == false )
  {
    IMU.update();
  }
}

void init_imu(){
  IMU.begin();
  calibrate_imu();
  timer_IMU.setInterval(IMU_PUBLISH_FREQUENCY);
  timer_IMU.expiredHandler(publish_imu);
  timer_IMU.setRepeats(0);
  timer_IMU.start();

  nh.advertise(imuPub);
  nh.spinOnce();
}

void read_imu(){
    IMU.update();
    rpy[0] = (IMU.rpy[0]);
    rpy[1] = (IMU.rpy[1]);
    rpy[2] = (IMU.rpy[2]);
    
    gyroRaw[0] = (IMU.gyroRaw[0]);    // GYRO X
    gyroRaw[1] = (IMU.gyroRaw[1]);    // GYRO Y
    gyroRaw[2] = (IMU.gyroRaw[2]);    // GYRO Z

    accRaw[0] = (IMU.accRaw[0]);    // ACC X
    accRaw[1] = (IMU.accRaw[1]);    // ACC Y
    accRaw[2] = (IMU.accRaw[2]);    // ACC Z

}

void publish_imu(MillisTimer &mt){
    
  read_imu();
  imu_msg.header.stamp = nh.now();
  imu_msg.header.frame_id = "imu_link";
  imu_msg.orientation.x = rpy[0] * MAG_FACTOR; 
  imu_msg.orientation.y = rpy[1] * MAG_FACTOR; 
  imu_msg.orientation.z = rpy[2] * MAG_FACTOR; 
  
  imu_msg.angular_velocity.x = gyroRaw[0] * DEG_TO_RAD;
  imu_msg.angular_velocity.y = gyroRaw[1] * DEG_TO_RAD;
  imu_msg.angular_velocity.z = gyroRaw[2] * DEG_TO_RAD;
  
  imu_msg.linear_acceleration.x = accRaw[0] * ACCEL_FACTOR;
  imu_msg.linear_acceleration.y = accRaw[1] * ACCEL_FACTOR;
  imu_msg.linear_acceleration.z = accRaw[2] * ACCEL_FACTOR;

  imuPub.publish(&imu_msg);
  nh.spinOnce();
}

// IMU of Turtlebot3
//sensor_msgs::Imu imu_msg;
//ros::Publisher imu_pub("imu", &imu_msg);
//
/*******************************************************************************
* Publish msgs (IMU data: angular velocity, linear acceleration, orientation)
*******************************************************************************
void publishImuMsg(void)
{
  imu_msg = sensors.getIMU();

  imu_msg.header.stamp    = rosNow();
  imu_msg.header.frame_id = imu_frame_id;

  imu_pub.publish(&imu_msg);
}

// Magnetic field
//sensor_msgs::MagneticField mag_msg;
//ros::Publisher mag_pub("magnetic_field", &mag_msg);
/*******************************************************************************
* Publish msgs (Magnetic data)
******************************************************************************
void publishMagMsg(void)
{
  mag_msg = sensors.getMag();

  mag_msg.header.stamp    = rosNow();
  mag_msg.header.frame_id = mag_frame_id;

  mag_pub.publish(&mag_msg);
}
*/

#endif
