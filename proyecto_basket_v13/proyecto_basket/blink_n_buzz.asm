.INCLUDE "delay_blink.asm"

;los puertos ya fueron configurados en "config.inc"

BLINK_N_BUZZ:
	PUSH R16
	IN R16, SREG
	PUSH R16

	LDI R16, NRO_BIPS

KEEP_BLINKING:	
	SBI PORTC,2				;se setea el pni2 del puerto C (tiras de led)
	CBI PORTC,3				;se clearea el pin3 del puerto C (tiras de led)
	RCALL BUZZ				;se activa el buzz (doble sonido)
	RCALL DELAY				;espera 
	CBI PORTC,2				;apaga los leds
	SBI PORTC,3				;apaga los leds
	RCALL BUZZ
	RCALL DELAY
	DEC BIPS_RESTANTES
	BRNE KEEP_BLINKING
	CBI PORTC,1		;si termina de blinkear, los apaga.
	CBI PORTC,2
	CBI PORTC,3

	POP R16
	IN R16, SREG
	POP R16
	RET

BUZZ:		
	SBIS PORTC,1			
	RJMP BUZZ_GOES_ON
	RJMP BUZZ_GOES_OFF

BUZZ_GOES_ON:
	SBI PORTC,1
	RET

BUZZ_GOES_OFF:
	CBI PORTC,1
	RET	