; Third layer (104 cycles)

    Y_POS_ADV ; 14 cycles

    X_POS_GAN  ; 25
    LDA (mapPtr),Y
    AND #LAYER3_AND_0
    STA shadow3b

    X_POS_LOS ; 25
    LDA (mapPtr),Y
    AND #LAYER3_AND_1
    STA wall3b

    X_POS_LOS ; 29
    LDA (mapPtr),Y
    AND #LAYER3_AND_2
    ORA wall3b
    STA wall3b

    X_POS_LOS ; 31
    LDA (mapPtr),Y
    AND #LAYER3_AND_3
    STA wall3a
    ORA wall3b
    STA wall3b

    X_POS_LOS ; 29
    LDA (mapPtr),Y
    AND #LAYER3_AND_2
    ORA wall3a
    STA wall3a

    X_POS_LOS ; 29
    LDA (mapPtr),Y
    AND #LAYER3_AND_1
    ORA wall3a
    STA wall3a

    X_POS_LOS ; 25
    LDA (mapPtr),Y
    AND #LAYER3_AND_0
    STA shadow3a
