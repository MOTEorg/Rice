for i=1:5
    
    datosdolor{i}=abrirraw(strcat('sujeto',num2str(i),'dolorraw.txt'));
    [gammadolor{i},wgammadolor{i}]=GAMMA(datosdolor{i});
    [betadolor{i},wbetadolor{i}]=BETA(datosdolor{i});
    [alfadolor{i},walfadolor{i}]=ALPHA(datosdolor{i});
    [thetadolor{i},wthetadolor{i}]=THETA(datosdolor{i});
    [deltadolor{i},wdeltadolor{i}]=DELTA(datosdolor{i});
    datosmanos{i}=abrirraw(strcat('sujeto',num2str(i),'manosraw.txt'));
    [gammamanos{i},wgammamanos{i}]=GAMMA(datosmanos{i});
    [betamanos{i},wbetamanos{i}]=BETA(datosmanos{i});
    [alfamanos{i},walfamanos{i}]=ALPHA(datosmanos{i});
    [thetamanos{i},wthetamanos{i}]=THETA(datosmanos{i});
    [deltamanos{i},wdeltamanos{i}]=DELTA(datosmanos{i});
    
    meangammadolor(i)=mean(mean(wgammadolor{i}));
    meanbetadolor(i)=mean(mean(wbetadolor{i}));
    meanalfadolor(i)=mean(mean(walfadolor{i}));
    meanthetadolor(i)=mean(mean(wthetadolor{i}));
    meandeltadolor(i)=mean(mean(wdeltadolor{i}));
    meangammamanos(i)=mean(mean(wgammamanos{i}));
    meanbetamanos(i)=mean(mean(wbetamanos{i}));
    meanalfamanos(i)=mean(mean(walfamanos{i}));
    meanthetamanos(i)=mean(mean(wthetamanos{i}));
    meandeltamanos(i)=mean(mean(wdeltamanos{i}));
    
   
    maxgammadolor(i)=max(max(wgammadolor{i}));
    maxbetadolor(i)=max(max(wbetadolor{i}));
    maxalfadolor(i)=max(max(walfadolor{i}));
    maxthetadolor(i)=max(max(wthetadolor{i}));
    maxdeltadolor(i)=max(max(wdeltadolor{i}));
    maxgammamanos(i)=max(max(wgammamanos{i}));
    maxbetamanos(i)=max(max(wbetamanos{i}));
    maxalfamanos(i)=max(max(walfamanos{i}));
    maxthetamanos(i)=max(max(wthetamanos{i}));
    maxdeltamanos(i)=max(max(wdeltamanos{i}));
    
   
    mingammadolor(i)=min(min(wgammadolor{i}));
    minbetadolor(i)=min(min(wbetadolor{i}));
    minalfadolor(i)=min(min(walfadolor{i}));
    minthetadolor(i)=min(min(wthetadolor{i}));
    mindeltadolor(i)=min(min(wdeltadolor{i}));
    mingammamanos(i)=min(min(wgammamanos{i}));
    minbetamanos(i)=min(min(wbetamanos{i}));
    minalfamanos(i)=min(min(walfamanos{i}));
    minthetamanos(i)=min(min(wthetamanos{i}));
    mindeltamanos(i)=min(min(wdeltamanos{i}));
    
   
    desgammadolor(i)=std(std(wgammadolor{i}));
    desbetadolor(i)=std(std(wbetadolor{i}));
    desalfadolor(i)=std(std(walfadolor{i}));
    desthetadolor(i)=std(std(wthetadolor{i}));
    desdeltadolor(i)=std(std(wdeltadolor{i}));
    desgammamanos(i)=std(std(wgammamanos{i}));
    desbetamanos(i)=std(std(wbetamanos{i}));
    desalfamanos(i)=std(std(walfamanos{i}));
    desthetamanos(i)=std(std(wthetamanos{i}));
    desdeltamanos(i)=std(std(wdeltamanos{i}));
end

