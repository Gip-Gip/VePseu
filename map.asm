; VePseu's maps

MAP_01_POS = $44
MAP_01_WDTH = $10
MAP_01_SZ = $100

mapList:
    DC.W map_01

map_01:
;       0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F
    HEX FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF ; 0
    HEX FF 00 00 00 FF 00 00 00 00 00 00 00 00 00 00 FF ; 1
    HEX FF 00 00 FF 00 FF 00 00 00 00 00 00 00 00 00 FF ; 2
    HEX FF 00 00 FF 00 FF 00 00 00 00 00 00 00 00 00 FF ; 3
    HEX FF 00 00 FF 00 FF 00 00 00 00 00 00 00 00 00 FF ; 4
    HEX FF 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF ; 5
    HEX FF 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF ; 6
    HEX FF 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF ; 7
    HEX FF 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF ; 8
    HEX FF 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF ; 9
    HEX FF 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF ; A
    HEX FF 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF ; B
    HEX FF 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF ; C
    HEX FF 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF ; D
    HEX FF 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF ; E
    HEX FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF ; F

map_01_load:
    LDA #MAP_01_POS
    STA playerPos
    LDA #MAP_01_WDTH
    STA mapWidth
    LDA mapList
    STA mapPtr
    INX
    LDA mapList + 1
    STA mapPtr + 1
    RTS
