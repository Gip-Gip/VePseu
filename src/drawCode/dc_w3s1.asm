; The draw code for the 1st wall and shadow

dc_w3s1:

    LDX #INDEXINIT
    JMP _dc_w3s1_start

_dc_w3s1_loop:
    STA WSYNC
    DELAY 10
_dc_w3s1_start:
    LDA wallColour
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

    STA WSYNC
    LDA shadowColour
    STA COLUPF
    LDA shadow3aa
    ORA shadow2ab
    STA PF1
    LDA shadow3ba
    ORA shadow2bb
    STA PF2
    LDA shadow3ca
    ORA shadow2cb
    STA PF0
    LDA shadow3da
    ORA shadow2db
    STA PF1
    LDA shadow3ea
    ORA shadow2eb
    STA PF2
    LDA #NULL
    STA PF0

    INX
    CPX #PIXH
    BNE _dc_w3s1_loop

    LDX #NULL

    DELAY 5

    RTS
