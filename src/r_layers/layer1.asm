; First layer of rendering (86 cycles)

    Y_POS_ADV ; 14 cycles

    LDA (mapPtr),Y
    STA shadow1d
    ORA shadow1e
    AND LAYER1_AND_1
    STA shadow1e

    X_POS_LOS ; 26 cycles
    LDA (mapPtr),Y
    STA wall1

    X_POS_LOS ; 23 cycles
    LDA (mapPtr),Y
    TAX
    ORA shadow1a
    STA shadow1a
    TXA
    AND LAYER1_AND_0
    STA shadow1b
