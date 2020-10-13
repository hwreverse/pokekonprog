100 'PC-G850 UART TEST 
110 OUT &H60,2 'UARTmode
120 OUT &H6D,&H80 'SIOreset
130 OUT &H6D,&H40 'error clearing
140 OUT &H63,0 'flow clear
150 OUT &H6C,&H0D '9600baud,Interruption available, no parity
160 OUT &H6D,&H30 'send and receive enable
170 OUT &H63,&H14 'DR,RS ON 
180 *LOOP 
190 X= INP (&H6E) 
200 IF (X AND &H10)<>0 THEN GOTO *RECEIVE 'Do you have reception?  
210 IF (X AND &H04)<>0 THEN GOTO *SEND 'Can I send it?
220 GOTO *LOOP 
230 *RECEIVE 
240 X$= CHR$ ( INP (&H6F)) 'data reception
250 PRINT X$; 
260 GOTO *LOOP 
270 *SEND 
280 X$= INKEY$ 
290 IF X$="" THEN GOTO *LOOP 
300 OUT &H6F, ASC (X$) 'data transmission
310 GOTO *LOOP 

