; VePseu's maps

MAP_01_POS = 54
MAP_01_WDTH = 10
MAP_01_SZ = 100

map_01:
;       0  1  2  3  4  5  6  7  8  9
    HEX FF FF FF FF FF FF FF FF FF FF ; 0
    HEX FF 00 00 00 FF 00 00 00 00 FF ; 1
    HEX FF 00 00 FF 00 FF 00 00 00 FF ; 2
    HEX FF 00 00 FF 00 FF 00 00 00 FF ; 3
    HEX FF 00 00 FF 00 FF 00 00 00 FF ; 4
    HEX FF 00 00 00 00 00 00 00 00 FF ; 5
    HEX FF 00 00 00 00 00 00 00 00 FF ; 6
    HEX FF 00 00 00 00 00 00 00 00 FF ; 7
    HEX FF 00 00 00 00 00 00 00 00 FF ; 8
    HEX FF FF FF FF FF FF FF FF FF FF ; 9

map_01_load:
    LDA #MAP_01_POS
    STA playerPos
    LDA #MAP_01_WDTH
    STA mapWidth

    LDX #INDEXINIT

_map_01_load_loop:
    LDA map_01,X
    STA map,X
    INX
    CPX #MAP_01_SZ
    BNE _map_01_load_loop
    RTS
