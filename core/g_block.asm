generate_block:
    call procedure_delay                   ; Generamos un numero aleatorio
    mov  bl,6                              ; entre [0,5] este sera el color
    call procedure_generate_random_number  ; de una de las secciones de una
                                           ; pieza
    inc al
    mov  [block_color_1],al

    call procedure_delay
    mov  bl,6
    call procedure_generate_random_number

    inc al
    mov [block_color_2],al

    call procedure_delay
    mov  bl,6
    call procedure_generate_random_number

    inc al
    mov [block_color_3],al

    ret

use_block:
    push ax

    mov al, byte [block_color_1]
    mov byte [cblock_color_1], al

    mov al, byte [block_color_2]
    mov byte [cblock_color_2], al

    mov al, byte [block_color_3]
    mov byte [cblock_color_3], al

    pop ax
    ret
