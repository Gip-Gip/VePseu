; VePseu's display kernel

; This actually draws 136 lines to the screen instead of the usual 196. The
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
    JSR otherWall
    LDY #SHAD_AND_1
    JSR otherWall
    LDY #SHAD_AND_2
    JSR otherWall
    LDY #SHAD_AND_3
    JSR otherWall
    LDY #SHAD_AND_4
    JSR otherWall
    LDX #0
    JSR medWall
    LDX #1
    JSR medWall
    LDX #2
    JSR medWall
    LDX #1
    JSR medWall
    LDX #0
    JSR medWall
    LDY #SHAD_AND_4
    JSR otherWall
    LDY #SHAD_AND_3
    JSR otherWall
    LDY #SHAD_AND_2
    JSR otherWall
    LDY #SHAD_AND_1
    JSR otherWall
    LDY #SHAD_AND_0
    JSR otherWall

    JMP stop

otherWall:

    LDX #INDEXINIT

_otherWall_loop:

    STA WSYNC

    LDA #MCOLU
    STA COLUPF
    LDA wall1a
    STA PF1
    LDA wall1b
    LSR
    STA PF2

    JSR wait

    LDA #NULL
    STA PF1
    STA PF2

    STA WSYNC

    LDA #SCOLU
    STA COLUPF
    STY shift
    LDA shadow1a
    AND shift
    STA PF1
    STA PF1
    LDA shadow1b
    AND shift
    LSR
    STA PF2

    JSR wait2

    LDA #NULL
    STA PF1
    STA PF2

    INX
    CPX #PIXH
    BNE _otherWall_loop

    RTS

; Every other wall drawing

medWall:

    LDY #INDEXINIT

_medWall_loop:

    STA WSYNC
    LDA #MCOLU
    STA COLUPF
    LDA wall2a,X
    STA PF1
    LDA wall2b,X
    LSR
    STA PF2

    JSR wait

    LDA #NULL
    STA PF1
    STA PF2
    STA WSYNC

    LDA #SCOLU
    STA COLUPF
    LDA shadow2a,X
    STA PF1
    LDA shadow2b,X
    LSR
    STA PF2

    JSR wait

    LDA #NULL
    STA PF1
    STA PF2

    INY

    CPY #PIXH
    BNE _medWall_loop

    RTS

stop:

    STA WSYNC

    LDA #NULL
    STA PF1
    STA PF2
