; VePseu's init file

    LDX #stack
    TXS

    LDX #INDEXINIT
    LDA #NULL

    CLD
    CLC
    CLI
    CLV

cleanLoop:

    STA cleanStart,X
    INX

    CPX #cleanEnd
    BNE cleanLoop

    JSR map_01_load

    LDA mapWidth
    STA yLoss
    LDA #ONE
    STA xGain
    LDA #NULL
    STA yGain
    STA xLoss
