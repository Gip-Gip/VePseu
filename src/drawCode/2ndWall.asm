; The draw code for the 1st wall and shadow

secondWall:

    LDX #INDEXINIT
    JMP _secondWall_start

_secondWall_loop:
    STA WSYNC
    DELAY 10
_secondWall_start:
    LDA wallColour
    STA COLUPF
    LDA wall2a
    STA PF1
    LDA wall2b
    STA PF2
    DELAY 14
    LDA wall2c
    STA PF0
    LDA wall2d
    STA PF1
    LDA wall2e
    STA PF2
    LDA #NULL
    DELAY 2
    STA PF2
    STA PF0

    STA WSYNC
    LDA shadowColour
    STA COLUPF
    LDA shadow2aa
    ORA shadow1a
    STA PF1
    LDA shadow2ba
    ORA shadow1b
    STA PF2
    LDA shadow2ca
    STA PF0
    LDA shadow2da
    ORA shadow1c
    STA PF1
    LDA shadow2ea
    ORA shadow1e
    STA PF2
    LDA #NULL
    STA PF0

    INX
    CPX #PIXH
    BNE _secondWall_loop

    DELAY 8

    LDX #NULL

    RTS
