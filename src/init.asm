; VePseu's init file

    SUBROUTINE

    LDX #stack
    TXS

    LDA #NULL

    CLD
    CLC
    CLI
    CLV

    LDX #NULL

.loop:

    STA cleanStart,X
    DEX

    BNE .loop

    JSR map_01_load

    LDA mapWidth
    STA yLoss
    LDA #ONE
    STA xGain

    LDA #WCOLU
    STA wallColour
    LDA #SCOLU
    STA shadowColour

    LDA #2
    STA AUDF0
    STA AUDC0
