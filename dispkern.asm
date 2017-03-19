; VePseu's display kernel

; This actually draws 121 lines to the screen instead of the usual 196. The
; only reason being it looks better with the small horizontal size of the
; picture

    JMP drawStart

wait: ; Waits the right amount of time to blank the mirrored playfield
    NOP
    NOP
    NOP
    NOP
    RTS

wait2: ; Waits the right amount of time to blank the mirrored playfield
    RTS


drawStart:
    LDY #SHAD_AND_0
    JSR firstWall
    LDY #SHAD_AND_1
    JSR firstWall
    LDY #SHAD_AND_2
    JSR firstWall
    LDY #SHAD_AND_3
    JSR firstWall
    LDY #SHAD_AND_4
    JSR firstWall
    LDX #0
    JSR otherWall
    LDX #1
    JSR otherWall
    LDX #2
    JSR otherWall
    LDX #1
    JSR otherWall
    LDX #0
    JSR otherWall
    LDY #SHAD_AND_4
    JSR firstWall
    LDY #SHAD_AND_3
    JSR firstWall
    LDY #SHAD_AND_2
    JSR firstWall
    LDY #SHAD_AND_1
    JSR firstWall
    LDY #SHAD_AND_0
    JSR firstWall

    LDA #NULL
    STA PF1
    STA PF2

    STA WSYNC

    JSR mmDraw

    JMP stop

    INCLUDE "drawCode/1stWall.asm"
    INCLUDE "drawCode/othrWall.asm"
    INCLUDE "drawCode/mmDraw.asm"

stop:


    STA COLUBK
