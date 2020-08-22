unsigned char duty;
float frecuencia;
unsigned int contadorgeneral=0;
unsigned int duracion;
unsigned int periodo;
unsigned int cont_duracion=0;
unsigned int cont_periodo=0;
unsigned int cont1=0;
unsigned int cont2=0;
unsigned int tpwm;   //perido del servomotor
unsigned int dutypwm;//ciclo de trabajo del servomotor
unsigned int dutyr;
unsigned char aux;
unsigned int temp_duracion;
float temp_frecuencia;
unsigned char temp_duty;

void set_duty(unsigned char porcentaje){  //0 a 100
if (porcentaje>100){
porcentaje=100;
}
duty=(char)porcentaje*10.24;
CCPR1L=duty>>2;
aux=CCP1CON;
CCP1CON=(duty<<4 & 0x30)| aux;
}


void set_duracion(unsigned int dur){ //milisegundos, minimo 20;
if (dur<20) {
   dur=20;
}
if (dur>periodo){
dur=periodo;
}
duracion=dur;
//Tiempo timer1=65535-(TMR1H:TMR1L)*(8*1/2000000)=0,001
}

void set_frecuencia(float frec){ //Hz, minimo 0.1, maximo 5;

if (frec<0.1) {
   frec=0.1;
}
if (frec>5) {
   frec=5;
}
frecuencia=frec;
periodo= (int)(1000.0/frecuencia);
//Tiempo timer1=65535-(TMR1H:TMR1L)*(8*1/2000000)=0,001
}

//PWM del Motor
void set_frecPWM(unsigned int pwmf){    //Hz
tpwm=(int)(1000.0/pwmf);

}

void set_dutyPWM(unsigned int pwmd){ //ms
if (pwmd>tpwm){
pwmd=tpwm;
}
dutypwm=pwmd;
}
void main() {
//Inicio Timer0(Frecuencia pulso)

//Interrupciones
GIE_bit=1;
PEIE_bit=1;

//Inicio PWM 20KHz
TRISC2_bit=1;
TMR2=0xFF;
PIR2=0xFF;
CCP1CON=0x0C;
CCPR1L=0x00;
TMR2IF_bit=0;
T2CON=0x04;


//Inicio USART
//UART1_Init(9600);
//delay_ms(100);


//*************Configuracion inicial******************

//Configuracion Estimulo
set_frecuencia(1); //frecuencia   -0.1 a 5-  Hz
set_duracion(100); //duracion     -0 a 10000- ms
set_duty(80);      //fuerza       -0 a 100- por determinar
//Configuración Motor
set_frecPWM(50);  //frecuencia servomtor -Hz-
//set_dutyPWM(2);   //ciclotrabjo servomotor -ms-

//Puertos IO
SSPEN_bit=0;
ADCON1=0x0D;
TRISC2_bit=0;
TRISC0_bit=0;
TRISC1_bit=0;
TRISA5_bit=0;
TRISA4_bit=0;
TRISA3_bit=1;
LATB=0x00;
PORTB=0xFF;
TRISB=0xFC;
RB0_bit=1;
RB1_bit=1;
//inicio Timer1(Duración Pulso)
T1CON=0x11; //Preescalador 1:2
TMR1H=0xE0;
TMR1L=0xBF;
TMR1IE_bit=1;
TMR1IF_bit=0;
NOT_RBPU_bit=0;

while(1){
if (RB6_bit==0){
   delay_ms(50);
   if  (RB6_bit==0){
        temp_frecuencia=frecuencia+0.1;
        set_frecuencia(temp_frecuencia);
   }
}
if (RB7_bit==0){
   delay_ms(50);
   if  (RB7_bit==0){
        temp_frecuencia=frecuencia-0.1;
        set_frecuencia(temp_frecuencia);
   }
}
if (RB2_bit==0){
   delay_ms(50);
   if  (RB2_bit==0){
        temp_duracion=duracion+10;
        set_duracion(temp_duracion);
   }
}
if (RB3_bit==0){
   delay_ms(50);
   if  (RB3_bit==0){
        temp_duracion=duracion-10;
        set_duracion(temp_duracion);
   }
}
if (RB4_bit==0){
   delay_ms(50);
   if  (RB4_bit==0){
        temp_duty=duty+10;
        set_duty(temp_duty);
   }
}
if (RB5_bit==0){
   delay_ms(50);
   if  (RB5_bit==0){
        temp_duty=duty-10;
        set_duty(temp_duty);
   }
}

}
}

void interrupt(){
  if (TMR1IF_bit){
  cont_duracion++;
  cont_periodo++;
  cont1++;
  cont2++;
  contadorgeneral++;
  //Led
  if (contadorgeneral<1000){
  RA4_bit=0;
  }
  if (contadorgeneral>=1000){
  RA4_bit=1;
  }
  if (contadorgeneral>=2000){
  contadorgeneral=0;
  }
  //Motor
  if (cont1>=tpwm){
  cont1=0;
  cont2=0;
  }
  if(cont2>=dutypwm){
  RC1_bit=0;
  }
  if(cont2<dutypwm){
  RC1_bit=1;
  }
    //Estimulo
  if (cont_periodo>=periodo){
     cont_periodo=0;
     cont_duracion=0;
  }

  if (cont_duracion<=duracion){
     RC0_bit=1;
     set_dutyPWM(1);
  }
  if (cont_duracion>duracion){
     RC0_bit=0;
     set_dutyPWM(2);
  }
  TMR1H=0xE0;
  TMR1L=0xBF;
  TMR1IF_bit=0;
  }
}