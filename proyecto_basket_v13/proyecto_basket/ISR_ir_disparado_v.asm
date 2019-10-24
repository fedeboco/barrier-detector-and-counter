.INCLUDE "blink_n_buzz_v.asm"

IR_DISPARADO_ISR_V:
	push r16
	IN r16, SREG		;se guarda el SREG
	PUSH r16			;pushea el valor de SREG
	push r18

	mov r18, r31		;antirebote, ver r31 en TIMER_delay_1s
	SUB r18, r25
	cpi r18, 1			;compara si pasaron 1 segundos
	brlt FIN_ISR_V		;si no pasaron 1 segundos no incrementa

	RCALL BLINK_N_BUZZ_V
	INC VISITANTE
	INC VISITANTE
	RCALL UPDATE_SCORE_VISITANTE	; updatea visitante
	RCALL GUARDAR_EN_RAM
	
	mov r25, r31		;guarda ultimo instante de anotacion para antirebote

FIN_ISR_V:
	pop r18
	POP r16
	OUT SREG, r16
	pop r16
	RETI
