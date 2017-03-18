; VePseu's main file

    processor 6502

    INCLUDE "include/vepseu.h"

    SEG

    ORG $F000

    INCLUDE "map.asm"

    ORG $F800

start:

; Initialize everything

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

; Render everything (12 scanlines)

    INCLUDE "walrend.asm" ; 6 scanlines

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

    INCLUDE "dispkern.asm" ; 121 Scanlines


; Start VBLANK

    LDA #VBLANK_SET
    STA VBLANK

; Process input

    INCLUDE "input.asm"

; Pad again

    LDX #INDEXINIT

lowerPad:
    STA WSYNC

    INX
    CPX #LOPAD_LIMIT
    BNE lowerPad

; Get everything ready for VSYNC

    LDA #NULL
    STA VBLANK
    LDA #VSYNC_SET
    STA WSYNC
    JMP screenStart

    ORG $FFFA

    DC.W start ; Something
    DC.W start ; Entrypoint
    DC.W screenStart ; Something else

    END
