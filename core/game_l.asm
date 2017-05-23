game_loop:
    cmp byte [exist_block],0  ; Comprobamos si se esta controlando un
    je  draw_block            ; bloque, de lo contrario se dibuja uno

    

    ret
