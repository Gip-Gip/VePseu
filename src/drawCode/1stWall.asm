; The draw code for the 1st wall and shadow

firstWall:

    LDX #INDEXINIT

_firstWall_loop:

    STA WSYNC

    LDA wallColour
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

    STY shift

    STA WSYNC

    LDA shadowColour
    STA COLUPF
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
    BNE _firstWall_loop

    RTS

