    SUBROUTINE

    LDA SWCHA
    AND #FFORD
    BNE .end

    LDA playerPos
    SEC
    SBC yLoss
    CLC
    ADC yGain
    TAY

    LDA (mapPtr),Y
    BNE .end
    STY playerPos

    LDA #PLAYER_STEPV
    ORA stepVol
    STA stepVol
    LDA #PLAYER_STEPS
    STA stepSnd

.end:
