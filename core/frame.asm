next_frame:

    call procedure_delay

    mov al,[frame_count]
    inc al
    mov [frame_count],al

    ret
