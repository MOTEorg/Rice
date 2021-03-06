clear all;
clc;


%Planta Temperatura
G = [1.6005 -0.6048;1 0];
H = [1;0];             
C = [0.0034 0.0033];

%Matriz de Probabilidades de 
%ir a estado du_j dado que se esta en estado du_i

%du/du  NG  NP  Z   PP  PG
%NG
%NP
%Z
%PP
%PG

%Trans=[0.2 0.7 0.1 0 0;
%    0 0.3 0.6 0.1 0;
%    0 0.1 .8 0.1 0;
%    0 0.1 0.6 0.3 0;
%    0 0 0.1 0.7 0.2];


Trans =[
       0.6772    0.3228         0         0         0
         0    0.6657    0.1303    0.2040         0
         0    0.2340    0.1667    0.5993         0
         0    0.2512    0.2605    0.4883         0
         0         0         0         0    1.0000];


%Matriz de Probabilidades de observar E_j dado du_i
%du/Error  NG  NP  Z   PP  PG
%NG
%NP
%Z
%PP
%PG

%Meas=[0.7 0.1 0 0.1 0.1;
%    0.1 0.7 0 0.1 0.1;
%    0 0 1 0 0;
%    0.1 0.1 0 0.7 .1;
%    0.1 0.1 0 0.1 0.7];


Meas =[
  0.3732    0.3411         0    0.2857         0
    0.3655    0.0818         0    0.0543    0.4984
         0         0    1.0000         0         0
    0.0000    0.3992         0    0.5673    0.0335
         0         0         0         0         0];



%Se busca du dado E, P(du|E)=(P(E|du)*P(du))/P(E)
%P(E_j)=Suma en i de (E_j|du_i)*P(du_i)

T=0.05;
Ke=acker(G',C',[0 0]);
ts = 80;                         % Tiempo simulacion
Muestras = floor(ts/T);                % # muestras a simular
x(:,1) = [0; 0];               % Condiciones iniciales
xg1(:,1) = [0; 0];
yg1(1)=0;
r=ones(1,Muestras)*15;
u1=0;
du=1;
u(1)=0;

%Probabilidad a priori de du_i
incert=0.00002; %incertidumbre
    pdu=zeros(1,5);
    flag=0;
    if du-1>0
        pdu(du-1)=incert;
        flag=flag+1;
    end
    if du+1<=length(pdu)
        pdu(du+1)=incert;
        flag=flag+1;
    end
    pdu(du)=1-flag*incert;
    
for k = 1 : Muestras
     % Planta
    x(:,k+1) = G*x(:,k) + H*u(k); 
    y(k)=C*x(:,k);
    
    %Observador
    yg1(k)=C*xg1(:,k);
    xg1(:,k+1)=H*u(k)+Ke'*(y(k)-yg1(k))+G*xg1(:,k);
    
    if y(k)<0
        y(k)=0;
    end
    %Red Bayesiana
    error=r(k)-y(k);
    estados(k,:)=pdu;
    pdu=pdu*Trans;
    if error>1
        E=1;
    else if error>0.1
            E=2;
        else if (error<0.1 && error>-0.1)
                E=3;
            else if error>-1
                    E=4;
                else
                    E=5;
                end
            end
        end
    end
    pa=(Meas.*[pdu' pdu' pdu' pdu' pdu']);%P(E|du)*P(du)
    pb=pdu*Meas; %P(E)
    pduE=pa(:,E)/pb(E);
    prob=[pduE(1) pduE(1)+pduE(2) pduE(1)+pduE(2)+pduE(3) pduE(1)+pduE(2)+pduE(3)+pduE(4) 1];
    l=rand(1);
    if l<prob(1)
        du=1;
    else if (l>prob(1) && l<prob(2))
            du=2;
        else if (l>prob(2) && l<prob(3))
                du=3;
            else if (l>prob(3) && l<prob(4))
                    du=4;
                else
                    du=5;
                end
            end
        end
    end
    switch du
        case 1
            v=6;
        case 2
            v=0.1;
        case 3
            v=0;
        case 4
            v=-0.5;
        case 5
            v=-1;
    end
    
   
    
    u(k+1)=u1+v;
    
    u1=u(k);
end

%pdu(1,:)=pdu*Trans;
%for i=2:10
%pdu(i,:)=pdu(i-1,:)*Trans;
%end