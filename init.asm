; VePseu's init file

    LDX #stack
    TXS

    LDA #NULL

    CLD
    CLC
    CLI
    CLV

    LDX #INDEXINIT

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
