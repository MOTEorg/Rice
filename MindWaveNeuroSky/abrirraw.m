%Abrir Archivo cons Datos RAW
function datosrecuperados=abrirraw(archivo);
fid=fopen(archivo);
datosrecuperados=fread(fid,'integer*2');
fclose(fid);
end
