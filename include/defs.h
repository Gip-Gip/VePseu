NULL    = 0 ; The value of NULL
ONE     = 1 ; The value of one

PIXH    = 4 ; The height of each pixel in scanlines (x2)

HADJ_A  = $00
HADJ_B  = $10

WCOLU       = $86 ; The initial colour of walls
SCOLU       = $82 ; The initial colour of shadows
MAPCOLU     = $0E ; The colour of the map on the minimap
PLYRCOLU    = $CC ; The colour of the player on the minimap

VBLANK_SET  = %11000010 ; The value to push to the vblank register
VSYNC_SET   = 2 ; The value to push to the vsync register

INDEXINIT   = 0 ; The value to initialize indexes to

UPPAD_LIMIT = 24 ; The upper pad amount
LOPAD_LIMIT = 77 ; The lower pad amount

LAYER2_AND_0    = %11100000 ; The pattern layer 2's shadow takes on
LAYER2_AND_1    = %11111000 ; The pattern layer 2's first wall takes on
LAYER2_AND_2    = %00000111 ; The pattern layer 2's second wall takes on

LAYER3_AND_0    = %10000000 ; The pattern layer 3's shadow takes on
LAYER3_AND_1    = %11100000 ; The pattern layer 3's first wall takes on
LAYER3_AND_2    = %00011100 ; The pattern layer 3's second wall takes on
LAYER3_AND_3    = %00000011 ; The pattern layer 3's third wall takes on

SHAD_AND_0  = %10000000 ; Patterns of the 1st shadow
SHAD_AND_1  = %11000000
SHAD_AND_2  = %11100000
SHAD_AND_3  = %11110000
SHAD_AND_4  = %11111000

FFORD   = %00010000 ; The bit set when the joystick is in the forward position
FBACK   = %00100000 ; The bit set when the joystick is in the backward position
FLEFT   = %10000000 ; The bit set when the joystick is in the left position
FRIGT   = %01000000 ; The bit set when the joystick is in the right position
ITRIG   = %10000000 ; The bit set when the trigger is set

cleanStart  = 0 ; The value to initialize X to in clearLoop
cleanEnd    = 0 ; The value of X to stop the loop at in clearLoop

stack   = $FF ; The address of the stack
