#include <TM1637Display.h>

#define CLK 2
#define DIO 3

TM1637Display display(CLK, DIO);

const uint8_t i[] = { SEG_E | SEG_F };        // Representación de la letra 'I'
const uint8_t love[] = { SEG_E | SEG_F | SEG_D, SEG_A | SEG_F | SEG_E | SEG_D |SEG_C | SEG_B, SEG_F | SEG_E | SEG_D |SEG_C | SEG_B, SEG_A | SEG_F | SEG_E | SEG_D | SEG_G };  // Representación de la palabra 'LOVE'
const uint8_t u[] = { SEG_F | SEG_E | SEG_D |SEG_C | SEG_B };  // Representación de la letra 'U'

const uint8_t clear[] = {SEG_G,SEG_G,SEG_G,SEG_G};

void setup() {
  display.setBrightness(5);
}

void loop() {
  display.setSegments(i,1, 0);        // Muestra la letra 'I'
  delay(1000);

  display.setSegments(clear, 4, 0);        // Muestra nada
  delay(1000);
  
  display.setSegments(love, 4, 0);     // Muestra la palabra 'LOVE'
  delay(1000);

  display.setSegments(clear, 1, 0);        // Muestra nada
  delay(1000);
  display.setSegments(clear, 1, 1);        // Muestra nada
  delay(1000);
  display.setSegments(clear, 1, 2);        // Muestra nada
  delay(1000);
  display.setSegments(clear, 1, 3);        // Muestra nada
  delay(1000);
  
  display.setSegments(u, 1, 2);        // Muestra la letra 'U'
  delay(1000);

  display.setSegments(clear, 4, 0);        // Muestra nada
  delay(1000);

}