start:
    mov ah,00h       ; Activamos el modo
    mov al,01h       ; texto 40x25 de
    int 10h          ; 16 colores

    call draw_ui     ; Dibujamos la UI
    call start_game  ; Comienza el juego
