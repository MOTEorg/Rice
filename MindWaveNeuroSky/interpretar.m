%Interpreta los datos obtenidos
%Devuelve un vector de cada
function [raw,delta,theta,Lalfa, Halfa, Lbeta,Hbeta,Lgamma, Hgamma, atention,meditation, signal, nerrores1,nerrores2]= interpretar(datos)
%inicalizacion de variables
ndatos=length(datos);
raw=zeros(1,round(ndatos/8));
delta=zeros(1,round(ndatos/4096));
theta=zeros(1,round(ndatos/4096));
Lalfa=zeros(1,round(ndatos/4096));
Halfa=zeros(1,round(ndatos/4096));
Lbeta=zeros(1,round(ndatos/4096));
Hbeta=zeros(1,round(ndatos/4096));
Lgamma= zeros(1,round(ndatos/4096));
Hgamma= zeros(1,round(ndatos/4096));
atention=zeros(1,round(ndatos/4096));
meditation= zeros(1,round(ndatos/4096));
signal=zeros(1,round(ndatos/4096));
rawk=1;
ondask=1;
nerrores1=0;
nerrores2=0;
i=1;
while nerrores1+nerrores2<30 && i<ndatos-nerrores1-8 %tolerancia de errores
    if datos(i)==170
        if datos(i+1)==170 %Encabezado 170 170
            nbytes=datos(i+2); %Numero de bytes transmitidos por paquete
            i=i+2;
            sum=0;
            databytes=zeros(1,nbytes);
            for j=1:nbytes  %Almacena y suma los datos de los bytes recibidos
                
                databytes(j)=datos(i+j);
                sum=sum+datos(i+j);
            end
            i=i+nbytes+1;
            if datos(i)==bitcmp(bitand(sum,255),8) 
                %Empieza la separacion de datos pues la suma de verificacion es
                %correcta
                if nbytes==3
                    %No se estan enviando datos
                    switch databytes(1)
                        case 209
                            msgbox ('Casco No Encontrado');
                            
                        case 210
                            msgbox('Casco Desconectado');
                           
                        case 211
                            msgbox ('Peticion Denegada');
                            
                        case 212
                            msgbox('Casco en Stand by');
                            
                    end
                elseif nbytes==4
                    
                    %recoge datos en bruto
                    rawactual=256*databytes(3)+databytes(4);
                    if rawactual>32767
                        raw(rawk)=rawactual-65536;
                    else
                        raw(rawk)=rawactual;
                    end
                    
                    rawk=rawk+1;
                elseif nbytes==32
                    %recoge el nivel de senal y el resto de ondas
                    
                    signal(ondask)=databytes(2);
                    delta(ondask)=databytes(5)*65535+databytes(6)*256+databytes(7);
                    theta(ondask)=databytes(8)*65535+databytes(9)*256+databytes(10);
                    Lalfa(ondask)=databytes(11)*65535+databytes(12)*256+databytes(13);
                    Halfa(ondask)=databytes(12)*65535+databytes(15)*256+databytes(16);
                    Lbeta(ondask)=databytes(17)*65535+databytes(18)*256+databytes(19);
                    Hbeta(ondask)=databytes(20)*65535+databytes(21)*256+databytes(22);
                    Lgamma(ondask)=databytes(23)*65535+databytes(24)*256+databytes(25);
                    Hgamma(ondask)=databytes(26)*65535+databytes(27)*256+databytes(28);
                    atention(ondask)=databytes(30);
                    meditation(ondask)=databytes(32);
                    ondask=ondask+1;
                else
                    nerrores1=nerrores1+1;
                end
                %Avanza al siguiente grupo de datos
                i=i+1;
            else
                %error en la suma de verificacion
                error=2;
                nerrores2=nerrores2+error;
            end
            
        else
            %Inicio de datos invalido
             
             error=1;
             nerrores1=nerrores1+error;
             %Busca en la siguiente posicion
            i=i+1;
            
        end
    else
        %Busca en la siguiente posicion
        i=i+1;
    end
    
end
end
