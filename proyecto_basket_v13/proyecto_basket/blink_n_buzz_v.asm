.INCLUDE "delay_blink_v.asm"

;los puertos ya fueron configurados en "config.inc"

BLINK_N_BUZZ_V:
	PUSH R16
	IN R16, SREG
	PUSH R16
	
	LDI R16, NRO_BIPS
	
KEEP_BLINKING_V:
	SBI PORTC,2				;se setea el pni2 del puerto C (tiras de led)
	CBI PORTC,3				;se clearea el pin3 del puerto C (tiras de led)
	RCALL BUZZ_V				;se activa el buzz (doble sonido)
	RCALL DELAY				;espera 
	CBI PORTC,2				;apaga los leds
	SBI PORTC,3				;apaga los leds
	RCALL BUZZ_V
	RCALL DELAY
	DEC BIPS_RESTANTES
	BRNE KEEP_BLINKING_V
	CBI PORTC,1		;si termina de blinkear, los apaga.
	CBI PORTC,2
	CBI PORTC,3

	POP R16
	IN R16, SREG
	POP R16
	RET

BUZZ_V:		
	SBIS PORTC,1			
	RJMP BUZZ_GOES_ON
	RJMP BUZZ_GOES_OFF

BUZZ_GOES_ON_V:
	SBI PORTC,1
	RET

BUZZ_GOES_OFF_V:
	CBI PORTC,1
	RET	