; Render the minimap

mmRender:
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
    LDX #0

_mmRender_wait1:
    INX
    CPX #4
    BNE _mmRender_wait1
    NOP
    NOP
    STA RESP0
    STA RESP1

    LDA playerPos

    STA WSYNC
    LDX #INDEXINIT

_mmRender_wait2:
    INX
    CPX #4
    BNE _mmRender_wait2
    NOP
    NOP
    STA foo ; wait 3 cycles instead of 2
    STA RESBL

    RTS
