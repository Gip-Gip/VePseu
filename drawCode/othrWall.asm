; Can draw any wall

otherWall:

    LDY #INDEXINIT

_otherWall_loop:

    STA WSYNC
    LDA wallColour
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

    LDA shadowColour
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
    BNE _otherWall_loop

    RTS
