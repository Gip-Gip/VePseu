; VePseu's controller input

    LDA SWCHA
    AND #FFORD
    CMP #FFORD
    BEQ CIN2

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

CIN2:
    LDA SWCHA
    AND #FBACK
    CMP #FBACK
    BEQ CIN3

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

CIN3:
    LDA SWCHA
    AND #FLEFT
    CMP #FLEFT
    BEQ CIN4

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

CIN4:
    LDA SWCHA
    AND #FRIGT
    CMP #FRIGT
    BEQ CTRIG

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

CTRIG:

    LDA INPT4
    AND #ITRIG
    CMP #ITRIG
    BEQ CNOTRIG

    LDA playerPos
    SEC
    SBC yLoss
    CLC
    ADC yGain
    TAY
    LDA (mapPtr),Y
    CMP #NULL
    BNE COLL
    LDA trigPressed
    CMP #NULL
    BNE COLL
    STY playerPos

COLL:

    LDA #$FF
    STA trigPressed
    JMP CEND

CNOTRIG:
    LDA #NULL
    STA trigPressed

CEND:
    STA WSYNC
