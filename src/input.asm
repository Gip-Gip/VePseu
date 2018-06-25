; VePseu's controller input

    STA WSYNC

    INCLUDE "ctrlCode/cin1.asm"
    INCLUDE "ctrlCode/cin2.asm"
    INCLUDE "ctrlCode/cin3.asm"
    INCLUDE "ctrlCode/cin4.asm"

CEND:
    STA WSYNC
