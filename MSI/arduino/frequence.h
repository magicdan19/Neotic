#ifndef FREQUENCE_H
#define FREQUENCE_H

#include "MillisTimer.h"

// Create a timer that fires every 1000 milliseconds.
MillisTimer timer_IMU       = MillisTimer();
MillisTimer timer_ENCODER   = MillisTimer();
MillisTimer timer_BATTERIE  = MillisTimer();
MillisTimer timer_cmd_vel   = MillisTimer();
//MillisTimer timer_TRANSFORM = MillisTimer();
//MillisTimer timer_ODOM = MillisTimer();

#endif
