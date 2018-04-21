; VePseu's display kernel

    JMP drawStart

;                        FILE/SUBROUTINE NAMING SCHEME:
;
; dc_w1s1.asm
; |   | |
; |   | |- The shadow variant it draws (A or B, 1 or 2)
; |   |
; |   |- The wall it draws
; |
; |- Draw-code identifies
;
; See GLOSSARY.TXT for definitions of vague words

drawStart:

    LDY spritePosY ; The Y register is expected to hold the sprite's Y position

                   ; Also note that if the sprite position = 0 then the sprite
                   ; will not be drawn


    CLV ; The overflow flag is used to determine which half of the screen is
        ; being drawn, allowing code to be easily re-used. This requires that
        ; the overflow flag be set to zero at start, otherwise things won't turn
        ; out so well...

    INCLUDE "drawCode/dc_w1s1.asm"
    INCLUDE "drawCode/dc_w2s1.asm"
    INCLUDE "drawCode/dc_w2s2.asm"
    INCLUDE "drawCode/dc_w3s1.asm"
    INCLUDE "drawCode/dc_w3s2.asm"
    INCLUDE "drawCode/dc_w4s0.asm"

    INCLUDE "drawCode/dc_w1s2.asm"

dc_wallsEnd: ; once we've finished drawing the walls we draw the minimap ( or
             ; hud, if that feature is added any time soon).

    CLV ; always best to leave the overflow flag at zero...

    LDA #NULL ; Also nice to make sure the playfields are clear...
    STA PF1
    STA PF2

    INCLUDE "drawCode/mmDraw.asm"
