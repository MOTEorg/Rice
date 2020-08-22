function varargout = MembranaVibrante(varargin)
% MEMBRANAVIBRANTE M-file for MembranaVibrante.fig
%      MEMBRANAVIBRANTE, by itself, creates a new MEMBRANAVIBRANTE or raises the existing
%      singleton*.
%
%      H = MEMBRANAVIBRANTE returns the handle to a new MEMBRANAVIBRANTE or the handle to
%      the existing singleton*.
%
%      MEMBRANAVIBRANTE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEMBRANAVIBRANTE.M with the given input arguments.
%
%      MEMBRANAVIBRANTE('Property','Value',...) creates a new MEMBRANAVIBRANTE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MembranaVibrante_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MembranaVibrante_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MembranaVibrante

% Last Modified by GUIDE v2.5 24-Jan-2016 17:03:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MembranaVibrante_OpeningFcn, ...
                   'gui_OutputFcn',  @MembranaVibrante_OutputFcn, ...
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


% --- Executes just before MembranaVibrante is made visible.
function MembranaVibrante_OpeningFcn(hObject, eventdata, handles, varargin)
%Colocar la imagen de la universidad
axes(handles.axes2);
a=imread('logou.png');
image(a);
axis off;

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MembranaVibrante (see VARARGIN)

% Choose default command line output for MembranaVibrante
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MembranaVibrante wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MembranaVibrante_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TxtFuncion_Callback(hObject, eventdata, handles)
% hObject    handle to TxtFuncion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtFuncion as text
%        str2double(get(hObject,'String')) returns contents of TxtFuncion as a double


% --- Executes during object creation, after setting all properties.
function TxtFuncion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtFuncion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TxtTension_Callback(hObject, eventdata, handles)
% hObject    handle to TxtTension (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtTension as text
%        str2double(get(hObject,'String')) returns contents of TxtTension as a double


% --- Executes during object creation, after setting all properties.
function TxtTension_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtTension (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TxtDensidad_Callback(hObject, eventdata, handles)
% hObject    handle to TxtDensidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtDensidad as text
%        str2double(get(hObject,'String')) returns contents of TxtDensidad as a double


% --- Executes during object creation, after setting all properties.
function TxtDensidad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtDensidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TxtValorN_Callback(hObject, eventdata, handles)
% hObject    handle to TxtValorN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtValorN as text
%        str2double(get(hObject,'String')) returns contents of TxtValorN as a double


% --- Executes during object creation, after setting all properties.
function TxtValorN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtValorN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TxtValorM_Callback(hObject, eventdata, handles)
% hObject    handle to TxtValorM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtValorM as text
%        str2double(get(hObject,'String')) returns contents of TxtValorM as a double


% --- Executes during object creation, after setting all properties.
function TxtValorM_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtValorM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TxtLimA_Callback(hObject, eventdata, handles)
% hObject    handle to TxtLimA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtLimA as text
%        str2double(get(hObject,'String')) returns contents of TxtLimA as a double


% --- Executes during object creation, after setting all properties.
function TxtLimA_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtLimA (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TxtLimB_Callback(hObject, eventdata, handles)
% hObject    handle to TxtLimB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtLimB as text
%        str2double(get(hObject,'String')) returns contents of TxtLimB as a double


% --- Executes during object creation, after setting all properties.
function TxtLimB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtLimB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BtCalcular.
function BtCalcular_Callback(hObject, eventdata, handles)
% hObject    handle to BtCalcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

syms x y t m n;                                         %Declarar x, y, t como variables simbólicas
clc;                                                %Borrar consola
%Lectura de variables desde la interfaz gráfica
a=str2double(get(handles.TxtLimA,'String'));    
b=str2double(get(handles.TxtLimB,'String'));
mn=str2double(get(handles.TxtValorM,'String'));
nn=str2double(get(handles.TxtValorN,'String'));
p=str2double(get(handles.TxtDensidad,'String'));
T=str2double(get(handles.TxtTension,'String'));
f=(get(handles.TxtFuncion,'String'));
g=(get(handles.TxtFunciong,'String'));
maximo=get(handles.sliderZ,'Value');
%Cálculos
c=sqrt(T/p);                                        %Cálculo de la constante
lambdamn=c*pi*sqrt(m^2/a^2+n^2/b^2);                %Cálculo de lambda_mn
senos= sin(m*pi*x/a)*sin(n*pi*y/a);                 %Función de apoyo de multiplicación de los senos.    
Amn=4/(a*b)*int(int(f*senos,x,0,a),y,0,b);          %Cálculo de Amn (Bmn del libro)
Bmn=4/(a*b*lambdamn)*int(int(g*senos,0,a),y,0,b);   %Cálculo de Bmn(Bmn* del libro)

%Calculo numérico, eliminar en caso de no ser necesario. 
senosnum= sin(mn*pi*x/a)*sin(nn*pi*y/a);
lambda= c*pi*sqrt(mn^2/a^2+nn^2/b^2);
A=4/(a*b)*int(int(f*senosnum,x,0,a),y,0,b);  
B=4/(a*b*lambda)*int(int(g*senosnum,0,a),y,0,b);

umn=(Amn*cos(lambdamn*t)+Bmn*sin(lambdamn*t))*senos;%Cálculo del desplazamiento umn

uxyt=0;                                             %Respuesta final
for i=1:1:mn                                        %Sumatoria en m
    for j=1:1:nn                                    %Sumatoria en n                    
        u=subs(umn,{m,n},{mn,nn});                  %substitución de m y n dejando en función de x,y,t
        uxyt=uxyt+u;
    end
end

%Colocar en pantalla resultados
set(handles.Txtlambda,'String',char(lambdamn));
%Pasar el texo a multilinea
texto=char(vpa(simplify(Amn),5));                                    %Convertir de simbólico a texto
j=1;
for i=1:44:length(texto)
    if i+44<length(texto)
    resultado(j,1:44)=texto(i:i+43);
    else 
    resultado(j,1:length(texto)-i+1)=texto(i:length(texto));
    end
    j=j+1;
end
set(handles.TxtAmn,'String',resultado);
clear resultado;
%Pasar el texo a multilinea
texto=char(vpa(simplify(Bmn),5));
j=1;
for i=1:44:length(texto)
    if i+44<length(texto)
    resultado(j,1:44)=texto(i:i+43);
    else 
    resultado(j,1:length(texto)-i+1)=texto(i:length(texto));
    end
    j=j+1;
end
set(handles.TxtBmn,'String',resultado);
clear resultado
%Pasar el texo a multilinea
texto=char(uxyt);
j=1;
for i=1:50:length(texto)
    if i+50<length(texto)
    resultado(j,1:50)=texto(i:i+49);
    else 
    resultado(j,1:length(texto)-i+1)=texto(i:length(texto));
    end
    j=j+1;
end
set(handles.Txtu,'String',resultado);
clear resultado
%Valores Númericos
set(handles.Numlambda,'String',num2str(lambda));
set(handles.NumAmn,'String',char(vpa(A,5)));
set(handles.NumBmn,'String',char(vpa(B,5)));
%Gráfica 3D
x1=0:0.05:a;                                         %Vector de valores del eje x
y1=0:0.05:b;                                         %Vector de valores del eje y
%Reemplazar las variables simbólicas por valores
unum=uxyt;
unum=subs(unum,x,x1);                                
unum=subs(unum,y,y1');

%Mostrar Gráfico 3D
axes(handles.axesGrafica)
for k=0:0.05:2;
    z=double(subs(unum,t,k));
    h=surf(x1,y1,z);
    set(h,'Zdata',z);
    zlim([-maximo maximo]);
    drawnow;
end
%movie(axes(handles.axesGrafica),M,2);


% --- Executes on button press in BtCerrar.
function BtCerrar_Callback(hObject, eventdata, handles)
% hObject    handle to BtCerrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Cerrar programa
close all;
%close(handles.gui);


% --- Executes on button press in BtSi.
function BtSi_Callback(hObject, eventdata, handles)
% hObject    handle to BtSi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Borrar todos los datos ingresado y la gráfica
set(handles.TxtAmn, 'String','');
set(handles.Txtlambda, 'String','');
set(handles.Txtu, 'String','');
set(handles.TxtLimA, 'String','');
set(handles.TxtLimB, 'String','');
set(handles.TxtValorM, 'String','');
set(handles.TxtValorN, 'String','');
set(handles.TxtTension, 'String','');
set(handles.TxtDensidad, 'String','');
set(handles.TxtFuncion, 'String','');
set(handles.TxtBmn, 'String','');
set(handles.TxtFunciong,'String','');
axes(handles.axesGrafica);
cla;
% --- Executes on button press in BtAyuda.
function BtAyuda_Callback(hObject, eventdata, handles)
%Teoria
%Abre un pdf con la teoría de la membrana vibrante.
winopen('Ayuda.pdf')
% hObject    handle to BtAyuda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Txtlambda_Callback(hObject, eventdata, handles)
% hObject    handle to Txtlambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Txtlambda as text
%        str2double(get(hObject,'String')) returns contents of Txtlambda as a double


% --- Executes during object creation, after setting all properties.
function Txtlambda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Txtlambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TxtAmn_Callback(hObject, eventdata, handles)
% hObject    handle to TxtAmn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtAmn as text
%        str2double(get(hObject,'String')) returns contents of TxtAmn as a double


% --- Executes during object creation, after setting all properties.
function TxtAmn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtAmn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TxtBmn_Callback(hObject, eventdata, handles)
% hObject    handle to TxtBmn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtBmn as text
%        str2double(get(hObject,'String')) returns contents of TxtBmn as a double


% --- Executes during object creation, after setting all properties.
function TxtBmn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtBmn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Txtu_Callback(hObject, eventdata, handles)
% hObject    handle to Txtu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Txtu as text
%        str2double(get(hObject,'String')) returns contents of Txtu as a double


% --- Executes during object creation, after setting all properties.
function Txtu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Txtu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BtNo.
function BtNo_Callback(hObject, eventdata, handles)
% hObject    handle to BtNo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function TxtFunciong_Callback(hObject, eventdata, handles)
% hObject    handle to TxtFunciong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtFunciong as text
%        str2double(get(hObject,'String')) returns contents of TxtFunciong as a double


% --- Executes during object creation, after setting all properties.
function TxtFunciong_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtFunciong (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sliderZ_Callback(hObject, eventdata, handles)
ma=get(handles.sliderZ,'Value');
set(handles.TxtZ,'String',num2str(ma));
% hObject    handle to sliderZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderZ_CreateFcn(hObject, eventdata, handles)

% hObject    handle to sliderZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function TxtZ_Callback(hObject, eventdata, handles)
ma=str2double(get(handles.TxtZ,'String'));
if ma>=0 || ma<=10 
set(handles.sliderZ,'Value',ma);
end
% hObject    handle to TxtZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtZ as text
%        str2double(get(hObject,'String')) returns contents of TxtZ as a double


% --- Executes during object creation, after setting all properties.
function TxtZ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtZ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on sliderZ and none of its controls.
function sliderZ_KeyPressFcn(hObject, eventdata, handles)

% hObject    handle to sliderZ (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function Numlambda_Callback(hObject, eventdata, handles)
% hObject    handle to Numlambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Numlambda as text
%        str2double(get(hObject,'String')) returns contents of Numlambda as a double


% --- Executes during object creation, after setting all properties.
function Numlambda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Numlambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumAmn_Callback(hObject, eventdata, handles)
% hObject    handle to NumAmn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumAmn as text
%        str2double(get(hObject,'String')) returns contents of NumAmn as a double


% --- Executes during object creation, after setting all properties.
function NumAmn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumAmn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function NumBmn_Callback(hObject, eventdata, handles)
% hObject    handle to NumBmn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumBmn as text
%        str2double(get(hObject,'String')) returns contents of NumBmn as a double


% --- Executes during object creation, after setting all properties.
function NumBmn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumBmn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
