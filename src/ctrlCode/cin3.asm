    SUBROUTINE

    STA WSYNC

    LDX rigtPressed
    BNE .wait

    LDA SWCHA
    AND #FLEFT
    BNE .noPress

    LDX direction
    INX
    TXA
    AND #%11

    STA direction

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
