; Render the minimap

mmRender:
    STA HMCLR
    ; Set the colour of the player
    LDA #PLYRCOLU
    STA COLUPF
    ; Set the colour of the map
    LDA #MAPCOLU
    STA COLUP0
    STA COLUP1
    ; Get the player's position and translate it into horizontal movement
    LDA #%00001000
    CLC
    SEC
    SBC playerPos
    ASL
    ASL
    ASL
    ASL
    STA horzPos_plyr

    ; Set the map's position to the right values
    LDA #HADJ_A
    STA horzPos_mA
    LDA #HADJ_B
    STA horzPos_mB

    STA WSYNC
    LDX #INDEXINIT

_mmRender_wait1:
    INX
    CPX #HWAIT
    BNE _mmRender_wait1
    DELAY HDELAY1
    STA RESP0
    STA RESP1

    LDA playerPos

    STA WSYNC
    LDX #INDEXINIT

_mmRender_wait2:
    INX
    CPX #HWAIT
    BNE _mmRender_wait2
    DELAY HDELAY2
    STA RESBL

    RTS
