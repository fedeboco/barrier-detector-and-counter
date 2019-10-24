DELAY_1s:	push R20
			in R20, SREG			;se guarda el SREG
			push R20				;se pushea el valor de SREG
			ldi R20, high(47000)		;se carga la parte alta y baja de TCNT1, ya que es de 16 bits
			sts TCNT1H, R20			
			ldi R20, low(47000)		;se debe calcular bien el valor de 3000, el delay NO es exactamente 1s
			sts TCNT1L,R20
			ldi R20, 0x00			;no se usa, se carga con ceros
			sts TCCR1A, R20
			ldi R20, 0x3			;preescaler de 128 (PONER EN 0x3)
			sts TCCR1B, R20
			sbi TIFR1, TOV1			;se limpia el flag TV01 CON UN 1			
ACA:		in R20, TIFR1
			sbrs R20, TOV1			;skippea cuando TOV1 llega a overflow
			rjmp ACA
			sbi TIFR1, TOV1			;(1<<TOV1);se limpia el flag de overflow				
			ldi R20, 0x00			;paro el timmer
			sts TCCR1B, R20
			sts TCCR1A, R20
			pop R20
			out SREG, R20
			pop R20
			ret