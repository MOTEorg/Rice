clc;
clear all;

G=[1.2447 1; -0.3448 0];
H=[26.29; 31.58];
C=[1 0];
%Planta Temperatura
%G = [1.6005 -0.6048;1 0];
%H = [1;0];             
%C = [0.0034 0.0033];

%Planta Temperatura 2
%G=[1.6545, -0.6574;1, 0];
%H=[1 ; 0];
%C=[0.0089, -0.0023];
D=0;
tss=0.2;
T=0.05;
z1=exp((-4.053+1i*2.34)*T/tss);
z2=exp((-4.053-1i*2.34)*T/tss);
syms 'z'
poly=(z-z1)*(z-z2);
poly=sym2poly(poly);
N=[C; C*G];
phiG=poly(1)*G^2+poly(2)*G+poly(3);
%phiG=G^2;
J=[0; 1];
Ke=G^2*N^-1*J
ke1=acker(G,H,[0 0]);
ts = 10;                         % Tiempo simulacion
Muestras = floor(ts/T);                % # muestras a simular
x(:,1) = [0; 0];               % Condiciones iniciales
xg1(:,1) = [0; 0];
yg1(1)=0;
r=ones(1,Muestras)*30;
u1=0;
for k = 1 : Muestras
      % Algoritmo de control
    u(k)= r(k)-K*xg1(:,k);       % Algoritmo de control
    x(:,k+1) = G*x(:,k) + H*u(k); % Planta
    y(k)=C*x(:,k);
    yg1(k)=C*xg1(:,k);
    xg1(:,k+1)=H*u(k)+Ke*(y(k)-yg1(k))+G*xg1(:,k);
    u1=u(k);
end

figure(1)
plot(1:Muestras+1,x(1,:)-xg1(1,:),1:Muestras+1,x(2,:)-xg1(2,:))
figure(2)
plot(y)
figure(3)
plot(1:Muestras+1,K*xg1(:,:))
figure(4)
plot(yg1)
figure(5)
plot(u)