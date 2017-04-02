; The draw code for the 1st wall and shadow

dc_w1s2:

    LDX #INDEXINIT
    LDY #9
    JMP _dc_w1s2_start

_dc_w1s2_loop:
    STA WSYNC
    DELAY 12
_dc_w1s2_start
    LDA wallColour
    STA COLUPF
    LDA wall1
    STA PF1
    STA PF2
    DELAY 16
    STA PF0
    DELAY 3
    LDA #NULL
    STA PF0
    DELAY 10
    STA PF2

    STA WSYNC
    LDA shadowColour
    STA COLUPF
    LDA shadow1a
    AND and_1a,Y
    STA PF1
    LDA shadow1b
    AND and_1b,Y
    STA PF2
    DELAY 9
    LDA shadow1d
    AND and_1c,Y
    STA PF1
    LDA shadow1e
    AND and_1d,Y
    STA PF2

    INX
    CPX #PIXH
    BNE _dc_w1s2_loop
    DEY

    LDX #NULL

    CPY #1
    BNE _dc_w1s2_loop

    RTS
