; VePseu's header file

    ORG $0000

NULL = 0

RSHIFT = 0
LSHIFT = 1

SHADCNT = 7
PIXH = 4
NWH = 5

MCOLU = $0E
SCOLU = $06

VBLANK_SET = %11000010
VSYNC_SET = 2

ONE = 1
INDEXINIT = 0
WAITTIME = 4

WALLCNT = 16

UPPAD_LIMIT = 29

LAYER2_AND_0 = %10000000
LAYER2_AND_1 = %11111000
LAYER2_AND_2 = %00000111

LAYER3_AND_0 = %10000000
LAYER3_AND_1 = %11100000
LAYER3_AND_2 = %00011100
LAYER3_AND_3 = %00000011

SHAD_AND_0 = %10000000
SHAD_AND_1 = %11000000
SHAD_AND_2 = %11100000
SHAD_AND_3 = %11110000
SHAD_AND_4 = %11111000

VSYNC = $00
VBLANK = $01
WSYNC = $02
RSYNC
NUSIZ0
NUSIZ1
COLUP0
COLUP1
COLUPF = $08
COLUBK = $09
CTRLPF
REFP0
REFP1
PF0 = $0D
PF1 = $0E
PF2 = $0F
RESP0
RESP1
RESM0
RESM1
RESBL
AUDC0
AUDC1
AUDF0
AUDF1
AUDV0
AUDV1
GRP0
GRP1
ENAM0
ENAM1
ENABL
HMP0
HMP1
HMM0
HMM1
HMBL
VDELP0
VDELP1
VDELBL
RESMP0
RESMP1
HMOVE
HMCLR
CXCLR

cleanStart = 0
cleanEnd = 0

; Variables...

wall1a = $80
wall2a = $81
wall3a = $82
wall4a = $83
wall1b = $84
wall2b = $85
wall3b = $86
wall4b = $87
shadow1a = $88
shadow2a = $89
shadow3a = $8A
shadow4a = $8B
shadow1b = $8C
shadow2b = $8D
shadow3b = $8E
shadow4b = $8F

shift = $90
playerPos = $91
mapWidth = $92
xGain = $93
xLoss = $94
yGain = $95
yLoss = $96
mapPtr = $97

stack = $FF
