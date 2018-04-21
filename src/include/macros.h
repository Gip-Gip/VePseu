; VePseu's macros

; Scanline padding macro
    MAC PAD

.SCANLINES SET {1} ; Scanlines to essentially skip

    LDX .SCANLINES

.loop:
    STA WSYNC

    DEX
    BNE .loop

    STA WSYNC

    ENDM

    MAC INA
        CLC
        ADC #1
    ENDM

    MAC DEA
        SEC
        SBC #1
    ENDM

; Precision delay macro

    MAC DELAY
.CYCLES SET {1}

        IF .CYCLES % 5 == 1 && .CYCLES % 3
        NOP
.CYCLES SET .CYCLES - 2
        ENDIF

        IF [.CYCLES - 2] / 5
        REPEAT .CYCLES / 5
            INC DUMP
        REPEND
.CYCLES SET .CYCLES % 5
        ENDIF

        IF .CYCLES % 3 == 1
        NOP
.CYCLES SET .CYCLES - 2
        ENDIF

        REPEAT .CYCLES / 3
            STA DUMP
        REPEND

.CYCLES SET .CYCLES % 3

        REPEAT .CYCLES / 2
        NOP
        REPEND

.CYCLES SET .CYCLES % 2

        IF .CYCLES
        ERR
        ENDIF

    ENDM

; Macro used to find the space used up in a certain section of ram

    MAC USAGE_REPORT

NAM    SET {1}  ; Name of the section
SPOS    SET {2} ; Start address of the section
EPOS    SET {3} ; End address of the section
CPOS    SET .   ; The current position of the macro in the section

CAP     SET [EPOS - SPOS]d ; Space that exists
TKUP    SET [CPOS - SPOS]d ; Space taken up by data

PCNT   SET [TKUP * 100 / CAP]d ; Percent of space taken by data

    ECHO PCNT, "% of your", NAM, "is used up (", TKUP, "/", CAP, ") bytes"

    ENDM
