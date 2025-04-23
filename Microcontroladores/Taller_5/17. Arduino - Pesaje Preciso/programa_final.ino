#include "HX711.h"
#include "Servo.h"

Servo puerta;
const int DOUT=(2);
const int CLK=(3);

HX711 balanza;
int angle;
int set = 600;   // valor de setpint en gramos
int pul = 7;
int state = 0;
bool flag = 0;
void setup() {
  puerta.attach(9);
  Serial.begin(9600);
  balanza.begin(DOUT, CLK);
  Serial.print("Lectura del valor del ADC:  ");
  Serial.println(balanza.read());
  Serial.println("No ponga ningun  objeto sobre la balanza");
  Serial.println("Destarando...");
  Serial.println("...");
  balanza.set_scale(-954.18375); // Establecemos la escala
  balanza.tare(20);  //El peso actual es considerado Tara.
  Serial.println("Listo para pesar");  
  pinMode(pul, INPUT);
  puerta.write(0);
  }

void loop() {

int weight = balanza.get_units();
state = digitalRead(pul);
  // toma el dato de la balanza
if ((state == 0) && (flag == 1)){
if (weight <= set){
  Serial.print("Peso: ");
  Serial.print(balanza.get_units(20),3);
  Serial.println(" g");
  delay(2);
  angle = map(weight, 0, set, 60, 10);
  Serial.println(angle);
    puerta.write(angle);
    delay(2); 
  }else if (weight > set){
    puerta.write(0);
    flag = 0;
    }
  }else if ((state == 1)&&(flag==0)){
      flag = state;
  }
   Serial.println(flag);
      Serial.println(state);
      Serial.println(weight);
}