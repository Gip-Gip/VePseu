; Peripheral vision rendering (54 cycles)

    INCLUDE "include/ands_0.h"

    X_POS_LOS ; 24 cycles
    LDA (mapPtr),Y
    AND #AND_W0S1P1
    STA shadow1a

    TYA ; Move twice the amount of a normal X_POS_GAIN (20 cycles)
    CLC
    ADC xGain
    ADC xGain
    SEC
    SBC xLoss
    SBC xLoss
    TAY

    LDA (mapPtr),Y ; 10 cycles
    STA shadow1e
