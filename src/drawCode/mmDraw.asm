; Draws the compass to the screen

    INCLUDE "drawCode/mmRender.asm"

mmDraw:
    LDA #0

    JSR mmRender

; Load the player's position

    LDA horzPos_plyr
    STA HMBL
    LDA horzPos_mA
    STA HMP0
    LDA horzPos_mB
    STA HMP1

    LDA #NULL
    STA GRP0
    STA GRP1
    STA HMOVE

    LDY #INDEXINIT
    LDX playerPos

_mmLoop:
    STA WSYNC

    LDA (miniMapPtr),Y
    STA GRP0
    INY
    LDA (miniMapPtr),Y
    STA GRP1
    INY

    TXA
    SEC
    SBC mapWidth
    TAX
    AND #%11110000

    CMP #0
    BNE _noDraw

    LDA #2
    STA ENABL
    STA drawingPlyr
    LDA #1
    STA VDELBL

_noDraw:

    LDA drawingPlyr
    STA ENABL
    LDA #0
    STA drawingPlyr
    CPY #32
    BNE _mmLoop

    LDA #0
    STA ENABL

    STA WSYNC

    LDA #NULL
    STA GRP0
    STA GRP1
    STA COLUP0
    STA COLUP1

    RTS
