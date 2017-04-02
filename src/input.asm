; VePseu's controller input

    STA WSYNC

    LDA SWCHA ; 9 or 10 cycles
    AND #FFORD
    CMP #FFORD
    BEQ CIN1_NOPRESS

    LDA playerPos ; 15 cycles
    SEC
    SBC yLoss
    CLC
    ADC yGain
    TAY

    LDA (mapPtr),Y ; 10 or 11 cycles
    CMP #NULL
    BNE CIN2

    LDA fordPressed ; 5 or 6 cycles
    CMP #NULL
    BNE CIN1_WAIT

    STY playerPos ; 9 cycles
    LDA #CWAITCNT
    STA fordPressed
    JMP CIN2

CIN1_WAIT:
    DEA
    STA fordPressed
    JMP CIN2

CIN1_NOPRESS:
    LDA #NULL ; 5 cycles
    STA fordPressed

CIN2:
    STA WSYNC
    LDA SWCHA ; 9 or 10 cycles
    AND #FBACK
    CMP #FBACK
    BEQ CIN2_NOPRESS

    LDA playerPos ; 15 cycles
    SEC
    SBC yGain
    CLC
    ADC yLoss
    TAY

    LDA (mapPtr),Y ; 10 or 11 cycles
    CMP #NULL
    BNE CIN3

    LDA backPressed ; 5 or 6 cycles
    CMP #NULL
    BNE CIN2_WAIT

    STY playerPos ; 9 cycles
    LDA #CWAITCNT
    STA backPressed
    JMP CIN3

CIN2_WAIT:
    DEA
    STA backPressed
    JMP CIN3

CIN2_NOPRESS:
    LDA #NULL ; 5 cycles
    STA backPressed

CIN3:
    STA WSYNC
    LDA SWCHA ; 9 or 10 cycles
    AND #FLEFT
    CMP #FLEFT
    BEQ CIN3_NOPRESS

    LDA direction
    INA
    AND #%00000011

    LDX rigtPressed
    CPX #NULL
    BNE CIN3_WAIT

    STA direction

    LDA #CWAITCNT ; 8 cycles
    STA rigtPressed
    JMP CIN4

CIN3_WAIT:
    DEX
    STX rigtPressed
    JMP CIN4

CIN3_NOPRESS:
    LDA #NULL ; 5 cycles
    STA rigtPressed

CIN4:
    STA WSYNC
    LDA SWCHA ; 9 or 10 cycles
    AND #FRIGT
    CMP #FRIGT
    BEQ CIN4_NOPRESS

    LDA direction ; 10 cycles
    DEA
    AND #%00000011

    LDX leftPressed ; 7 or 8 cycles
    CPX #NULL
    BNE CIN4_WAIT

    STA direction

    LDA #CWAITCNT ; 8 cycles
    STA leftPressed
    JMP CDIR1

CIN4_WAIT:
    DEX
    STX leftPressed
    JMP CDIR1

CIN4_NOPRESS:
    LDA #NULL
    STA leftPressed

CDIR1:
    STA WSYNC
    LDA direction
    CMP #DNORTH
    BNE CDIR2

    LDA mapWidth
    STA yLoss
    LDA #ONE
    STA xGain
    LDA #WCOLU
    STA wallColour
    LDA #SCOLU
    STA shadowColour
    LDA #NULL
    STA yGain
    STA xLoss

CDIR2:
    LDA direction
    CMP #DSOUTH
    BNE CDIR3

    LDA mapWidth
    STA yGain
    LDA #ONE
    STA xLoss
    LDA #WCOLU
    STA wallColour
    LDA #SCOLU
    STA shadowColour
    LDA #NULL
    STA yLoss
    STA xGain

CDIR3:
    LDA direction
    CMP #DWEST
    BNE CDIR4

    LDA mapWidth
    STA xGain
    LDA #ONE
    STA yGain
    LDA #SCOLU
    STA wallColour
    LDA #WCOLU
    STA shadowColour
    LDA #NULL
    STA yLoss
    STA xLoss

CDIR4:
    LDA direction
    CMP #DEAST
    BNE CEND

    LDA mapWidth
    STA xLoss
    LDA #ONE
    STA yLoss
    LDA #SCOLU
    STA wallColour
    LDA #WCOLU
    STA shadowColour
    LDA #NULL
    STA yGain
    STA xGain

CEND:
    STA WSYNC