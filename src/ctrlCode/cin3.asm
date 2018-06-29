    SUBROUTINE

    STA WSYNC

    LDA SWCHA
    AND #FLEFT
    BNE .end

    LDX shadowColour
    LDA wallColour
    STX wallColour
    STA shadowColour

    LDA yLoss
    LDX xGain
    STA xGain
    LDA yGain
    STX yGain
    LDX xLoss
    STA xLoss
    STX yLoss

    LDA #PLAYER_STEPV
    ORA stepVol
    STA stepVol
    LDA #PLAYER_TURNS
    STA stepSnd

.end
