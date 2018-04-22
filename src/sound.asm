; sounds.asm - makes sounds 'n' stuff

    SUBROUTINE

    LDA stepVol
    STA AUDV0
    LDA stepSnd
    STA AUDC0
    LDA #NULL
    STA stepVol

