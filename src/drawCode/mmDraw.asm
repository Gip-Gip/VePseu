; Draws the compass to the screen
; See GLOSSARY.TXT for definitions of vague words

mmDraw:

    INCLUDE "drawCode/mmRender.asm"

    SUBROUTINE ; The preceeding code declares it's own subroutine

    LDY #NULL
    STY GRP0
    STY GRP1
    STY WSYNC
    STY HMOVE

    LDX playerPos

.loop:
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
    AND #$F0

    BNE .noDraw

    LDA #2
    STA ENABL
    STA drawingPlyr
    LDA #1
    STA VDELBL

.noDraw:

    LDA drawingPlyr
    STA ENABL
    LDA #NULL
    STA drawingPlyr
    CPY #MMSIZE
    BNE .loop

    LDA #NULL
    STA ENABL

    STA WSYNC

    LDA #NULL
    STA GRP0
    STA GRP1
    STA COLUP0
    STA COLUP1
