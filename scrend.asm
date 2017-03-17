; VePseu's screen renderer

; Remove the shadows incase only 1 wall is drawn (22 cycles)
    LDA shadow1a
    ORA wall1a
    EOR wall1a
    AND #%11111000
    STA shadow1a

    LDA shadow1b
    ORA wall1b
    EOR wall1b
    AND #%11111000
    STA shadow1b


; Merge walls (approx 382 cycles)

    LDX #1

mergeLoop:

; Make shadows
    LDA wall1a,X
    LSR
    ORA wall1a,X
    EOR wall1a,X
    DEX
    ORA shadow1a,X
    INX
    STA shadow1a,X

    LDA wall1b,X
    LSR
    ORA wall1b,X
    EOR wall1b,X
    DEX
    ORA shadow1b,X
    INX
    STA shadow1b,X

; Merge walls
    LDA wall1a,X
    DEX
    ORA wall1a,X
    INX
    ORA shadow1a,X
    EOR shadow1a,X
    STA wall1a,X

    LDA wall1b,X
    DEX
    ORA wall1b,X
    INX
    ORA shadow1b,X
    EOR shadow1b,X
    STA wall1b,X

    INX
    CPX #4
    BNE mergeLoop

    STA WSYNC

; By this time, we know approx 6 scanlines have passed
