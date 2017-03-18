    ; Argument 1 is wall1X
    MAC MRGWLL ; 17 cycles
        LDA {1},X
        DEX
        ORA {1},X
        INX
        STA {1},X
    ENDM

    ; Argument 1 is shadow1X
    MAC MKSHAD ; 21 cycles
        LSR
        DEX
        ORA {1},X
        INX
        ORA {1},X
        STA {1},X
    ENDM

    ; Argument 1 is wall1X, 2 is shadow1X
    MAC OVLWLL ; 22 cycles
        LDA {1},X
        DEX
        ORA {2},X
        EOR {2},X
        INX
        STA {1},X
    ENDM

    ; Argument 1 is wall1X, 2 is shadow1X
    MAC OVLSHD ; 20 cycles
        LDA {2},X
        ORA {1},X
        EOR {1},X
        STA {2},X
    ENDM
