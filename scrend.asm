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


; Merge walls (approx 381 cycles)

    LDX #1

mergeLoop:

; Merge wall a

    LDA wall1a,X ; 17 cycles
    DEX
    ORA wall1a,X
    INX
    STA wall1a,X

; Make shadow a

    LSR ; 21 cycles
    DEX
    ORA shadow1a,X
    INX
    ORA shadow1a,X
    STA shadow1a,X

; Overlap wall a

    LDA wall1a,X ; 22 cycles
    DEX
    ORA shadow1a,X
    EOR shadow1a,X
    INX
    STA wall1a,X

; Overlap shadow a

    LDA shadow1a,X ; 20 cycles
    ORA wall1a,X
    EOR wall1a,X
    STA shadow1a,X

; Merge wall b

    LDA wall1b,X ; 17 cycles
    DEX
    ORA wall1b,X
    INX
    STA wall1b,X

; Make shadow b

    LSR ; 31 cycles
    DEX
    ORA shadow1b,X
    INX
    ORA shadow1b,X
    STA shadow1b,X

; Overlap wall b

    LDA wall1b,X ; 22 cycles
    DEX
    ORA shadow1b,X
    EOR shadow1b,X
    INX
    STA wall1b,X

; Overlap shadow b

    LDA shadow1b,X ; 20 cycles
    ORA wall1b,X
    EOR wall1b,X
    STA shadow1b,X

; Loop if not done

    INX ; 7 or 6 cycles
    CPX #4
    BNE mergeLoop

    STA WSYNC

; By this time, we know approx 6 scanlines have passed
