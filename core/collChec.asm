check_rc:
    mov ah,02h
    xor bh,bh
    mov dh,[block_y]
    mov dl,[block_x]
    inc dl
    int 10h

    mov ah,08h
    int 10h

    cmp al,178
    jne no_coll

    pop ax
    ret

check_lc:
    mov ah,02h
    xor bh,bh
    mov dh,[block_y]
    mov dl,[block_x]
    dec dl
    int 10h

    mov ah,08h
    int 10h

    cmp al,178
    jne no_coll

    pop ax
    ret


check_coll:
    mov dh,[block_y]

    cmp dh,18
    jge coll_down ; Si llegamos abajo tenemos que generar un nuevo bloque

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

no_coll:
    ret
