; VePseu's screen renderer

; Remove the shadows incase only 1 wall is drawn

    SUBROUTINE

    LDA shadow1a ; 12 cycles
    ORA wall1
    EOR wall1
    STA shadow1a

    LDA shadow1b ; 12 cycles
    ORA wall1
    EOR wall1
    STA shadow1b

    LDA shadow1d ; 12 cycles
    ORA wall1
    EOR wall1
    STA shadow1d

    LDA shadow1e ; 12 cycles
    ORA wall1
    EOR wall1
    STA shadow1e

    LDA wall1 ; Copy wall one to the four addresses preceding it (15 cycles)
    STA wall1+1
    STA wall1+2
    STA wall1+3
    STA wall1+4

    LDX #INDEXINIT ; 2 cycles

.loop: ; Totals at 909 cycles

    LDA wall2a,X ; Merge walls (12 cycles)
    ORA wall1,X
    STA wall2a,X

    LDA shadow2aa,X ; Merge A shadows (12 cycles)
    ORA shadow1a,X
    STA shadow2aa,X

    LDA shadow2ab,X ; Merge B shadows (12 cycles)
    ORA shadow1a,X
    STA shadow2ab,X

    LDA wall2a,X ; Overlap walls (16 cycles)
    ORA shadow1a,X
    EOR shadow1a,X
    STA wall2a,X

    LDA shadow2aa,X ; Overlap A shadows (16 cycles)
    ORA wall2a,X
    EOR wall2a,X
    STA shadow2aa,X

    LDA shadow2ab,X ; Overlap B shadows (16 cycles)
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
