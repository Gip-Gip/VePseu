; The draw code for the 4th wall

dc_w4s0:

    LDX #INDEXINIT
    JMP _dc_w4s0_start

_dc_w4s0_loop:
    STA WSYNC
    DELAY 10
_dc_w4s0_start:
    LDA wallColour
    STA COLUPF
    LDA #FULLWALL
    EOR shadow3ab
    STA PF1
    LDA #FULLWALL
    EOR shadow3bb
    STA PF2
    DELAY 4
    LDA #FULLWALL
    EOR shadow3cb
    STA PF0
    LDA #FULLWALL
    EOR shadow3db
    STA PF1
    LDA #FULLWALL
    EOR shadow3eb
    STA PF2
    LDA #NULL
    DELAY 2
    STA PF2
    STA PF0

    STA WSYNC
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
    BNE _dc_w4s0_loop

    DELAY 7

    RTS
