function [ imagenSalida, valoresInterpolados ] = interpolaYSuaviza( imagen )
    original = imagen;
    %1 Llamada a la funcion suaviza por el método de Gauss
    imagen = suavizaGauss(imagen);
    
    %2 Llamada a la funcion interpola
    [ valoresInterpolados, imagenInterpolada ] = interpolaPolin(imagen);
    
    %3 Edicion de la matriz valores interpolados
    %1 valores interpolados(borde de la mancha que hemos interpolado)
    %-1 valores de la mancha(dentro de los interpolados, el borde ya no forma parte de la mancha)
    %0 resto de la imagen
    [filas,columnas] = size(imagen);
    for i=1:filas
        for j=1:columnas
            if sum(sum(valoresInterpolados(i,:))) == 2
                fila = valoresInterpolados(i,:);
                [~,max1] = max(fila);
                fila(max1) = 0;
                [~,max2] = max(fila);
                valoresInterpolados(i,max1+1:max2-1) = -1;
            end
        end
    end
    
    %4 Devolvemos la imagen original sin suavizar, con la zona desconocida
    %reducida mediante la interpolacion
    original(valoresInterpolados==1) = imagenInterpolada(valoresInterpolados==1);
    imagenSalida = original;
end

