# Inpainting
### Restauración de imágenes mediante pirámides Gaussianas

En este proceso para restaurar una zona de la imagen, creamos una Pirámide Guassiana. En esta pirámide generamos la imagen cada vez con mejor tamaño, para rellenar la zona desconocida interpolamos sus bordes, hasta llegar a un tamaño en el que la zona desconocida haya desaparecido por completo. En ese momento volvemos a ampliar la imagen, sin zonas desconocidas, hasta el tamaño original. 
