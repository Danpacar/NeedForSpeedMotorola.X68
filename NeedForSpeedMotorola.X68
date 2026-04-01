*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
ALTURA_PANTALLA: EQU (640)<<16
ANCHURA_PANTALLA: EQU (480)<<16
 
   ORG    $1000
START:                  ; first instruction of program

DIBUJAR_COCHE:
         
         BSR LIMPIAR_PANTALLA
         MOVE.W X_CUADRADO,-(A7)
         MOVE.W Y_CUADRADO,-(A7)
         MOVE.W ANCHO_CUADRADO,-(A7)
         MOVE.W ALTO_CUADRADO,-(A7)
         BSR RECTANGULO
         ADDQ.L #8,A7
MOVER_COCHE:  
         MOVE.W #$44,-(A7)
         BSR CHECK_TECLA
         CMP.W #0,D1
         ADDQ.L #2,A7
         BNE DERECHA
         MOVE.W #$41,-(A7)
         BSR CHECK_TECLA
         CMP.W #0,D1
         ADDQ.L #2,A7
         BNE IZQUIERDA
         BRA MOVER_COCHE
 
DERECHA:

    ADD.W #1,X_CUADRADO
    BRA DIBUJAR_COCHE
      
IZQUIERDA:
    
    SUB.W #1,X_CUADRADO
    BRA DIBUJAR_COCHE

* Put program code here

    SIMHALT             ; halt simulator
    INCLUDE GROUTINES_FINAL.X68
    ;comentario Random 
    ;Felipe Mason
    ;aklajkladjkldfjkldsf

* Put variables and constants here
ANCHO_CUADRADO: DC.W 40
ALTO_CUADRADO: DC.W 80
X_CUADRADO: DC.W 240
Y_CUADRADO: DC.W 240

    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~16~
*~Tab type~0~
*~Tab size~20~
