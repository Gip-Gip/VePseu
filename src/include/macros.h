; VePseu's macros

    MAC INA
        CLC
        ADC #1
    ENDM

    MAC DEA
        SEC
        SBC #1
    ENDM

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

    MAC USAGE_REPORT

NAM    SET {1}
SPOS    SET {2}
EPOS    SET {3}
CPOS    SET .

CAP     SET EPOS - SPOS
TKUP  SET CPOS - SPOS
PCNT   SET [TKUP * 100 / CAP]d

    ECHO PCNT, "% of your", NAM, "is used up (", [TKUP]d, "/", [CAP]d, ") bytes"

    ENDM
