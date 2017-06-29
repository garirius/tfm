#include <wiringPi.h>
#include <stdio.h>
#include <mcp3004.h>

//Pines de control del MUX
#define PINA 23 //msb
#define PINB 23
#define PINC 23
#define PIND 23 //lsb
#define CHMUX 16 //los canales del MUX

//Convierte un valor numérico a HIGH/LOW
int num2logic(int num){
  if(num>=0){
    return LOW;
  } else {
    return HIGH;
  }
}

//Configura el MUX para que deje pasar el canal chan.
void setMUX(int chan){
  char aux[4],i, var=1;
  if(chan<0 || chan>=CHMUX-1){
    printf("Escoja un canal válido.\n");
  } else {
    for(i=0; i<4; i++){
      aux[i]=num2logic((chan/var)%2);
      var = 2*var;
    }

    digitalWrite(PINA,aux[3]); //MSB
    digitalWrite(PINB,aux[2]);
    digitalWrite(PINC,aux[1]);
    digitalWrite(PIND,aux[0]); //LSB
  }
}

//Lee del ADC
float reADC(){
  int x = analogRead(100);
  return 3.3*x/1024.0;
}

//Inicializa todo lo relativo al ADC y el MUX
void adcmuxinit(){
  mcp3004Setup(100,0);
  pinMode(PINA,OUTPUT);
  pinMode(PINB,OUTPUT);
  pinMode(PINC,OUTPUT);
  pinMode(PIND,OUTPUT);
}

int main(){
  int n=9;
  int a,b,c,d;

  d = n%2;
  c = (n/2)%2;
  b = (n/4)%2;
  a = (n/8)%2;

  printf("%d%d%d%d\n", a,b,c,d);
}
