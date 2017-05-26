game_loop:

    call draw_block  ; Dibujamos el bloque controlado

    call check_key   ; Comprobamos si se presiono alguna tecla

    call gravity     ; Provocamos gravedad si se requiere

    call next_frame  ; Avanzamos al siguiente frame del juego

    jmp game_loop
