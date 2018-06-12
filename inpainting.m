%RESTAURACIÓN CON IMPAITING

%0 Rompemos la imagen de lena original
im = double(imread('lena512.png'));
imRota = hazMancha(im,2,4); % ojo 8,10 % pelo 10,3 % fondo 2,4 %gorro 2,5
nmax = 8;%maximos niveles
[f,c]=size(imRota);

%1 Creacion e inicializacion de piramides
pSubida = creaPiramide(f,c,nmax);
pInter = creaPiramide(f,c,nmax);
pSubida{1} = imRota;

%2 Piramide de subida
%Primer nivel
n=1;
figure;imshow(pSubida{n}./255);
[pSubida{n},pInter{n}] = interpolaYSuaviza(pSubida{n});
%Resto de niveles
pSubida{n+1}=reduceImagen(pSubida{n},2); 
n=2;
while sum(sum(pInter{n-1}(pInter{n-1}<0)))<0 % hasta que la mancha desaparezca
    [pSubida{n},pInter{n}]= interpolaYSuaviza(pSubida{n});    
    %figure;imshow(pSubida{n}./255);
    pSubida{n+1}=reduceImagen(pSubida{n},2); 
    n = n+1;
end

%3 Construccion de la imagen restaurada
for i=n-1:-1:1 % n son los niveles
    aux = imresize(pSubida{i+1},2,'bicubic');
    pSubida{i}(pInter{i}==-1)= aux(pInter{i}==-1);
end
figure;imshow(pSubida{1}./255);

%4 calculo del error en la zona desconocida de la imagen restaurada respecto a la imagen original
disp(MSE(im,pSubida{1}));