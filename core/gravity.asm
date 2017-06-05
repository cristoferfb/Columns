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

    cmp al,18             ; No aplicamos gravedad si nos
    je no_gravity         ; encontramos al final del campo

    inc al                ; Procedemos a hacer efectiva la
    mov [block_y],al      ; gravedad

    ret

no_gravity:
    ret

; Lo que sigue provoca la caida de los bloques
; cuando ocurre eliminacion de bloques

gravity_all:
                ; Nos posicionamos en la esquina
    mov dh,18   ; inferior izquierda para
    mov dl,22   ; comenzar el checkeo del campo
                ; de juego.

    mov byte [gravi_size],0

gravity_loop:

    mov ah,02h  ; Movemos el cursor a la
    xor bh,bh   ; posicion a ser
    int 10h     ; checkeada

    mov ah,08h  ; Obtenemos los datos de
    int 10h     ; la posicion actual

    mov [color_check],ah  ; Guardamos el color

    cmp al,178      ; Comprobamos si es una pieza
    je gravity_pos

    mov al,[gravi_size]
    inc al
    mov [gravi_size],al

    jmp next_gravity

gravity_pos:
    mov al,[gravi_size]  ; Comprobamos si es que
    cmp al,0             ; hay que aplicar
    je next_gravity      ; gravedad

    mov ah,09h           ; Borramos la pieza de
    mov al,0             ; su posicion actual
    xor bx,bx
    mov cx,1
    int 10h

    mov ah,02h           ; Nos movemos a la
    add dh,[gravi_size]  ; posicion de caida
    int 10h              ; de la pieza

    mov ah,09h           ; Dibujamos la pieza
    mov al,178           ; en su nueva posicion
    mov bl,[color_check]
    mov cx,1
    int 10h

    mov byte [gravi_size],0  ; reseteamos la gravedad

    jmp gravity_loop

next_gravity:
    cmp dh,6
    je gravity_coll

    dec dh
    jmp gravity_loop

gravity_coll:
    cmp dl,17
    je end_gravity

    dec dl
    mov dh,18

    mov byte [gravi_size],0

    jmp gravity_loop

end_gravity:
    jmp check_field
