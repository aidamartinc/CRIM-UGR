%% Practica01ApelidoNombre
% Cambia el nombre del gui�n a Practica01tuapellidoNombre

% Incluye aqu� tu nombre y apellidos
%Aida Martin Cuellar


%% Paso 1

clear all; close all;
fichero='constitucion espa�ola.txt';
fid=fopen(fichero, 'r')
[words count]=fread(fid,inf,'*uint8');
fclose(fid)
histograma= histc(words,[0:255]);
subplot(1,2,1);
plot([0:255],histograma); axis('tight')
% si prefieres puedes usar la funci�n bar
subplot(1,2,2); bar([0:255],histograma)


%% Paso 2

% A REALIZAR POR LOS ESTUDIANTES

% Crea la funci�n entropiaTUSINICIALES(histograma)

%% Paso 3

H= entropiaAMC(histograma)

% Debe salirte 4.4880. 

%% Paso 4 

% A REALIZAR POR LOS ESTUDIANTES. RESPUESTA EN FICHERO PDF

% �Qu� significa el valor de la entrop�a que has obtenido? 
% �Cu�l ser�a el factor de compresi�n que obtendr�amos si usamos un modelo
% de codificaci�n que alcanzase la entrop�a? 
% �Podremos, a lo largo del curso, ganar a la entrop�a?

%% Paso 5

clear all; close all;
A=imread('camera.pgm');
% Mostramos la imagen camera.pgm
subplot(1,2,1); imshow(A);



%% Paso 6


histograma=histc(A(:),[0:255]);
subplot(1,2,2); bar([0:255],histograma)
entropiaAMC(histograma)

%% Paso 7

% A REALIZAR POR LOS ESTUDIANTES. RESPUESTA EN FICHERO PDF

% �Qu� significa el valor de la entrop�a que has obtenido? 
% �Cu�l ser�a el factor de compresi�n que obtendr�amos si usamos un modelo
% de codificaci�n que alcanzase la entrop�a? 


%% Paso 8

clear all; close all; 
A=uint8(zeros(256));
A(1:128,:)=uint8(180);
subplot(1,2,1); imshow(A)
histograma= histc(A(:),[0:255]);
subplot(1,2,2); bar([0:255],histograma)
H=entropiaAMC(histograma)

%% Paso 9

% A REALIZAR POR LOS ESTUDIANTES. RESPUESTA EN FICHERO PDF

% �Qu� significa el valor de la entrop�a que has obtenido? 
% �Cu�l ser�a el factor de compresi�n que obtendr�amos si usamos un modelo
% de codificaci�n que alcanzase la entrop�a? 
% �Podremos, a lo largo del curso, ganar a la entrop�a?



%% Paso 10

% A REALIZAR POR LOS ESTUDIANTES. RESPUESTA EN FICHERO PDF

% Si hicieras m�s grande (y luego m�s chico) el cuadrado blanco, 
% �qu� le pasar�a  a la entrop�a?
% �Cu�nto valdr�a la entrop�a si toda la imagen fuera blanca o negra? 
% �Qu� significar�a el valor de la entrop�a obtenido en este caso? 




%% Paso 11


clear all; close all;
fichero='camera.pgm'
fid=fopen(fichero, 'r')
words=fread(fid,inf,'*uint16');
fclose(fid)
histograma= histc(words,[0:256*256-1]);
bar([0:256*256-1],histograma), axis('tight')
H=entropiaAMC(histograma)




%% Paso 12

% A REALIZAR POR LOS ESTUDIANTES. INCLUYE TUS RESPUESTAS EN EL FICHERO PDF

% �Cu�l es la entrop�a de esta fuente que codifica los s�mbolos de 
% �camera.pgm� de dos en dos? 
% �Qu� significa el valor de la entrop�a que has obtenido? 

%% Paso 13

clear all; close all;
fichero='camera.pgm'
fid=fopen(fichero, 'r')
words=fread(fid,inf,'*uint8');
fclose(fid)
histograma= histc(words,[0:255]);
H=entropiaAMC(histograma)

%% Paso 14

% A REALIZAR POR LOS ESTUDIANTES. INCLUYE TUS RESPUESTAS EN EL FICHERO PDF

% Compara los valores de la entrop�a que has obtenido en los pasos 11 y 13. 
% �Qu� est� pasando? 


%% Paso 15

% A REALIZAR POR LOS ESTUDIANTES. INCLUYE TUS RESPUESTAS EN EL FICHERO PDF
% Y C�DIGO AQU�

% Para los ficheros bird.pgm, ptt1.pbm, texto10000.txt, Cinco 
% semanas en globo - Julio Verne.txt crea una tabla con los nombres de los
% ficheros (filas) completa la siguiente tabla. �Qu� significan los valores
% que obtienes?. Escribe el c�digo correspondiente en el Paso 15 del fichero 
% Practica01ApellidoNombre (aqui).

clear all; close all;
num_ficheros=4;
Ficheros=cell(num_ficheros);
Ficheros{1}='bird.pgm';
Ficheros{2}='ptt1.pbm';
Ficheros{3}='texto10000.txt'
Ficheros{4}='Cinco semanas en globo - Julio Verne.txt';

fprintf('Primer orden\n');
for i=1:4
    % Primer orden
    fichero=Ficheros{i}; 
    fid=fopen(fichero, 'r');
    words=fread(fid,inf,'*uint8');
    fclose(fid);
    histograma= histc(words,[0:255]);
    fprintf('Fichero: %s', Ficheros{i});
    H=entropiaAMC(histograma)
end

fprintf('Segundo orden\n');
for i=1:4
    % Segundo orden
    fichero=Ficheros{i};
    fid=fopen(fichero, 'r');
    words=fread(fid,inf,'*uint16');
    fclose(fid);
    histograma= histc(words,[0:256*256-1]);
    bar([0:256*256-1],histograma), axis('tight');
    fprintf('Fichero: %s', Ficheros{i});
    H=entropiaAMC(histograma)
end



%% Paso 16 

A=imread('bird.pgm');


%% Paso 17

% A REALIZAR POR LOS ESTUDIANTES. INCLUYE C�DIGO AQU�

%En el paso 17 del fichero Practica01ApellidoNombre.m escribe c�digo para
%1.	Calcular  la entrop�a de la matriz que contiene la imagen. 
%2.	Calcular la diferencia de cada p�xel con el anterior por filas.  
%    Es decir, vamos a calcular A(i,j)-A(i,j-1). No debes usar bucles y adem�s
%    tienes que tener mucho cuidado con las diferencias ya que la diferencia 
%    de dos caracteres sin signo da un car�cter sin signo y esto no es lo 
%    que queremos hacer. Para calcular la diferencia de la primera columna 
%    considera que la columna anterior es cero. 
%3.	Calcula tambi�n las diferencias m�dulo 256, es decir, 
%    (diferencias+256) m�dulo 256
%4.	Dibujar en una misma ventana la imagen de diferencias y su histograma. 
%5.	Dibujar tambi�n la imagen de (diferencias +256) m�dulo 256 y su histograma
%6.	Calcular la entrop�a de primer orden sobre la imagen de diferencias y 
%    sobre la imagen (diferencias +256) m�dulo 256 

%Nota 1: Ten cuidado con los tipos de datos cuando hagas diferencias 

%Nota 2: �Cuidado al calcular las diferencias! Para una imagen en escala de
%grises, las diferencias pueden estar en el intervalo [-255, 255] y por 
%tanto necesitamos al menos 9 bits para representarlas.  Esto no es 
%necesario en la imagen (diferencias +256) m�dulo 256

%1.
histograma=histc(A(:),[0:255]);
entropiaAMC(histograma)

%2.
Dif=zeros(size(A));
Dif(1:end,1:1)=int16(A(1:end,1:1));
Dif(1:end,2:end)=int16(A(1:end,2:end))-int16(A(1:end,1:end-1));
figure
subplot(1,2,1); imshow(Dif, [-255,255])
histogramaDif=histc(Dif(:),(-255:255));
subplot(1,2,2); bar([-255:255],histogramaDif);
entDif=entropiaAMC(histogramaDif)

%3.
Modulo=zeros(size(A));
Modulo=mod((Dif+256),256);
figure
subplot(1,2,1); imshow(Modulo, [0,255])
histogramaMod=histc(Modulo(:),(0:255));
subplot(1,2,2); bar([0:255],histogramaMod);
entMod=entropiaAMC(histogramaMod)


%% Paso 18

% A REALIZAR POR LOS ESTUDIANTES. INCLUYE TUS RESPUESTAS EN EL FICHERO PDF

% 1.	Incluye los gr�ficos del paso 17 aqu�
% 2.	�Cu�l son las entrop�as de la imagen original, de la imagen de 
%       diferencias y de la imagen (diferencias+256) m�dulo 256 ? 
% 3.	Comp�ralas y explica el resultado 
% 4.	Si hubiese codificado las diferencias usando 
%       (diferencias+256) m�dulo 256, �podr�as con esta codificaci�n de
%       las diferencias reconstruir la se�al original?


%% Paso 19

% A REALIZAR POR LOS ESTUDIANTES. INCLUYE TUS RESPUESTAS EN EL FICHERO PDF

% Supongamos que tenemos una fuente que obtiene palabras de cuatro letras. 
% Supongamos adem�s que las letras son generadas aleatoriamente suponiendo 
% una distribuci�n uniforme sobre las 27 letras del abecedario. 
% �Cu�ntos bits necesitar�amos en media para representar cada palabra de 
% cuatro letras?  







