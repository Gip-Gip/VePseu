    SUBROUTINE

    STA WSYNC

    LDX rigtPressed
    BNE .wait

    LDA SWCHA
    AND #FLEFT
    BNE .noPress

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

    LDA #CWAITCNT
    STA rigtPressed

    LDA #PLAYER_STEPV
    ORA stepVol
    STA stepVol
    LDA #PLAYER_TURNS
    STA stepSnd

    JMP .end

.wait:
    DEX
    STX rigtPressed
    JMP .end

.noPress:
    STX rigtPressed

.end
