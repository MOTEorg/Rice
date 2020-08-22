clc;
clear all;
datos=load('LQR.txt');
%setpoint=load('LQR.txt');
setpoint=datos(:,1);
e=setpoint-datos(:,2);
eint=e(3:1000);
u=datos(:,4);
de=eint-e(1:998);
du=(u(2:999)-u(1:998));
danf=[de,du];
%Matriz de Probabilidades de 
%ir a estado du_j dado que se esta en estado du_i

%du/du  PG  PP  Z   NP  NG
%PG
%PP
%Z
%NP
%NG
Trans=[0.2 0.7 0.1 0 0;
        0 0.3 0.6 0.1 0;
        0 0.1 0.8 0.1 0;
        0 0.1 0.6 0.3 0;
        0 0 0.1 0.7 0.2];


%Matriz de Probabilidades de observar E_j dado du_i
%du/Error  NG  NP  Z   PP  PG
%NG
%NP
%Z
%PP
%PG

Meas=[0.7 0.1 0 0.1 0.1;
      0.1 0.7 0 0.1 0.1;
      0   0   1  0  0;
      0.1 0.1 0 0.7 .1;
      0.1 0.1 0 0.1 0.7];
  
for i=1:99
if eint(i)>2
        E(i)=1;
    else if eint(i)>0.1
            E(i)=2;
        else if (eint(i)<0.1 && eint(i)>-0.1)
                E(i)=3;
            else if eint(i)>-2
                    E(i)=4;
                else
                    E(i)=5;
                end
            end
        end
end


if du(i)>0.4
        est(i)=1;
    else if du(i)>0.1
            est(i)=2;
        else if (du(i)<0.1 && du(i)>-0.1)
                est(i)=3;
            else if du(i)>-0.4 
                    est(i)=4;
                else
                    est(i)=5;
                end
            end
        end
end
end

%[Trans1,Meas1]=hmmtrain(E,Trans,Meas);
[Trans2,Meas2]=hmmtrain(est,Trans,Meas);

%Probar modelo

%k=1;
%for x=-5:0.5:5
%    eval(k)=evalfis(x,anfistemp);
%    k=k+1;
%end
%x=-5:0.5:5;
%plot(x,eval);