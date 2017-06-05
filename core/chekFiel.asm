check_field:
    mov ah,02h  ; Nos posicionamos en la esquina
    mov dh,18   ; inferior izquierda para
    mov dl,22   ; comenzar el checkeo del campo
    xor bh,bh   ; de juego.
    int 10h

check_loop:
    mov ah,08h    ; Obtenemos el caracter
    int 10h       ; en la posicion actual

    cmp al,178    ; Comprobamos si hay una
    je check_pos  ; pieza en esa posicion

    jmp next_check

check_pos:
    mov [check_x],dl  ; guardamos la posicion
    mov [check_y],dh  ; a checkear

    mov ah,08h
    int 10h

    mov [color_check],ah  ; Guardamos el color a checkear

    call reset_data

    call check_hor

    call reset_data

    call check_ver

    call reset_data

    call check_diag1

    call reset_data

    call check_diag2

    call reset_data

    mov ah,02h   ; Avanzamos a la siguiente
    dec dh       ; fila
    int 10h

    jmp check_loop

check_diag2:
    mov ah,02h
    inc dl
    dec dh
    int 10h

    mov ah,08h
    int 10h

    mov al,[color_check]

    cmp ah,al
    jne potential_diag2match

    ret

potential_diag2match:
    pop cx
    dec dl
    inc dh

    jmp diag2match_loop

diag2match_loop:
    mov al,[match_count]
    inc al
    mov [match_count],al

    push dx

    mov ah,02h
    inc dh
    dec dl
    int 10h

    mov ah,08h
    int 10h

    mov al,[color_check]
    cmp al,ah
    je diag2match_loop

    jmp check_match

check_diag1:
    mov ah,02h
    inc dl
    inc dh
    int 10h

    mov ah,08h
    int 10h

    mov al,[color_check]

    cmp ah,al
    jne potential_diag1match

    ret

potential_diag1match:
    pop cx
    dec dl
    dec dh

    jmp diag1match_loop

diag1match_loop:
    mov al,[match_count]
    inc al
    mov [match_count],al

    push dx

    mov ah,02h
    dec dh
    dec dl
    int 10h

    mov ah,08h
    int 10h

    mov al,[color_check]
    cmp al,ah
    je diag1match_loop

    jmp check_match


reset_data:
    mov byte [match_count],0
    mov dl,[check_x]
    mov dh,[check_y]

    ret

check_hor:
    mov ah,02h
    inc dl
    int 10h

    mov ah,08h
    int 10h

    mov al,[color_check]

    cmp ah,al
    jne potential_hmatch

    ret

potential_hmatch:
    pop cx
    dec dl

    jmp hmatch_loop

hmatch_loop:

    mov al,[match_count]
    inc al
    mov [match_count],al

    push dx

    mov ah,02h
    dec dl
    int 10h

    mov ah,08h
    int 10h

    mov al,[color_check]
    cmp al,ah
    je hmatch_loop

    jmp check_match

check_ver:
    mov ah,02h   ; Nos movemos a la pieza
    inc dh       ; inferior a la actual
    int 10h

    mov ah,08h   ; Obtenemos su color
    int 10h

    mov al,[color_check]

    cmp ah,al    ; Comprobamos si coinciden
    jne potential_vmatch

    ret

potential_vmatch:
    pop cx      ; Guardamos la direccion de retorno
    dec dh      ; Volvemos a nuestra pieza

    jmp vmatch_loop

vmatch_loop:
    mov al,[match_count]  ; Aumentamos el contador
    inc al                ; de coincidencias
    mov [match_count],al

    push dx               ; Agregamos la posicion al stack

    mov ah,02h            ; Nos movemos al bloque superior
    dec dh
    int 10h

    mov ah,08h            ; Obtenemos el color
    int 10h

    mov al,[color_check]
    cmp ah,al
    je vmatch_loop

    jmp check_match

check_match:
    mov al,[match_count]

    cmp al,2
    jle no_match

    jmp effective_match

effective_match:
    mov al,[match_count]
    mov ah,[stack_count]
    add ah,al

    mov [stack_count],ah
    push cx
    ret

no_match:
    mov ax,cx
    xor cx,cx
    mov cl,[match_count]
    jmp no_match_loop

no_match_loop:
    pop dx
    loop no_match_loop

    push ax
    ret

next_check:
    cmp dl,16     ; Comprobamos si estamos
    je end_check  ; en la ultima columna

    mov ah,02h    ; Avanzamos a la siguiente
    mov dh,18     ; columna desde abajo
    dec dl
    int 10h

    jmp check_loop

end_check:
    mov al,[stack_count]
    cmp al,0

    jne clear_match

    ret

clear_match:
    mov ah,02h
    pop dx
    int 10h

    mov ah,09h
    mov al,0
    xor bx,bx
    mov cx,1
    int 10h

    mov al,[points]
    add al,11
    sub al,[slowness]
    mov [points],al

    mov al,[stack_count]
    dec al
    mov [stack_count],al

    cmp al,0
    je gravity_all   ; Do Gravity here

    jmp clear_match
