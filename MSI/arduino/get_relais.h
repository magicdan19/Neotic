#ifndef GET_RELAIS_H
#define GET_RELAIS_H
/*
 * LED que j'ai besoin
 * 
 * Arduino démarré = ok
 * GPS RTK = OK
 * Moteur Coupe = on
 * Fan = on
 * Lidar = OK
 * Kinect = OK
 * Jetson démaré = ok
 * Mode automatique activé = on
 * obstacles détectés = oui
 * 
 * 
 */


//inclure les fichiers .h
#include <std_msgs/Empty.h>

//inclure le nombre de frequency
//const byte BATTERIE_PUBLISH_FREQUENCY 50  //ms

//inclure les pins
const byte pinRelaisCoupe   = 10;
const byte pinRelaisFan     = 11;

//inclure les variables

char EtatMoteurCoupe[] = "Changement du moteur coupe";
char EtatFan[] = "Changement du Fan";

void RelaisCoupe( const std_msgs::Empty& toggle_msg) {  
  digitalWrite(pinRelaisCoupe, HIGH-digitalRead(pinRelaisCoupe));
  EtatDesRelais.data = EtatMoteurCoupe;
} 

void Fan( const std_msgs::Empty& toggle_msg) {  
  digitalWrite(pinRelaisFan, HIGH-digitalRead(pinRelaisFan));
  EtatDesRelais.data = EtatFan;
} 

ros::Subscriber<std_msgs::Empty> RelaisMoteurCoupe("coupe", &RelaisCoupe ); 
ros::Subscriber<std_msgs::Empty> RelaisFan("fan", &Fan ); 


// inclure le init qui ira dans le setup()
void init_relais(){
  pinMode(pinRelaisCoupe, OUTPUT);
  pinMode(pinRelaisFan, OUTPUT); 
  
  nh.subscribe(RelaisMoteurCoupe);
  nh.subscribe(RelaisFan);
  nh.advertise(RelaisState);
  nh.spinOnce();
}

//inlcure les publish ou les subscriptions


#endif
