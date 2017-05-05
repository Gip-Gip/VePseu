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

    LDA backPressed
    BNE .wait

    STY playerPos
    LDA #CWAITCNT
    STA backPressed
    JMP .end

.wait:
    DEA
    STA backPressed
    JMP .end

.noPress:
    LDA #NULL
    STA backPressed

.end:
