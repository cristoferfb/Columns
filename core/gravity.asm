gravity:
    mov al,[frame_count]
    mov ah,[frame_gravi]

    cmp al,ah
    jg do_gravity

    ret

do_gravity:
    mov ah,[speed]

    add al,ah
    mov [frame_gravi],al

    mov al,[block_y]

    cmp al,18
    je no_gravity

    inc al
    mov [block_y],al

    ret

no_gravity:
    ret
