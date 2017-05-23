[bits 16]
org  0x100

segment .text
    global main

%include "main.asm"

%include "core/random.asm"
%include "core/draw_ui.asm"

segment .data
    delay_stopping_point_centiseconds db 0
    delay_initial db 0
    random_number db 0
    delay_centiseconds db 0
