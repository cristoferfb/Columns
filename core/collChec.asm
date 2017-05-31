check_rc:
    ; Checkeamos las colisiones al
    ; lado derecho del boque

    mov ah,02h
    xor bh,bh
    mov dh,[block_y]
    mov dl,[block_x]
    inc dl
    int 10h

    mov ah,08h
    int 10h

    cmp al,178
    jne no_coll

    pop ax
    ret

check_lc:
    ; Checkeamos las colisiones al
    ; lado izquierdo del bloque
    mov ah,02h
    xor bh,bh
    mov dh,[block_y]
    mov dl,[block_x]
    dec dl
    int 10h

    mov ah,08h
    int 10h

    cmp al,178
    jne no_coll

    pop ax
    ret

check_down:
    ; Checkeamos colisiones
    ; en la parte inferior

    mov ah,02h
    xor bh,bh
    mov dh,[block_y]
    mov dl,[block_x]
    inc dh
    int 10h

    mov ah,08h
    int 10h

    cmp al,178
    jne no_coll

    pop ax
    ret


check_coll:
    ; Se checkea colision con la
    ; parte inferior del campo
    ; de juego

    mov dh,[block_y]

    cmp dh,18
    je coll_down ; Si llegamos abajo tenemos que generar un nuevo bloque

    mov ah,02h
    xor bh,bh
    inc dh
    mov dl,[block_x]
    int 10h

    mov ah,08h
    int 10h

    cmp al,178    ; Si tenemos por debajo otra pieza
    je coll_down  ; tenemos que generar un nuevo bloque

    ret

coll_down:
    ; Este es el proceso que se lleva
    ; a cabo en el caso de una colision
    ; de la parte inferior del bloque

    pop ax
    xor cx,cx
    mov cl,10

    mov al,[collision]  ; Comprobamos si se le
    cmp al,0            ; debe otorgar un ultimo
    je last_move        ; movimiento al jugador

    call draw_block     ; Se dibuja el bloque por ultima vez

    call use_block      ; se asigna el bloque en espera como el actual

    call generate_block ; Se genera el siguiente bloque

    call draw_next ; Se dibuja el spoiler del siguiente bloque

    call new_block ; Se dibuja el bloque en su posicion inicial

    call normalize ; Se reinician los valores para la gravedad

    xor al,al           ; Se reinicia el contador para
    mov [collision],al  ; una nueva oportunidad

    jmp game_loop

last_move:
    ; Esto le da al jugador un tiempo
    ; de gracia para realizar un ultimo
    ; movimiento.

    call procedure_delay  ; Se da algo de tiempo
    loop last_move        ; al jugador.

    mov al,1              ; Se desactiva la posibilidad
    mov [collision],al    ; de otro last_move
    jmp game_loop

no_coll:
    ret
