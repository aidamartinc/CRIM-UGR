function [ Compr ] = Compr( seq, long )
    % Histograma
    letras=[0:long];
    histo=histc(seq,letras);   % calcular histograma e indices
    bar(letras,histo);
    axis('tight');
    xlabel('letras[0:255]');
    ylabel('Frecuencias');
    title('Histograma');
    xlabel('letras [0:255]');
    ylabel('Frecuencias');
    title('Histograma');
    
    %% Simbolos y probabilidades
    
    pos_letras_usadas=find(histo>0);
    letras_usadas=letras(pos_letras_usadas);
    hist_letras_usadas=histo(pos_letras_usadas);
    prob_letras_usadas=hist_letras_usadas/sum(hist_letras_usadas(:));
    %% Huffman
    
    [dict,avglen] = huffmandict(letras_usadas,prob_letras_usadas) ; %construimos el diccionario
    seq_codificada = huffmanenco(seq,dict); %codificamos la señal
    fprintf('Número de letras usadas %d\n',numel(letras_usadas))
    fprintf('Longitud la secuencia codificada %d\n', length(seq_codificada))
    %% Tamagno comprimido
    
    tamagno_comprimido=(length(letras_usadas)+1)*1+ ...
    (length(letras_usadas)+1)*8+ ...
    ceil(length(seq_codificada)/8);
    fprintf('Tamaño fichero comprimido en bytes  %d\n',tamagno_comprimido)
    %% Factor de compresion
    
    factor_comp=numel(seq)/tamagno_comprimido;
    fprintf('Factor de compresion: %d\n', factor_comp)
    %% Decodificacion
    
    deco=huffmandeco(seq_codificada,dict);

    %% Comprobacion igualdad original y decodificado
    fprintf('¿Coinciden original y comprimido 1(S) 0 (N)?, %d\n',...
         isequal(seq,uint8(deco)))
 
end

