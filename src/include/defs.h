    MAC INA
        CLC
        ADC #1
    ENDM

    MAC DEA
        SEC
        SBC #1
    ENDM

    MAC DELAY
        REPEAT {1}/2 - {1}%2
            NOP
        REPEND

        REPEAT {1}%2
            STA DUMP
        REPEND
    ENDM

NULL    = 0 ; The value of NULL
ONE     = 1 ; The value of one

PIXH    = 3 ; The height of each pixel, in scanlines (x2)

HADJ_A  = $00 ; The horizontal adjustment of each minimap sprite
HADJ_B  = $10

WCOLU       = $86 ; The initial colour of walls
SCOLU       = $82 ; The initial colour of shadows
MAPCOLU     = $0E ; The colour of the map on the minimap
PLYRCOLU    = $CC ; The colour of the player on the minimap

VBLANK_SET  = %11000010 ; The value to push to the vblank register
VSYNC_SET   = 2 ; The value to push to the vsync register

INDEXINIT   = 0 ; The value to initialize indexes to

UPPAD_LIMIT = 20 ; The upper pad amount
LOPAD_LIMIT = 20 ; The lower pad amount

FULLWALL    = $FF

LAYER0_AND_0    = %10000000 ; The pattern the peripheral vision takes on
LAYER0_AND_1    = %00000010 ; The pattern the peripheral vision takes on

LAYER1_AND_0    = %00000011
LAYER1_AND_1    = %00000011

LAYER2_AND_0    = %11100000 ; The pattern layer 2's shadow takes on
LAYER2_AND_1    = %11111100 ; The pattern layer 2's first wall takes on
LAYER2_AND_2    = %00000011 ; The pattern layer 2's second wall takes on
LAYER2_AND_3    = %00000100 ; The pattern layer 2's second wall takes on
LAYER2_AND_4    = %00001100 ; The pattern layer 2's second wall takes on
LAYER2_AND_5    = %11111100 ; The pattern layer 2's second wall takes on
LAYER2_AND_6    = %00110000 ; The pattern layer 2's second wall takes on
LAYER2_AND_7    = %10000000 ; The pattern layer 2's second wall takes on
LAYER2_AND_8    = %11000000 ; The pattern layer 2's second wall takes on
LAYER2_AND_9    = %00000001 ; The pattern layer 2's second wall takes on
LAYER2_AND_A    = %00001111 ; The pattern layer 2's second wall takes on
LAYER2_AND_B    = %00000011 ; The pattern layer 2's second wall takes on
LAYER2_AND_C    = %00000011 ; The pattern layer 2's second wall takes on

LAYER3_AND_0    = %00000010 ; The pattern layer 3's shadow takes on
LAYER3_AND_1    = %00000011 ; The pattern layer 3's shadow takes on
LAYER3_AND_2    = %00000011 ; The pattern layer 3's first wall takes on
LAYER3_AND_3    = %00001111 ; The pattern layer 3's second wall takes on
LAYER3_AND_4    = %00001000 ; The pattern layer 3's third wall takes on
LAYER3_AND_5    = %00001100 ; The pattern layer 3's third wall takes on
LAYER3_AND_6    = %11110000 ; The pattern layer 3's third wall takes on
LAYER3_AND_7    = %11000000 ; The pattern layer 3's third wall takes on
LAYER3_AND_8    = %00100000 ; The pattern layer 3's third wall takes on
LAYER3_AND_9    = %00110000 ; The pattern layer 3's third wall takes on
LAYER3_AND_A    = %00110000 ; The pattern layer 3's third wall takes on
LAYER3_AND_B    = %11110000 ; The pattern layer 3's third wall takes on
LAYER3_AND_C    = %00001111 ; The pattern layer 3's third wall takes on
LAYER3_AND_D    = %00000011 ; The pattern layer 3's third wall takes on
LAYER3_AND_E    = %00010000 ; The pattern layer 3's third wall takes on
LAYER3_AND_F    = %00110000 ; The pattern layer 3's third wall takes on
LAYER3_AND_G    = %11111100 ; The pattern layer 3's third wall takes on
LAYER3_AND_H    = %00000010 ; The pattern layer 3's third wall takes on
LAYER3_AND_I    = %00000011 ; The pattern layer 3's third wall takes on
LAYER3_AND_J    = %10000000 ; The pattern layer 3's third wall takes on
LAYER3_AND_K    = %11000000 ; The pattern layer 3's third wall takes on

FFORD   = %00010000 ; The bit set when the joystick is in the forward position
FBACK   = %00100000 ; The bit set when the joystick is in the backward position
FLEFT   = %10000000 ; The bit set when the joystick is in the left position
FRIGT   = %01000000 ; The bit set when the joystick is in the right position
ITRIG   = %10000000 ; The bit set when the trigger is set

cleanStart  = 0 ; The value to initialize X to in clearLoop
cleanEnd    = 0 ; The value of X to stop the loop at in clearLoop

stack   = $FF ; The address of the stack

CWAITCNT    = #15 ; The amount of frames to wait before input is repeated

DNORTH = 0 ; The possible directions
DSOUTH = 2
DWEST = 1
DEAST = 3
