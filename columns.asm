[bits 16]
org  0x100

segment .text
    global main

%include "main.asm"

%include "core/random.asm"
%include "core/draw_ui.asm"
%include "core/start_g.asm"
%include "core/g_block.asm"
%include "core/game_l.asm"
%include "core/draw_b.asm"

segment .data
    delay_stopping_point_centiseconds db 0  ; Variables necesarias para
    delay_initial                     db 0  ; el generador de numeros
    random_number                     db 0  ; aleatorios.
    delay_centiseconds                db 0  ;

    block_color_1 db 0  ; Estos seran los colores
    block_color_2 db 0  ; que componen a un bloque
    block_color_3 db 0  ; de tres secciones.

    cblock_color_1 db 0  ; Estos seran los colores
    cblock_color_2 db 0  ; que componen al actual
    cblock_color_3 db 0  ; bloque.

    exist_block db 0 ; Para saber si se esta controlando un bloque
