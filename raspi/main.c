#include <time.h>
#include <stdio.h>

//Devuelve un string con formato hh:mm:ss
void timestamp(char* v){
  struct tm localTime = localtime(time(NULL));
  int seg = localTime.tm_sec;
  int min = localTime.tm_min;
  int hor = localTime.tm_hour;

  sprintf(v,"%d:%d:%d",hor,min,seg);
}

//Añade una medida al archivo
void addLog(FILE* arx, float sig[16]){
  int i;
  char* times;
  for(i=0; i<16; i++){
    fprintf(arx, "%.2f,",sig[i]);
  }

  timestamp(times);
  fprintf(arx, "%s\n", times);
}
