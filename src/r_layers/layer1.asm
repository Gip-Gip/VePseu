; First layer of rendering (86 cycles)

    Y_POS_ADV ; 14 cycles

    LDA (mapPtr),Y
    ORA shadow1b
    STA shadow1b

    X_POS_LOS ; 26 cycles
    LDA (mapPtr),Y
    STA wall1a
    LDA (mapPtr),Y
    STA wall1b

    X_POS_LOS ; 23 cycles
    LDA (mapPtr),Y
    ORA shadow1a
    STA shadow1a
