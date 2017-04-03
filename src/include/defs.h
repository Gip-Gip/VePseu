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

WALLCNT = 10 ; The number of walls to render in scrend

PIXH    = 3 ; The height of each pixel, in scanlines (x2)

HADJ_A  = $00 ; The horizontal adjustment of each minimap sprite
HADJ_B  = $10

HWAIT   = 5 ; The horizontal wait for the minimap
HDELAY1 = 7 ; The amount of clocks for horizontal correction (minimap)
HDELAY2 = 10 ; The amount of clocks for horizontal correction (player blip)

WCOLU       = $86 ; The initial colour of walls
SCOLU       = $82 ; The initial colour of shadows
MAPCOLU     = $0E ; The colour of the map on the minimap
PLYRCOLU    = $CC ; The colour of the player on the minimap

VBLANK_SET  = %11000010 ; The value to push to the vblank register
VSYNC_SET   = 2 ; The value to push to the vsync register

INDEXINIT   = 0 ; The value to initialize indexes to

UPPAD_LIMIT = 14 ; The upper pad amount
LOPAD_LIMIT = 25 ; The lower pad amount

FULLWALL    = $FF

FFORD   = %00010000 ; The bit set when the joystick is in the forward position
FBACK   = %00100000 ; The bit set when the joystick is in the backward position
FLEFT   = %10000000 ; The bit set when the joystick is in the left position
FRIGT   = %01000000 ; The bit set when the joystick is in the right position
ITRIG   = %10000000 ; The bit set when the trigger is set

LOWSHAD_LIMIT = 1 ; The limited size of the shadow at the bottem of the screen

cleanStart  = 0 ; The value to initialize X to in clearLoop
cleanEnd    = 0 ; The value of X to stop the loop at in clearLoop

stack   = $FF ; The address of the stack

CWAITCNT    = #15 ; The amount of frames to wait before input is repeated

DNORTH = 0 ; The possible directions
DSOUTH = 2
DWEST = 1
DEAST = 3
