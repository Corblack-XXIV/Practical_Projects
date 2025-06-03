#include <SPI.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SH110X.h>

// Configuración OLED
#define OLED_MOSI 51
#define OLED_CLK  52
#define OLED_DC   9
#define OLED_CS   8
#define OLED_RST  10
Adafruit_SH1106G display(128, 64, OLED_MOSI, OLED_CLK, OLED_DC, OLED_RST, OLED_CS);

// Botones y buzzer
#define BTN_UPDOWN     5
#define BTN_LEFTRIGHT  6
#define BTN_SELECT     7
#define BUZZER_PIN     4

// Estado del juego
char tablero[3][3];
int fila = 0, columna = 0;
int jugador = 0; // 0 = X, 1 = O
int puntuacionX = 0, puntuacionO = 0;

// -------------------------------------------
// SETUP
// -------------------------------------------
void setup() {
  pinMode(BTN_UPDOWN, INPUT_PULLUP);
  pinMode(BTN_LEFTRIGHT, INPUT_PULLUP);
  pinMode(BTN_SELECT, INPUT_PULLUP);
  pinMode(BUZZER_PIN, OUTPUT);

  display.begin(0x3C, true);
  display.clearDisplay();

  mostrarPantallaInicio();
  iniciarTablero();
  dibujarTablero();
}

// -------------------------------------------
// LOOP PRINCIPAL
// -------------------------------------------
void loop() {
  if (digitalRead(BTN_UPDOWN) == LOW) {
    fila = (fila + 1) % 3;
    delay(200);
    dibujarTablero();
  }

  if (digitalRead(BTN_LEFTRIGHT) == LOW) {
    columna = (columna + 1) % 3;
    delay(200);
    dibujarTablero();
  }

  if (digitalRead(BTN_SELECT) == LOW) {
    if (tablero[fila][columna] == ' ') {
      tablero[fila][columna] = (jugador == 0) ? 'X' : 'O';
      tone(BUZZER_PIN, 1000, 150);

      if (verificarGanador()) {
        if (jugador == 0) puntuacionX++;
        else puntuacionO++;

        mostrarGanador();
        delay(1500);

        if (puntuacionX == 1 || puntuacionO == 1) {
          mostrarFinalDelJuego();
          puntuacionX = 0;
          puntuacionO = 0;
          jugador = 0;
          mostrarPantallaInicio();
        }

        iniciarTablero();
        dibujarTablero();
      } else if (esEmpate()) {
        mostrarEmpate();
        delay(1500);
        iniciarTablero();
        dibujarTablero();
      } else {
        jugador = 1 - jugador;
        dibujarTablero();
      }
    }
    delay(200);
  }
}

// -------------------------------------------
// FUNCIONES DE JUEGO
// -------------------------------------------
void iniciarTablero() {
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
      tablero[i][j] = ' ';
  fila = 0;
  columna = 0;
}

bool verificarGanador() {
  char s = (jugador == 0) ? 'X' : 'O';
  for (int i = 0; i < 3; i++) {
    if (tablero[i][0] == s && tablero[i][1] == s && tablero[i][2] == s) return true;
    if (tablero[0][i] == s && tablero[1][i] == s && tablero[2][i] == s) return true;
  }
  if (tablero[0][0] == s && tablero[1][1] == s && tablero[2][2] == s) return true;
  if (tablero[0][2] == s && tablero[1][1] == s && tablero[2][0] == s) return true;
  return false;
}

bool esEmpate() {
  for (int i = 0; i < 3; i++)
    for (int j = 0; j < 3; j++)
      if (tablero[i][j] == ' ') return false;
  return true;
}

// -------------------------------------------
// DIBUJO EN OLED
// -------------------------------------------
void dibujarTablero() {
  display.clearDisplay();
  display.setTextColor(SH110X_WHITE);
  display.setTextSize(1);

  // Puntuación y turno
  display.setCursor(0, 0);
  display.print("X:");
  display.print(puntuacionX);
  display.print(" O:");
  display.print(puntuacionO);
  display.setCursor(80, 0);
  display.print("Turno:");
  display.print((jugador == 0) ? "X" : "O");

  int celdaW = 40, celdaH = 18;
  int offsetX = 4, offsetY = 12;

  // Líneas del tablero
  for (int i = 1; i < 3; i++) {
    display.drawLine(offsetX, offsetY + i * celdaH, offsetX + 3 * celdaW, offsetY + i * celdaH, SH110X_WHITE);
    display.drawLine(offsetX + i * celdaW, offsetY, offsetX + i * celdaW, offsetY + 3 * celdaH, SH110X_WHITE);
  }

  // Fichas y cursor
  for (int f = 0; f < 3; f++) {
    for (int c = 0; c < 3; c++) {
      int x = offsetX + c * celdaW;
      int y = offsetY + f * celdaH;

      if (f == fila && c == columna) {
        display.drawRect(x + 1, y + 1, celdaW - 2, celdaH - 2, SH110X_WHITE);
      }

      if (tablero[f][c] != ' ') {
        display.setCursor(x + celdaW / 3, y + 2);
        display.setTextSize(2);
        display.print(tablero[f][c]);
        display.setTextSize(1);
      }
    }
  }

  display.display();
}

void mostrarGanador() {
  display.clearDisplay();
  display.setCursor(10, 25);
  display.setTextSize(2);
  display.print("Gana ");
  display.print((jugador == 0) ? "X" : "O");
  display.display();

  reproducirMelodiaGanadora(); // se ejecuta la música
}

void mostrarEmpate() {
  display.clearDisplay();
  display.setCursor(25, 25);
  display.setTextSize(2);
  display.print("Empate!");
  display.display();
}

void mostrarFinalDelJuego() {
  display.clearDisplay();
  display.setTextSize(2);
  display.setCursor(10, 15);
  display.print((puntuacionX == 3) ? "X gana!" : "O gana!");
  display.setTextSize(1);
  display.setCursor(10, 45);
  display.print("Volviendo al menu...");
  display.display();
  delay(3000);
}

  // Título
void mostrarPantallaInicio() {
  display.clearDisplay();
  display.setTextColor(SH110X_WHITE);
  display.setTextSize(1,2);
  display.setCursor(25, 5);
  display.print("Tres en Raya");

  // Dibujar X y O grandes
  display.setTextSize(3);
  display.setCursor(25, 30);
  display.print("X");
  display.setCursor(80, 30);
  display.print("O");

  // Indicador de acción
  display.setTextSize(1);
  display.setCursor(10, 55);
  display.print("Presiona un boton...");
  display.display();

  // Esperar que se presione un botón
  while (digitalRead(BTN_SELECT) == HIGH &&
         digitalRead(BTN_UPDOWN) == HIGH &&
         digitalRead(BTN_LEFTRIGHT) == HIGH) {
    // espera
  }

  delay(300); // rebote
  while (digitalRead(BTN_SELECT) == LOW ||
         digitalRead(BTN_UPDOWN) == LOW ||
         digitalRead(BTN_LEFTRIGHT) == LOW) {
    // esperar que se suelte
  }
}

void reproducirMelodiaGanadora() {
  
  tone(BUZZER_PIN, 523.25, 133);
  delay(133);
  tone(BUZZER_PIN, 523.25, 133);
  delay(133);
  tone(BUZZER_PIN, 523.25, 133);
  delay(133);
  tone(BUZZER_PIN, 523.25, 400);
  delay(400);
  tone(BUZZER_PIN, 415.30, 400);
  delay(400);
  tone(BUZZER_PIN, 466.16, 400);
  delay(400);
  tone(BUZZER_PIN, 523.25, 133);
  delay(133);
  delay(133);
  tone(BUZZER_PIN, 466.16, 133);
  delay(133);
  tone(BUZZER_PIN, 523.25, 1200);
  delay(1200);
}