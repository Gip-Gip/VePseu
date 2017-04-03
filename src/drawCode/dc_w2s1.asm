; The second wall and it's first shadow

dc_w2s1:

    LDX #INDEXINIT
    JMP _dc_w2s1_start

_dc_w2s1_loop:
    STA WSYNC
    DELAY 10 ; Delay to keep the timing constant
_dc_w2s1_start:
    LDA wallColour ; Draw the wall
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

    STA WSYNC ; Draw the shadow
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

    INX ; Loop for the rest of the pixel's height
    CPX #PIXH
    BNE _dc_w2s1_loop

    DELAY 10 ; Delay to keep timing constant

    RTS
