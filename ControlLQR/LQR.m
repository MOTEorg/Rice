%A = [1.2447 1 %Matriz de estados
%-0.3448 0];
%B = [26.29; 31.58]; %Matriz de ponderación de entradas
%C=[0.01 0];
A = [1.6005 -0.6048;1 0];
B = [1;0];             
C = [0.0034 0.0033];

Q=[1 0; 0 100];
R=[10000];

H=[A+B*R^-1*B'*(A')^-1*Q  -B*R^-1*B'*(A')^-1;
   -(A^-1)'*Q (A^-1)'];
[eigvectors,eigvalues]=eig(H);

XI=eigvectors(1:2,3:4);
YI=eigvectors(3:4,3:4);
EH=eigvalues(3:4,3:4);
W=YI*EH;
E=(R^-1)*B'*W*XI^-1;
HGp=ss(A,B,C,0);
%************************ - Respuesta del sistema - ***********************
x0 = [20;10]; %Vector inicial de estados
ftime = 2; %Tiempo de simulación
T = 0.01; %Tiempo de muestreo
N = ftime/T; %# Muestras totales
x(:,1) = x0; %Vector de estados inicial
u(1) = E*x0;
Ko = 1.30351; %Ganancia Ajustable del sistema
r = ones(1,N); %Entrada al sistema, escalón.
for k = 1 : N - 1 %Ciclo de simulación
x(:,k+1) = A*x(:,k) + B*u(k);
u(:,k+1) = r(k) - E*x(:,k+1);
y(:,k+1) = C*x(:,k+1);
end
t = T*[0:N - 1]; %Vector de tiempo
plot(t,r,'r--','LineWidth',2)
hold on
plot(t,y,'b.-','LineWidth',2)
title('Simulación de un sistema de control para una válvula electrohidráulica');
xlabel('Tiempo (s)');
grid on;
