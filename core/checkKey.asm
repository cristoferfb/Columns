check_key:
    mov ah,01h    ; Comprobamos si se esta
    int 16h       ; presionando alguna tecla
    jnz read_character

    ret

read_character:
    mov ah,00h    ; Obtenemos la tecla
    int 16h       ; desde el buffer

    push ax       ; Limpiamos el buffer
    mov ah,06h    ; manualmente
    mov dl,0FFh
    int 21h
    pop ax

    cmp al,'w'
    je change

    cmp al,'s'
    je down

    cmp al,'d'
    je right

    cmp al,'a'
    je left

    cmp al,'q'
    je quit

    ret
