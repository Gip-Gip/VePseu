    MAC Y_POS_ADV ; 14 cycles

        TYA
        CLC
        ADC yGain
        SEC
        SBC yLoss
        TAY

    ENDM

    MAC Y_POS_ADV_AG ; 20 cycles

        TYA
        CLC
        ADC yGain
        ADC xGain
        SEC
        SBC yLoss
        SBC xLoss
        TAY

    ENDM

    MAC Y_POS_ADV_AL ; 20 cycles

        TYA
        CLC
        ADC yGain
        ADC xLoss
        SEC
        SBC yLoss
        SBC xGain
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
