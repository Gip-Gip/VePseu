; VePseu's wall renderer

    LDY playerPos ; 3 cycles

    INCLUDE "r_layers/layer0.asm" ; 86 cycles

    INCLUDE "r_layers/layer1.asm" ; 86 cycles

    INCLUDE "r_layers/layer2.asm" ; 148 cycles

    INCLUDE "r_layers/layer3.asm" ; 182 cycles

    STA WSYNC ; By this time 6 scanlines have passed
