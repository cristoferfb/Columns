game_loop:

    call draw_block

    call check_key

    call gravity

    call next_frame

    jmp game_loop
