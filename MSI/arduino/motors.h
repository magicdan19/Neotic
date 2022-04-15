#ifndef MOTORS_H
#define MOTORS_H

void moteur(int motorLSpeed, int motorRSpeed){// moteur gauche et moteur droite en pourcentage entre -255 à 255

int _motorLSpeed = 0;
int _motorRSpeed = 0;
int commandByte = 0;

  if (motorLSpeed >= 0) {
        commandByte = 0;
        _motorLSpeed = map(motorLSpeed, 0, 255, 0, 63);
      }
      else if (motorLSpeed < 0) {
        commandByte = 0x40;
        _motorLSpeed = map(motorLSpeed, 0, -255, 0, 63);
      }
      commandByte = commandByte | _motorLSpeed;    
      Serial2.write(commandByte);
    
    

      if (motorRSpeed >= 0) {
        commandByte = 0xC0;
        _motorRSpeed = map(motorRSpeed, 0, 255, 0, 63);
      }
      else if (motorRSpeed < 0) {
        commandByte = 0x80;
        _motorRSpeed = map(motorRSpeed, 0, -255, 0, 63);
      }
      commandByte = commandByte | _motorRSpeed;
      Serial2.write(commandByte);
    
}

#endif
