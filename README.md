# Columns

Este proyecto fue realizado para una tarea de la asignatura de arquitectura de hardware de la Pontificia Universidad Catolica
de Valparaiso. Basicamente es una copia del juego Columns, mas precisamente fue usada como referencia la version de Sega
Master System que se ve a continuación:

<p align='center'> <img src='http://www.sega-16.com/wp-content/uploads/2011/10/Hands-On-Columns-Master-System-2.gif'/> </p>

## Caracteristicas

  - Se a utlizado el modo texto 40x25 de 16 colores
  - De lo anterior se desprende que no hay graficos solo caracteres
  - El espacio de juego es de 6x13
  - Cumple las reglas clasicas del juego
  - Se a utilizado NASM como ensamblador

## Ensamblado

Para ensamblar este juego se recomienda el uso de DOSBOX entorno bajo el cual se realizaron la pruebas para
esta aplicación.

    nasm columns.asm -o columns.com

 Esto generara un binario columns.com que podra ser ejecutado bajo DOS (o similar) para jugar el juego.


## Creditos

Los algoritmos para el numero aleatorio y el delay han sido extraidos desde el codigo fuente de aSMtris (los comentarios han sido traducidos) en conformidad con las condiciones de uso ahi descritas, puede encontrar mas informacion acerca de la fuente
de los algoritmos, su autor y sus condiciones de uso en el siguiente link: [Fuente](http://sebastianmihai.com/main.php?t=96&n=aSMtris-Tetris-in-assembly-language-x86-16-bit)

El algoritmo que reproduce sonido ah sido extraido (pero modificado) desde [Aqui](http://www.edaboard.com/thread182595.html)

> La programación es una actividad altamente creativa, así como un musico tiene sus instrumentos y un pintor su pincel 
> nosotros tenemos a nuestro fiel teclado que nos permite plasmar nuestras emociones en un archivo así como la propia 
> emoción  por programar, indescriptible sensación que acompaña cada pulsación de tecla que poco a poco van construyendo
> nuestra propia creación y en ella plasmando nuestra propia identidad, no conozco ningún artista que se reserve sus obras
> para si mismo y es que esta en la propia naturaleza del ser humano expresar sus sueños y sus anhelos mas grandes de una
> u otra manera, en nuestro caso  a través de lineas y lineas de código.
