; VePseu's controller input

    STA WSYNC

    INCLUDE "ctrlCode/cin1.asm"
    INCLUDE "ctrlCode/cin2.asm"
    INCLUDE "ctrlCode/cin3.asm"
    INCLUDE "ctrlCode/cin4.asm"

CDIR1:
    STA WSYNC
    LDA direction
    CMP #DNORTH
    BNE CDIR2

    LDA #WCOLU
    STA wallColour
    LDA #SCOLU
    STA shadowColour

    LDA mapWidth
    STA yLoss
    LDX #ONE
    STX xGain
    DEX
    STX yGain
    STX xLoss

CDIR2:
    LDA direction
    CMP #DSOUTH
    BNE CDIR3

    LDA #WCOLU
    STA wallColour
    LDA #SCOLU
    STA shadowColour

    LDA mapWidth
    STA yGain
    LDX #ONE
    STX xLoss
    DEX
    STX yLoss
    STX xGain

CDIR3:
    LDA direction
    CMP #DWEST
    BNE CDIR4

    LDA #SCOLU
    STA wallColour
    LDA #WCOLU
    STA shadowColour

    LDA mapWidth
    STA xGain
    LDX #ONE
    STX yGain
    DEX
    STX yLoss
    STX xLoss

CDIR4:
    LDA direction
    CMP #DEAST
    BNE CEND

    LDA #SCOLU
    STA wallColour
    LDA #WCOLU
    STA shadowColour

    LDA mapWidth
    STA xLoss
    LDX #ONE
    STX yLoss
    DEX
    STX yGain
    STX xGain

CEND:
    STA WSYNC
