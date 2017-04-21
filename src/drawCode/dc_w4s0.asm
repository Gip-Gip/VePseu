; The second wall and it's second shadow

dc_w4s0_delayed:
    JMP dc_w4s0

dc_w4s0_switch:
    LDA #$7F
    ADC #$01

dc_w4s0:

    LDX #PIXH

_dc_w4s0_loop:
    LDA wallColour
    STA WSYNC
_dc_w4s0_joinIn:
    STA COLUPF
    LDA wall4a
    STA PF1
    TYA
    BEQ _dc_w4s0_noSprite_1
    DEY
    CPY spriteHeight
    BCS _dc_w4s0_noSprite_2
    LDA (sprite),Y
    STA GRP0
_dc_w4s0_noSprite_ret:
    LDA wall4b
    STA PF2

    LDA #FULLWALL
    EOR shadow3cb
    STA PF0
    LDA #FULLWALL
    EOR shadow3db
    STA PF1
    LDA #FULLWALL
    EOR shadow3eb
    STA PF2
    LDA #NULL
    DELAY 4
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
    BNE _dc_w4s0_loop

    BVC dc_w4s0_switch
    JMP dc_w3s2

_dc_w4s0_noSprite_1:
    DELAY 11
    JMP _dc_w4s0_noSprite_ret

_dc_w4s0_noSprite_2:
    DELAY 4
    JMP _dc_w4s0_noSprite_ret
