; The draw code for the 1st wall and shadow

dc_w1s1:

    LDX #INDEXINIT

_dc_w1s1_loop:
    LDA wallColour
    STA WSYNC
    STA COLUPF
    LDA wall1
    STA PF1
    TYA
    BEQ noSprite_1
    DEY
    CPY spriteHeight
    BCS noSprite_2
    LDA (sprite),Y
    STA GRP0
noSprite_ret:
    LDA wall1
    STA PF2
    DELAY 6
    STA PF0
    DELAY 5
    LDA #NULL
    STA PF0
    DELAY 10
    STA PF2

    STA WSYNC
    LDA shadowColour
    STA COLUPF
    LDA shadow1a
    AND and_1a,X
    STA PF1
    LDA shadow1b
    AND and_1b,X
    STA PF2
    DELAY 9
    LDA shadow1d
    AND and_1c,X
    STA PF1
    LDA shadow1e
    AND and_1d,X
    STA PF2

    INX
    CPX #30
    BNE _dc_w1s1_loop

    RTS

noSprite_1:
    DELAY 11
    JMP noSprite_ret

noSprite_2:
    DELAY 4
    JMP noSprite_ret
