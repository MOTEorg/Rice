for i=1:5
    %Concentracion 
    datosblanco{i}=abrirraw(strcat('sujeto',num2str(i),'blancoraw.txt'));
    [gammablanco{i},wgammablanco{i}]=GAMMA(datosblanco{i}(1024:2048));
    [betablanco{i},wbetablanco{i}]=BETA(datosblanco{i}(1024:2048));
    [alfablanco{i},walfablanco{i}]=ALPHA(datosblanco{i}(1024:2048));
    [thetablanco{i},wthetablanco{i}]=THETA(datosblanco{i}(1024:2048));
    [deltablanco{i},wdeltablanco{i}]=DELTA(datosblanco{i}(1024:2048));
    datosnegro{i}=abrirraw(strcat('sujeto',num2str(i),'negroraw.txt'));
    [gammanegro{i},wgammanegro{i}]=GAMMA(datosnegro{i}(1024:2048));
    [betanegro{i},wbetanegro{i}]=BETA(datosnegro{i}(1024:2048));
    [alfanegro{i},walfanegro{i}]=ALPHA(datosnegro{i}(1024:2048));
    [thetanegro{i},wthetanegro{i}]=THETA(datosnegro{i}(1024:2048));
    [deltanegro{i},wdeltanegro{i}]=DELTA(datosnegro{i}(1024:2048));
    %Dolor
    datosdolor{i}=abrirraw(strcat('sujeto',num2str(i),'dolorraw.txt'));
    % Sin estimulo <2560
    [gammasdolor{i},wgammasdolor{i}]=GAMMA(datosdolor{i}(1024:2048));
    [betasdolor{i},wbetasdolor{i}]=BETA(datosdolor{i}(1024:2048));
    [alfasdolor{i},walfasdolor{i}]=ALPHA(datosdolor{i}(1024:2048));
    [thetasdolor{i},wthetasdolor{i}]=THETA(datosdolor{i}(1024:2048));
    [deltasdolor{i},wdeltasdolor{i}]=DELTA(datosdolor{i}(1024:2048));
    % Estimulo >2560
    [gammacdolor{i},wgammacdolor{i}]=GAMMA(datosdolor{i}(2560:3584));
    [betacdolor{i},wbetacdolor{i}]=BETA(datosdolor{i}(2560:3584));
    [alfacdolor{i},walfacdolor{i}]=ALPHA(datosdolor{i}(2560:3584));
    [thetacdolor{i},wthetacdolor{i}]=THETA(datosdolor{i}(2560:3584));
    [deltacdolor{i},wdeltacdolor{i}]=DELTA(datosdolor{i}(2560:3584));
    
    %Movimiento
    datosmanos{i}=abrirraw(strcat('sujeto',num2str(i),'manosraw.txt'));
    %Izquierda
    [gammaimanos{i},wgammaimanos{i}]=GAMMA(datosmanos{i}(1024:2048));
    [betaimanos{i},wbetaimanos{i}]=BETA(datosmanos{i}(1024:2048));
    [alfaimanos{i},walfaimanos{i}]=ALPHA(datosmanos{i}(1024:2048));
    [thetaimanos{i},wthetaimanos{i}]=THETA(datosmanos{i}(1024:2048));
    [deltaimanos{i},wdeltaimanos{i}]=DELTA(datosmanos{i}(1024:2048));
    %Derecha
    [gammadmanos{i},wgammadmanos{i}]=GAMMA(datosmanos{i}(3584:4608));
    [betadmanos{i},wbetadmanos{i}]=BETA(datosmanos{i}(3584:4608));
    [alfadmanos{i},walfadmanos{i}]=ALPHA(datosmanos{i}(3584:4608));
    [thetadmanos{i},wthetadmanos{i}]=THETA(datosmanos{i}(3584:4608));
    [deltadmanos{i},wdeltadmanos{i}]=DELTA(datosmanos{i}(3584:4608));
    % *******************Media**********************
    
    %Concentracion
    meangammablanco(i)=mean(mean(wgammablanco{i}));
    meanbetablanco(i)=mean(mean(wbetablanco{i}));
    meanalfablanco(i)=mean(mean(walfablanco{i}));
    meanthetablanco(i)=mean(mean(wthetablanco{i}));
    meandeltablanco(i)=mean(mean(wdeltablanco{i}));
    meangammanegro(i)=mean(mean(wgammanegro{i}));
    meanbetanegro(i)=mean(mean(wbetanegro{i}));
    meanalfanegro(i)=mean(mean(walfanegro{i}));
    meanthetanegro(i)=mean(mean(wthetanegro{i}));
    meandeltanegro(i)=mean(mean(wdeltanegro{i}));
    
    %dolor
    meangammasdolor(i)=mean(mean(wgammasdolor{i}));
    meanbetasdolor(i)=mean(mean(wbetasdolor{i}));
    meanalfasdolor(i)=mean(mean(walfasdolor{i}));
    meanthetasdolor(i)=mean(mean(wthetasdolor{i}));
    meandeltasdolor(i)=mean(mean(wdeltasdolor{i}));
    
    meangammacdolor(i)=mean(mean(wgammacdolor{i}));
    meanbetacdolor(i)=mean(mean(wbetacdolor{i}));
    meanalfacdolor(i)=mean(mean(walfacdolor{i}));
    meanthetacdolor(i)=mean(mean(wthetacdolor{i}));
    meandeltacdolor(i)=mean(mean(wdeltacdolor{i}));
    
    %movimiento
    meangammaimanos(i)=mean(mean(wgammaimanos{i}));
    meanbetaimanos(i)=mean(mean(wbetaimanos{i}));
    meanalfaimanos(i)=mean(mean(walfaimanos{i}));
    meanthetaimanos(i)=mean(mean(wthetaimanos{i}));
    meandeltaimanos(i)=mean(mean(wdeltaimanos{i}));
    
    meangammadmanos(i)=mean(mean(wgammadmanos{i}));
    meanbetadmanos(i)=mean(mean(wbetadmanos{i}));
    meanalfadmanos(i)=mean(mean(walfadmanos{i}));
    meanthetadmanos(i)=mean(mean(wthetadmanos{i}));
    meandeltadmanos(i)=mean(mean(wdeltadmanos{i}));
    
    %**********Maximo*************************
    maxgammablanco(i)=max(max(wgammablanco{i}));
    maxbetablanco(i)=max(max(wbetablanco{i}));
    maxalfablanco(i)=max(max(walfablanco{i}));
    maxthetablanco(i)=max(max(wthetablanco{i}));
    maxdeltablanco(i)=max(max(wdeltablanco{i}));
    maxgammanegro(i)=max(max(wgammanegro{i}));
    maxbetanegro(i)=max(max(wbetanegro{i}));
    maxalfanegro(i)=max(max(walfanegro{i}));
    maxthetanegro(i)=max(max(wthetanegro{i}));
    maxdeltanegro(i)=max(max(wdeltanegro{i}));
    
    
    maxgammasdolor(i)=max(max(wgammasdolor{i}));
    maxbetasdolor(i)=max(max(wbetasdolor{i}));
    maxalfasdolor(i)=max(max(walfasdolor{i}));
    maxthetasdolor(i)=max(max(wthetasdolor{i}));
    maxdeltasdolor(i)=max(max(wdeltasdolor{i}));
    
    maxgammacdolor(i)=max(max(wgammacdolor{i}));
    maxbetacdolor(i)=max(max(wbetacdolor{i}));
    maxalfacdolor(i)=max(max(walfacdolor{i}));
    maxthetacdolor(i)=max(max(wthetacdolor{i}));
    maxdeltacdolor(i)=max(max(wdeltacdolor{i}));
    
    maxgammaimanos(i)=max(max(wgammaimanos{i}));
    maxbetaimanos(i)=max(max(wbetaimanos{i}));
    maxalfaimanos(i)=max(max(walfaimanos{i}));
    maxthetaimanos(i)=max(max(wthetaimanos{i}));
    maxdeltaimanos(i)=max(max(wdeltaimanos{i}));
    
    maxgammadmanos(i)=max(max(wgammadmanos{i}));
    maxbetadmanos(i)=max(max(wbetadmanos{i}));
    maxalfadmanos(i)=max(max(walfadmanos{i}));
    maxthetadmanos(i)=max(max(wthetadmanos{i}));
    maxdeltadmanos(i)=max(max(wdeltadmanos{i}));
    
    
    %***********Minimo****************************
    mingammablanco(i)=min(min(wgammablanco{i}));
    minbetablanco(i)=min(min(wbetablanco{i}));
    minalfablanco(i)=min(min(walfablanco{i}));
    minthetablanco(i)=min(min(wthetablanco{i}));
    mindeltablanco(i)=min(min(wdeltablanco{i}));
    mingammanegro(i)=min(min(wgammanegro{i}));
    minbetanegro(i)=min(min(wbetanegro{i}));
    minalfanegro(i)=min(min(walfanegro{i}));
    minthetanegro(i)=min(min(wthetanegro{i}));
    mindeltanegro(i)=min(min(wdeltanegro{i}));
    
    mingammasdolor(i)=min(min(wgammasdolor{i}));
    minbetasdolor(i)=min(min(wbetasdolor{i}));
    minalfasdolor(i)=min(min(walfasdolor{i}));
    minthetasdolor(i)=min(min(wthetasdolor{i}));
    mindeltasdolor(i)=min(min(wdeltasdolor{i}));
    
    mingammacdolor(i)=min(min(wgammacdolor{i}));
    minbetacdolor(i)=min(min(wbetacdolor{i}));
    minalfacdolor(i)=min(min(walfacdolor{i}));
    minthetacdolor(i)=min(min(wthetacdolor{i}));
    mindeltacdolor(i)=min(min(wdeltacdolor{i}));
    
    mingammaimanos(i)=min(min(wgammaimanos{i}));
    minbetaimanos(i)=min(min(wbetaimanos{i}));
    minalfaimanos(i)=min(min(walfaimanos{i}));
    minthetaimanos(i)=min(min(wthetaimanos{i}));
    mindeltaimanos(i)=min(min(wdeltaimanos{i}));
    
    mingammadmanos(i)=min(min(wgammadmanos{i}));
    minbetadmanos(i)=min(min(wbetadmanos{i}));
    minalfadmanos(i)=min(min(walfadmanos{i}));
    minthetadmanos(i)=min(min(wthetadmanos{i}));
    mindeltadmanos(i)=min(min(wdeltadmanos{i}));
    
    %**************Desviacion********************
    desgammablanco(i)=std(std(wgammablanco{i}));
    desbetablanco(i)=std(std(wbetablanco{i}));
    desalfablanco(i)=std(std(walfablanco{i}));
    desthetablanco(i)=std(std(wthetablanco{i}));
    desdeltablanco(i)=std(std(wdeltablanco{i}));
    desgammanegro(i)=std(std(wgammanegro{i}));
    desbetanegro(i)=std(std(wbetanegro{i}));
    desalfanegro(i)=std(std(walfanegro{i}));
    desthetanegro(i)=std(std(wthetanegro{i}));
    desdeltanegro(i)=std(std(wdeltanegro{i}));
    
    
    desgammasdolor(i)=std(std(wgammasdolor{i}));
    desbetasdolor(i)=std(std(wbetasdolor{i}));
    desalfasdolor(i)=std(std(walfasdolor{i}));
    desthetasdolor(i)=std(std(wthetasdolor{i}));
    desdeltasdolor(i)=std(std(wdeltasdolor{i}));
    
    desgammacdolor(i)=std(std(wgammacdolor{i}));
    desbetacdolor(i)=std(std(wbetacdolor{i}));
    desalfacdolor(i)=std(std(walfacdolor{i}));
    desthetacdolor(i)=std(std(wthetacdolor{i}));
    desdeltacdolor(i)=std(std(wdeltacdolor{i}));
    
    desgammaimanos(i)=std(std(wgammaimanos{i}));
    desbetaimanos(i)=std(std(wbetaimanos{i}));
    desalfaimanos(i)=std(std(walfaimanos{i}));
    desthetaimanos(i)=std(std(wthetaimanos{i}));
    desdeltaimanos(i)=std(std(wdeltaimanos{i}));
   
    desgammadmanos(i)=std(std(wgammadmanos{i}));
    desbetadmanos(i)=std(std(wbetadmanos{i}));
    desalfadmanos(i)=std(std(walfadmanos{i}));
    desthetadmanos(i)=std(std(wthetadmanos{i}));
    desdeltadmanos(i)=std(std(wdeltadmanos{i}));
end

