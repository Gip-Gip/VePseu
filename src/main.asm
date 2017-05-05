; VePseu's main file

    processor 6502

    INCLUDE "include/vepseu.h"

    SEG

    ORG $F000

    INCLUDE "andtable.asm"
    INCLUDE "map.asm"

    USAGE_REPORT "map space", $F000, $F800

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

; Render everything


    INCLUDE "walrend.asm"
    INCLUDE "scrend.asm"

    LDA #<carl
    STA sprite
    LDA #>carl
    STA sprite+1
    LDA #$0C
    STA COLUP0

    LDA #11
    STA spriteHeight

; Pad!

    LDX #UPPAD_LIMIT

upperPad:
    STA WSYNC

    DEX
    BNE upperPad

    STA WSYNC

; Draw everything

    LDY 0

    INCLUDE "dispkern.asm"

; Start VBLANK

    LDA #VBLANK_SET
    STA VBLANK

; Process input

    INCLUDE "input.asm"

; Pad again

    LDX #LOPAD_LIMIT

lowerPad:
    STA WSYNC

    DEX
    BNE lowerPad

; Get everything ready for VSYNC

    STX VBLANK
    LDA #VSYNC_SET
    STA WSYNC
    JMP screenStart

; Tell us how many bytes we have used up

    USAGE_REPORT "ROM", $F800, $FFFA

    ORG $FFFA

    DC.W start ; Something
    DC.W start ; Entrypoint
    DC.W screenStart ; Something else

    END
