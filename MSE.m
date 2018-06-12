function [ error ] = MSE( original, modificada )
    %Solo comparamos la mancha, el resto es igual
    tamMancha = 32;
%     original = original./255;
%     modificada = modificada./255;
    error = sum(sum((original-modificada).^2)) / (tamMancha^2);
    error = sqrt(error); % Así muestra el numero de niveles de media que cambia
end 

