.include "M328pdef.inc"
.include "TIMER_delay_1s.asm"

.EQU CANT_SEGUNDOS = 10
.EQU CANT_MINUTOS = 0

rjmp inicio

						
inicio: sbi DDRC, 1
		rcall timer
		sbi PORTC, 1
		rcall DELAY_1s
		cbi PORTC,1
		fin:rjmp fin 
							
				timer:		
							
							clr R0				;registro para almacenar los segundos
							clr R1				;registro para almacenar los minutos
							ldi R16, CANT_SEGUNDOS
							ldi R17, CANT_MINUTOS
			
				INC_SEGUNDO:		
							call DELAY_1s				;espera de 1s
							;rcall SET_SEGMENT			;actualizo display
							inc R0						;se incrementa el contador de segundos
							cp R0, R16					;compara, para ver si llegó a 60s 
							brne INC_SEGUNDO			;si no son iguales, vuelve
							rjmp INC_MINUTO				;se llegó al minuto
								
				INC_MINUTO: clr R0						;se limpia el registro de segundos
							inc R1						;se incrementa el contador de minutos
							cp R1, R17					;se compara con el tiempo elegido
							brne INC_SEGUNDO			;vuelve a incrementar los segundos
							
							ret							;terminó el juego

