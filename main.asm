; VePseu's main file

    processor 6502

    INCLUDE "vepseu.h"

    SEG

;Initialize everything

    ORG $F000

    INCLUDE "map.asm"

    ORG $F800

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

    LDA #VBLANK_SET
    STA VBLANK

    INCLUDE "input.asm"

    LDX #INDEXINIT

lowerPad: ;Pad everything else
    STA WSYNC

    INX
    CPX #LOPAD_LIMIT
    BNE lowerPad

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
