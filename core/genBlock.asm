generate_block:

    call procedure_delay                   ; Generamos un numero aleatorio
    mov  bl,0x6                            ; entre [0,5] este sera el color
    call procedure_generate_random_number  ; de una de las secciones de una
                                           ; pieza
    inc al                                 ; Aumentamos su valor en 1 para
    mov [block_color_1],al                 ; que no salga el "color" negro

    call procedure_delay
    mov  bl,0x6
    call procedure_generate_random_number

    inc al
    mov [block_color_2],al

    call procedure_delay
    mov  bl,0x6
    call procedure_generate_random_number

    inc al
    mov [block_color_3],al

    ret

use_block:
    push ax

    ; Movemos los colores guardados
    ; y los asignamos al bloque actual

    mov al, byte [block_color_1]
    mov byte [cblock_color_1], al

    mov al, byte [block_color_2]
    mov byte [cblock_color_2], al

    mov al, byte [block_color_3]
    mov byte [cblock_color_3], al

    pop ax
    ret

new_block:
    ; Comprobamos si es posible dibujar
    ; un nuevo bloque de ser asi
    ; se asigna su posicion inicial

    mov ah,02h
    xor bh,bh
    mov dh,8
    mov dl,18
    int 10h

    mov ah,08h
    int 10h

    cmp al,178
    je quit    ; De lo contratio game overs

    mov [block_x],dl
    mov [oblock_x],dl

    mov [block_y],dh
    mov [oblock_y],dh


    ret

quit:
    mov  ah,00h  ; Terminamos la
    int  21h     ; aplicacion
