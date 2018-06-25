    SUBROUTINE

    STA WSYNC

    LDX leftPressed
    BNE .wait

    LDA SWCHA
    AND #FRIGT
    BNE .noPress

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

    LDA #CWAITCNT
    STA leftPressed

    LDA #PLAYER_STEPV
    ORA stepVol
    STA stepVol
    LDA #PLAYER_TURNS
    STA stepSnd

    JMP .end

.wait:
    DEX
    STX leftPressed
    JMP .end

.noPress:
    STX leftPressed

.end:
