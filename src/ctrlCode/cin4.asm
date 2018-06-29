    SUBROUTINE

    STA WSYNC

    LDA SWCHA
    AND #FRIGT
    BNE .end

    LDX shadowColour
    LDA wallColour
    STX wallColour
    STA shadowColour

    LDA xGain
    LDX yLoss
    STA yLoss
    LDA xLoss
    STX xLoss
    LDX yGain
    STA yGain
    STX xGain

    LDA #PLAYER_STEPV
    ORA stepVol
    STA stepVol
    LDA #PLAYER_TURNS
    STA stepSnd

.end:
