;Funciones UART para configurar, emitir tabla almacenada en posicion 0x0300, recibir un dato al r16 (ej)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
USART_config:
    push r18
    push r17
    push r16
	in r16,SREG
	push r16


	ldi r17, 0
	ldi r16, 12 ;1100 (setea TXEN0 (transmitter enable) UCSZ02 (tamaño de caracter))
	sts UBRR0H, r17
	sts UBRR0L, r16
	ldi r18, 0x02 ;setea el doble de velocidad de baud rate
	sts UCSR0A, r18
	ldi r16, (1<<RXEN0)|(1<<TXEN0) ; se activa tranmision y recepcion
	sts UCSR0B, r16
	ldi r16, (1<<USBS0)|(3<<UCSZ00) ;formato de 8bits y dos de stop
	sts UCSR0C, r16
	

	pop r16
	out SREG,r16
    pop r16
    pop r17
    pop r18
    ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
USART_transmitir:
    push r17
    push r16
	in r16,SREG
	push r16


		ldi XH, 0x03
		ldi XL, 0x00			;posiciono la tabla al comienzo para transmitir hasta encontrar el caracter de parada	
SIGUE:	
		ld r16,X+
	
		lds r17, UCSR0A
		sbrs r17, UDRE0
		rjmp USART_transmitir  
		sts UDR0,r16			;r20 para sólo transmisión
		call DELAY				;DELAY_TRANSMITIR
		cpi r16,0x04            ;simbolo de fin de tabla en RAM
		brne SIGUE

			
    pop r16
	out SREG,r16
	pop r16
    pop r17
	ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
USART_recibir:
	push r19
	push r18
    push r17
    push r16
	in r16,SREG
	push r16
	
	lds r17, UCSR0A			;verifica si llegó dato NUEVO
	sbrs r17, RXC0
	rjmp SALIR

	lds r16, UDR0			;carga lo que recibió y está en el buffer

	ldi r18, 'v'
	cp r18, r16
	breq INC_VISITANTE		;si llegó 'v' incrementa visitante
	ldi r18, 'l'
	cp r18, r16
	breq INC_LOCAL			;si llegó 'l' incrementa local
	ldi r18, 'c'
	cp r18, r16
	breq DEC_VISITANTE		;si llegó 'c' decrementa visitante
	ldi r18, 'k'
	cp r18, r16
	breq DEC_LOCAL			;si llegó 'k' decrementa local
	rjmp SALIR
	
	
	INC_VISITANTE:inc r28	
				rcall GUARDAR_EN_RAM
				rcall UPDATE_SCORE_VISITANTE
				rjmp SALIR

	INC_LOCAL: inc r29
				rcall GUARDAR_EN_RAM
				rcall UPDATE_SCORE_LOCAL
				rjmp SALIR

	DEC_VISITANTE:
				cpi r28, 0
				breq SALIR
				dec r28	
				rcall GUARDAR_EN_RAM
				rcall UPDATE_SCORE_VISITANTE
				rjmp SALIR

	DEC_LOCAL:  cpi r29, 0
				breq SALIR
				dec r29
				rcall GUARDAR_EN_RAM
				rcall UPDATE_SCORE_LOCAL
				rjmp SALIR


SALIR:
	pop r16
	out SREG,r16
    pop r16
    pop r17
	pop r18
	pop r19
	ret

DELAY_TRANSMITIR:
	push r18
	push r16
	IN r16, SREG
	push r16

    ldi  r18, 66
L21: dec  r18
    brne L21

	pop r16
	OUT SREG, r16
	pop r16
	pop r18
	ret