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
    NOP
    RTS


drawStart:

    LDA shadow1a
    AND #%10000000
    STA shadow1a

    LDA shadow1b
    AND #%10000000
    STA shadow1b

    LDA #RSHIFT
    STA shift
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
    LDA #LSHIFT
    STA shift
    JSR otherWall

    JMP stop

; Upper wall and shadows

_otherWall_rShift:
    LDA shadow1a
    LSR
    ORA shadow1a
    STA shadow1a

    LDA shadow1b
    LSR
    ORA shadow1b
    STA shadow1b

    JMP _otherWall_end

otherWall:
    LDX #INDEXINIT
    LDY #INDEXINIT

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
    LDA shadow1a
    STA PF1
    LDA shadow1b
    LSR
    STA PF2

    JSR wait

    LDA #NULL
    STA PF1
    STA PF2

    INX
    CPX #PIXH
    BNE _otherWall_loop

; Extend the shadows

    LDX #INDEXINIT

    LDA shift
    CMP #RSHIFT
    BEQ _otherWall_rShift

    LDA shadow1a
    CLC
    ROL
    STA shadow1a

    LDA shadow1b
    CLC
    ROL
    STA shadow1b

_otherWall_end:

    INY
    CPY #NWH
    BNE _otherWall_loop

    LDA shadow1a
    CLC
    ROL
    STA shadow1a

    LDA shadow1b
    CLC
    ROL
    STA shadow1b


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
