function [ valoresInterpolados, imagenInterpolada ] = interpola( imagen )
    [filas,columnas]=size(imagen);
    imagenInterpolada = imagen;
    valoresInterpolados = zeros(filas,columnas);
    for i=1:filas
        for j=1:columnas
            %Interpola Dcha
            if imagen(i,j)==-1 && imagen(i,j+1)~=-1 && imagen(i,j+2)~=-1
               imagenInterpolada(i,j) = 2*imagen(i,j+1)-imagen(i,j+2);
               valoresInterpolados(i,j) = 1;
            end
            %Interpola Izda
            if imagen(i,j)==-1 && imagen(i,j-1)~=-1 && imagen(i,j-2)~=-1
               imagenInterpolada(i,j) = 2*imagen(i,j-1)-imagen(i,j-2);
               valoresInterpolados(i,j) = 1;
            end
            %Interpola Arriba
            if imagen(i,j)==-1 && imagen(i-1,j)~=-1 && imagen(i-2,j)~=-1
               imagenInterpolada(i,j) = 2*imagen(i-1,j)-imagen(i-2,j);
               valoresInterpolados(i,j) = 1;
            end
            %Interpola Abajo
            if imagen(i,j)==-1 && imagen(i+1,j)~=-1 && imagen(i+2,j)~=-1
               imagenInterpolada(i,j) = 2*imagen(i+1,j)-imagen(i+2,j);
               valoresInterpolados(i,j) = 1;
            end  
        end
    end
end

