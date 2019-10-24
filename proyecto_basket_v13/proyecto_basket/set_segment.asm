.INCLUDE "write_byte_TIMER.s"	
.INCLUDE "digit_to_segment.asm"	
.INCLUDE "SELECCION_DE_TIEMPO.asm"
   
SET_SEGMENT:			push r1
						push r0
						push r16
						push r17
						push r18
						IN R18, SREG
						push R18
						
		
;Hago regresivo			
						ldi r16,CANT_SEGUNDOS
						sub r16,r0
							
;Paso digitos a segmentos
						clr r17			;primer digito segs
						clr	r18			;segundo digito segs	

DIVIDIR_DIGITOS_SEG:	cpi r16,0
						breq SEGS	;si terminó de convertir, empiezo a transmitir al display
						dec r16
						inc r17				;incremento 1 seg (primer digito)
						cpi r17,10			;comparo si pasaron 10 segs
						brne DIVIDIR_DIGITOS_SEG
						inc r18				;si pasaron 10 segs, incremento 10 segs (segundo digito)
						clr r17				;paso primer digito a 0
						cpi r18,6			;comparo si pasaron 60 segs
						brne DIVIDIR_DIGITOS_SEG
						clr r18				;si llegó a 60 segs, paso el segundo digito a 0
						rjmp DIVIDIR_DIGITOS_SEG

SEGS:					mov r6, r17
						mov r7, r18

						clr r17			;primer digito mins
						clr	r18			;segundo digito mins	

;Hago regresivo			
						mov r16,CANT_MINUTOS		;desde donde empiezo a contar
						sub r16,r1					;limite-transcurridos
						clr r1						;para comparar contra 0
						cp r0,r1					;si estoy en 00 segundos entonces...
						brne DIVIDIR_DIGITOS_MIN
						inc r16						;....bajo en uno los minutos

DIVIDIR_DIGITOS_MIN:	cpi r16,0
						breq MINS	;si terminó de convertir, empiezo a transmitir al display
						dec r16
						inc r17				;incremento 1 min (tercer digito)
						cpi r17,10			;comparo si pasaron 10 min
						brne DIVIDIR_DIGITOS_MIN
						inc r18				;si pasaron 10 min, incremento 10 min (cuarto digito)
						clr r17				;paso tercer digito a 0
						rjmp DIVIDIR_DIGITOS_MIN

MINS:					mov r8, r17
						mov r9, r18

;---------------- Configuro TM1637

SET_COMMAND11:			ldi r19, 0b01000100		; COMANDO: Normal, escribir datos, fixed ad.
						rcall START
						rcall WRITE_BYTE
						rcall STOP

;---------------- 7 Segmentos #1 (0X:XX)

SET_COMMAND21:			ldi r19, 0b11001000		; Seteo direccion del display
						rcall START
						rcall WRITE_BYTE
						

SET_DATA1:				mov r19, r9			
						rcall DIGIT_TO_SEGMENT	; Pasa digito a segmento en r19
						rcall WRITE_BYTE		; Mando dato
						rcall STOP

;---------------- 7 Segmentos #2 (X0:XX)

SET_COMMAND22:			ldi r19, 0b11001001		; Seteo direccion del display
						rcall START
						rcall WRITE_BYTE
						
SET_DATA2:				mov r19, r8
						rcall DIGIT_TO_SEGMENT	; Pasa digito a segmento en r19
						ori r19, 0x80			;agrega los 2 puntos
						rcall WRITE_BYTE		; Mando dato
						rcall STOP

;---------------- 7 Segmentos #3 (XX:0X)

SET_COMMAND23:			ldi r19, 0b11001010		; Seteo direccion del display
						rcall START
						rcall WRITE_BYTE					

SET_DATA3:				mov r19, r7			
						rcall DIGIT_TO_SEGMENT	; Pasa digito a segmento en r19
						rcall WRITE_BYTE		; Mando dato
						rcall STOP

;---------------- 7 Segmentos #4 (XX:X0)

SET_COMMAND24:			ldi r19, 0b11001011		; Seteo direccion del display
						rcall START
						rcall WRITE_BYTE					

SET_DATA4:				mov r19, r6
						rcall DIGIT_TO_SEGMENT	; Pasa digito a segmento en r19
						rcall WRITE_BYTE		; Mando dato
						rcall STOP

;---------------- Configuro brillo

SET_COMMAND3:			;seteo el brillo
						ldi r19, 0b10001010
						rcall START
						rcall WRITE_BYTE
						rcall STOP
						pop R18
						out SREG,r18
						pop r18
						pop r17
						pop r16
						pop r0
						pop r1
						ret