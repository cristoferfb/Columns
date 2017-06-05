match_sound:
    mov CX,400  ; frecuencia en Hz
    call STARTSOUND

    mov CX,3
    call sound_delay

    mov CX,650  ; frecuencia en Hz
    call STARTSOUND

    mov CX,3
    call sound_delay

    call STOPSOUND

    ret

sound_delay:
    call procedure_delay
    loop sound_delay

    ret


STARTSOUND:
    push ax
    push cx
    push dx
    CMP CX, 014H
    JB STARTSOUND_DONE
    IN AL, 061H
    OR AL, 003H
    DEC AX
    OUT 061H, AL
    MOV DX, 00012H
    MOV AX, 034DCH
    DIV CX
    MOV DX, AX
    MOV AL, 0B6H
    PUSHF
    CLI
    OUT 043H, AL
    MOV AL, DL
    OUT 042H, AL
    MOV AL, DH
    OUT 042H, AL
    POPF
    IN AL, 061H
    OR AL, 003H
    OUT 061H, AL

    pop ax
    pop cx
    pop dx

STARTSOUND_DONE:
    RET

STOPSOUND:
    push ax

    IN AL, 061H
    AND AL, 0FCH
    OUT 061H, AL

    pop ax
    RET
