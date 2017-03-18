; First layer of rendering (86 cycles)

    Y_POS_ADV ; 14 cycles

    X_POS_GAN ; 23 cycles
    LDA (mapPtr),Y
    STA shadow1b

    X_POS_LOS ; 26 cycles
    LDA (mapPtr),Y
    STA wall1a
    STA wall1b

    X_POS_LOS ; 23 cycles
    LDA (mapPtr),Y
    STA shadow1a
