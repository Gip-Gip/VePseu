    SUBROUTINE

    STA WSYNC
    LDA SWCHA
    AND #FBACK
    BNE .end

    LDA playerPos
    SEC
    SBC yGain
    CLC
    ADC yLoss
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
