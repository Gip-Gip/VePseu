; VePseu's main file

    processor 6502

    INCLUDE "vepseu.h"

    SEG

;Initialize everything

    ORG $F000

    INCLUDE "map.asm"

    ORG $F800

clear: ; Clear all wall values (199 cycles)
    LDX #INDEXINIT
    LDA #NULL

_clear_loop:

    STA wall1a,X
    INX
    CPX #WALLCNT
    BNE _clear_loop
    RTS

start:

    INCLUDE "init.asm"

    LDA #VSYNC_SET

screenStart:

; Start vsync (3 scanlines)
    STA VSYNC

    STA WSYNC
    STA WSYNC
    LDA #NULL
    STA WSYNC

    STA VSYNC

; Render everything (10 scanlines)

    INCLUDE "walrend.asm" ; 4 scanlines

    INCLUDE "scrend.asm" ; 6 Scanlines

; Pad!

    LDX #INDEXINIT

upperPad:
    STA WSYNC

    INX
    CPX #UPPAD_LIMIT
    BNE upperPad

    STA WSYNC

; Draw everything

    INCLUDE "dispkern.asm" ; 136 Scanlines

; Pad even more!

    LDA #VBLANK_SET
    STA VBLANK

    REPEAT 86

    STA WSYNC

    REPEND

    LDA #NULL
    STA VBLANK
    LDA #VSYNC_SET
    STA WSYNC
    JMP screenStart

    ORG $FFFA



            .word start          ; NMI

            .word start          ; RESET

            .word screenStart          ; IRQ



    END
