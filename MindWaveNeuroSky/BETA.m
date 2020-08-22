function [ysig,coefs]= BETA(archivo)
%figure(2)
%SEÑAL
pas=0.03;
%t=0:pas:10;
senal=archivo;

%FILTRO
fs=512;
wp=[13 30]/fs;
ws=[9 40]/fs;
rp=0.1;
rs=6;
[n,wn]=buttord(wp,ws,rp,rs);
[b,a]=butter(n,wn);
[h,f]=freqz(b,a,[],1025);
ysig=filter(b,a,senal);
coefs=cwt(ysig,1:512,'db8');

end