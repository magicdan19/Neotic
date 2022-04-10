#ifndef GET_DHT_H
#define GET_DHT_H

#include <DHT.h>

const byte DHTPIN = 10;

#define DHTTYPE DHT22   // DHT 22  (AM2302), AM2321
DHT dht(DHTPIN, DHTTYPE);
const int max_temperature = 30;




#endif
