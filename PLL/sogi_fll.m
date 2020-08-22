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
Prod2=0;
integ2=0;
maxa=1;
maxb=1;
maxv=1;
spi=0;
frecuenciacentral=2*pi*60;
Vdc=1;
sum=0;
%Gamma=60;
Y=frecuenciacentral/(maxa^2+maxb^2)*60;

for i=1:length(t)
    if i==1
    Y(i)=Y;
    frecuencia(i)=frecuenciacentral;
    vp(i)=0;
    vq(i)=0;
    else
        frecuencia(i)=integ(i-1)+frecuenciacentral;
        Y(i)=frecuencia(i)/(maxv^2+maxb^2)*60;
        vp(i)=vp(i-1);
        vq(i)=vq(i-1);
    end
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
    %vp(i)=0.03628*norma(i)-0.03628*a3+1.922*vp2-0.9274*vp3;
    %vq(i)=0.001368*norma(i)+0.002735*a2+0.001368*a3+1.922*vq2-0.9274*vq3;
    
    %%%%Integrales para sogi con frecuencia central variable.
    Ev(i)=norma(i)-vp(i);
    vp(i)=frecuencia(i)*(0.0001*(Ev(i)-vq(i))+0.0001*a2)+vp2;
    if vp(i)>1
        vp(i)=1;
    end
    if vp(i)<-1
        vp(i)=-1;
    end
    vq(i)=frecuencia(i)*(0.0001*vp(i)+0.0001*vp2)+vq2;
    if vq(i)>1
        vq(i)=1;
    end
    if vq(i)<-1
        vq(i)=-1;
    end
    
    
    Prod(i)=-Ev(i)*vq(i)*Y(i);
    
    %Integrador
    integ(i)=0.0001*Prod(i)+0.0001*Prod2+integ2;
    if integ(i)>1
        integ(i)=1;
    end
    if integ(i)<-1
        integ(i)=-1;
    end
    
    
    
    %%%%%Forma facil de obtener la fase
    phase(i)=atan2(vq(i),vp(i))+pi;
    Prod2=Prod(i);
    integ2=integ(i);
    fase=integ(i);
    vp3=vp2;
    vp2=vp(i);
    vq3=vq2;
    vq2=vq(i);
    a3=a2;
    a2=Ev(i)-vq(i);
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
    if vp(i)>maxv
        maxv=vq(i);
    end
    comp(i)=-cos(phase(i));
   %comp2(i)=cos(integ(i));
end
figure(1)
plot(t,vp,t,vq)
figure(2)
%comp:atan, comp1:PLL, a:original
plot(t,comp,t,a)
figure(3)
plot(t,Ev)
figure(4)
plot(t,frecuencia)
figure(6)
plot(t,integ)