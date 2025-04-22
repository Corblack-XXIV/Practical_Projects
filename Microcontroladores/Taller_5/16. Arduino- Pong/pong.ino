#include <SPI.h>
#include <Adafruit_SH110X.h>

#define OLED_MOSI     10
#define OLED_CLK      8
#define OLED_DC       7
#define OLED_CS       5
#define OLED_RST      9
#define BUZZER_PIN    4
#define UP_BUTTON     2
#define DOWN_BUTTON   3

Adafruit_SH1106G display = Adafruit_SH1106G(128, 64, OLED_MOSI, OLED_CLK, OLED_DC, OLED_RST, OLED_CS);

bool gameStarted = false;

#define PADDLE_HEIGHT 16
#define PADDLE_WIDTH  2
#define BALL_SIZE     2
#define CPU_SPEED     2

int paddleSpeed = 2; 
int ballSpeed = 3;

int cpuPaddleY = 16;
int playerPaddleY = 16;

float ballX = 64;
float ballY = 32;

float ballSpeedX = ballSpeed;
float ballSpeedY = ballSpeed;

int playerScore = 0;
int cpuScore = 0;
const int SCORE_LIMIT = 2;

bool gameEnded = false;

void setupBuzzer() {
  pinMode(BUZZER_PIN, OUTPUT);
}

void VictoryTheme() {
  // Puedes ajustar las frecuencias y los tiempos según sea necesario
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

void DefeatTheme() {
  // Puedes ajustar las frecuencias y los tiempos según sea necesario
  tone(BUZZER_PIN, 400, 200);
  delay(200);
  tone(BUZZER_PIN, 300, 200);
  delay(200);
  tone(BUZZER_PIN, 200, 200);
  delay(200);
  tone(BUZZER_PIN, 100, 400);
  delay(400);
}


void playBuzzer() {
  tone(BUZZER_PIN, 1000, 100);
}

void drawPaddles() {
  display.fillRect(2, cpuPaddleY, PADDLE_WIDTH, PADDLE_HEIGHT, SH110X_WHITE);
  display.fillRect(126 - PADDLE_WIDTH, playerPaddleY, PADDLE_WIDTH, PADDLE_HEIGHT, SH110X_WHITE);
}

void drawBall() {
  display.fillCircle(ballX, ballY, BALL_SIZE, SH110X_WHITE);
}

void clearBall() {
  display.fillCircle(ballX, ballY, BALL_SIZE, SH110X_BLACK);
}

void drawScores() {
  display.setTextSize(1);
  display.setTextColor(SH110X_WHITE);
  display.setCursor(48, 5);
  display.print(playerScore);
  display.setCursor(80, 5);
  display.print(cpuScore);
}

void drawStartScreen() {
  display.clearDisplay();
  display.setTextSize(2);
  display.setTextColor(SH110X_WHITE);
  display.setCursor(10, 10);
  display.print("Pong");
  display.setTextSize(1);
  display.setCursor(10, 30);
  display.print("Taller 5");
  display.setCursor(13, 40);
  display.print("Presiona un boton");
  display.display();
}

void waitForStartButton() {
  while (digitalRead(UP_BUTTON) == HIGH && digitalRead(DOWN_BUTTON) == HIGH) {
    delay(50);
  }

  // Espera hasta que ambos botones estén sueltos antes de continuar
  while (digitalRead(UP_BUTTON) == LOW || digitalRead(DOWN_BUTTON) == LOW) {
    delay(50);
  }

  gameStarted = true;
}

void waitForButtonPress() {
  display.setTextSize(1);
  display.setTextColor(SH110X_WHITE);
  display.setCursor(13, 40);
  display.print("Presiona un boton");
  display.display();

  display.setTextSize(1);
  display.setTextColor(SH110X_WHITE);
  display.setCursor(20, 50);
  display.print("Para reiniciar!");
  display.display();

  while (digitalRead(UP_BUTTON) == HIGH && digitalRead(DOWN_BUTTON) == HIGH) {
    delay(50);
  }

  // Espera hasta que ambos botones estén sueltos antes de continuar
  while (digitalRead(UP_BUTTON) == LOW || digitalRead(DOWN_BUTTON) == LOW) {
    delay(50);
  }

  // Reinicia el juego
  gameEnded = false;
  playerScore = 0;
  cpuScore = 0;
}

void checkWinner() {
  if (playerScore >= SCORE_LIMIT) {
    display.clearDisplay();
    display.setTextSize(2);
    display.setTextColor(SH110X_WHITE);
    display.setCursor(12, 20);
    display.print("PERDISTE!");
    display.display();
    gameEnded = true;
    DefeatTheme();  // Toca la melodía de derrota
    delay(500);    // Espera 2 segundos antes de reiniciar
  } else if (cpuScore >= SCORE_LIMIT) {
    display.clearDisplay();
    display.setTextSize(2);
    display.setTextColor(SH110X_WHITE);
    display.setCursor(20, 20);
    display.print("GANASTE!");
    display.display();
    gameEnded = true;
    VictoryTheme();  // Toca la melodía de victoria
    delay(500);     // Espera 2 segundos antes de reiniciar
  }

  if (gameEnded) {
    waitForButtonPress();
  }
}

void resetBall() {
  ballX = 64;
  ballY = 32;
}

void updatePaddles() {
  if (digitalRead(UP_BUTTON) == LOW && playerPaddleY > 0) {
    playerPaddleY -= paddleSpeed;
  }

  if (digitalRead(DOWN_BUTTON) == LOW && playerPaddleY < 64 - PADDLE_HEIGHT) {
    playerPaddleY += paddleSpeed;
  }

  if (ballY > cpuPaddleY + PADDLE_HEIGHT / 2 && cpuPaddleY < 64 - PADDLE_HEIGHT) {
    cpuPaddleY += cpuPaddleY < 64 - PADDLE_HEIGHT - CPU_SPEED ? CPU_SPEED : 0;
  } else if (ballY < cpuPaddleY + PADDLE_HEIGHT / 2 && cpuPaddleY > 0) {
    cpuPaddleY -= cpuPaddleY > CPU_SPEED ? CPU_SPEED : 0;
  }
}

void updateBall() {
  clearBall();

  ballX += ballSpeedX;
  ballY += ballSpeedY;

  if (ballY <= 0 || ballY >= 64) {
    ballSpeedY = -ballSpeedY;
  }

  if (ballX <= 2 + PADDLE_WIDTH && ballY >= cpuPaddleY && ballY <= cpuPaddleY + PADDLE_HEIGHT) {
    ballSpeedX = -ballSpeedX;
    playBuzzer();
  }

  if (ballX >= 126 - PADDLE_WIDTH && ballY >= playerPaddleY && ballY <= playerPaddleY + PADDLE_HEIGHT) {
    ballSpeedX = -ballSpeedX;
    playBuzzer();
  }

  if (ballX < 0 || ballX > 128) {
    if (ballX < 0) {
      cpuScore++;
    } else {
      playerScore++;
    }
    playBuzzer();
    resetBall();
  }

  drawBall();
  drawScores();
  checkWinner();
}

void drawCourt() {
  display.drawRect(0, 0, 128, 64, SH110X_WHITE);
}

void setup() {
  pinMode(UP_BUTTON, INPUT_PULLUP);
  pinMode(DOWN_BUTTON, INPUT_PULLUP);

  display.begin();
  display.display();
  delay(2000);

  setupBuzzer();
}

void loop() {
  if (!gameStarted) {
    drawStartScreen();
    waitForStartButton();
  }

  display.clearDisplay();
  drawCourt();

  if (!gameEnded) {
    updatePaddles();
    drawPaddles();
    updateBall();
  }

  display.display();
  delay(10);
}
