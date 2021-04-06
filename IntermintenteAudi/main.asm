/***********************************************************
					Intermitente Audi
					   roberechev
***********************************************************/
ser r16
out ddrd, r16
main:
	ldi r16, 0
	repetirL:
		out portd, r16 ; inicializar puerto D como salida
	;delay 100ms
		CALL funcionDelay100ms ;Guarda el puntero de retorno(Para poder volver al mismo punto) y hace un salto a la funcion (ocupa 2 espacios en la pila dr RAM)
		
		lsl r16 ;multiplicador por 2 para desplazar a la izquierda
		inc r16
		
		cpi r16, 255
		brne repetirL
		
		out portd, r16  ;asi muestro los 8 leds encendidos (sino solo se verian 7)
		CALL funcionDelay500ms ;delay 100ms

	rjmp main

/***********************************************************
				 Fin Intermitente Audi
***********************************************************/


/***********************************************************
						delays
***********************************************************/

funcionDelay100ms:
		push r16
		push r17 ;guardo en una pila de la ram los registros (como copia de seguridad)
		push r18
			ldi  r18, 9
			ldi  r19, 30
			ldi  r20, 229
		L1: dec  r20
			brne L1
			dec  r19
			brne L1
			dec  r18
			brne L1
		pop r18
		pop r17 ;recuperas de la pila de la ram el valor guardado del registro (recuperas copia de seguridad)
		pop r16
			RET ;Vuelves al puntero guardado con la instruccion CALL

funcionDelay500ms:
		push r16
		push r17 ;guardo en una pila de la ram los registros (como copia de seguridad)
		push r18
			ldi  r18, 41
			ldi  r19, 150
			ldi  r20, 128
		L2: dec  r20
			brne L2
			dec  r19
			brne L2
			dec  r18
			brne L2
		pop r18
		pop r17 ;recuperas de la pila de la ram el valor guardado del registro (recuperas copia de seguridad)
		pop r16
		RET ;Vuelves al puntero guardado con la instruccion CALL