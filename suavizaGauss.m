function [ imagen ] = suavizaGauss( imagen )
    [f,c] = size(imagen);
    
    %1 mascara de Gauss
    mascara = fspecial('gaussian',[5 5],0.5); %desviacion tipica sigma =0.5
    d = floor(5/2) ;
    
   %2 Hacemos un padarray manual para no ampliar la zona desconocida 
    filA = imagen(1,:);
    filB = imagen(f,:);
    imagen = vertcat(filA,imagen);
    imagen = vertcat(filA,imagen);
    imagen = vertcat(imagen,filB);
    imagen = vertcat(imagen,filB);
    
    colA = imagen(:,1);
    colB = imagen(:,c);
    imagen = horzcat(colA,imagen);
    imagen = horzcat(colA,imagen);
    imagen = horzcat(imagen,colB);
    imagen = horzcat(imagen,colB);
    
    %3 suavizamos la imagen sin tener en cuenta(evitando)los píxeles de la zona
    %desconocida
    imagen = double(imagen);
    [f,c]=size(imagen);
    imagenSuavizada = zeros(f,c);
    for i=1+d:f-d
        for j=1+d:c-d
            if imagen(i,j)~=-1
                bloque = imagen(i-d:i+d,j-d:j+d);
                if sum(sum(bloque==-1)) >0
                    valorSum = sum(mascara(bloque==-1));                    
                    imagenSuavizada(i,j) = sum( (   bloque(bloque~=-1).*   mascara(bloque~=-1)  )   ) + valorSum*imagen(i,j);  
                else                
                    imagenSuavizada(i,j) = sum(sum((bloque.*mascara)));
                end
            else
                imagenSuavizada(i,j) = imagen(i,j);
            end
        end
    end
    imagen = imagenSuavizada(1+d:f-d,1+d:c-d);
end