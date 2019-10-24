.include "TIMER_delay_1s.asm"

TIMER_CONTADOR:				push R16
							push R17
							push R0
							push R1
							IN R16, SREG
							push R16

							clr R0				;registro para almacenar los segundos
							clr R1				;registro para almacenar los minutos
							ldi R16, CANT_SEGUNDOS
							mov R17, CANT_MINUTOS
							
				INC_SEGUNDO:
							call DELAY_1s		
							call DELAY_1s				;espera de 1s
							rcall SET_SEGMENT			;actualizo display
							inc R0						;se incrementa el contador de segundos
							cp R0, R16					;compara, para ver si llegó a 60s 
							brne INC_SEGUNDO			;si no son iguales, vuelve
							rjmp INC_MINUTO				;se llegó al minuto

								
				INC_MINUTO: clr R0						;se limpia el registro de segundos
							inc R1						;se incrementa el contador de minutos
							
							inc r17						;incremento necesario para trabajar con tiempo regresivo.

							cp R17, R1					;se compara con el tiempo elegido
							
							push r16					;guarda el flag Z para saltar en brne.
							in r16, SREG
							push r16
							dec r17
							pop r16
							out SREG, r16
							pop r16

							brne INC_SEGUNDO			;vuelve a incrementar los segundos
							inc r17
							rcall SET_SEGMENT
							dec r17

							push r16				;fin de tabla
							ldi r16, 0x04			;caracter EOT fin de transmisión
							st X, r16
							pop r16

							pop R16
							out SREG,r16
							pop R1
							pop R0
							pop R17
							pop R16
							cli
								
							

							ret							;terminó el juego

