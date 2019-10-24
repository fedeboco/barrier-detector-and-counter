.INCLUDE "M328PDEF.INC"

.DEF BIPS_RESTANTES = r16		;local
.DEF CONTADOR1 = r18			;local
.DEF CONTADOR2 = r19			;local
.DEF VISITANTE = r28			;GLOBAL!! ;OJO: es el puntero Y, usar el puntero X para tabla RAM
.DEF LOCAL = r29				;GLOBAL!! ;OJO: es el puntero Z, usar el puntero X para tabla RAM
.DEF CANT_MINUTOS = r13			;GLOBAL!!
.DEF SEGS_TRANSCURRIDOS = r0	;GLOBAL!!
.DEF MINS_TRANSCURRIDOS = r1	;GLOBAL!!

.EQU NRO_BIPS = 1				
.EQU CANT_SEGUNDOS = 60

;----------vector interrupciones
.ORG 0
JMP CONFIG

.ORG 0x02
JMP IR_DISPARADO_ISR

.ORG 0x04
JMP IR_DISPARADO_ISR_V
;-------------------------------

.ORG 0x0100  

CONFIG:	;config stack
		LDI r16, LOW(RAMEND)            ; inicializa el SP
		OUT SPL, r16
		LDI r16, HIGH(RAMEND)
		OUT SPH, r16
		
		ldi XL, 0x00					; inicialización del puntero X al primer
		ldi XH, 0x03					; elemento de la tabla (asumí esa dirección)			 
					
		CLI								; interrupciones deshabilitadas

		;config INT0 e INT1
		LDI r20,  0b00000011	
		OUT EIMSK, r20			; habilita interrupcion de hardware externo 0, descendente por def
		LDI r20, 0b00001111		; (1<<ISC00)||(1<<ISC01)
		STS EICRA, r20			; IR por flanco ascendente	

		;config puertos
		SBI DDRC,1		; buzzer
		SBI DDRC,2		; tira led 1
		SBI DDRC,3		; tira led 2
		CBI DDRD,2      ; sensor local INT0
		CBI DDRD,3		; sensor visitante INT1

		;Inicializo tantos y tiempo
		CLR LOCAL
		CLR VISITANTE
		LDI R17, 60			; empieza en 60 para ser regresivo.
		MOV R0, R17
		CLR R1				; empieza en 0 para ser regresivo.
		CLR CANT_MINUTOS	; clr para standby
		RCALL UPDATE_SCORE_LOCAL
		RCALL UPDATE_SCORE_VISITANTE
		
		clr r31				;	tiempo transcurrido
		clr r30				;	último instante de interrupción

		RJMP MAIN
