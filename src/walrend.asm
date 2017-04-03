; VePseu's wall renderer

    LDY playerPos

    INCLUDE "r_layers/layer0.asm" ; 54 cycles

    INCLUDE "r_layers/layer1.asm" ; 86 cycles

    INCLUDE "r_layers/layer2.asm" ; 186 cycles

    INCLUDE "r_layers/layer3.asm" ; 281 cycles

    STA WSYNC ; At the end, we've consumed 9 scanlines
