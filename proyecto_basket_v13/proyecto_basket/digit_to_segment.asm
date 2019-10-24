//
//      A
//     ---
//  F |   | B
//     -G-
//  E |   | C
//     ---
//      D

/*  0b00111111,    // 0
  0b00000110,    // 1
  0b01011011,    // 2
  0b01001111,    // 3
  0b01100110,    // 4
  0b01101101,    // 5
  0b01111101,    // 6
  0b00000111,    // 7
  0b01111111,    // 8
  0b01101111,    // 9
  0b01110111,    // A
  0b01111100,    // b
  0b00111001,    // C
  0b01011110,    // d
  0b01111001,    // E
  0b01110001,    // F
  0b10000000	 // DP DOUBLE POINT   */


DIGIT_TO_SEGMENT:	cpi r19,9
					breq ES_9

					cpi r19,8
					breq ES_8

					cpi r19,7
					breq ES_7

					cpi r19,6
					breq ES_6

					cpi r19,5
					breq ES_5

					cpi r19,4
					breq ES_4

					cpi r19,3
					breq ES_3

					cpi r19,2
					breq ES_2

					cpi r19,1
					breq ES_1

					cpi r19,0
					breq ES_0

ES_9:				ldi r19, 0b01101111
					ret

ES_8:				ldi r19, 0b01111111
					ret

ES_7:				ldi r19, 0b00000111
					ret

ES_6:				ldi r19, 0b01111101
					ret

ES_5:				ldi r19, 0b01101101
					ret

ES_4:				ldi r19, 0b01100110
					ret

ES_3:				ldi r19, 0b01001111
					ret

ES_2:				ldi r19, 0b01011011
					ret

ES_1:				ldi r19, 0b00000110
					ret

ES_0:				ldi r19, 0b00111111
					ret