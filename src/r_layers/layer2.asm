; Render the second layer (186 cycles)

    INCLUDE "include/ands_2.h"

    Y_POS_ADV ; 14 cycles

    X_POS_LOS ; 29 cycles
    LDA (mapPtr),Y
    AND #AND_W2S2P1
    STA shadow2ab
    AND #AND_W2S1P1
    STA shadow2aa

    X_POS_GAN ; 41 cycles
    LDA (mapPtr),Y
    TAX
    STA wall2a
    AND #AND_W2S0P1
    STA wall2b
    TXA
    AND #AND_W2S2P2
    STA shadow2bb
    AND #AND_W2S1P2
    STA shadow2ba

    X_POS_GAN ; 30 cycles
    LDA (mapPtr),Y
    STA wall2c
    AND #AND_W2S0P2
    ORA wall2b
    STA wall2b

    X_POS_GAN ; 35 cycles
    LDA (mapPtr),Y
    STA wall2d
    STA wall2e
    AND #AND_W2S2P3
    STA shadow2cb
    AND #AND_W2S1P3
    STA shadow2ca

    X_POS_GAN ; 37 cycles
    LDA (mapPtr),Y
    AND #AND_W2S2P4
    STA shadow2db
    AND #AND_W2S1P5
    STA shadow2ea
    STA shadow2eb
    AND #AND_W2S1P4
    STA shadow2da
