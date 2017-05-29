check_coll:
    mov dh,[block_y]

    cmp dh,18
    je coll_down ; Si llegamos abajo tenemos que generar un nuevo bloque

    mov ah,02h
    xor bh,bh
    inc dh
    mov dl,[block_x]
    int 10h

    mov ah,08h
    int 10h

    cmp al,178
    je coll_down

    ret

coll_down:
    call use_block

    call generate_block

    call draw_next

    call new_block

    call normalize

    pop ax

    jmp game_loop
