; VePseu's display kernel

    JMP drawStart

;                        FILE/SUBROUTINE NAMING SCHEME:
;
; dc_w1s1.asm
; |   | |
; |   | |- The shadow variant it draws (A or B, 1 or 2)
; |   |
; |   |- The wall it draws
; |
; |- Draw-code identifies

drawStart:

    CLV

    INCLUDE "drawCode/dc_w1s1.asm"
    INCLUDE "drawCode/dc_w2s1.asm"
    INCLUDE "drawCode/dc_w2s2.asm"
    INCLUDE "drawCode/dc_w3s1.asm"
    INCLUDE "drawCode/dc_w3s2.asm"
    INCLUDE "drawCode/dc_w4s0.asm"

    INCLUDE "drawCode/dc_w1s2.asm"

dc_wallsEnd:

    CLV

    LDA #NULL
    STA PF1
    STA PF2

    INCLUDE "drawCode/mmDraw.asm"

    JMP stop

stop:


    STA COLUBK
