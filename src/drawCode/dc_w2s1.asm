; The second wall and it's first shadow

dc_w2s1:

    LDX #PIXH
    LDA wallColour
    DELAY 2
    JMP _dc_w2s1_joinIn

_dc_w2s1_noSprite_1:
    DELAY 11
    JMP _dc_w2s1_noSprite_ret

_dc_w2s1_noSprite_2:
    DELAY 4
    JMP _dc_w2s1_noSprite_ret

_dc_w2s1_loop:
    LDA wallColour
    STA WSYNC
_dc_w2s1_joinIn:
    STA COLUPF
    LDA wall2a
    STA PF1
    TYA
    BEQ _dc_w2s1_noSprite_1
    DEY
    CPY spriteHeight
    BCS _dc_w2s1_noSprite_2
    LDA (sprite),Y
    STA GRP0
_dc_w2s1_noSprite_ret:
    LDA wall2b
    STA PF2

    LDA wall2c
    STA PF0
    LDA wall2d
    STA PF1
    LDA wall2e
    STA PF2
    LDA #NULL
    DELAY 10
    STA PF2
    STA PF0

    STA WSYNC ; Draw the shadow
    LDA shadowColour
    STA COLUPF
    LDA shadow2aa
    ORA shadow1a
    STA PF1
    LDA shadow2ba
    ORA shadow1b
    STA PF2
    LDA shadow2ca
    STA PF0
    LDA shadow2da
    ORA shadow1d
    STA PF1
    LDA shadow2ea
    ORA shadow1e
    STA PF2
    LDA #NULL
    STA PF0

    DEX
    BNE _dc_w2s1_loop

    BVC dc_w2s2_delayed
    JMP dc_w1s2
