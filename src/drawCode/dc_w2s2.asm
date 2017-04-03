; The draw code for the 1st wall and shadow

dc_w2s2:

    LDX #INDEXINIT
    JMP _dc_w2s2_start

_dc_w2s2_loop:
    STA WSYNC
    DELAY 10
_dc_w2s2_start:
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
    LDA shadow2ab
    ORA shadow1a
    STA PF1
    LDA shadow2bb
    ORA shadow1b
    STA PF2
    LDA shadow2cb
    STA PF0
    LDA shadow2db
    ORA shadow1c
    STA PF1
    LDA shadow2eb
    ORA shadow1e
    STA PF2
    LDA #NULL
    STA PF0

    INX
    CPX #PIXH
    BNE _dc_w2s2_loop

    LDX #NULL

    DELAY 8

    RTS
