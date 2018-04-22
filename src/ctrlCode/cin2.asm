    SUBROUTINE

    STA WSYNC
    LDA SWCHA
    AND #FBACK
    BNE .noPress

    LDA playerPos
    SEC
    SBC yGain
    CLC
    ADC yLoss
    TAY

    LDA (mapPtr),Y
    BNE .end

    LDX backPressed
    BNE .wait

    STY playerPos
    LDA #CWAITCNT
    STA backPressed

    LDA #PLAYER_STEPV
    ORA stepVol
    STA stepVol
    LDA #PLAYER_STEPS
    STA stepSnd

    JMP .end

.wait:
    DEX
    STX backPressed
    JMP .end

.noPress:
    LDA #NULL
    STA backPressed

.end:
