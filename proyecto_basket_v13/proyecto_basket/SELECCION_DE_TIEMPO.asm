SELECCION_TIEMPO:
    push r19
	push r18
    push r17
    push r16
	in r16,SREG
	push r16

    rcall FUNCION_UART_RECIBE_TIEMPO     ;Recibe el valor del tiempo y define el .EQU CANT_MINUTOS
   
	pop r16
	out SREG,r16
    pop r16
    pop r17
	pop r18
	pop r19
    ret


FUNCION_UART_RECIBE_TIEMPO:
	
NO_OPCION:      lds r17, UCSR0A
	            sbrs r17, RXC0
	            rjmp FUNCION_UART_RECIBE_TIEMPO     ;Espera hasta que ingresen un valor 0,1,2 o 3 (o basura)
	            lds r17,UDR0

                ;indentifica si es 0,1,2 o 3 [1min, 5min, 10min o 15min] ... etc.

                cpi r17,0x30      ;Valor de 0
                breq T_ES_0
                cpi r17,0x31      ;Valor de 1
                breq T_ES_1
                cpi r17,0x32      ;Valor de 2
                breq T_ES_2
                cpi r17,0x33      ;Valor de 3
                breq T_ES_3
				cpi r17,0x34      ;Valor de 4
                breq T_ES_4
                cpi r17,0x35	  ;Valor de 5
                breq T_ES_5
                cpi r17,0x36	  ;Valor de 6
                breq T_ES_6
                cpi r17,0x37	  ;Valor de 7
                breq T_ES_7
                cpi r17,0x38	  ;Valor de 8
                breq T_ES_8
                rjmp NO_OPCION                          ;salta al no ingresar ninguna de las cuatro opciones anteriores
EXIT:
                ret



T_Es_0:	ldi r16, 1-1
		mov r13, r16
        rjmp EXIT
		

T_ES_1: ldi r16, 5-1
		mov r13, r16
        rjmp EXIT
		

T_ES_2: ldi r16, 10-1
		mov r13, r16
        rjmp EXIT
		

T_ES_3: ldi r16, 15-1
		mov r13, r16
        rjmp EXIT

T_ES_4: ldi r16, 20-1
		mov r13, r16
        rjmp EXIT
		
T_ES_5: ldi r16, 25-1
		mov r13, r16
        rjmp EXIT

T_ES_6: ldi r16, 30-1
		mov r13, r16
        rjmp EXIT

T_ES_7: ldi r16, 35-1
		mov r13, r16
        rjmp EXIT

T_ES_8: ldi r16, 40-1
		mov r13, r16
        rjmp EXIT