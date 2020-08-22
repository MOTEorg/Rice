function [ysig,coefs]= ALPHA(archivo)
%figure(2)
%SEÑAL

senal=archivo;

%FILTRO
fs=512;
wp=[8 13]/fs;
ws=[5 16]/fs;
rp=0.1;
rs=6;
[n,wn]=buttord(wp,ws,rp,rs);
[b,a]=butter(n,wn);
[h,f]=freqz(b,a,[],1025);

ysig=filter(b,a,senal);
coefs=cwt(ysig,1:512,'db8');


% ejet=[0:1/512:(length(senal)-1)/512];
% subplot(3,3,1);
% plot(ejet,senal);
% axis([min(ejet) max(ejet) min(senal) max(senal)]);
% %xlabel('t(s)');
% title('Señal a ser filtrada')
% 
% %ESPECTRO SEÑAL
% subplot(3,3,2);
% dim=length(senal)*pas;
% ejefrec=[0:512/(length(senal)-1):512];
% espectr=abs(fft(senal));
% espectr=espectr/max(espectr);
% plot(ejefrec,espectr);
% axis([0 100 0 max(espectr)]);
% %xlabel('Frecuencia(Hz)');
% title('Espectro de la Señal')



%subplot(3,3,3)
%plot(f,abs(h))
%axis([0 100 0 max(espectr)]);
%xlabel('f(Hz)')
%ylabel('|H(f)|')
%title('FILTRO PASABANDA DE BUTTERWORTH')

%SEÑAL FILTRADA

%subplot(3,3,4)
%ejet=[0:1/512:(length(senal)-1)/512];
%plot(ejet,ysig)
%axis([0 max(ejet) 0 max(ysig)]);
%title('SEÑAL FILTRADA')
%xlabel('t(s)');

%ESPECTRO SEÑAL FILTRADA
%spectr1=abs(fft(ysig));
%subplot(4,3,5)
%spectr1=spectr1/max(spectr1);
%plot(ejefrec,spectr1);
%axis([0 max(ejefrec) 0 max(spectr1)]);
%xlabel('F(Hz)')
%title('Espectro Filtrada')

%ESPECTROGRAMA
%subplot(3,3,5);
%spectrogram(ysig);
%title('Espectrograma')
%Transformada CWT 3D
%transformada=abs(fft(ysig));

%subplot(3,3,6);
%hold off;
%plot(ejet,ysig);
%title('Alpha')
%subplot(3,3,7);
%ejefrec=[0:512/(length(transformada(5:1029))-1):512];
%plot(ejefrec,transformada(5:1029));
%axis([0 100 0 max(transformada)]);
%title('Transformada Alpha')

%subplot(3,3,8);
%mesh(coefs)
%title('CWT 3d')
%Transformada 2D CWT
%subplot(3,3,9);
%contourf(coefs);

end