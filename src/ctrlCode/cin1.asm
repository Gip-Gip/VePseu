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

    LDA fordPressed
    BNE .wait

    STY playerPos
    LDA #CWAITCNT
    STA fordPressed
    JMP .end

.wait:
    DEA
    STA fordPressed
    JMP .end

.noPress:
    LDA #NULL
    STA fordPressed

.end:
