; VePseu's init file

    SUBROUTINE

    LDX #stack
    TXS

    LDA #NULL
    TAX

    CLD
    CLC
    CLI
    CLV

.loop:

    STA cleanStart,X
    DEX

    BNE .loop

    JSR map_01_load

    LDA #WCOLU
    STA wallColour
    LDA #SCOLU
    STA shadowColour

    LDA #2
    STA AUDF0
