*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
ALTURA_PANTALLA: EQU (640)
ANCHURA_PANTALLA: EQU (480)
 
   ORG    $1000
START:                  ; first instruction of program


BUCLE_JUEGO:

       BSR LIMPIAR_PANTALLA
       BSR DIBUJAR_CARRETERA
       ;BSR AVANZAR_CARRETERA
       BSR DIBUJAR_COCHE
       BSR MOVER_COCHE
       BSR CAMBIO_CARRETERA
       BRA BUCLE_JUEGO
       
DIBUJAR_CARRETERA:

      ;UN LADO DE LA CARRETERA
    
       MOVE.W  POSICION_LINEA1,-(A7)
       MOVE.W  #0,-(A7)
       MOVE.W  #1,-(A7)
       MOVE.W  #ALTURA_PANTALLA,-(A7)
       BSR RECTANGULO
       ADDQ.L #8,A7
       
       ;OTRO LADO CARRETERA
       
       
       MOVE.W  POSICION_LINEA2,-(A7)
       MOVE.W  #0,-(A7)
       MOVE.W  #1,-(A7)
       MOVE.W  #ALTURA_PANTALLA,-(A7)
       BSR RECTANGULO
       ADDQ.L #8,A7

       
       ;LINEAS BLANCAS
       
;LINEAS_BLANCAS_BUCLE:       
       
;       MOVE.W  POSICION_LINEA1,D0
 ;      ADD.W   #100,D0
  ;     MOVE.W  D0,-(A7)
   ;    MOVE.W  POSICION_INICIAL_LINEAS_BLANCAS,-(A7)
    ;   MOVE.W  #5,-(A7)
     ;  MOVE.W  #20,-(A7)
      ; BSR RECTANGULO
       ;ADDQ.L  #8,A7
       ;ADD.W   #50,POSICION_INICIAL_LINEAS_BLANCAS
       ;CMP     #600,POSICION_INICIAL_LINEAS_BLANCAS
       ;BNE     LINEAS_BLANCAS_BUCLE
       
       
       
       RTS
       
AVANZAR_CARRETERA: 
      
      BSR WAIT_CENT
      ADD.W #10,POSICION_INICIAL_LINEAS_BLANCAS
      
      RTS

DIBUJAR_COCHE:
         
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

    ADD.W #2,X_CUADRADO
    BSR WAIT_CENT
    ADD.L #1,CONTADOR_CICLOS
    RTS
    
    
      
IZQUIERDA:
    
    SUB.W #2,X_CUADRADO
    BSR WAIT_CENT
    ADD.L #1,CONTADOR_CICLOS
    RTS    
    
CAMBIO_CARRETERA:

      MOVE.L CONTADOR_CICLOS,D1
      CMP #0,D1
      BEQ RETURN
      DIVU.W   #125,D1
      SWAP.W   D1
      MOVE.W D1,D2
      BNE RETURN    
      MOVE.W #3,-(A7)
      BSR ALEATORIO
      ADDQ.L #2,A7
      BEQ CARRETERA_NOR
      CMP.L #1,D1
      BEQ CARRETERA_IZQ
      CMP.L #2,D1
      BEQ CARRETERA_DER
     
     
CARRETERA_NOR:

      MOVE.W POSICION_LINEA1,POSICION_PREVIA_LINEA1
      MOVE.W POSICION_LINEA2,POSICION_PREVIA_LINEA2
      MOVE.W #200,POSICION_LINEA1
      MOVE.W #400,POSICION_LINEA2
      
      RTS
     
CARRETERA_IZQ:
      
      MOVE.W POSICION_LINEA1,POSICION_PREVIA_LINEA1
      MOVE.W POSICION_LINEA2,POSICION_PREVIA_LINEA2
      MOVE.W #100,POSICION_LINEA1
      MOVE.W #300,POSICION_LINEA2
      
      RTS
      
CARRETERA_DER:

      MOVE.W POSICION_LINEA1,POSICION_PREVIA_LINEA1
      MOVE.W POSICION_LINEA2,POSICION_PREVIA_LINEA2
      MOVE.W #300,POSICION_LINEA1
      MOVE.W #500,POSICION_LINEA2

      RTS
      
      
RETURN:

    RTS
    
    
TRANSICION_CARRETERA:

      ;MOVE.W 
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
CONTADOR_CICLOS: DC.L 0
POSICION_LINEA1: DC.W 200
POSICION_LINEA2: DC.W 400
POSICION_PREVIA_LINEA1: DC.W 200
POSICION_PREVIA_LINEA2: DC.W 400
POSICION_INICIAL_LINEAS_BLANCAS DC.W 50

    END    START        ; last line of source








*~Font name~Courier New~
*~Font size~16~
*~Tab type~0~
*~Tab size~20~
