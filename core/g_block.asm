generate_block:
    call procedure_delay                   ; Generamos un numero aleatorio
    mov  bl, 6                             ; entre [0,5] este sera el color
    call procedure_generate_random_number  ; de una de las secciones de una
                                           ; pieza
    mov  [block_color_1],al

    call procedure_delay
    mov  bl, 6
    call procedure_generate_random_number

    mov [block_color_2],al

    call procedure_delay
    mov  bl, 6
    call procedure_generate_random_number

    mov [block_color_3],al

    ret

use_block:
    mov word [cblock_color_1],block_color_1
    mov word [cblock_color_2],block_color_2
    mov word [cblock_color_3],block_color_3

    ret