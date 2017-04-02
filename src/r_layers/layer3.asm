; Third layer (104 cycles)

    Y_POS_ADV ; 14 cycles

    X_POS_GAN  ; 25
    LDA (mapPtr),Y
    TAX
    AND #LAYER3_AND_0
    STA shadow3ea
    TXA
    AND #LAYER3_AND_1
    STA shadow3eb

    X_POS_LOS ; 25
    LDA (mapPtr),Y
    TAX
    AND #LAYER3_AND_2
    STA wall3e
    TXA
    AND #LAYER3_AND_3
    STA wall3d
    TXA
    AND #LAYER3_AND_4
    STA shadow3da
    TXA
    AND #LAYER3_AND_5
    STA shadow3db

    X_POS_LOS ; 29
    LDA (mapPtr),Y
    TAX
    AND #LAYER3_AND_6
    ORA wall3d
    STA wall3d
    TXA
    AND #LAYER3_AND_7
    STA wall3c
    TXA
    AND #LAYER3_AND_8
    STA shadow3ca
    TXA
    AND #LAYER3_AND_9
    STA shadow3cb

    X_POS_LOS ; 31
    LDA (mapPtr),Y
    TAX
    AND #LAYER3_AND_A
    ORA wall3c
    STA wall3c
    TXA
    AND #LAYER3_AND_B
    STA wall3b

    X_POS_LOS ; 29
    LDA (mapPtr),Y
    TAX
    AND #LAYER3_AND_C
    ORA wall3b
    STA wall3b
    TXA
    AND #LAYER3_AND_D
    STA wall3a
    TXA
    AND #LAYER3_AND_E
    STA shadow3ba
    TXA
    AND #LAYER3_AND_F
    STA shadow3bb

    X_POS_LOS ; 29
    LDA (mapPtr),Y
    TAX
    AND #LAYER3_AND_G
    ORA wall3a
    STA wall3a
    TXA
    AND #LAYER3_AND_H
    STA shadow3aa
    TXA
    AND #LAYER3_AND_I
    STA shadow3ab

    X_POS_LOS ; 25
    LDA (mapPtr),Y
    TAX
    AND #LAYER3_AND_J
    STA shadow3aa
    TXA
    AND #LAYER3_AND_K
    STA shadow3ab
