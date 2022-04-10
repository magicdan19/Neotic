#ifndef GET_SONAR_H
#define GET_SONAR_H

const byte TRIGGER_PIN1 = 9;   //sensor 1
const byte ECHO_PIN1   = 10 ;  

const byte MAX_DISTANCE = 300; // Maximum distance we want to ping  

NewPing sonar1(TRIGGER_PIN1, ECHO_PIN1, MAX_DISTANCE); // back us
char frameid[] = "base_link";
long duration;
float tmp;
long range_time;

void init_sonar()
{
  nh.advertise(pub_range1);

  range_msg.radiation_type = sensor_msgs::Range::ULTRASOUND;
  range_msg.header.frame_id =  "ultrasound_1";
  range_msg.field_of_view = 0.3665;  // fake
  range_msg.min_range = 0.0;
  range_msg.max_range = MAX_DISTANCE;

}

void get_sonar()
{
  //publish the adc value every 50 milliseconds
  //since it takes that long for the sensor to stabilize
  if ( millis() >= range_time ){
    tmp=sonar1.ping_cm();
    range_msg.range = tmp/100;
    range_msg.header.stamp = nh.now();
    pub_range1.publish(&range_msg);
    range_time =  millis() + 50;
  }
  nh.spinOnce();
}


#endif
