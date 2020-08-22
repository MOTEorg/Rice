%S=tf('s');
%ki=256.97;
%kp=0.0282667;
%PI=kp+ki/S;
%bode(PI)
%c2d(PI,0.0002,'tautin')
t=0:0.0002:2;
escalon=zeros(1,10001);
escalon(5000:8000)=0.3;
escalonfreq=ones(1,10001);
escalonfreq(2500:4999)=0.98;
%senal @a distorsionada
Vin=sin(2*pi*60*escalonfreq.*t)+1+0.2*sin(2*pi*180*t)+0.1*sin(2*pi*300*t)+escalon;
%senal @a casi tal cual entra al adc
%Vin=sin(2*pi*60*t)+1;
%senal @b sin filtro;
%b=cos(2*pi*60*t)

fase=0;
a2=0;
a3=0;
b2=0;
b3=0;
integ2=0;
sal2=0;
E2=0;
maxa=1;
maxb=1;
Vdc=1;
j=0;
sum=0;
for i=1:length(t)
    %Tomar la senal del ADC y quitar el offset
    sum=sum+Vin(i);
    j=j+1;
    if j==84
        Vdc=sum/84;
        sum=0;
        j=0;
    end
    a(i)=Vin(i)-Vdc;
    
    %aqui esta el filro y amplificado b*10 
    b(i)=0.038*a(i)+0.038*a2+0.9924*b2;
    if b(i)>1
        b(i)=1;
    end
    if b(i)<-1;
        b(i)=-1;
    end
    
    %senales normalizadas
    %c(i)=bamp(i)/sqrt(maxa^2+maxb^2);
    %d(i)=a(i)/sqrt(maxa^2+maxb^2);
    
    %AlhpaBeta a dq
        
    E(i)=b(i)/sqrt(maxa^2+maxb^2)*cos(fase)-a(i)/sqrt(maxa^2+maxb^2)*sin(fase);
    %Controlador P(i)
    %sal(i)=0.02498*E(i)+0.02506*E2+sal2;
    sal(i)=0.082*E(i)+0.082*E2+sal2;
    %sal(i)=-0.018*E(i)+0.138*E2+sal2;
    if sal(i)<0.5
        sal(i)=0.5;
    end
    if sal(i)>1.2
        sal(i)=1.2;
    end
    
    %Integrador  multiplicado(amplificado) por w
    integ(i)=2*pi*60*(0.0001*sal(i)+0.0001*sal2)+integ2;
    if integ(i)>6.283185
        integ(i)=0;
    end
    if integ(i)<0
        integ(i)=0;
    end
    integ2=integ(i);
    fase=integ(i);
    a2=a(i);
    b2=b(i);
    E2=E(i);
    sal2=sal(i);
    %spi=sal(i);
    if a(i)>maxa
        maxa=a(i);
    end
    if b(i)>maxb
        maxb=b(i);
    end
    comp(i)=cos(fase);
end
figure(1)
plot (t,Vin)
figure(2)
plot(t,a)
figure(3)
plot(t,b)
figure(4)
plot(t,a,t,comp)