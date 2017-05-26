start_game:
    call generate_block  ; Generamos un bloque
    call use_block       ; Lo asignamos como el bloque actual
    call generate_block  ; Generamos otro bloque (sera el siguiente)

    mov al,18            ; Asignamos la posicion
    mov [block_x],al     ; inicial del primer
    mov [oblock_x],al    ; bloque del juego

    mov al,8
    mov [block_y],al
    mov [oblock_y],al

    call game_loop       ; Comenzamos el juego
    ret
