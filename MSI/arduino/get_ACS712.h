#ifndef GET_ACS712_H
#define GET_ACS712_H

const byte pin_ampSensor = A5; // pin pour ACS712
ACS712 acs712(ACS712_30A, pin_ampSensor);



#endif
