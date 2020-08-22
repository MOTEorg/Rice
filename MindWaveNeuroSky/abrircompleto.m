%Abrir Archivo de todos los datos
function datosrecuperados=abrircompleto(archivo)
fid=fopen(archivo);
datosrecuperados=fread(fid,'uint8');
fclose(fid);
end
