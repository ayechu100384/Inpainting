function [ valoresInterpolados, imagenInterpolada ] = interpolaPolin( imagen )
    [f,c]=size(imagen);
    imagenInterpolada = imagen;
    valoresInterpolados = zeros(f,c);
    for i=1:f
        for j=1:c
            %Interpola Dcha
            if imagen(i,j)==-1 && imagen(i,j+1)~=-1 && imagen(i,j+2)~=-1 && imagen(i,j+3)~=-1
                p = polyfit([1 2 3],imagen(i,j+1:j+3),2);
                valor = polyval(p,0);
                imagenInterpolada(i,j) = valor;
                valoresInterpolados(i,j)=1;
            end
            %Interpola Izda
            if imagen(i,j)==-1 && imagen(i,j-1)~=-1 && imagen(i,j-2)~=-1 && imagen(i,j-3)~=-1
                p = polyfit([3 2 1],imagen(i,j-3:j-1),2);
                valor = polyval(p,0);                
                imagenInterpolada(i,j) = valor;
                valoresInterpolados(i,j)=1;
            end
            %Interpola Arriba
            if imagen(i,j)==-1 && imagen(i-1,j)~=-1 && imagen(i-2,j)~=-1 && imagen(i-3,j)~=-1
                p = polyfit([3 2 1],imagen(i-3:i-1,j)',2);
                valor = polyval(p,0);                
                imagenInterpolada(i,j) = valor;
                valoresInterpolados(i,j)=1;
            end
            %Interpola Abajo
            if imagen(i,j)==-1 && imagen(i+1,j)~=-1 && imagen(i+2,j)~=-1 && imagen(i+3,j)~=-1
                p = polyfit([1 2 3],imagen(i+1:i+3,j)',2);
                valor = polyval(p,0);                
                imagenInterpolada(i,j) = valor;
                valoresInterpolados(i,j)=1;
            end  
        end
    end
end

