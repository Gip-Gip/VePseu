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

_renderWait_1:
    INX
    CPX #4
    BNE _renderWait_1
    NOP
    NOP
    STA RESP0
    STA RESP1

    LDA playerPos

    STA WSYNC
    LDX #INDEXINIT

_renderWait_2:
    INX
    CPX #4
    BNE _renderWait_2
    NOP
    NOP
    STA foo ; wait 3 cycles instead of 2
    STA RESBL

    RTS
