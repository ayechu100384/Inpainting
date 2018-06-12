function [ imReducida ] = reduceImagen( imagen,tamanhoBloque )
    [f,c] = size(imagen);
    d = tamanhoBloque;% d: desplazamiento por el tmaño de bloque
    imReducida = double(zeros(f/d,c/d)); 
    for i=1:d:f    
        x=floor(i/d)+1;
        for j =1:d:c
             y=floor(j/d)+1; % pal caso que van de una en una
             bloqueAgregar = imagen(i:i+(d-1),j:j+(d-1));
           % OPERADORES DE AGREGACION  
           % imReducida(fNewPix,cNewPix) = median(bloqueAgregar(:)); 
           % imReducida(y,x) = mean(bloqueAgregar(:));
           
%              imReducida(x,y) = mean(bloqueAgregar(:));            
           % imReducida(fNewPix,cNewPix) = det (abs(imagen(i:i+(tamanhoBloque-1),j:j+(tamanhoBloque-1))));
           
           %Apaño para la mancha
           if sum(sum(bloqueAgregar==-1))==4
                imReducida(x,y) =-1;
           end
           if sum(sum(bloqueAgregar==-1))<4
                imReducida(x,y) =mean(bloqueAgregar(bloqueAgregar>0));
           else
                imReducida(x,y) = mean(bloqueAgregar(:)); 
           end
        end
    end
    imReducida = (double(imReducida));
end

