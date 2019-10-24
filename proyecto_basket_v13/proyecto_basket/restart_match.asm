REINICIAR_PARTIDO:
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

	ldi r18, 13				;retorno de carro
	cp r18, r16
	breq CONFIG


NO_REINICIAR:
	pop r16
	out SREG,r16
    pop r16
    pop r17
	pop r18
	pop r19
	ret