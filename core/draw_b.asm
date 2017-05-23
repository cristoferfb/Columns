draw_block:
    mov byte [exist_block],1

    mov ah,02h
    mov dh,6
    mov dl,18
    int 10h

    mov ah,09h
    mov al,178
    mov bl,[cblock_color_1]
    inc bl
    mov cx,1
    int 10h

    mov ah,02h
    mov dh,7
    mov dl,18
    int 10h

    mov ah,09h
    mov al,178
    mov bl,[cblock_color_2]
    inc bl
    mov cx,1
    int 10h

    mov ah,02h
    mov dh,8
    mov dl,18
    int 10h

    mov ah,09h
    mov al,178
    mov bl,[cblock_color_3]
    inc bl
    mov cx,1
    int 10h

    jmp game_loop
