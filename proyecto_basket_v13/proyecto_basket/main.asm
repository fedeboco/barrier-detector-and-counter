.INCLUDE "config.inc" ; micro, stack, puertos, defs, equs, etc
.INCLUDE "ISR_ir_disparado_l.asm"
.INCLUDE "ISR_ir_disparado_v.asm"
.INCLUDE "Funciones_UART.asm"
.INCLUDE "M328Pdef.inc"
.INCLUDE "set_segment.asm"	
.INCLUDE "TIMER.asm"
.INCLUDE "start_segments.asm"

MAIN:
	rcall START_SEGMENTS
	rcall USART_config
	push R16
	ldi R16, 1
	mov R13, R16
	pop R16
	;rcall SELECCION_TIEMPO
	SEI
	rcall TIMER_CONTADOR
	cli						;se deshabilita la interrupcion
	rcall USART_transmitir

REINICIAR_PARTIDO:
	cli
	lds r17, UCSR0A			;verifica si llegó dato NUEVO
	sbrs r17, RXC0
	rjmp REINICIAR_PARTIDO

	lds r16, UDR0			;carga lo que recibió y está en el buffer

	ldi r18, 'r'
	cp r18, r16
	breq SI_REINICIAR		;si llegó 'r' incrementa visitante
	rjmp REINICIAR_PARTIDO

SI_REINICIAR:
	jmp CONFIG

