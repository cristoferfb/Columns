gravity:
    mov al,[frame_count]  ; Obtenemos el frame actual
    mov ah,[frame_gravi]  ; Obtenemos el frame en que se debe aplicar gravedad

    cmp al,ah
    jg do_gravity         ; Comprobamos si devemos efectuar gravedad

    ret

do_gravity:
    mov ah,[slowness]     ; Seteamos la siguiente vez
                          ; en la que deveremos aplicar
    add al,ah             ; gravedad segun la variable
    mov [frame_gravi],al  ; slowness

    mov al,[block_y]      ; Obtenemos la posicion actual en y

    cmp al,18
    je no_gravity

    inc al                ; Procedemos a hacer efectiva la
    mov [block_y],al      ; gravedad

    ret

no_gravity:
    ret
