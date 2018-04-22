; VePseu's screen renderer

    SUBROUTINE

    LDX #INDEXINIT ; 2 cycles

.loop: ; Totals at 909 cycles

    LDA wall2a,X ; Merge walls (12 cycles)
    ORA wall1,X
    ORA shadow1a,X
    EOR shadow1a,X
    STA wall2a,X

    LDA shadow2aa,X ; Merge A shadows (12 cycles)
    ORA shadow1a,X
    ORA wall2a,X
    EOR wall2a,X
    STA shadow2aa,X

    LDA shadow2ab,X ; Merge B shadows (12 cycles)
    ORA shadow1a,X
    ORA wall2a,X
    EOR wall2a,X
    STA shadow2ab,X

    INX ; Loop if we haven't rendered all the walls (6 or 7 cycles)
    CPX #WALLCNT
    BNE .loop

    LDX #FULLWALL

    TXA
    EOR shadow3ab
    STA wall4a

    TXA
    EOR shadow3bb
    STA wall4b

    STA WSYNC ; by the end of this we have used 14 scanlines
