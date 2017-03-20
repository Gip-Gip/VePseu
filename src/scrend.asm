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

    MRGWLL wall1a ; 17 cycles

; Make shadow a

    MKSHAD shadow1a ; 21 cycles

; Overlap wall a

    OVLWLL wall1a, shadow1a ; 22 cycles

; Overlap shadow a

    OVLSHD wall1a, shadow1a ; 21 cycles

; Merge wall b

    MRGWLL wall1b ; 17 cycles

; Make shadow b

    MKSHAD shadow1b ; 21 cycles

; Overlap wall b

    OVLWLL wall1b, shadow1b ; 22 cycles

; Overlap shadow b

    OVLSHD wall1b, shadow1b ; 20 cycles

; Loop if not done

    INX ; 7 or 6 cycles
    CPX #4
    BNE mergeLoop

    STA WSYNC

; By this time, we know approx 6 scanlines have passed
