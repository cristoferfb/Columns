check_coll:
    mov al,[block_y]

    cmp al,18
    je coll_down

    ret

coll_down:
    call use_block

    call generate_block

    call draw_next

    call new_block

    ret
