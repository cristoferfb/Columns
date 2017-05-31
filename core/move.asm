down:
    call check_down

    mov al,[block_y]

    cmp al,18
    je no_move

    inc al
    mov [block_y],al

    ret

right:
    call check_rc

    mov al,[block_x]

    cmp al,22
    je no_move

    inc al
    mov [block_x],al

    ret

left:
    call check_lc
    mov al,[block_x]

    cmp al,17
    je no_move

    dec al
    mov [block_x],al

    ret

no_move:
    ret

change:
    mov al,[cblock_color_1]
    mov ah,[cblock_color_2]
    mov [cblock_color_2],al
    mov al,[cblock_color_3]
    mov [cblock_color_3],ah
    mov [cblock_color_1],al

    ret
