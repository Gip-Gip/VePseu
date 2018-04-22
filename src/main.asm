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


; Tell the draw code to draw carl...

    LDA #<carl
    STA spriteAddrH
    LDA #>carl
    STA spriteAddrL
    LDA #carlH
    STA spriteHeight

    LDA #14    ; Color him...
    STA COLUP0

    LDX spritePosY ; And roll him accross the screen for some reason
    INX
    ;STX spritePosY

; Pad!

    PAD UPPAD_LIMIT

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

; Tell us how many bytes we have used up

    USAGE_REPORT "ROM", $F800, $FFFA

    ORG $FFFA

    DC.W start ; Something
    DC.W start ; Entrypoint
    DC.W screenStart ; Something else

    END
