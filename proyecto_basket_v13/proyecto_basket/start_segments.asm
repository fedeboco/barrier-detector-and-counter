START_SEGMENTS:			push r1
						push r0
						push r16
						push r17
						push r18
						IN R18, SREG
						push R18
						
						ldi r16, 0b01000000 ;PALITO DEL MEDIO
		

;---------------- Configuro TM1637

SSET_COMMAND11:			ldi r19, 0b01000100		; COMANDO: Normal, escribir datos, fixed ad.
						rcall START
						rcall WRITE_BYTE
						rcall STOP

;---------------- 7 Segmentos #1 (0X:XX)

SSET_COMMAND21:			ldi r19, 0b11001000		; Seteo direccion del display
						rcall START
						rcall WRITE_BYTE
						

SSET_DATA1:				mov r19, r16			
						rcall WRITE_BYTE		; Mando dato
						rcall STOP

;---------------- 7 Segmentos #2 (X0:XX)

SSET_COMMAND22:			ldi r19, 0b11001001		; Seteo direccion del display
						rcall START
						rcall WRITE_BYTE
						
SSET_DATA2:				mov r19, r16
						ori r19, 0x80			;agrega los 2 puntos
						rcall WRITE_BYTE		; Mando dato
						rcall STOP

;---------------- 7 Segmentos #3 (XX:0X)

SSET_COMMAND23:			ldi r19, 0b11001010		; Seteo direccion del display
						rcall START
						rcall WRITE_BYTE					

SSET_DATA3:				mov r19, r16		
						rcall WRITE_BYTE		; Mando dato
						rcall STOP

;---------------- 7 Segmentos #4 (XX:X0)

SSET_COMMAND24:			ldi r19, 0b11001011		; Seteo direccion del display
						rcall START
						rcall WRITE_BYTE					

SSET_DATA4:				mov r19, r16
						rcall WRITE_BYTE		; Mando dato
						rcall STOP

;---------------- Configuro brillo

SSET_COMMAND3:			;seteo el brillo
						ldi r19, 0b10001010
						rcall START
						rcall WRITE_BYTE
						rcall STOP
						pop R18
						out SREG,r18
						pop r18
						pop r17
						pop r16
						pop r0
						pop r1
						ret