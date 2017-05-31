next_frame:

    call procedure_delay  ; Efectuamos un retardo

    mov al,[frame_count]  ; Obtenemos el contador de frames
    inc al                ; Lo aumentamos en 1
    mov [frame_count],al  ; actualizamos el contador

    ret

normalize:
    xor al,al
    mov [frame_count],al  ; Se resetean los valores
    mov [frame_gravi],al  ; para la gravedad

    ret
