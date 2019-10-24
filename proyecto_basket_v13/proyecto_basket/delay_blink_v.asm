DELAY_V:
	push CONTADOR1
	push CONTADOR2
	push r16
	in r16, SREG
	push r16

    ldi  CONTADOR1, 130
    ldi  CONTADOR2, 222
LOOP1_V: dec  CONTADOR2
    brne LOOP1_V
    dec  CONTADOR1
    brne LOOP1_V
    nop
	
	pop r16
	out SREG, r16
	pop r16
	pop CONTADOR2
	pop CONTADOR1
    RET