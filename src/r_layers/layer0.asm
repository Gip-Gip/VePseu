; Peripheral vision rendering (86 cycles)
    X_POS_LOS ; 23 cycles
    LDA (mapPtr),Y
    AND #LAYER0_AND_0
    STA shadow1a

    TYA ; Move twice the amount of a normal X_POS_GAIN
    CLC
    ADC xGain
    ADC xGain
    SEC
    SBC xLoss
    SBC xLoss
    TAY

    LDA (mapPtr),Y
    AND #LAYER0_AND_1
    STA shadow1e
