#include <DHT.h>
#include <DHT_U.h>


#define DHTPIN A1 // pino que estamos conectado
#define DHTTYPE DHT11 // DHT 11
DHT dht(DHTPIN, DHTTYPE);

void setup()
{
// Inicia a comunicação serial

//Determina a velocidade de transmissão de dados (9600 bound rate ou bits por segundo)
Serial.begin(9600);
dht.begin();
}

void loop()
{
// A leitura da temperatura e umidade pode levar 250ms!
// O atraso do sensor pode chegar a 2 segundos.
float h = dht.readHumidity();
float t = dht.readTemperature();
// testa se retorno é valido, caso contrário algo está errado.
if (isnan(t) || isnan(h))
{
Serial.println("Failed to read from DHT");
}
else
{
Serial.print(h);
Serial.print(",");
Serial.println(t);

}
delay(1000);
}
