;R19 ES EL BYTE
;PC2 CLK
;PC0 DATA

;NOTA: los PORTX que puse de CLK_LOW en adelante, en arduino estaba
;escrito con pinmode() cuyo analogo seria DDRB. Pero para mi no tiene sentido.
;deberia haber sido un pinwrite(). Stola says the same. Debe ser para que sea 
;bidireccional porque el TM1637 acepta un teclado entonces cambiando el modo 
;se modifica la impedancia y puede ir en ambos sentidos.

WRITE_BYTE_VISITANTE:	push r16
						push r17
						push r18

						ldi r16, 8		; Contador para transmitir 1 byte
						sbi DDRC,0		; Configuro PORTB2 como salida
						sbi DDRC,2		; Configuro PORTB3 como salida

V_CLK_LOW:	;Seteo CLK en LOW
			cbi PORTC, 2 ; CLW en LOW
			rcall V_BIT_DELAY

V_SETEAR_BIT:	;Configuro bit del puerto dato
				mov r17, r19	;mueve el dato a otro registro
				andi r17, 0x01	;enmascara para ver el bit menos significativo para enviarlo
				lsr r19		;shiftea el byte a derecha para la proxima iteracion
				cpi r17, 0
				brne V_BIT1

V_BIT0:		cbi PORTC, 0 ; pongo 0 en PB2
			rcall V_BIT_DELAY
			rjmp V_CLK_HIGH	
				
V_BIT1:		sbi PORTC, 0 ; pongo 1 en PB2.
			rcall V_BIT_DELAY
			
V_CLK_HIGH:	;Seteo CLK en HIGH
			sbi PORTC, 2 ; CLK en HIGH
			rcall V_BIT_DELAY
			

V_BYTE_END:	dec r16
			cpi r16, 0
			brne V_CLK_LOW ;vuelvo para transmitir otro bit si no transmiti 8 bits.

V_ACK:		;Acknowledge para ver si terminé de transmitir

			;Seteo CLK en LOW
			cbi PORTC, 2 ; CLK en LOW
			rcall V_BIT_DELAY

			;Seteo CLK en HIGH
			sbi PORTC, 2 ; CLK en HIGH
			rcall V_BIT_DELAY

			sbis PORTC, 0;
			cbi PORTC, 0 ; CLK en LOW si no lo estaba
			rcall V_BIT_DELAY
			
			;Seteo CLK en LOW
			cbi PORTC, 2 ; CLK en LOW
			rcall V_BIT_DELAY

V_FIN:		pop r18
			pop r17
			pop r16
			ret







V_BIT_DELAY:  ;delay de 50 us
				push r20
				ldi  r20, 16
				V_L1: dec  r20
				brne V_L1
				pop r20
				ret

V_START:	;comienza transmision segun especifica datasheet
			cbi PORTC, 0 ; Data a LOW para iniciar.
			rcall V_BIT_DELAY
			ret

V_STOP:		;termina transmision segun especifica datasheet
			cbi PORTC, 0 ; Data a LOW.
			rcall BIT_DELAY
			sbi PORTC, 2 ; CLK a HIGH.
			rcall V_BIT_DELAY
			sbi PORTC, 0 ; Data a HIGH para terminar.
			rcall V_BIT_DELAY
			ret
