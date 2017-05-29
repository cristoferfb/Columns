draw_ui:

    mov ah,02h   ; Posicionamos el cursor
    mov dh,5     ; en la esquina superior
    mov dl,16    ; izquierda del campo de
    xor bh,bh    ; juego.
    int 10h

    mov ah,02h   ; Imprimimos la esquina
    mov dl,0xc9  ; superior izquierda
    int 21h      ; del campo de juego

    mov bl,6
    call draw_hor_line

    mov ah,02h   ; Imprimimos la esquina
    mov dl,0xbb  ; superior derecha del
    int 21h      ; campo de juego

    mov bl,13
    call draw_ver_line

    mov ah,03h  ; Obtenemos la posicion
    int 10h     ; del cursor

    mov ah,02h  ; Lo movemos hacia abajo
    dec dl      ; y devolvemos el avanze
    inc dh      ; provocado por int 21h
    int 10h

    mov ah,02h  ; Imprimimos la esquina
    mov dl,188  ; inferior derecha del
    int 21h     ; campo de juego

    mov ah,03h  ; Obtenemos la posicion
    int 10h     ; del cursor

    mov ah,02h  ; Movemos su posicion
    sub dl,8    ; 8 caracteres hacia
    int 10h     ; la izquierda

    mov ah,02h  ; Imprimimos la esquina
    mov dl,200  ; inferior izquierda del
    int 21h     ; campo de juego

    mov bl,6
    call draw_hor_line

    mov ah,02h   ; Posicionamos el cursor
    mov dh,5     ; en la esquina superior
    mov dl,17    ; izquierda del campo de
    mov bh,0x0   ; juego.
    int 10h

    mov bl,13
    call draw_ver_line

    mov ah,02h
    xor bh,bh
    mov dh,6
    mov dl,25
    int 10h

    lea si,[msg_next]
    call draw_text

    ret

draw_hor_line:    ; Dibuja una linea horizontal
    mov ah,02h    ; Imprimimos el caracter
    mov dl,0xcd   ; horizontal del campo
    int 21h       ; de juego

    dec bl        ; Hacemos esto bl veces
    jnz draw_hor_line
    ret

draw_ver_line:    ; Dibuja una linea vertical
    push bx

    mov ah,03h    ; Obtenemos la posicion
    int 10h       ; del cursor

    mov ah,02h    ; Movemos el cursor una
    dec dl        ; posicion hacia abajo
    inc dh        ; y devolvemos el avanze
    int 10h       ; provocado por la int

    mov ah,02h    ; Imprimimos el caracter
    mov dl,186    ; vertical del campo de
    int 21h       ; juego

    pop bx
    dec bl        ; Hacemos esto bl veces
    jnz draw_ver_line

    ret

draw_text:
    mov dx,si
    mov ah,09h
    int 21h

    ret
