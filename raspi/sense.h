//Convierte un valor numérico a HIGH/LOW
int num2logic(int num);
//Configura el MUX para que deje pasar el canal chan.
void setMUX(int chan);
//Lee del ADC
float reADC();
//Inicializa todo lo relativo al ADC y el MUX
void adcmuxinit();
