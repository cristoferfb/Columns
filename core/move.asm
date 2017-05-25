right:
    mov al,[block_x]

    cmp al,22
    je no_move

    inc al
    mov [block_x],al

    ret

left:
    mov al,[block_x]

    cmp al,17
    je no_move

    dec al
    mov [block_x],al

    ret

no_move:
    ret
