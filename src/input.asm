; VePseu's controller input

    STA WSYNC

    LDA SWCHA
    AND #FFORD
    BNE CIN1_NOPRESS

    LDA playerPos
    SEC
    SBC yLoss
    CLC
    ADC yGain
    TAY

    LDA (mapPtr),Y
    BNE CIN2

    LDA fordPressed
    BNE CIN1_WAIT

    STY playerPos
    LDA #CWAITCNT
    STA fordPressed
    JMP CIN2

CIN1_WAIT:
    DEA
    STA fordPressed
    JMP CIN2

CIN1_NOPRESS:
    LDA #NULL
    STA fordPressed

CIN2:
    STA WSYNC
    LDA SWCHA
    AND #FBACK
    BNE CIN2_NOPRESS

    LDA playerPos
    SEC
    SBC yGain
    CLC
    ADC yLoss
    TAY

    LDA (mapPtr),Y
    BNE CIN3

    LDA backPressed
    BNE CIN2_WAIT

    STY playerPos
    LDA #CWAITCNT
    STA backPressed
    JMP CIN3

CIN2_WAIT:
    DEA
    STA backPressed
    JMP CIN3

CIN2_NOPRESS:
    LDA #NULL
    STA backPressed

CIN3:
    STA WSYNC
    LDA SWCHA
    AND #FLEFT
    BNE CIN3_NOPRESS

    LDA direction
    INA
    AND #%00000011

    LDX rigtPressed
    BNE CIN3_WAIT

    STA direction

    LDA #CWAITCNT
    STA rigtPressed
    JMP CIN4

CIN3_WAIT:
    DEX
    STX rigtPressed
    JMP CIN4

CIN3_NOPRESS:
    LDA #NULL
    STA rigtPressed

CIN4:
    STA WSYNC
    LDA SWCHA
    AND #FRIGT
    BNE CIN4_NOPRESS

    LDA direction
    DEA
    AND #%11

    LDX leftPressed
    BNE CIN4_WAIT

    STA direction

    LDA #CWAITCNT
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
