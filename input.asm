; VePseu's controller input

    LDA SWCHA
    AND #FFORD
    CMP #FFORD
    BEQ CIN1_NOPRESS

    LDA playerPos
    SEC
    SBC yLoss
    CLC
    ADC yGain
    TAY
    LDA (mapPtr),Y
    CMP #NULL
    BNE CIN2
    LDA fordPressed
    CMP #NULL
    BNE CIN2
    STY playerPos
    STY fordPressed
    JMP CIN2

CIN1_NOPRESS:
    LDA #NULL
    STA fordPressed

CIN2:
    LDA SWCHA
    AND #FBACK
    CMP #FBACK
    BEQ CIN2_NOPRESS

    LDA playerPos
    SEC
    SBC yGain
    CLC
    ADC yLoss
    TAY
    LDA (mapPtr),Y
    CMP #NULL
    BNE CIN3
    LDA backPressed
    CMP #NULL
    BNE CIN3
    STY playerPos
    STY backPressed
    JMP CIN3

CIN2_NOPRESS:
    LDA #NULL
    STA backPressed

CIN3:
    LDA SWCHA
    AND #FLEFT
    CMP #FLEFT
    BEQ CIN3_NOPRESS

    LDA rigtPressed
    CMP #NULL
    BNE CIN4
    LDA direction
    INA
    AND #%00000011
    STA direction
    LDA #1
    STA rigtPressed
    JMP CIN4

CIN3_NOPRESS:
    LDA #NULL
    STA rigtPressed

CIN4:
    LDA SWCHA
    AND #FRIGT
    CMP #FRIGT
    BEQ CIN4_NOPRESS

    LDA leftPressed
    CMP #NULL
    BNE CDIR1
    LDA direction
    DEA
    AND #%00000011
    STA direction
    LDA #1
    STA leftPressed
    JMP CDIR1

CIN4_NOPRESS:
    LDA #NULL
    STA leftPressed

CDIR1:
    LDA direction
    CMP DNORTH
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
    CMP DSOUTH
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
    CMP DWEST
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
    CMP DEAST
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
