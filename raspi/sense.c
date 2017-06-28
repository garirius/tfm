//#include <wiringPi.h>
#include <stdio.h>

//Pines de control del MUX
#define PINA 23 //msb
#define PINB 23
#define PINC 23
#define PIND 23 //lsb
#define CHAN 16 //los canales del MUX

//Convierte un valor numérico a HIGH/LOW
// int num2logic(int num){
//   if(num>=0){
//     return LOW;
//   } else {
//     return HIGH;
//   }
// }
/*void setMUX(int chan){
  int aux[4];
  if(chan<0 || chan>=CHAN-1){
    printf("Escoja un canal válido.\n");
  } else {

  }
}*/

int main(){
  int n=9;
  int a,b,c,d;

  d = n%2;
  c = (n/2)%2;
  b = (n/4)%2;
  a = (n/8)%2;

  printf("%d%d%d%d\n", a,b,c,d);
}
