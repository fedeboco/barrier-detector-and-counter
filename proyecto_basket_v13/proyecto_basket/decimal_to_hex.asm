;r21 es el dato

DEC_TO_HEX:
	push r16
	in r16, SREG
	push r16
	push r23
	push r24
	push r22

	clr r16
	clr r22
	clr r23
	clr r24

N1: cpi r21, 0			;primer digito
	breq GUARDAR_CONV
	
	dec r21
	inc r22
	cpi r22, 10
	brne N1

N2: inc r23				;segundo digito
	clr r22
	cpi r23, 10
	brne N1

N3: inc r24
	clr r23
	cpi r24, 9
	brne N1

GUARDAR_CONV:
	mov r16, r22
	rcall HEX_TO_ASCII
	sts 0x0250, r16
	mov r16, r23
	rcall HEX_TO_ASCII
	sts 0x0251, r16
	mov r16, r24
	rcall HEX_TO_ASCII
	sts 0x0252, r16

fin_conv: 
	pop r22
	pop r24
	pop r23
	pop r16
	out SREG, r16
	pop r16
	ret

HEX_TO_ASCII:
	cpi r16, 0
	breq DEC_ES_0
	cpi r16, 1
	breq DEC_ES_1
	cpi r16, 2
	breq DEC_ES_2
	cpi r16, 3
	breq DEC_ES_3
	cpi r16, 4
	breq DEC_ES_4
	cpi r16, 5
	breq DEC_ES_5
	cpi r16, 6
	breq DEC_ES_6
	cpi r16, 7
	breq DEC_ES_7
	cpi r16, 8
	breq DEC_ES_8
	cpi r16, 9
	breq DEC_ES_9

DEC_ES_0:
	ldi r16, 0x30
	ret
DEC_ES_1:
	ldi r16, 0x31
	ret
DEC_ES_2:
	ldi r16, 0x32
	ret
DEC_ES_3:
	ldi r16, 0x33
	ret
DEC_ES_4:
	ldi r16, 0x34
	ret
DEC_ES_5:
	ldi r16, 0x35
	ret
DEC_ES_6:
	ldi r16, 0x36
	ret
DEC_ES_7:
	ldi r16, 0x37
	ret
DEC_ES_8:
	ldi r16, 0x38
	ret
DEC_ES_9:
	ldi r16, 0x39
	ret


