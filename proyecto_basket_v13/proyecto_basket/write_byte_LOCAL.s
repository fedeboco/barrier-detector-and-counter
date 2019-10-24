;R19 ES EL BYTE
;PB7 CLK
;PD5 DATA

;NOTA: los PORTX que puse de CLK_LOW en adelante, en arduino estaba
;escrito con pinmode() cuyo analogo seria DDRB. Pero para mi no tiene sentido.
;deberia haber sido un pinwrite(). Stola says the same. Debe ser para que sea 
;bidireccional porque el TM1637 acepta un teclado entonces cambiando el modo 
;se modifica la impedancia y puede ir en ambos sentidos.

WRITE_BYTE_LOCAL:	push r16
					push r17
					push r18

					ldi r16, 8		; Contador para transmitir 1 byte
					sbi DDRD,5		; Configuro PORTB2 como salida
					sbi DDRB,7		; Configuro PORTB3 como salida

L_CLK_LOW:	;Seteo CLK en LOW
			cbi PORTB, 7 ; CLW en LOW
			rcall L_BIT_DELAY

L_SETEAR_BIT:	;Configuro bit del puerto dato
				mov r17, r19	;mueve el dato a otro registro
				andi r17, 0x01	;enmascara para ver el bit menos significativo para enviarlo
				lsr r19		;shiftea el byte a derecha para la proxima iteracion
				cpi r17, 0
				brne L_BIT1

L_BIT0:		cbi PORTD, 5 ; pongo 0 en PB2
			rcall L_BIT_DELAY
			rjmp L_CLK_HIGH	
				
L_BIT1:		sbi PORTD, 5 ; pongo 1 en PB2.
			rcall L_BIT_DELAY
			
L_CLK_HIGH:	;Seteo CLK en HIGH
			sbi PORTB, 7 ; CLK en HIGH
			rcall L_BIT_DELAY
			

L_BYTE_END:	dec r16
			cpi r16, 0
			brne L_CLK_LOW ;vuelvo para transmitir otro bit si no transmiti 8 bits.

L_ACK:		;Acknowledge para ver si terminé de transmitir

			;Seteo CLK en LOW
			cbi PORTB, 7 ; CLK en LOW
			rcall L_BIT_DELAY

			;Seteo CLK en HIGH
			sbi PORTB, 7 ; CLK en HIGH
			rcall L_BIT_DELAY

			sbis PORTD, 5;
			cbi PORTD, 5 ; CLK en LOW si no lo estaba
			rcall L_BIT_DELAY
			
			;Seteo CLK en LOW
			cbi PORTB, 7 ; CLK en LOW
			rcall L_BIT_DELAY

L_FIN:		pop r18
			pop r17
			pop r16
			ret







L_BIT_DELAY:	;delay de 50 us
				push r20
				ldi  r20, 16
				L_L1: dec  r20
				brne L_L1
				pop r20
				ret

L_START:	;comienza transmision segun especifica datasheet
			cbi PORTD, 5 ; Data a LOW para iniciar.
			rcall L_BIT_DELAY
			ret

L_STOP:		;termina transmision segun especifica datasheet
			cbi PORTD, 5 ; Data a LOW.
			rcall BIT_DELAY
			sbi PORTB, 7 ; CLK a HIGH.
			rcall L_BIT_DELAY
			sbi PORTD, 5 ; Data a HIGH para terminar.
			rcall L_BIT_DELAY
			ret
