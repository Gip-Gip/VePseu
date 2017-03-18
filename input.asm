; VePseu's controller input

    LDA SWCHA
    EOR #SWGET
    AND #FFORD
    CMP #NOIN
    BEQ CIN2

    LDA mapWidth
    STA yLoss
    LDA #ONE
    STA xGain
    LDA #NULL
    STA yGain
    STA xLoss

CIN2:
    LDA SWCHA
    EOR #SWGET
    AND #FBACK
    CMP #NOIN
    BEQ CIN3

    LDA mapWidth
    STA yGain
    LDA #ONE
    STA xLoss
    LDA #NULL
    STA yLoss
    STA xGain

CIN3:
    LDA SWCHA
    EOR #SWGET
    AND #FLEFT
    CMP #NOIN
    BEQ CIN4

    LDA mapWidth
    STA xLoss
    LDA #ONE
    STA yGain
    LDA #NULL
    STA yLoss
    STA xGain

CIN4:
    LDA SWCHA
    EOR #SWGET
    AND #FRIGT
    CMP #NOIN
    BEQ CTRIG

    LDA mapWidth
    STA xGain
    LDA #ONE
    STA yLoss
    LDA #NULL
    STA yGain
    STA xLoss

CTRIG:

    LDA INPT4
    EOR #SWGET
    AND #ITRIG
    CMP #NOIN
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
