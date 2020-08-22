%S=tf('s');
%ki=256.97;
%kp=0.0282667;
%PI=kp+ki/S;
%bode(PI)
%c2d(PI,0.0002,'tautin')
clear all;
t=0:0.0002:2;
escalon=zeros(1,10001);
escalon(5000:8000)=0.3;
escalonfreq=ones(1,10001);
escalonfreq(2500:4999)=0.98;
%poca distorsion
%a=sin(2*pi*60*t)+1+0.1*sin(2*pi*180*t);
%con distorsion
Vin=sin(2*pi*60*escalonfreq.*t)+1+0.2*sin(2*pi*180*t)+0.1*sin(2*pi*300*t)+escalon;
%b=cos(2*pi*60*t)+1;
sal2=0;
E2=0;
fase=0;
a2=0;
a3=0;
vp2=0;
vp3=0;
vq2=0;
vq3=0;
c2=0;
d2=0;
integ2=0;
maxa=1;
maxb=1;
spi=0;
frecuencia=2*pi*60;
Vdc=1;
sum=0;

for i=1:length(t)
    %quitar offset de continua
    sum=sum+Vin(i);
    j=j+1;
    if j==84
        Vdc=sum/84;
        sum=0;
        j=0;
    end
    a(i)=Vin(i)-Vdc;
    %normalizar
    norma(i)=a(i)/maxa;
    
    %SOGI con frecuencia central fija
    vp(i)=0.03628*norma(i)-0.03628*a3+1.922*vp2-0.9274*vp3;
    vq(i)=0.001368*norma(i)+0.002735*a2+0.001368*a3+1.922*vq2-0.9274*vq3;
    
    %%%%Integrales para sogi con frecuencia central variable.
    %c(i)=frecuencia*(0.0001*norma(i)+0.0001*a2)+c2;
    %if c(i)>1
    %    c(i)=1;
    %end
    %if c(i)<-1
    %    c(i)=-1;
    %end
    %d(i)=frecuencia*(0.0001*c(i)+0.0001*c2)+d2;
    %if d(i)>1
    %    d(i)=1;
    %end
    %if d(i)<-1
    %    d(i)=-1;
    % end
    %integ(i)=fase+sal(i);
    %c2=c(i);
    %d2=d(i);
    
    %%%%%Forma facil de obtener la fase
    phase(i)=atan2(vq(i),vp(i))+pi;
    
    %%%Usando PLL
    %AB-dq
    E(i)=vq(i)/sqrt(maxa^2+maxb^2)*cos(fase)-vp(i)/sqrt(maxa^2+maxb^2)*sin(fase);
    
    %Controlador P(i)
    %sal(i)=0.02498*E(i)+0.02506*E2+sal2;
     sal(i)=0.082*E(i)+0.0821*E2+sal2;
     %sal(i)=0.006137*E(i)+0.006157*E2+sal2;
    if sal(i)<0.6
        sal(i)=0.6;
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
    E2=E(i);
    sal2=sal(i);
    vp3=vp2;
    vp2=vp(i);
    vq3=vq2;
    vq2=vq(i);
    a3=a2;
    a2=norma(i);
    %if integ(i)>6.283185
     %   ig(i)=0;
     %   integ(i)=0;
    %end
    %integ2=integ(i);
    %fase=integ(i);
    %E1=E(i);
    %sal1=sal(i);
    %spi=sal(i);
    if a(i)>maxa
        maxa=a(i);
    end
    if vq(i)>maxb
        maxb=vq(i);
    end
    comp(i)=-cos(phase(i));
    comp2(i)=cos(integ(i));
end
figure(1)
plot(t,vp,t,vq)
figure(2)
%comp:atan, comp1:PLL, a:original
plot(t,comp,t,comp2,t,a)
figure(3)
plot(t,sal)
figure(4)
plot(t(1:9960),integ(1:9960),t(1:9960),phase(42:10001))