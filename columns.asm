[bits 16]
org  100h


segment .text

%include "main.asm"

%include "core/move.asm"
%include "core/frame.asm"
%include "core/delay.asm"
%include "core/randomn.asm"
%include "core/gravity.asm"
%include "core/collChec.asm"
%include "core/drawGame.asm"
%include "core/startGam.asm"
%include "core/genBlock.asm"
%include "core/gameLoop.asm"
%include "core/drawBloc.asm"
%include "core/checkKey.asm"

quit:
    mov  ah,00h  ; Terminamos la
    int  21h     ; aplicacion

segment .data
    delay_stopping_point_centiseconds db 0  ; Variables necesarias para
    delay_initial                     db 0  ; generar un retraso o
    random_number                     db 0  ; 'sleep' del sistema

    delay_centiseconds db 5  ; Tiempo de duracion de un frame

    frame_count db 0  ; Contador de frames
    frame_gravi db 0  ; frame en el que se debe aplicar gravedad

    collision db 0  ; Para saber si se esta colisionando con algo

    slowness db 10  ; lentitud a la que va la gavedad

    block_color_1 db 0  ; Estos seran los colores
    block_color_2 db 0  ; que componen a un bloque
    block_color_3 db 0  ; de tres secciones.

    cblock_color_1 db 0  ; Estos seran los colores
    cblock_color_2 db 0  ; que componen al actual
    cblock_color_3 db 0  ; bloque.

    block_x db 0  ; Posicion de la cabeza
    block_y db 0  ; del bloque actual

    oblock_x db 0  ; Posicion anterior de
    oblock_y db 0  ; la cabeza del bloque actual

    exist_block db 0  ; Para saber si se esta controlando un bloque

    ; Lo que sigue solo son los textos del juego

    msg_next db 'Siguiente:','$'
