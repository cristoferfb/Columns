check_rc:
    ; Comrobamos las colisiones al
    ; lado derecho del boque

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
    ; Checkeamos las colisiones al
    ; lado izquierdo del bloque
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
    ; Se checkean las colisiones de
    ; la parte inferiror del bloque

    mov dh,[block_y]

    call fix_ycoll ; Si nos pasamos del limite
                   ; del juego esto lo arregla

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

fix_ycoll:
    cmp dh,18
    jg y_issue

    ret

y_issue:
    mov dh,18
    mov [block_y],dh
    ret

coll_down:
    pop ax
    xor cx,cx
    mov cl,10

    mov al,[collision]
    cmp al,0
    je last_move

    call draw_block

    call use_block

    call generate_block

    call draw_next

    call new_block

    call normalize

    xor al,al
    mov [collision],al

    jmp game_loop

last_move:
    call procedure_delay
    loop last_move

    mov al,1
    mov [collision],al
    jmp game_loop

no_coll:
    ret
