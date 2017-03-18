; VePseu's wall renderer

    MAC Y_POS_ADV ; 14 cycles

        TYA
        CLC
        ADC yGain
        SEC
        SBC yLoss
        TAY

    ENDM

    MAC X_POS_GAN ; 14 cycles

        TYA
        CLC
        ADC xGain
        SEC
        SBC xLoss
        TAY

    ENDM

    MAC X_POS_LOS ; 14 cycles

        TYA
        CLC
        ADC xLoss
        SEC
        SBC xGain
        TAY

    ENDM

    LDY playerPos ; 3 cycles

    INCLUDE "r_layers/layer1.asm" ; 86 cycles

    INCLUDE "r_layers/layer2.asm" ; 148 cycles

    INCLUDE "r_layers/layer3.asm" ; 182 cycles

    INCLUDE "r_layers/layer4.asm" ; 8 cycles

    STA WSYNC ; By this time 2 scanlines have passed
