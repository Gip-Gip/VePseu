; Third layer (104 cycles)

    TXA ; 9 cycles
    SEC
    SBC mapWidth
    TAX

    INX ; 12 cycles
    LDA map,X
    AND #LAYER3_AND_0
    STA shadow3b

    DEX ; 12 cycles
    LDA map,X
    AND #LAYER3_AND_1
    STA wall3b

    DEX ; 14 cycles
    LDA map,X
    AND #LAYER3_AND_2
    ORA wall3b
    STA wall3b

    DEX ; 17 cycles
    LDA map,X
    AND #LAYER3_AND_3
    STA wall3a
    ORA wall3b
    STA wall3a

    DEX ; 14 cycles
    LDA map,X
    AND #LAYER3_AND_2
    ORA wall3a
    STA wall3a

    DEX ; 14 cycles
    LDA map,X
    AND #LAYER3_AND_1
    ORA wall3a
    STA wall3a

    DEX ; 12 cycles
    LDA map,X
    AND #LAYER3_AND_0
    STA shadow3a
