; The draw code for the 1st wall and shadow

dc_w1s1:

    LDX #INDEXINIT
    LDY #INDEXINIT

_dc_w1s1_loop:
    STA WSYNC
    LDA wallColour
    STA COLUPF
    LDA wall1
    STA PF1
    STA PF2
    DELAY 28
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
    BNE _dc_w1s1_loop
    INY

    LDX #NULL

    CPY #10
    BNE _dc_w1s1_loop

    RTS
