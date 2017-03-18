; Second Layer (76 cycles)

    TXA ; 9 cycles
    SEC
    SBC mapWidth
    TAX

    DEX ; 12 cycles
    LDA map,X
    AND #LAYER2_AND_0
    STA shadow2a

    INX ; 12 cycles
    LDA map,X
    AND #LAYER2_AND_1
    STA wall2a

    INX ; 17 cycles
    LDA map,X
    AND #LAYER2_AND_2
    STA wall2b
    ORA wall2a
    STA wall2a

    INX ; 14 cycles
    LDA map,X
    AND #LAYER2_AND_1
    ORA wall2b
    STA wall2b

    INX ; 12 cycles
    LDA map,X
    AND #LAYER2_AND_0
    STA shadow2b
