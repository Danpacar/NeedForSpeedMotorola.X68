*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
ALTURA_PANTALLA: EQU 640
ANCHURA_PANTALLA: EQU 480
 
   ORG    $1000
START:                  ; first instruction of program

DIBUJAR_COCHE:

         MOVE.W #240,-(A7)
         MOVE.W #240,-(A7)
         MOVE.W #40,-(A7)
         MOVE.W #80,-(A7)
         BSR RECTANGULO

* Put program code here

    SIMHALT             ; halt simulator
    INCLUDE GROUTINES_FINAL.X68
    ;comentario Random 
    ;Felipe Mason
    ;aklajkladjkldfjkldsf

* Put variables and constants here

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~16~
*~Tab type~0~
*~Tab size~20~
