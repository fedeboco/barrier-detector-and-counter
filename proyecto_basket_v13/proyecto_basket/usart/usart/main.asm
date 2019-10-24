.include "M328pdef.inc"
rjmp inicio

ldi R16, high(RAMEND)
out SPH, R16
ldi R16, low(RAMEND)
out SPL, R16

inicio:
rcall USART_config

rcall func

ldi XL, 0x00
ldi XH, 0x03

ld R20, X+
rcall transmitir
ld R20, X+
rcall transmitir
ld R20, X+
rcall transmitir
ld R20, X


rcall transmitir

fin: rjmp fin


func:

ldi XL, 0x00
ldi XH, 0x03	; inicialización del puntero X al primer elemento de la tabla
ldi R16, 'h'
st X+, R16
clr R16
ldi R16, 'o'
st X+, R16
clr R16
ldi R16, 'l'
st X+, R16
ldi R16, 'a'
st X, R16
ret


transmitir:
	lds r17, UCSR0A
	sbrs r17, UDRE0
	rjmp transmitir
	sts UDR0, r20 ; r20 para sólo transmisión
	nop
	nop
	nop
	ret


;transmitir:
;	lds R18, UCSR0A
;	sbrs R18, UDRE0
;	rjmp transmitir
;	sts UDR0, R18


ret

USART_config:
	ldi r17, 0
	ldi r16, 12
	sts UBRR0H, r17
	sts UBRR0L, r16
	ldi r16, (1<<RXEN0)|(1<<TXEN0) ; se activa tranmision y recepcion
	sts UCSR0B, r16
	;formato de 8bits y dos de stop
	ldi r16, (1<<USBS0)|(3<<UCSZ00)
	sts UCSR0C, r16

	ldi r18,0x02		;0x02 activa doble velocidad
	sts UCSR0A, r18

	ret

