// Pines de los sensores
const int trigPins[4] = {2, 4, 6, 8};
const int echoPins[4] = {3, 5, 7, 9};

// Variables
float filteredValues[4] = {0, 0, 0, 0};
int lastSentValue[4] = { -1, -1, -1, -1 }; // Últimos valores enviados
const float filterStrength = 0.05; // Suavizado

// Curva
const float curveExponent = 1.5; // 1.0 = lineal, >1 = más suave, <1 = más agresiva

void setup() {
  Serial.begin(9600);

  for (int i = 0; i < 4; i++) {
    pinMode(trigPins[i], OUTPUT);
    pinMode(echoPins[i], INPUT);
    digitalWrite(trigPins[i], LOW);
  }
}

void loop() {
  for (int i = 0; i < 4; i++) {
    long duration;
    int distance;

    // Activar un sensor a la vez
    digitalWrite(trigPins[i], LOW);
    delayMicroseconds(2);
    digitalWrite(trigPins[i], HIGH);
    delayMicroseconds(10);
    digitalWrite(trigPins[i], LOW);

    duration = pulseIn(echoPins[i], HIGH, 30000); // Timeout 30ms

    distance = duration * 0.034 / 2;

    if (distance == 0 || distance > 200) {
      distance = 200;
    }

    // Suavizado
    filteredValues[i] = filteredValues[i] + filterStrength * (distance - filteredValues[i]);

    // Mapear 0-200cm → 0.0–1.0
    float normalized = constrain(filteredValues[i] / 200.0, 0.0, 1.0);

    // Aplicar curva exponencial
    normalized = pow(normalized, curveExponent);

    // Mapear a MIDI 0–127 (invertido: más cerca, más volumen)
    int mappedValue = int((1.0 - normalized) * 127.0);

    // Solo enviar si el valor cambió
    if (mappedValue != lastSentValue[i]) {
      sendMIDIControlChange(7 + i, mappedValue); // CC7, CC8, CC9, CC10
      lastSentValue[i] = mappedValue;
    }

    delay(30); // Espera antes del próximo sensor
  }
}

// Función para enviar MIDI CC
void sendMIDIControlChange(byte control, byte value) {
  Serial.write(0xB0);    // CC en canal 1
  Serial.write(control);
  Serial.write(value);
}