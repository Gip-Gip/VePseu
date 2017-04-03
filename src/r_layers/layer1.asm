; Render the first layer (not that ugly) (86 cycles)

    INCLUDE "include/ands_1.h"

    Y_POS_ADV ; 30 cycles
    LDA (mapPtr),Y
    STA shadow1d
    ORA shadow1e
    AND #AND_W1S1P1
    STA shadow1e

    X_POS_LOS ; 22 cycles
    LDA (mapPtr),Y
    STA wall1

    X_POS_LOS ; 34 cycles
    LDA (mapPtr),Y
    TAX
    ORA shadow1a
    STA shadow1a
    TXA
    AND #AND_W1S1P2
    STA shadow1b
