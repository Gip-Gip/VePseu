

; VePseu's wall renderer

    JSR clear
    LDX playerPos

; First layer

    TXA
    SBC mapWidth
    TAX

    INX
    LDA map,X
    STA shadow1b

    DEX
    LDA map,X
    STA wall1a
    STA wall1b

    DEX
    LDA map,X
    STA shadow1a

; Second Layer

    TXA
    SBC mapWidth
    TAX

    DEX
    LDA map,X
    AND LAYER2_AND_0
    STA shadow2a

    INX
    LDA map,X
    AND #LAYER2_AND_1
    STA wall2a

    STA WSYNC
