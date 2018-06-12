function [ imRota ] = hazMancha( imagen,x,y )
    [f,c] = size(imagen);
    sizeMancha=32;
    for i=0:sizeMancha:f
        for j =0:sizeMancha:c
            if i==sizeMancha*x && j == sizeMancha*y
                imagen(i:i+(sizeMancha-1),j:j+(sizeMancha-1)) = -1;
            end
        end
    end
    imRota =imagen;
end

