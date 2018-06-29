; VePseu's controller input

    STA WSYNC

    LDA frameNum
    AND #$1F
    CMP #$10
    BNE CENDJMP

    JMP CSTART

CENDJMP:
    JMP CEND

CSTART:

    INCLUDE "ctrlCode/cin1.asm"
    INCLUDE "ctrlCode/cin2.asm"
    INCLUDE "ctrlCode/cin3.asm"
    INCLUDE "ctrlCode/cin4.asm"

CEND:
    STA WSYNC
