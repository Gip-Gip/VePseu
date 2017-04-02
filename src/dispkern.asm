; VePseu's display kernel

; This actually draws 121 lines to the screen instead of the usual 196. The
; only reason being it looks better with the small horizontal size of the
; picture

    JMP drawStart

    INCLUDE "drawCode/1stWall.asm"
    INCLUDE "drawCode/2ndWall.asm"
    INCLUDE "drawCode/3rdWall.asm"
    INCLUDE "drawCode/4thWall.asm"
    INCLUDE "drawCode/5thWall.asm"
    INCLUDE "drawCode/6thWall.asm"
    INCLUDE "drawCode/mmDraw.asm"

drawStart:
    LDA #WCOLU
    STA COLUPF
    JSR firstWall
    JSR secondWall
    JSR thirdWall
    JSR fourthWall
    JSR fifthWall
    JSR sixthWall
    JSR sixthWall
    JSR fifthWall
    JSR fourthWall
    JSR thirdWall
    JSR secondWall

    LDA #NULL
    STA PF1
    STA PF2

    STA WSYNC

    JSR mmDraw

    JMP stop

stop:


    STA COLUBK
