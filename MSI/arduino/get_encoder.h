#ifndef GET_ENCODER_H
#define GET_ENCODER_H

long left_ticks_encoder   = 0;
long right_ticks_encoder  = 0;
long last_left_encoder    = 0;
long last_right_encoder   = 0;

// True = Forward; False = Reverse
boolean Direction_left = true;
boolean Direction_right = true;

void sub_left_encoder (const std_msgs::Int16& left_ticks);
ros::Subscriber<std_msgs::Int16> left_ticks("left_ticks", sub_left_encoder );

void sub_right_encoder (const std_msgs::Int16& right_ticks);
ros::Subscriber<std_msgs::Int16> right_ticks("right_ticks", sub_right_encoder );

void init_encoder(){

  nh.subscribe(left_ticks);
  nh.subscribe(right_ticks);
  nh.spinOnce();

}

void sub_left_encoder (const std_msgs::Int16& left_ticks){
  left_ticks_encoder = left_ticks.data;
  if (left_ticks_encoder > last_left_encoder){
    Direction_left = true;
  }
  else if(left_ticks_encoder < last_left_encoder){
    Direction_left = false;
  }
  last_left_encoder = left_ticks_encoder;
}

void sub_right_encoder (const std_msgs::Int16& right_ticks){
  right_ticks_encoder = right_ticks.data;
  if (right_ticks_encoder > last_right_encoder){
    Direction_right = true;
  }
  else if(right_ticks_encoder < last_right_encoder){
    Direction_right = false;
  }
  last_right_encoder = right_ticks_encoder;
}
#endif
