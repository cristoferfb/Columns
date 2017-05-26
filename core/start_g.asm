start_game:
    call generate_block  ; Generamos el primero
    call use_block       ; y el siguiente bloque
    call generate_block  ; para comenzar el juego

    mov al,18            ; Asignamos la posicion
    mov [block_x],al     ; inicial del primer
    mov [oblock_x],al    ; bloque del juego

    mov al,8
    mov [block_y],al
    mov [oblock_y],al

    call game_loop
    ret
