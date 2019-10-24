.include "decimal_to_hex.asm"

GUARDAR_EN_RAM:
				push R28
				push R29
				push R0
				push R1
				push R17
				in R17, SREG
				push R17
				
				LDI R17, 10		;salto de linea
				st X+, R17
				ldi R17, 13		;retorno de carro
				st X+, R17
				
				mov r21, r29	
				rcall DEC_TO_HEX
				lds r29, 0x0252	;guarda tercer digito local
				st X+, R29		
				lds r29, 0x0251	;guarda segundo digito local
				st X+, R29	
				lds r29, 0x0250	;guarda primer digito local
				st X+, R29	

				ldi R17, 44		;coma
				st X+, R17

				mov r21, r28	
				rcall DEC_TO_HEX
				lds r28, 0x0252	;guarda tercer digito visitante
				st X+, R28		
				lds r28, 0x0251	;guarda segundo digito visitante
				st X+, R28	
				lds r28, 0x0250	;guarda primer digito visitante
				st X+, R28		

				ldi R17, 44		;coma
				st X+, R17

				mov r21, r1	
				rcall DEC_TO_HEX
				lds r17, 0x0251	;guarda segundo digito minutos
				st X+, R17	
				lds r17, 0x0250	;guarda primer digito minutos
				st X+, R17	
				
				ldi R17, 44		;coma
				st X+, R17

				mov r21, r0	
				rcall DEC_TO_HEX
				lds r17, 0x0251	;guarda segundo digito segundos
				st X+, R17	
				lds r17, 0x0250	;guarda primer digito segundos
				st X+, R17	


				


				pop R17
				out SREG, R17
				pop R17
				pop R1
				pop R0
				pop R29
				pop R28			
				
				ret