; The draw code for the 1st wall and shadow

    JMP dc_w1s1

_dc_w1s1_noSprite_1:
    DELAY 11
    JMP _dc_w1s1_noSprite_ret

_dc_w1s1_noSprite_2:
    DELAY 4
    JMP _dc_w1s1_noSprite_ret

dc_w1s1:

    LDX #INDEXINIT

_dc_w1s1_loop:
    LDA wallColour
    STA WSYNC
    STA COLUPF
    LDA wall1
    STA PF1
    TYA
    BEQ _dc_w1s1_noSprite_1
    DEY
    CPY spriteHeight
    BCS _dc_w1s1_noSprite_2
    LDA (sprite),Y
    STA GRP0
_dc_w1s1_noSprite_ret:
    LDA wall1
    STA PF2
    DELAY 6
    STA PF0
    DELAY 19
    LDA #NULL
    STA PF2
    STA PF0

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

    LDA #NULL
    STA GRP0

    INX
    CPX #UPPRWALL_S
    BNE _dc_w1s1_loop
