; The third wall and it's second shadow
; See GLOSSARY.TXT for definitions of vague words

dc_w3s2_delayed:
    DELAY 2
dc_w3s2:    SUBROUTINE

    LDX #PIXH

.loop:
    LDA wallColour
    STA WSYNC
.joinIn:
    STA COLUPF
    LDA wall3a
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
    BNE .loop

    BVC dc_w4s0_delayed
    JMP dc_w3s1

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
