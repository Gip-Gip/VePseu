; The draw code for the 1st wall and shadow

dc_w1s1:    SUBROUTINE

    LDX #INDEXINIT
    JMP .loop

.noSprite_1:
    ; Depending on the location in the program the branch here might cross a
    ; page boundry, causing it to take an extra clock cycle. To choose the right
    ; delay simply check if the page number (the MSB of the address) is
    ; different between the branch and it's destination
    IF >.branchPoint_1 ==  >.noSprite_1
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

    INX
    CPX #UPPRWALL_S
    BNE .loop
