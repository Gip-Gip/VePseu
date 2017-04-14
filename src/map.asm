; VePseu's maps

MAP_01_POS = $D1
MAP_01_WDTH = $10
MAP_01_SZ = $100

jerry:
    DC %01000010
    DC %01000010
    DC %01000010
    DC %01000010
    DC %01000010
    DC %01000010
    DC %01000010
    DC %01000010
    DC %01000010
    DC %01000010
    DC %01000010
    DC %11111111
    DC %10000001
    DC %10001001
    DC %10000001
    DC %10001001
    DC %10000001
    DC %10001001
    DC %10000001
    DC %10001001
    DC %10000001
    DC %10011001
    DC %10100101
    DC %01000010
    DC %01000010
    DC %01101010
    DC %01000010
    DC %10011001
    DC %10100101
    DC %11000011

miniMap_01:
    DC.W %0000011111100000
    DC.W %1111110110111111
    DC.W %0000000110000000
    DC.W %0000000110000000
    DC.W %1011110110111110
    DC.W %1010010110100010
    DC.W %1010011110100010
    DC.W %1010011111100010
    DC.W %1010010111100010
    DC.W %1011110110111110
    DC.W %1000000110000000
    DC.W %1000000110000000
    DC.W %1111110110111111
    DC.W %0000010110100000
    DC.W %0000010110100000
    DC.W %0000011111100000

map_01_load:
    LDA #MAP_01_POS
    STA playerPos
    LDA #MAP_01_WDTH
    STA mapWidth

    LDA #<map_01
    STA mapPtr
    LDA #>map_01
    STA mapPtr + 1

    LDA #<miniMap_01
    STA miniMapPtr
    LDA #>miniMap_01
    STA miniMapPtr + 1
    RTS


    ALIGN 256

map_01:
    HEX  FF FF FF 00 00 00 00 00 00 00 00 00 00 FF FF FF
    HEX  FF 00 FF FF FF FF FF FF FF FF FF FF FF FF 00 FF
    HEX  FF 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF
    HEX  FF 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF
    HEX  FF 00 FF FF FF FF FF 00 FF 00 FF FF FF FF 00 FF
    HEX  FF 00 FF 00 00 00 FF 00 FF 00 FF 00 00 FF 00 FF
    HEX  FF 00 FF 00 00 00 FF 00 FF 00 FF 00 00 FF FF FF
    HEX  FF FF FF 00 00 00 FF 00 FF 00 FF 00 00 FF FF FF
    HEX  FF FF FF 00 00 00 FF 00 FF 00 FF 00 00 FF 00 FF
    HEX  FF 00 FF FF FF FF FF 00 FF 00 FF FF FF FF 00 FF
    HEX  FF 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 FF
    HEX  FF 00 00 00 00 00 00 00 FF 00 00 00 00 00 00 FF
    HEX  FF 00 FF FF FF FF FF FF FF FF FF FF FF FF 00 FF
    HEX  FF 00 FF 00 00 00 00 00 00 00 00 00 00 FF 00 FF
    HEX  FF 00 FF 00 00 00 00 00 00 00 00 00 00 FF 00 FF
    HEX  FF FF FF 00 00 00 00 00 00 00 00 00 00 FF FF FF
