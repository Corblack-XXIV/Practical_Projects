#include <Servo.h>

Servo servoMotor;
int celdaCargaPin = A0; // Pin analógico utilizado para leer el valor de la celda de carga
int umbral = 500; // Valor de umbral para activar el servo motor

void setup() {
  servoMotor.attach(9); // Conecta el servo motor al pin 9
  pinMode(celdaCargaPin, INPUT); // Configura el pin de la celda de carga como entrada
}

void loop() {
  int valorCeldaCarga = analogRead(celdaCargaPin); // Lee el valor de la celda de carga

  if (valorCeldaCarga > umbral) {
    // Si el valor de la celda de carga supera el umbral, mueve el servo motor a 90 grados
    servoMotor.write(90);
  } else {
    // Si el valor de la celda de carga no alcanza el umbral, mueve el servo motor a 0 grados
    servoMotor.write(0);
  }

  delay(100); // Pequeña pausa para evitar lecturas erróneas rápidas
}