#include <NewPing.h> // librería para HC-SR04

// --- CONFIGURACIÓN ---
const int MAX_DISTANCE = 200; // Distancia máxima a detectar (en cm)
const int PING_INTERVAL = 33; // Milisegundos entre pings de sensores (aprox 30 pings/seg)
unsigned long pingTimer[4];     // Timers para controlar pings escalonados

// Pines Sensores Ultrasónicos (Trig/Echo en el mismo pin con NewPing si se desea)
// O usar pines separados como antes: const int trigPinA = 2; const int echoPinA = 3; etc.
// Usando NewPing (Trigger/Echo en el mismo pin o separados):
NewPing sonar[4] = { // Array de objetos NewPing
  NewPing(2, 3, MAX_DISTANCE), // Sensor A: Trig Pin 2, Echo Pin 3
  NewPing(4, 5, MAX_DISTANCE), // Sensor B: Trig Pin 4, Echo Pin 5
  NewPing(6, 7, MAX_DISTANCE), // Sensor C: Trig Pin 6, Echo Pin 7
  NewPing(8, 9, MAX_DISTANCE)  // Sensor D: Trig Pin 8, Echo Pin 9
};

const int detectionThreshold = 100; // Umbral de detección en cm
bool detectedStatus[4] = {false, false, false, false};
String lastSentStatus = ""; // Para enviar solo cuando cambie (opcional)

// --- FIN CONFIGURACIÓN ---

void setup() {
  Serial.begin(9600); // Inicia comunicación serial (asegúrate que coincida en Pd)
  pingTimer[0] = millis() + 75; // Inicializa timers escalonados
  pingTimer[1] = millis() + 150;
  pingTimer[2] = millis() + 225;
  pingTimer[3] = millis() + 300;
}

void loop() {
  String currentStatusString = ""; // Construye la cadena de estado actual

  for (int i = 0; i < 4; i++) {
    // Lee el sensor si ha pasado el intervalo (ping escalonado)
    if (millis() >= pingTimer[i]) {
      pingTimer[i] += PING_INTERVAL * 4; // Programa el próximo ping
      unsigned int distance = sonar[i].ping_cm(); // Lee distancia en cm (0 si fuera de rango)

      // Determina estado de detección
      detectedStatus[i] = (distance > 0 && distance < detectionThreshold);
    }

    // Construye la cadena de estado (0 o 1)
    currentStatusString += detectedStatus[i] ? "1" : "0";
    if (i < 3) {
      currentStatusString += ","; // Añade coma separadora
    }
  }

  // Envía el estado por Serial SOLO si ha cambiado (opcional, reduce tráfico)
  if (currentStatusString != lastSentStatus) {
     Serial.println(currentStatusString); // Envía "1,0,1,0" o similar
     lastSentStatus = currentStatusString;
  }

  // Pequeño delay para no saturar el loop
  delay(10);
}