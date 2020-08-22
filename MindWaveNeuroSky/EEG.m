function varargout = EEG(varargin)
% EEG MATLAB code for EEG.fig
%      EEG, by itself, creates a new EEG or raises the existing
%      singleton*.
%
%      H = EEG returns the handle to a new EEG or the handle to
%      the existing singleton*.
%
%      EEG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EEG.M with the given input arguments.
%
%      EEG('Property','Value',...) creates a new EEG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EEG_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EEG_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EEG

% Last Modified by GUIDE v2.5 14-Sep-2014 15:56:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EEG_OpeningFcn, ...
                   'gui_OutputFcn',  @EEG_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before EEG is made visible.
function EEG_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EEG (see VARARGIN)

% Choose default command line output for EEG
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EEG wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EEG_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtPuerto_Callback(hObject, eventdata, handles)
% hObject    handle to txtPuerto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtPuerto as text
%        str2double(get(hObject,'String')) returns contents of txtPuerto as a double


% --- Executes during object creation, after setting all properties.
function txtPuerto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtPuerto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function txttiempo_Callback(hObject, eventdata, handles)
% hObject    handle to txttiempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txttiempo as text
%        str2double(get(hObject,'String')) returns contents of txttiempo as a double


% --- Executes during object creation, after setting all properties.
function txttiempo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txttiempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtNombre_Callback(hObject, eventdata, handles)
% hObject    handle to txtNombre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNombre as text
%        str2double(get(hObject,'String')) returns contents of txtNombre as a double


% --- Executes during object creation, after setting all properties.
function txtNombre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNombre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btCapturar.
function btCapturar_Callback(hObject, eventdata, handles)
global s1;
tiempo=str2double(get(handles.txttiempo,'String'));
nombre=get(handles.txtNombre,'String'); 
%Ver el numero usando ThinkConector y luego desactivar el ThinkConector de
%la barra de tareas para usar el puerto.
%Si hay problemas usar la ultima línea
if tiempo>10
    msgbox('Colocar un tiempo menor a 10 segundos');
else
    set(handles.ledEstado,'BackgroundColor','green');
    flushinput(s1);
   %obtener los datos y el tiempo que toma recogerlos y guardarlos
   tic
   flushinput(s1);
   data=fread(s1,4096*tiempo);
   toc
   nombre1=strcat(nombre,'completo.txt');
   id=fopen(nombre1,'w');
   fwrite(id,data,'uint8');
   fclose(id);
   %Interpretar y recoger los datos utiles de la onda
   [raw,delta,theta,Lalfa, Halfa, Lbeta,Hbeta,Lgamma, Hgamma, atention,meditation, signal, nerrores1,nerrores2]= interpretar(data);
   %Mostrar en pantalla
   axes(handles.axesRaw);
   %subplot(2,1,1);
   plot(1:length(raw),raw);
   %ESPECTRO SEÑAL
% axes (handles.axesRaw)
%    subplot(2,1,2);
%dim=length(data)*pas;
%ejefrec=[0:1/dim:(length(senal)-1)/dim];
% espectr=abs(fft(data));
% espectr=espectr/max(espectr);
% plot(1:length(data),espectr);
% axis([0 10 0 max(espectr)]);
% xlabel('Frecuencia(Hz)');
% title('Espectro de la Señal')
%
   axes (handles.axes2)
   plot(1:length(signal),200-signal);
   ylim([0,201]);
    axes (handles.axes3)
   plot(1:length(meditation),meditation);
   ylim([0,100]);
    axes (handles.axes4)
   plot(1:length(atention),atention);
   ylim([0,100]);
   nombre=strcat(nombre,'raw.txt');
   id=fopen(nombre,'w');
   fwrite(id,raw,'integer*2');
   fclose(id);
   set(handles.ledEstado,'BackgroundColor','blue');
   
end
% hObject    handle to btCapturar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btConectar.
function btConectar_Callback(hObject, eventdata, handles)
global s1;
texto=get(handles.btConectar,'String');
portcom=str2double(get(handles.txtPuerto,'String'));
%Cierra tods los puertos COM
   if strcmp(texto,'Conectar');
%Iniciar el puerto
    s1 = serial(strcat('COM', num2str(portcom))); 
   s1.BaudRate=57600;
   s1.InputBufferSize=round(81920);%Para  capturar maximo 20 seg a 8bytesx512Hz.
   fopen(s1);
   flushinput(s1);
   flushoutput(s1);
   
   %Iniciar la comunicación con el dispositivo 3123=Hx1F17 el ID del
   %lector, ver con Mindwave manager cual es el ID.
   %fwrite(s1,192);
   %fwrite(s1,31);
   %fwrite(s1,23)
   %pause(0.5);
   
   %Conexion Automatica a cualquier dispositivo
   %redundancia para seguridad de obtener conexion
   fwrite(s1,194)
   pause(2);
   fwrite(s1,194)
   pause(2);
   fwrite(s1,194)
   pause(2);
   fwrite(s1,194)
   pause(2);
   fwrite(s1,194)
   pause(2);
   fwrite(s1,194)
    fwrite(s1,194)
   pause(2);
   fwrite(s1,194)
   pause(2);
   fwrite(s1,194)
   fwrite(s1,194)
   pause(2);
   fwrite(s1,194)
   pause(2);
   fwrite(s1,194)
   pause(2);
   fwrite(s1,194)
   
   set(handles.btConectar,'String','Desconectar');
   set(handles.ledEstado,'BackgroundColor','blue');
   else
       %Desconectar el dispositivo, igual redundancia por seguridad
       
       pause(2);
       fwrite(s1,193);
       pause(2);
       fwrite(s1,193);
       pause(2);
       fwrite(s1,193);
       pause(2);
       fwrite(s1,193);
       pause(2);
       fwrite(s1,193);
       set(handles.btConectar,'String','Conectar');
       fclose(s1);
       fclose(instrfind);
       set(handles.ledEstado,'BackgroundColor','red');
   end
   % hObject    handle to btConectar (see GCBO)
   % eventdata  reserved - to be defined in a future version of MATLAB
   % handles    structure with handles and user data (see GUIDATA)
   
   
   % --- Executes on button press in btObtener.
    function btObtener_Callback(hObject, eventdata, handles)
        global s1;
        warning('off','all');
        clc;
        axes(handles.axesRaw)
        cla;
        i=1;
        j=0;
        k=0;
        flushinput(s1);
        nombre=get(handles.txtNom,'String');
        set(handles.ledEstado,'BackgroundColor','green');
        nombre=strcat(nombre,'raw.txt');
        tic
        while k<2
            while j<10
                for i=1:256
                    m=0;
                    suma=0;
                    datotemp(i+256*j)=0;
                    while m<8
                        data=fread(s1,1);
                        if data==170 && m<2
                            m=m+1;
                        elseif data==4 && m==2
                            m=m+1;
                        elseif data==128 && m==3
                            m=m+1;
                            suma=suma+data;
                        elseif data==2 && m==4
                            m=m+1;
                            suma=suma+data;
                        elseif m==5
                            m=m+1;
                            dato1=256*data;
                            suma=suma+data;
                        elseif m==6
                            m=m+1;
                            dato1=dato1+data;
                            suma=suma+data;
                            if dato1>32767
                                dato1=dato1-65536;
                            end
                        elseif m==7
                            m=m+1;
                            if data==bitcmp(bitand(suma,255),8)
                                datotemp(i+256*j)=dato1;
                            end 
                        end
                    end
                end
                j=j+1;
                axes(handles.axesRaw)
                plot(((j-1)*256):(256*j)-1,datotemp((j-1)*256+1:256*j)/20000)
                ylim([-max(datotemp)/20000,max(datotemp)/20000]);
                if j>2
                    xlim([(j-3)*256+1,j*256]);
                end
                hold on;
            end
            k=k+1;
            j=0;
            
            if get(handles.guardar,'Value')==1
                id=fopen(nombre,'a');
                fwrite(id,datotemp,'integer*2');
                fclose(id);
            end
            axes(handles.axesRaw)
            cla;
        end
        toc
        
    set(handles.ledEstado,'BackgroundColor','blue');

% hObject    handle to btObtener (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function txtNom_Callback(hObject, eventdata, handles)
% hObject    handle to txtNom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNom as text
%        str2double(get(hObject,'String')) returns contents of txtNom as a double


% --- Executes during object creation, after setting all properties.
function txtNom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in guardar.
function guardar_Callback(hObject, eventdata, handles)
    
% hObject    handle to guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of guardar


% --- Executes on button press in btDelta.
function btDelta_Callback(hObject, eventdata, handles)
    global archivo;
    figure(2)
%SEÑAL
pas=0.03;
%t=0:pas:10;
senal=archivo;
ejet=[0:1/512:(length(senal)-1)/512];
subplot(3,3,1);
plot(ejet,senal);
axis([min(ejet) max(ejet) min(senal) max(senal)]);
%xlabel('t(s)');
title('Señal a ser filtrada')

%ESPECTRO SEÑAL
subplot(3,3,2);
dim=length(senal)*pas;
ejefrec=[0:512/(length(senal)-1):512];
espectr=abs(fft(senal));
espectr=espectr/max(espectr);
plot(ejefrec,espectr);
axis([0 100 0 max(espectr)]);
%xlabel('Frecuencia(Hz)');
title('Espectro de la Señal')

%FILTRO
fs=512;
wp=[1.5 4]/fs;
ws=[1 7]/fs;
rp=0.1;
rs=6;
[n,wn]=buttord(wp,ws,rp,rs);
[b,a]=butter(n,wn);
[h,f]=freqz(b,a,[],1025);
subplot(3,3,3)
plot(f,abs(h))
axis([0 100 0 max(espectr)]);
%xlabel('f(Hz)')
%ylabel('|H(f)|')
title('FILTRO PASABANDA DE BUTTERWORTH')

%SEÑAL FILTRADA
ysig=filter(b,a,senal);
subplot(3,3,4)
ejet=[0:1/512:(length(senal)-1)/512];
plot(ejet,ysig)
axis([0 max(ejet) 0 max(ysig)]);
title('SEÑAL FILTRADA')
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
subplot(3,3,5);
spectrogram(ysig);
title('Espectrograma')
%Transformada CWT 3D
transformada=abs(fft(ysig));

subplot(3,3,6);
hold off;
plot(ejet,ysig);
title('Alpha')
subplot(3,3,7);
ejefrec=[0:512/(length(transformada(5:1029))-1):512];
plot(ejefrec,transformada(5:1029));
axis([0 100 0 max(transformada)]);
title('Transformada Alpha')
coefs=cwt(ysig,1:512,'sym6');
subplot(3,3,8);
mesh(coefs)
title('CWT 3d')
%Transformada 2D CWT
subplot(3,3,9);
contourf(coefs);
% hObject    handle to btDelta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%SEÑAL




%


% --- Executes on button press in btTheta.
function btTheta_Callback(hObject, eventdata, handles)
    global archivo;
    figure(2)
%SEÑAL
pas=0.03;
%t=0:pas:10;
senal=archivo;
ejet=[0:1/512:(length(senal)-1)/512];
subplot(3,3,1);
plot(ejet,senal);
axis([min(ejet) max(ejet) min(senal) max(senal)]);
%xlabel('t(s)');
title('Señal a ser filtrada')

%ESPECTRO SEÑAL
subplot(3,3,2);
dim=length(senal)*pas;
ejefrec=[0:512/(length(senal)-1):512];
espectr=abs(fft(senal));
espectr=espectr/max(espectr);
plot(ejefrec,espectr);
axis([0 100 0 max(espectr)]);
%xlabel('Frecuencia(Hz)');
title('Espectro de la Señal')

%FILTRO
fs=512;
wp=[4 8]/fs;
ws=[2 11]/fs;
rp=0.1;
rs=6;
[n,wn]=buttord(wp,ws,rp,rs);
[b,a]=butter(n,wn);
[h,f]=freqz(b,a,[],1025);
subplot(3,3,3)
plot(f,abs(h))
axis([0 100 0 max(espectr)]);
%xlabel('f(Hz)')
%ylabel('|H(f)|')
title('FILTRO PASABANDA DE BUTTERWORTH')

%SEÑAL FILTRADA
ysig=filter(b,a,senal);
subplot(3,3,4)
ejet=[0:1/512:(length(senal)-1)/512];
plot(ejet,ysig)
axis([0 max(ejet) 0 max(ysig)]);
title('SEÑAL FILTRADA')
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
subplot(3,3,5);
spectrogram(ysig);
title('Espectrograma')
%Transformada CWT 3D
transformada=abs(fft(ysig));

subplot(3,3,6);
hold off;
plot(ejet,ysig);
title('Alpha')
subplot(3,3,7);
ejefrec=[0:512/(length(transformada(5:1029))-1):512];
plot(ejefrec,transformada(5:1029));
axis([0 100 0 max(transformada)]);
title('Transformada Alpha')
coefs=cwt(ysig,1:512,'sym6');
subplot(3,3,8);
mesh(coefs)
title('CWT 3d')
%Transformada 2D CWT
subplot(3,3,9);
contourf(coefs);
% hObject    handle to btTheta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btAlpha.
function btAlpha_Callback(hObject, eventdata, handles)
    global archivo;
   figure(2)
%SEÑAL
pas=0.03;
%t=0:pas:10;
senal=archivo;

ejet=[0:1/512:(length(senal)-1)/512];
subplot(3,3,1);
plot(ejet,senal);
axis([min(ejet) max(ejet) min(senal) max(senal)]);
%xlabel('t(s)');
title('Señal a ser filtrada')

%ESPECTRO SEÑAL
subplot(3,3,2);
dim=length(senal)*pas;
ejefrec=[0:512/(length(senal)-1):512];
espectr=abs(fft(senal));
espectr=espectr/max(espectr);
plot(ejefrec,espectr);
axis([0 100 0 max(espectr)]);
%xlabel('Frecuencia(Hz)');
title('Espectro de la Señal')

%FILTRO
fs=512;
wp=[8 13]/fs;
ws=[5 16]/fs;
rp=0.1;
rs=6;
[n,wn]=buttord(wp,ws,rp,rs);
[b,a]=butter(n,wn);
[h,f]=freqz(b,a,[],1025);
subplot(3,3,3)
plot(f,abs(h))
axis([0 100 0 max(espectr)]);
%xlabel('f(Hz)')
%ylabel('|H(f)|')
title('FILTRO PASABANDA DE BUTTERWORTH')

%SEÑAL FILTRADA
ysig=filter(b,a,senal);
subplot(3,3,4)
ejet=[0:1/512:(length(senal)-1)/512];
plot(ejet,ysig)
axis([0 max(ejet) 0 max(ysig)]);
title('SEÑAL FILTRADA')
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
subplot(3,3,5);
spectrogram(ysig);
title('Espectrograma')
%Transformada CWT 3D
transformada=abs(fft(ysig));

subplot(3,3,6);
hold off;
plot(ejet,ysig);
title('Alpha')
subplot(3,3,7);
ejefrec=[0:512/(length(transformada(5:1029))-1):512];
plot(ejefrec,transformada(5:1029));
axis([0 100 0 max(transformada)]);
title('Transformada Alpha')
coefs=cwt(ysig,1:512,'sym6');
subplot(3,3,8);
mesh(coefs)
title('CWT 3d')
%Transformada 2D CWT
subplot(3,3,9);
contourf(coefs);

% hObject    handle to btAlpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btBeta.
function btBeta_Callback(hObject, eventdata, handles)
    global archivo;
    figure(2)
%SEÑAL
pas=0.03;
%t=0:pas:10;
senal=archivo;
ejet=[0:1/512:(length(senal)-1)/512];
subplot(3,3,1);
plot(ejet,senal);
axis([min(ejet) max(ejet) min(senal) max(senal)]);
%xlabel('t(s)');
title('Señal a ser filtrada')

%ESPECTRO SEÑAL
subplot(3,3,2);
dim=length(senal)*pas;
ejefrec=[0:512/(length(senal)-1):512];
espectr=abs(fft(senal));
espectr=espectr/max(espectr);
plot(ejefrec,espectr);
axis([0 100 0 max(espectr)]);
%xlabel('Frecuencia(Hz)');
title('Espectro de la Señal')

%FILTRO
fs=512;
wp=[13 30]/fs;
ws=[9 40]/fs;
rp=0.1;
rs=6;
[n,wn]=buttord(wp,ws,rp,rs);
[b,a]=butter(n,wn);
[h,f]=freqz(b,a,[],1025);
subplot(3,3,3)
plot(f,abs(h))
axis([0 100 0 max(espectr)]);
%xlabel('f(Hz)')
%ylabel('|H(f)|')
title('FILTRO PASABANDA DE BUTTERWORTH')

%SEÑAL FILTRADA
ysig=filter(b,a,senal);
subplot(3,3,4)
ejet=[0:1/512:(length(senal)-1)/512];
plot(ejet,ysig)
axis([0 max(ejet) 0 max(ysig)]);
title('SEÑAL FILTRADA')
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
subplot(3,3,5);
spectrogram(ysig);
title('Espectrograma')
%Transformada CWT 3D
transformada=abs(fft(ysig));

subplot(3,3,6);
hold off;
plot(ejet,ysig);
title('Alpha')
subplot(3,3,7);
ejefrec=[0:512/(length(transformada(5:1029))-1):512];
plot(ejefrec,transformada(5:1029));
axis([0 100 0 max(transformada)]);
title('Transformada Alpha')
coefs=cwt(ysig,1:512,'sym6');
subplot(3,3,8);
mesh(coefs)
title('CWT 3d')
%Transformada 2D CWT
subplot(3,3,9);
contourf(coefs);
% hObject    handle to btBeta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btGamma.
function btGamma_Callback(hObject, eventdata, handles)
    global archivo;
    figure(2)
%SEÑAL
pas=0.03;
%t=0:pas:10;
senal=archivo;
ejet=[0:1/512:(length(senal)-1)/512];
subplot(3,3,1);
plot(ejet,senal);
axis([min(ejet) max(ejet) min(senal) max(senal)]);
%xlabel('t(s)');
title('Señal a ser filtrada')

%ESPECTRO SEÑAL
subplot(3,3,2);
dim=length(senal)*pas;
ejefrec=[0:512/(length(senal)-1):512];
espectr=abs(fft(senal));
espectr=espectr/max(espectr);
plot(ejefrec,espectr);
axis([0 100 0 max(espectr)]);
%xlabel('Frecuencia(Hz)');
title('Espectro de la Señal')

%FILTRO
fs=512;
wp=[40 80]/fs;
ws=[35 185]/fs;
rp=0.1;
rs=6;
[n,wn]=buttord(wp,ws,rp,rs);
[b,a]=butter(n,wn);
[h,f]=freqz(b,a,[],1025);
subplot(3,3,3)
plot(f,abs(h))
axis([0 100 0 max(espectr)]);
%xlabel('f(Hz)')
%ylabel('|H(f)|')
title('FILTRO PASABANDA DE BUTTERWORTH')

%SEÑAL FILTRADA
ysig=filter(b,a,senal);
subplot(3,3,4)
ejet=[0:1/512:(length(senal)-1)/512];
plot(ejet,ysig)
axis([0 max(ejet) 0 max(ysig)]);
title('SEÑAL FILTRADA')
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
subplot(3,3,5);
spectrogram(ysig);
title('Espectrograma')
%Transformada CWT 3D
transformada=abs(fft(ysig));

subplot(3,3,6);
hold off;
plot(ejet,ysig);
title('Alpha')
subplot(3,3,7);
ejefrec=[0:512/(length(transformada(5:1029))-1):512];
plot(ejefrec,transformada(5:1029));
axis([0 100 0 max(transformada)]);
title('Transformada Alpha')
coefs=cwt(ysig,1:512,'sym6');
subplot(3,3,8);
mesh(coefs)
title('CWT 3d')
%Transformada 2D CWT
subplot(3,3,9);
contourf(coefs);
% hObject    handle to btGamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function txtAbrir_Callback(hObject, eventdata, handles)
% hObject    handle to txtAbrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtAbrir as text
%        str2double(get(hObject,'String')) returns contents of txtAbrir as a double


% --- Executes during object creation, after setting all properties.
function txtAbrir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtAbrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Abrir.
function Abrir_Callback(hObject, eventdata, handles)
global archivo;

    min=str2double(get(handles.txtmin,'String'));
if min<1
    min=1;
end
max=str2double(get(handles.txtmax,'String'));
nombre=get(handles.txtAbrir,'String');
nombre=strcat(nombre,'raw.txt');
    archivo=abrirraw(nombre);
    axes(handles.axesRaw)
    cla;
    plot(archivo(min:max)/20000);
    xlim([0,length(archivo(min:max))-1]);
    ylim([-0.2,0.2]);
% hObject    handle to Abrir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in Espectros.
function Espectros_Callback(hObject, eventdata, handles)
    global archivo;
    
    min=str2double(get(handles.txtmin,'String'));
    if min<1
        min=1;
    end
    max=str2double(get(handles.txtmax,'String'));
    a=ALPHA(archivo(min:max));
    b=BETA(archivo(min:max));
    g=GAMMA(archivo(min:max));
    t=THETA(archivo(min:max));
    d=DELTA(archivo(min:max));
    figure(3);
    subplot(5,2,1);
    ejet=[0:512/(length(a)-1):512];
    plot(ejet,abs(fft(d)));
    axis([0 100 0 5e4]);
    subplot(5,2,2);
    [S,F,T,P]=spectrogram(d,256,128,256,512);
    surf(T,F,log(P),'edgecolor','none');
    view(0,90);
    
    subplot(5,2,3);
    plot(ejet,abs(fft(t)));
    axis([0 100 0 5e4]);
    subplot(5,2,4);
    [S,F,T,P]=spectrogram(t,256,128,256,512);
    surf(T,F,log(P),'edgecolor','none');
    view(0,90);
    
    subplot(5,2,5);
    plot(ejet,abs(fft(a)));
    axis([0 100 0 5e4]);
    subplot(5,2,6);
    [S,F,T,P]=spectrogram(a,256,128,256,512);
    surf(T,F,log(P),'edgecolor','none');
    view(0,90);
    
    subplot(5,2,7);
    plot(ejet,abs(fft(b)));
    axis([0 100 0 5e4]);
    subplot(5,2,8);
    [S,F,T,P]=spectrogram(b,256,128,256,512);
    surf(T,F,log(P),'edgecolor','none');
    view(0,90);
    
    subplot(5,2,9);
    plot(ejet,abs(fft(g)));
    axis([0 100 0 5e4]);
    subplot(5,2,10);
    [S,F,T,P]=spectrogram(g,256,128,256,512);
    surf(T,F,log(P),'edgecolor','none');
    view(0,90);
% hObject    handle to Espectros (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Wavelet.
function Wavelet_Callback(hObject, eventdata, handles)
    global archivo;
    min=str2double(get(handles.txtmin,'String'));
if min<1
    min=1;
end
max=str2double(get(handles.txtmax,'String'));
[a,aa]=ALPHA(archivo(min:max));
[b,bb]=BETA(archivo(min:max));
[g,gg]=GAMMA(archivo(min:max));
[t,tt]=THETA(archivo(min:max));
[d,dd]=DELTA(archivo(min:max));
figure(3);
subplot(5,2,1);
mesh(dd)
subplot(5,2,2);
contourf(dd)
subplot(5,2,3);
mesh(tt)
subplot(5,2,4);
contourf(tt)
subplot(5,2,5);
mesh(aa)
subplot(5,2,6);
contourf(aa)
subplot(5,2,7);
mesh(bb)
subplot(5,2,8);
contourf(bb)
subplot(5,2,9);
mesh(gg)
subplot(5,2,10);
contourf(gg)
% hObject    handle to Wavelet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btTiempo.
function btTiempo_Callback(hObject, eventdata, handles)
% hObject    handle to btTiempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global archivo;
min=str2double(get(handles.txtmin,'String'));
if min<1
    min=1;
end
max=str2double(get(handles.txtmax,'String'));
a=ALPHA(archivo(min:max));
b=BETA(archivo(min:max));
g=GAMMA(archivo(min:max));
t=THETA(archivo(min:max));
d=DELTA(archivo(min:max));
figure(3);
subplot(5,1,1);
ejet=[0:1/512:(length(a)-1)/512];
plot(ejet,d);
subplot(5,1,2);
plot(ejet,t);
subplot(5,1,3);
plot(ejet,a);
subplot(5,1,4);
plot(ejet,b);
subplot(5,1,5);
plot(ejet,g);



function txtmin_Callback(hObject, eventdata, handles)
% hObject    handle to txtmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtmin as text
%        str2double(get(hObject,'String')) returns contents of txtmin as a double


% --- Executes during object creation, after setting all properties.
function txtmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtmax_Callback(hObject, eventdata, handles)
% hObject    handle to txtmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtmax as text
%        str2double(get(hObject,'String')) returns contents of txtmax as a double


% --- Executes during object creation, after setting all properties.
function txtmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
