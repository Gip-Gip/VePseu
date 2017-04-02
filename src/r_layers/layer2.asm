; Second Layer (148 cycles)

    Y_POS_ADV ; 14 cycles

    X_POS_LOS ; 25 cycles
    LDA (mapPtr),Y
    TAX
    AND #LAYER2_AND_0
    STA shadow2aa
    TXA
    AND #LAYER2_AND_1
    STA shadow2ab

    X_POS_GAN ; 25 cycles
    LDA (mapPtr),Y
    TAX
    STA wall2a
    AND #LAYER2_AND_2
    STA wall2b
    TXA
    AND #LAYER2_AND_3
    STA shadow2ba
    TXA
    AND #LAYER2_AND_4
    STA shadow2bb

    X_POS_GAN ; 31 cycles
    LDA (mapPtr),Y
    TAX
    AND #LAYER2_AND_5
    ORA wall2b
    STA wall2b
    TXA
    STA wall2c

    X_POS_GAN ; 28 cycles
    LDA (mapPtr),Y
    TAX
    STA wall2d
    STA wall2e
    AND #LAYER2_AND_7
    STA shadow2ca
    TXA
    AND #LAYER2_AND_8
    STA shadow2cb

    X_POS_GAN ; 25 cycles
    LDA (mapPtr),Y
    TAX
    AND #LAYER2_AND_9
    STA shadow2da
    TXA
    AND #LAYER2_AND_A
    STA shadow2db
    TXA
    AND #LAYER2_AND_B
    STA shadow2ea
    TXA
    AND #LAYER2_AND_C
    STA shadow2eb
