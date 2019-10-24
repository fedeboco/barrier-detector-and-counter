.include "write_byte_VISITANTE.s"

UPDATE_SCORE_VISITANTE:	push r16
						push r17
						push r18
						push r19
						push r20
						in r16, SREG
						push r16

						clr r16
						clr r17
						clr r18
						clr r20
						mov r16, r28

V_DIVIDIR_DIGITOS:		cpi r16,0
						breq V_SET_COMMAND11	;si terminó de convertir, empiezo a transmitir al display
						dec r16
						inc r17				;incremento 1 seg (primer digito)
						cpi r17,10			;comparo si pasaron 10 pts
						brne V_DIVIDIR_DIGITOS
						inc r18				;si pasaron 10 pts, incremento 10 pts (segundo digito)
						clr r17				;paso primer digito a 0
						cpi r18,10			;comparo si pasaron 100 pts
						brne V_DIVIDIR_DIGITOS
						inc r20				;si pasaron 100 pts, incremento 100 pts (tercer digito)
						clr r18				;paso primer digito a 0
						rjmp V_DIVIDIR_DIGITOS

;---------------- Configuro TM1637

V_SET_COMMAND11:		ldi r19, 0b01000100		; COMANDO: Normal, escribir datos, fixed ad.
						rcall V_START
						rcall WRITE_BYTE_VISITANTE
						rcall V_STOP

;---------------- 7 Segmentos #1 (0X:XX)

V_SET_COMMAND21:		ldi r19, 0b11001000		; Seteo direccion del display
						rcall V_START
						rcall WRITE_BYTE_VISITANTE
						

V_SET_DATA1:			clr r19					; lo quiero apagado		
						rcall DIGIT_TO_SEGMENT	; Pasa digito a segmento en r19
						rcall WRITE_BYTE_VISITANTE		; Mando dato
						rcall V_STOP

;---------------- 7 Segmentos #2 (X0:XX)

V_SET_COMMAND22:		ldi r19, 0b11001001		; Seteo direccion del display
						rcall V_START
						rcall WRITE_BYTE_VISITANTE
						
V_SET_DATA2:			mov r19, r20
						rcall DIGIT_TO_SEGMENT	; Pasa digito a segmento en r19
						rcall WRITE_BYTE_VISITANTE		; Mando dato
						rcall V_STOP

;---------------- 7 Segmentos #3 (XX:0X)

V_SET_COMMAND23:		ldi r19, 0b11001010		; Seteo direccion del display
						rcall V_START
						rcall WRITE_BYTE_VISITANTE					

V_SET_DATA3:			mov r19, r18		
						rcall DIGIT_TO_SEGMENT	; Pasa digito a segmento en r19
						rcall WRITE_BYTE_VISITANTE		; Mando dato
						rcall V_STOP

;---------------- 7 Segmentos #4 (XX:X0)

V_SET_COMMAND24:		ldi r19, 0b11001011		; Seteo direccion del display
						rcall V_START
						rcall WRITE_BYTE_VISITANTE					

V_SET_DATA4:			mov r19, r17
						rcall DIGIT_TO_SEGMENT	; Pasa digito a segmento en r19
						rcall WRITE_BYTE_VISITANTE		; Mando dato
						rcall V_STOP

;---------------- Configuro brillo

V_SET_COMMAND3:		;seteo el brillo
						ldi r19, 0b10001010
						rcall V_START
						rcall WRITE_BYTE_VISITANTE
						rcall V_STOP

						pop r16
						out SREG, r16
						pop r20
						pop r19
						pop r18
						pop r17
						pop r16
						ret