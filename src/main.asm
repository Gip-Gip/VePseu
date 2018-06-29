; VePseu's main file

    processor 6502

    INCLUDE "include/vepseu.h"

    SEG

    ORG $F000

    INCLUDE "map.asm"

    USAGE_REPORT "map space", $F000, $F600

    ORG $F600

    INCLUDE "andtable.asm"
    INCLUDE "gamecode.asm"

start:

; Initialize everything

    INCLUDE "init.asm"

    LDA #VSYNC_SET

screenStart:

; Start vsync (3 scanlines)
    STA VSYNC

    STA WSYNC
    STA WSYNC
    INC frameNum
    LDA #NULL
    STA WSYNC

    STA VSYNC

; Render everything


    INCLUDE "walrend.asm"
    INCLUDE "scrend.asm"

; Pad!

    PAD UPPAD_LIMIT + 2

; Draw everything

    INCLUDE "dispkern.asm"

; Start VBLANK

    LDA #VBLANK_SET
    STA VBLANK

; Make sounds 'n' stuff

    INCLUDE "sound.asm"

; Process input

    INCLUDE "input.asm"

; Pad again!

    PAD LOPAD_LIMIT

; Get everything ready for VSYNC

    STX VBLANK
    LDA #VSYNC_SET
    STA WSYNC
    JMP screenStart ; And start all over again!

; Tell us how many bytes we've used up

    USAGE_REPORT "ROM", $F600, $FFFA

    ORG $FFFA

    DC.W start ; Something
    DC.W start ; Entrypoint
    DC.W screenStart ; Something else

    END
