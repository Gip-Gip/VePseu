; Second Layer (148 cycles)

    Y_POS_ADV ; 14 cycles

    X_POS_LOS ; 25 cycles
    LDA (mapPtr),Y
    AND #LAYER2_AND_0
    STA shadow2a

    X_POS_GAN ; 25 cycles
    LDA (mapPtr),Y
    AND #LAYER2_AND_1
    STA wall2a

    X_POS_GAN ; 31 cycles
    LDA (mapPtr),Y
    AND #LAYER2_AND_2
    STA wall2b
    ORA wall2a
    STA wall2a

    X_POS_GAN ; 28 cycles
    LDA (mapPtr),Y
    AND #LAYER2_AND_1
    ORA wall2b
    STA wall2b

    X_POS_GAN ; 25 cycles
    LDA (mapPtr),Y
    AND #LAYER2_AND_0
    STA shadow2b
