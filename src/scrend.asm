; VePseu's screen renderer

; Remove the shadows incase only 1 wall is drawn (22 cycles)
    LDA shadow1a
    ORA wall1
    EOR wall1
    STA shadow1a

    LDA shadow1b
    ORA wall1
    EOR wall1
    STA shadow1b

    LDA shadow1d
    ORA wall1
    EOR wall1
    STA shadow1d

    LDA shadow1e
    ORA wall1
    EOR wall1
    STA shadow1e

    LDA wall1
    STA wall1+1
    STA wall1+2
    STA wall1+3
    STA wall1+4

    LDX #NULL

scrRendLoop:

    LDA wall2a,X
    ORA wall1,X
    STA wall2a,X

    LDA shadow2aa,X
    ORA shadow1a,X
    STA shadow2aa,X

    LDA shadow2ab,X
    ORA shadow1a,X
    STA shadow2ab,X

    LDA wall2a,X
    ORA shadow1a,X
    EOR shadow1a,X
    STA wall2a,X

    LDA shadow2aa,X
    ORA wall2a,X
    EOR wall2a,X
    STA shadow2aa,X

    LDA shadow2ab,X
    ORA wall2a,X
    EOR wall2a,X
    STA shadow2ab,X

    INX
    CPX #10
    BNE scrRendLoop
