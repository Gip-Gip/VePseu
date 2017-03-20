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
