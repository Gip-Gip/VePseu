; The draw code for the 1st wall and  it's second shadow

dc_w1s2:    SUBROUTINE

    LDX #UPPRWALL_S - 1

.loop:
    LDA wallColour
    STA WSYNC
    STA COLUPF
    LDA wall1
    STA PF1
    TYA

    BEQ .noSprite_1
.branchPoint_1:
    DEY
    CPY spriteHeight

    BCS .noSprite_2
.branchPoint_2:
    LDA (sprite),Y
    STA GRP0

.noSprite_ret:
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

    DEX
    CPX #LOWRWALL_S
    BNE .loop

    JMP dc_wallsEnd

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
