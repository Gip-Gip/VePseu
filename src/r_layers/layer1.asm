; Render the first layer (not that ugly) (86 cycles)

    INCLUDE "include/ands_1.h"

    Y_POS_ADV ; 30 cycles
    LDA (mapPtr),Y
    STA shadow1d

    X_POS_LOS ; 22 cycles
    LDA (mapPtr),Y
    STA wall1
    STA wall1+1
    STA wall1+2
    STA wall1+3
    STA wall1+4

    LDA shadow1d
    TAX
    ORA wall1
    EOR wall1
    STA shadow1d
    TXA
    ORA shadow1e
    ORA wall1
    EOR wall1
    AND #AND_W1S1P2
    STA shadow1e

    X_POS_LOS ; 34 cycles
    LDA (mapPtr),Y
    ORA wall1
    TAX
    ORA shadow1a
    EOR wall1
    STA shadow1a
    TXA
    EOR wall1
    AND #AND_W1S1P2
    STA shadow1b
