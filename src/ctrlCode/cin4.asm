    SUBROUTINE

    STA WSYNC

    LDX leftPressed
    BNE .wait

    LDA SWCHA
    AND #FRIGT
    BNE .noPress

    LDX direction
    DEX
    TXA
    AND #%11

    STA direction

    LDA #CWAITCNT
    STA leftPressed
    JMP .end

.wait:
    DEX
    STX leftPressed
    JMP CDIR1

.noPress:
    STX leftPressed

.end:
