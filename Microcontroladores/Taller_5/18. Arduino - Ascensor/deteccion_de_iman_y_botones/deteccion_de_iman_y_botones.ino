#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SH110X.h>

#define i2c_Address 0x3C
#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define OLED_RESET -1

Adafruit_SH1106G display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

// Definir pines para los botones
#define BOTON_P 6
#define BOTON_5 7
#define BOTON_4 8
#define BOTON_3 9
#define BOTON_2 10
#define BOTON_1 11
#define BOTON_L 12
#define BOTON_MENOS1 13

// Definir pines para el control del motor con L298N
#define MOTOR_ENA 3
#define MOTOR_IN1 4
#define MOTOR_IN2 2

// Pin para el sensor de efecto Hall
#define SENSOR_EFECTO_HALL 5
// Variable para almacenar el piso actual
int pisoActual = -1;

void setup() {
  // Configurar pines de los botones como entrada
  pinMode(BOTON_P, INPUT_PULLUP);
  pinMode(BOTON_5, INPUT_PULLUP);
  pinMode(BOTON_4, INPUT_PULLUP);
  pinMode(BOTON_3, INPUT_PULLUP);
  pinMode(BOTON_2, INPUT_PULLUP);
  pinMode(BOTON_1, INPUT_PULLUP);
  pinMode(BOTON_L, INPUT_PULLUP);
  pinMode(BOTON_MENOS1, INPUT_PULLUP);

  // Configurar pines para el control del motor
  pinMode(MOTOR_ENA, OUTPUT);
  pinMode(MOTOR_IN1, OUTPUT);
  pinMode(MOTOR_IN2, OUTPUT);

  // Configurar pin del sensor de efecto Hall como entrada
  pinMode(SENSOR_EFECTO_HALL, INPUT);

  Serial.begin(9600);

  delay(250);
  display.begin(i2c_Address, true);
  display.display();
  delay(2000);
  display.clearDisplay();

  // Mostrar el piso actual en la pantalla OLED
  display.setTextSize(1);
  display.setTextColor(SH110X_WHITE);
  display.setCursor(10, 20);
  display.print("Piso actual: ");
  display.println(obtenerTextoPiso(pisoActual));
  display.display();
}

void loop() {
  // Verificar si se ha presionado algún botón
  if (digitalRead(BOTON_P) == LOW) {
    moverAscensor(6, "P", "Penthouse");
  } else if (digitalRead(BOTON_5) == LOW) {
    moverAscensor(5, "5", "");
  } else if (digitalRead(BOTON_4) == LOW) {
    moverAscensor(4, "4", "");
  } else if (digitalRead(BOTON_3) == LOW) {
    moverAscensor(3, "3", "");
  } else if (digitalRead(BOTON_2) == LOW) {
    moverAscensor(2, "2", "");
  } else if (digitalRead(BOTON_1) == LOW) {
    moverAscensor(1, "1", "");
  } else if (digitalRead(BOTON_L) == LOW) {
    moverAscensor(0, "L", "Lobby");
  } else if (digitalRead(BOTON_MENOS1) == LOW) {
    moverAscensor(-1, "M-1", "");
  }

  // Verificar la presencia del imán con el sensor de efecto Hall
  int valorSensor = digitalRead(SENSOR_EFECTO_HALL);
  Serial.print("Valor del sensor: ");
  Serial.println(valorSensor);

  if (valorSensor == HIGH) {
    // Imán detectado, detener el motor
    detenerMotor();
    Serial.println("Imán detectado");
  } else {
    Serial.println("No se detectó el imán");
  }
}

void moverAscensor(int pisoDestino, String mensajePiso, String nombreCompleto) {
  // Determinar la dirección del movimiento
  String direccion = (pisoDestino > pisoActual) ? "Subiendo" : "Bajando";
  
  // Configurar el carácter del triángulo según la dirección
  char triangulo = (direccion == "Subiendo") ? '<' : '>';

  // Mostrar mensaje en la pantalla OLED
  display.clearDisplay();
  display.setTextSize(2);
  display.setTextColor(SH110X_WHITE);
  display.setCursor(10, 20);
  display.print(direccion);
  display.setCursor(10, 40);
  display.print(mensajePiso);
  display.setCursor(110, 50);
  display.print(triangulo);
  display.display();

  // Imprimir mensaje en la terminal
  Serial.print(direccion);
  Serial.print(" al piso ");
  Serial.println(mensajePiso);

  // Controlar el motor
  controlarMotor(direccion);

  // Actualizar el piso actual
  pisoActual = pisoDestino;

  // Esperar un momento (puedes ajustar el tiempo según sea necesario)
  delay(500);

  // Imprimir mensaje en la terminal
  Serial.print("Llegaste al piso ");
  Serial.println(mensajePiso);

  // Mostrar el nombre completo en la pantalla OLED si está disponible
  if (nombreCompleto != "") {
    display.clearDisplay();
    display.setTextSize(1);
    display.setTextColor(SH110X_WHITE);
    display.setCursor(10, 20);
    display.print(nombreCompleto);
    display.display();
    
    // Esperar un momento
    delay(1000);
  }

  // Mostrar el piso actual en la pantalla OLED
  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(SH110X_WHITE);
  display.setCursor(10, 20);
  display.print("Piso actual: ");
  display.println(obtenerTextoPiso(pisoActual));
  display.display();
}

void controlarMotor(String direccion) {
  // Encender el motor hacia la dirección especificada
  if (direccion == "Subiendo") {
    digitalWrite(MOTOR_IN1, LOW);
    digitalWrite(MOTOR_IN2, HIGH);
  } else {
    digitalWrite(MOTOR_IN1, HIGH);
    digitalWrite(MOTOR_IN2, LOW);
  }
  analogWrite(MOTOR_ENA, 150);  // Ajusta la velocidad según sea necesario
}

void detenerMotor() {
  // Apagar el motor
  digitalWrite(MOTOR_IN1, LOW);
  digitalWrite(MOTOR_IN2, LOW);
  analogWrite(MOTOR_ENA, 0);
}

String obtenerTextoPiso(int piso) {
  // Función para obtener el texto correspondiente al piso actual
  if (piso == 0) {
    return "L";
  } else if (piso == 6) {
    return "P";
  } else {
    return String(piso);
  }
}