    SUBROUTINE

    LDA SWCHA
    AND #FFORD
    BNE .noPress

    LDA playerPos
    SEC
    SBC yLoss
    CLC
    ADC yGain
    TAY

    LDA (mapPtr),Y
    BNE .end

    LDX fordPressed
    BNE .wait
    STY playerPos
    LDA #CWAITCNT
    STA fordPressed

    LDA #PLAYER_STEPV
    ORA stepVol
    STA stepVol
    LDA #PLAYER_STEPS
    STA stepSnd

    JMP .end

.wait:
    DEX
    STX fordPressed
    JMP .end

.noPress:
    LDA #NULL
    STA fordPressed

.end:
