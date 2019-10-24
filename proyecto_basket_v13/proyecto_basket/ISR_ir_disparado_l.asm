.INCLUDE "blink_n_buzz.asm"
.INCLUDE "update_score_LOCAL.asm"
.INCLUDE "update_score_VISITANTE.asm"
.INCLUDE "guardar_ram_v2.asm"

IR_DISPARADO_ISR:
	push r16
	IN r16, SREG		;se guarda el SREG
	PUSH r16			;pushea el valor de SREG
	push r17

	mov r17, r31		;antirebote, ver r31 en TIMER_delay_1s
	SUB r17, r30
	cpi r17, 1			;compara si pasaron 1 segundos
	brlt FIN_ISR		;si no pasaron 1 segundos no incrementa

	RCALL BLINK_N_BUZZ
	INC LOCAL			;doble como en basket
	INC LOCAL
	RCALL UPDATE_SCORE_LOCAL  ; updatea local
	RCALL GUARDAR_EN_RAM
	
	mov r30, r31		;guarda ultimo instante de anotacion para antirebote
	
FIN_ISR:
	pop r17
	POP r16
	OUT SREG, r16
	pop r16
	RETI
