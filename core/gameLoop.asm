game_loop:

    call check_key   ; Comprobamos si se presiono alguna tecla

    call draw_block  ; Dibujamos el bloque antes de una posible colision

    call check_coll  ; Checkeamos colisiones

    call draw_block  ; Dibujamos el bloque despues de colisionar

    call gravity     ; Provocamos gravedad si se requiere

    call next_frame  ; Avanzamos al siguiente frame del juego

    jmp game_loop
