; VePseu's init file

    LDA #NULL
    STA VBLANK
    STA shift
    STA playerPos
    STA mapWidth

    JSR clear

    JSR map_01_load
