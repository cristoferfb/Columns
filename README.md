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
