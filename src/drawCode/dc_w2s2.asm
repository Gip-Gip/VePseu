; The second wall and it's second shadow

dc_w2s2_delayed:
    DELAY 2
dc_w2s2:    SUBROUTINE

    LDX #PIXH

.loop:
    LDA wallColour
    STA WSYNC
    STA COLUPF
    LDA wall2a
    STA PF1
    TYA
.branchPoint_1:
    BEQ .noSprite_1
    DEY
    CPY spriteHeight
.branchPoint_2:
    BCS .noSprite_2
    LDA (sprite),Y
    STA GRP0
.noSprite_ret:
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
    LDA shadow2ab
    ORA shadow1a
    STA PF1
    LDA shadow2bb
    ORA shadow1b
    STA PF2
    LDA shadow2cb
    STA PF0
    LDA shadow2db
    ORA shadow1d
    STA PF1
    LDA shadow2eb
    ORA shadow1e
    STA PF2
    LDA #NULL
    STA PF0

    DEX
    BNE .loop

    BVC dc_w3s1_delayed
    DELAY 4
    JMP dc_w2s1

.noSprite_1:
    IF >.branchPoint_1 == >.noSprite_1
    DELAY 11
    ELSE
    DELAY 10
    ENDIF
    JMP .noSprite_ret

.noSprite_2:
    IF >.branchPoint_2 == >.noSprite_2
    DELAY 4
    ELSE
    DELAY 3
    ENDIF
    JMP .noSprite_ret
