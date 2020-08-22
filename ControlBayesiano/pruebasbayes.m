clc;
clear all;

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

%Probabilidad a priori de du_i


%Se busca du dado E, P(du|E)=(P(E|du)*P(du))/P(E)
%P(E_j)=Suma en i de (E_j|du_i)*P(du_i)
error=-50;
du=2;
incert=0.1; %incertidumbre  

pdu=zeros(1,5);
pdu(du)=1-incert;
if du-1>0
    pdu(du-1)=incert;
end
if du+1<length(pdu)
    pdu(du+1)=incert;
end
pdu1=pdu*Trans;
if error>10
        E=5;
    else if error>1
            E=4;
        else if (error<1 && error>-1)
                E=3;
            else if error>-10
                    E=2;
                else
                    E=1;
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
        u=0.1;
        break;
        case 2
            u=0.01;
        break;
        case 3
            u=0;
        break;
        case 4
            u=-0.01;
        break;
        case 5
            u=-0.1;
        break;
end
    
    
    