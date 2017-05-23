main:
    mov ah,00h     ; Activamos el modo
    mov al,01h     ; texto 40x25 de
    int 10h        ; 16 colores

    call draw_ui   ; Dibujamos la UI

    


    mov ah,00h     ; Terminamos la
    int 21h        ; aplicacion
