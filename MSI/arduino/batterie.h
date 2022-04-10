#ifndef BATTERIE_H
#define BETTERIE_H

const int BATTERIE_PUBLISH_FREQUENCY = 1000;  //ms

float get_voltage(){
  int adc_value;
  float vol_value;

  adc_value = analogRead(BDPIN_BAT_PWR_ADC);
  vol_value = map(adc_value, 0, 1023, 0, 330*57/10);
  vol_value = vol_value/100;
  return(vol_value);

}

float get_amperage(){
  
  return  analogRead(BDPIN_BAT_PWR_ADC);

}

void publish_voltage(){
  volt_msg.data = get_voltage();
  pub_volt.publish(&volt_msg);
}

void publish_amperage(){
  amp_msg.data = get_amperage();
  pub_amp.publish(&amp_msg); 
}

void publish_batterie(MillisTimer &mt){
  
  publish_amperage();
  publish_voltage();
  
  nh.spinOnce();

}

/// from turtlebot3
//turtlebot3_msgs::SensorState sensor_state_msg;
//ros::Publisher sensor_state_pub("sensor_state", &sensor_state_msg);
/*
void publishBatteryStateMsg(void)
{
  battery_state_msg.header.stamp = rosNow();
  battery_state_msg.design_capacity = 1.8f; //Ah
  battery_state_msg.voltage = sensors.checkVoltage();
  battery_state_msg.percentage = (float)(battery_state_msg.voltage / 11.1f);

  if (battery_state == 0)
    battery_state_msg.present = false;
  else
    battery_state_msg.present = true;  

  battery_state_pub.publish(&battery_state_msg);
}
*/

void init_batterie(){

  timer_BATTERIE.setInterval(BATTERIE_PUBLISH_FREQUENCY);
  timer_BATTERIE.expiredHandler(publish_batterie);
  timer_BATTERIE.setRepeats(0);
  timer_BATTERIE.start();
  
  nh.advertise(pub_volt);
  nh.advertise(pub_amp);
  nh.spinOnce();
}

#endif
