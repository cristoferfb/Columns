start_game:
    call generate_block  ; Generamos un bloque

    call use_block       ; Lo asignamos como el bloque actual

    call generate_block  ; Generamos otro bloque (sera el siguiente)

    call draw_next       ; Dibujamos el siguiente bloque

    call new_block       ; Posicionamos el nuevo bloque

    call draw_points     ; Dibujamos el puntaje

    call game_loop       ; Comenzamos el juego
    ret
