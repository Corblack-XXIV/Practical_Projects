// Detección de sensor ultrasonico HC-SRO4

// Pines del sensor
const int trigPin = 9;
const int echoPin = 10;

// Variables
long duracion;
float distancia;

void setup() {
  Serial.begin(9600);       // Inicia comunicación serial
  pinMode(trigPin, OUTPUT); // Trig como salida
  pinMode(echoPin, INPUT);  // Echo como entrada
}

void loop() {
  // Generar pulso de disparo (TRIG)
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);    
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);   
  digitalWrite(trigPin, LOW);

  // Medir duración del pulso de retorno (ECHO)
  duracion = pulseIn(echoPin, HIGH);

  // Calcular distancia en centímetros
  distancia = duracion * 0.034 / 2;

  // Imprimir resultado
  Serial.print("Distancia: ");
  Serial.print(distancia);
  Serial.println(" cm");

  delay(500); // Espera medio segundo
}
