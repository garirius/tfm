#include <wiringpi.h>
#include <stdio.h>
#define PINU 17
#define PIND 18
#define POSI 64
#define RMAX 10000
int currpos = POSI-1;

//Devuelve la resistencia (en ohmios)
float getR(){
  return currpos*RMAX/float(POSI);
}

//Pulso en el pin where
void pulso(int where){
  digitalWrite(where,HIGH);
  delay(20);
  digitalWrite(where,LOW);
}

//Va a la posición pos del wiper
void goToPos(int pos){
  int which; //pin que vamos a usar
  int delta = pos - currpos;
  int i;
  if(pos<0 || pos>POSI-1){
    printf("Escoja una posición válida\n");
  } else {
    if(delta != 0){
      if(delta>0){
        which = PINU;
      } else {
        which = PIND;
        delta = -delta;
      }

      for(i=0; i<delta){
        pulso(which);
        delay(20);
      }
      currpos = pos;
  }
}

//Inicializa el potenciómetro poniendo R=0
void resistini(){
  pinMode(PINU,OUTPUT);
  pinMode(PIND,OUTPUT);
  goToPos(0);
}
