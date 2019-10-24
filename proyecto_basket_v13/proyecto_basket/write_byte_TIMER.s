;R19 ES EL BYTE
;PD6 CLK
;PD7 DATA

;NOTA: los PORTX que puse de CLK_LOW en adelante, en arduino estaba
;escrito con pinmode() cuyo analogo seria DDRB. Pero para mi no tiene sentido.
;deberia haber sido un pinwrite(). Stola says the same. Debe ser para que sea 
;bidireccional porque el TM1637 acepta un teclado entonces cambiando el modo 
;se modifica la impedancia y puede ir en ambos sentidos.

WRITE_BYTE:	push r16
			push r17
			push r18

			ldi r16, 8		; Contador para transmitir 1 byte
			sbi DDRD,7		; Configuro PORTB2 como salida
			sbi DDRD,6		; Configuro PORTB3 como salida

CLK_LOW:	;Seteo CLK en LOW
			cbi PORTD, 6 ; CLW en LOW
			rcall BIT_DELAY

SETEAR_BIT:	;Configuro bit del puerto dato
			mov r17, r19	;mueve el dato a otro registro
			andi r17, 0x01	;enmascara para ver el bit menos significativo para enviarlo
			lsr r19		;shiftea el byte a derecha para la proxima iteracion
			cpi r17, 0
			brne BIT1

BIT0:		cbi PORTD, 7 ; pongo 0 en PB2
			rcall BIT_DELAY
			rjmp CLK_HIGH	
				
BIT1:		sbi PORTD, 7 ; pongo 1 en PB2.
			rcall BIT_DELAY
			
CLK_HIGH:	;Seteo CLK en HIGH
			sbi PORTD, 6 ; CLK en HIGH
			rcall BIT_DELAY
			

BYTE_END:	dec r16
			cpi r16, 0
			brne CLK_LOW ;vuelvo para transmitir otro bit si no transmiti 8 bits.

ACK:		;Acknowledge para ver si terminé de transmitir

			;Seteo CLK en LOW
			cbi PORTD, 6 ; CLK en LOW
			rcall BIT_DELAY

			;Seteo CLK en HIGH
			sbi PORTD, 6 ; CLK en HIGH
			rcall BIT_DELAY

			sbis PORTD, 7;
			cbi PORTD, 7 ; CLK en LOW si no lo estaba
			rcall BIT_DELAY
			
			;Seteo CLK en LOW
			cbi PORTD, 6 ; CLK en LOW
			rcall BIT_DELAY

FIN:		pop r18
			pop r17
			pop r16
			ret







BIT_DELAY:  ;delay de 50 us
			push r20
			ldi  r20, 16
			L1: dec  r20
			brne L1
			pop r20
			ret

START:		;comienza transmision segun especifica datasheet
			cbi PORTD, 7 ; Data a LOW para iniciar.
			rcall BIT_DELAY
			ret

STOP:		;termina transmision segun especifica datasheet
			cbi PORTD, 7 ; Data a LOW.
			rcall BIT_DELAY
			sbi PORTD, 6 ; CLK a HIGH.
			rcall BIT_DELAY
			sbi PORTD, 7 ; Data a HIGH para terminar.
			rcall BIT_DELAY
			ret
