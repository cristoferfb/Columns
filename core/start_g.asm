start_game:
    call generate_block  ; Generamos el primero
    call use_block       ; y el siguiente bloque
    call generate_block  ; para comenzar el juego

    call game_loop
    ret
