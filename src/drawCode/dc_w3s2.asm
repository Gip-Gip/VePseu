; The second wall and it's second shadow

dc_w3s2_delayed:
    DELAY 2
dc_w3s2:

    LDX #PIXH

_dc_w3s2_loop:
    LDA wallColour
    STA WSYNC
_dc_w3s2_joinIn:
    STA COLUPF
    LDA wall3a
    STA PF1
    TYA
    BEQ _dc_w3s2_noSprite_1
    DEY
    CPY spriteHeight
    BCS _dc_w3s2_noSprite_2
    LDA (sprite),Y
    STA GRP0
_dc_w3s2_noSprite_ret:
    LDA wall3b
    STA PF2

    LDA wall3c
    STA PF0
    LDA wall3d
    STA PF1
    LDA wall3e
    STA PF2
    LDA #NULL
    DELAY 10
    STA PF2
    STA PF0

    STA WSYNC ; Draw the shadow
    LDA shadowColour
    STA COLUPF
    LDA shadow3ab
    ORA shadow2ab
    STA PF1
    LDA shadow3bb
    ORA shadow2bb
    STA PF2
    LDA shadow3cb
    ORA shadow2cb
    STA PF0
    LDA shadow3db
    ORA shadow2db
    STA PF1
    LDA shadow3eb
    ORA shadow2eb
    STA PF2
    LDA #NULL
    STA PF0

    DEX
    BNE _dc_w3s2_loop

    BVC dc_w4s0_delayed
    JMP dc_w3s1

_dc_w3s2_noSprite_1:
    DELAY 10
    JMP _dc_w3s2_noSprite_ret

_dc_w3s2_noSprite_2:
    DELAY 3
    JMP _dc_w3s2_noSprite_ret
