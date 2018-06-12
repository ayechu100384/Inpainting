# Inpainting
### Restauración de imágenes mediante pirámides Gaussianas

Emplearemos una Pirámide Gaussiana para restaurar una zona de la imagen. La pirámide consiste en generar la imagen con menor tamaño cada vez, en cada reducción interpolamos los bordes de la zona desconocida hsata que llegará un nivel en el que la zona desconocida haya desaparecido por completo. En ese momento volvemos a ampliar la imagen, que ya no tiene zonas desconocidas, hasta el tamaño original.

Se adjunta un documento que describe el proceso con más detalle y presenta algunas pruebas con la imagen de Lena.
