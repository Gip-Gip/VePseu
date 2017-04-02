; The draw code for 3rd wall and it's second shadow

dc_w3s2:

    LDX #INDEXINIT
    JMP _dc_w3s2_start

_dc_w3s2_loop:
    STA WSYNC
    DELAY 10 ; Delay to keep the timing constant
_dc_w3s2_start:
    LDA wallColour ; Draw the wall
    STA COLUPF
    LDA wall3a
    STA PF1
    LDA wall3b
    STA PF2
    DELAY 14
    LDA wall3c
    STA PF0
    LDA wall3d
    STA PF1
    LDA wall3e
    STA PF2
    LDA #NULL
    DELAY 2
    STA PF2
    STA PF0

    STA WSYNC ; Draw the shadow
    LDA shadowColour
    STA COLUPF
    LDA shadow3ab
    ORA shadow2ab
    STA PF1
    LDA shadow3bb
    ORA shadow2bb
    STA PF2
    LDA shadow3cb
    ORA shadow2cb
    STA PF0
    LDA shadow3db
    ORA shadow2db
    STA PF1
    LDA shadow3eb
    ORA shadow2eb
    STA PF2
    LDA #NULL
    STA PF0

    INX
    CPX #PIXH
    BNE _dc_w3s2_loop

    DELAY 7 ; Delay to keep the timing constant

    RTS