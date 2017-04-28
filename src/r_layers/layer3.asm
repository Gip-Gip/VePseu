; Render the third layer (it's really ugly, at 281 cycles)

    INCLUDE "include/ands_3.h"

    Y_POS_ADV_AG ; 35 cycles
    LDA (mapPtr),Y
    AND #AND_W3S2P6
    STA shadow3eb
    AND #AND_W3S1P6
    STA shadow3ea

    X_POS_LOS ; 38 cycles
    LDA (mapPtr),Y
    TAX
    AND #AND_W3S0P8
    STA wall3d
    AND #AND_W3S0P9
    STA wall3e
    TXA
    AND #AND_W3S2P5
    STA shadow3db
    AND #AND_W3S1P5
    STA shadow3da

    X_POS_LOS ; 46 cycles
    LDA (mapPtr),Y
    TAX
    AND #AND_W3S0P7
    ORA wall3d
    STA wall3d
    AND #AND_W3S0P6
    STA wall3c
    TXA
    AND #AND_W3S2P4
    STA shadow3cb
    AND #AND_W3S1P4
    STA shadow3ca

    X_POS_LOS ; 32 cycles
    LDA (mapPtr),Y
    AND #AND_W3S0P4
    STA wall3b
    AND #AND_W3S0P5
    ORA wall3c
    STA wall3c

    X_POS_LOS ; 46 cycles
    LDA (mapPtr),Y
    TAX
    AND #AND_W3S0P3
    ORA wall3b
    STA wall3b
    AND #AND_W3S0P2
    STA wall3a
    TXA
    AND #AND_W3S2P3
    STA shadow3bb
    AND #AND_W3S1P3
    STA shadow3ba

    X_POS_LOS ; 41 cycles
    LDA (mapPtr),Y
    TAX
    AND #AND_W3S0P1
    ORA wall3a
    STA wall3a
    TXA
    AND #AND_W3S2P2
    STA shadow3ab
    AND #AND_W3S1P2
    STA shadow3aa

    X_POS_LOS ; 35 cycles
    LDA (mapPtr),Y
    AND #AND_W3S2P1
    ORA shadow3ab
    STA shadow3ab
    AND #AND_W3S1P1
    ORA shadow3aa
    STA shadow3aa
