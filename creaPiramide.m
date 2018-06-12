function [ piramide ] = creaPiramide( filasN0,columnasN0,niveles )
    piramide = cell(1, niveles); 
    for i = 1 : niveles
        piramide{i} = zeros(filasN0,columnasN0);
        filasN0 = filasN0/2;
        columnasN0 = columnasN0/2;        
    end
end

