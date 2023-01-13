;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Mac OS X x86_64)
;--------------------------------------------------------
	.module test3threads
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _Consumer
	.globl _Producer2
	.globl _Producer1
	.globl _ThreadCreate
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _turn2
	.globl _turn
	.globl _Token2
	.globl _empty
	.globl _mutex
	.globl _full
	.globl _Token
	.globl _buffer
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_buffer	=	0x003a
_Token	=	0x003b
_full	=	0x003c
_mutex	=	0x003d
_empty	=	0x003e
_Token2	=	0x003f
_turn	=	0x002a
_turn2	=	0x002b
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_Producer1_sloc0_1_0:
	.ds 1
_Producer2_sloc0_1_0:
	.ds 1
_Consumer_sloc0_1_0:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer1'
;------------------------------------------------------------
;	test3threads.c:17: void Producer1(void) {
;	-----------------------------------------
;	 function Producer1
;	-----------------------------------------
_Producer1:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	test3threads.c:18: Token = 'A';
	mov	_Token,#0x41
;	test3threads.c:19: while (1) {
00102$:
;	test3threads.c:23: SemaphoreWaitBody(turn,  L(__COUNTER__));
		0$:
	MOV A, _turn 
	JZ 0$ 
	JB ACC.7, 0$ 
	dec _turn 
;	test3threads.c:24: SemaphoreWaitBody(empty, L(__COUNTER__) );
		1$:
	MOV A, _empty 
	JZ 1$ 
	JB ACC.7, 1$ 
	dec _empty 
;	test3threads.c:25: SemaphoreWaitBody(mutex, L(__COUNTER__) );
		2$:
	MOV A, _mutex 
	JZ 2$ 
	JB ACC.7, 2$ 
	dec _mutex 
;	test3threads.c:30: }
	setb	_Producer1_sloc0_1_0
	jbc	ea,00116$
	clr	_Producer1_sloc0_1_0
00116$:
;	test3threads.c:27: buffer = Token;
	mov	_buffer,_Token
;	test3threads.c:28: Token = ( Token == 'Z' ) ? 'A' :  Token + 1;
	mov	a,#0x5a
	cjne	a,_Token,00106$
	mov	r6,#0x41
	mov	r7,#0x00
	sjmp	00107$
00106$:
	mov	r5,_Token
	inc	r5
	mov	a,r5
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
00107$:
	mov	_Token,r6
	mov	c,_Producer1_sloc0_1_0
	mov	ea,c
;	test3threads.c:31: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:32: SemaphoreSignal(full);
	INC _full 
;	test3threads.c:33: SemaphoreSignal(turn2);
	INC _turn2 
;	test3threads.c:36: }
	sjmp	00102$
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer2'
;------------------------------------------------------------
;	test3threads.c:37: void Producer2(void) {
;	-----------------------------------------
;	 function Producer2
;	-----------------------------------------
_Producer2:
;	test3threads.c:38: Token2 = '0';
	mov	_Token2,#0x30
;	test3threads.c:39: while (1) {
00102$:
;	test3threads.c:43: SemaphoreWaitBody(turn2,  L(__COUNTER__));
		3$:
	MOV A, _turn2 
	JZ 3$ 
	JB ACC.7, 3$ 
	dec _turn2 
;	test3threads.c:44: SemaphoreWaitBody(empty, L(__COUNTER__) );
		4$:
	MOV A, _empty 
	JZ 4$ 
	JB ACC.7, 4$ 
	dec _empty 
;	test3threads.c:45: SemaphoreWaitBody(mutex, L(__COUNTER__) );
		5$:
	MOV A, _mutex 
	JZ 5$ 
	JB ACC.7, 5$ 
	dec _mutex 
;	test3threads.c:50: }
	setb	_Producer2_sloc0_1_0
	jbc	ea,00116$
	clr	_Producer2_sloc0_1_0
00116$:
;	test3threads.c:47: buffer = Token2;
	mov	_buffer,_Token2
;	test3threads.c:48: Token2 = ( Token2 == '9' ) ? '0' :  Token2 + 1;
	mov	a,#0x39
	cjne	a,_Token2,00106$
	mov	r6,#0x30
	mov	r7,#0x00
	sjmp	00107$
00106$:
	mov	r5,_Token2
	inc	r5
	mov	a,r5
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
00107$:
	mov	_Token2,r6
	mov	c,_Producer2_sloc0_1_0
	mov	ea,c
;	test3threads.c:51: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:52: SemaphoreSignal(full);
	INC _full 
;	test3threads.c:53: SemaphoreSignal(turn);
	INC _turn 
;	test3threads.c:56: }
	sjmp	00102$
;------------------------------------------------------------
;Allocation info for local variables in function 'Consumer'
;------------------------------------------------------------
;	test3threads.c:58: void Consumer(void) {
;	-----------------------------------------
;	 function Consumer
;	-----------------------------------------
_Consumer:
;	test3threads.c:60: EA = 0;
;	assignBit
	clr	_EA
;	test3threads.c:61: TMOD |= 0x20; // TMOD is also assigned by the (modified) Bootstrap code to set up the timer interrupt in timer-0 for preemption 
	orl	_TMOD,#0x20
;	test3threads.c:62: TH1 = -6;
	mov	_TH1,#0xfa
;	test3threads.c:63: SCON = 0x50;
	mov	_SCON,#0x50
;	test3threads.c:64: TR1 = 1;
;	assignBit
	setb	_TR1
;	test3threads.c:65: EA = 1;
;	assignBit
	setb	_EA
;	test3threads.c:66: while (1) {
00105$:
;	test3threads.c:67: SemaphoreWaitBody(full,  L(__COUNTER__));
		6$:
	MOV A, _full 
	JZ 6$ 
	JB ACC.7, 6$ 
	dec _full 
;	test3threads.c:68: SemaphoreWaitBody(mutex,  L(__COUNTER__));
		7$:
	MOV A, _mutex 
	JZ 7$ 
	JB ACC.7, 7$ 
	dec _mutex 
;	test3threads.c:72: }
	setb	_Consumer_sloc0_1_0
	jbc	ea,00121$
	clr	_Consumer_sloc0_1_0
00121$:
;	test3threads.c:70: SBUF = buffer;
	mov	_SBUF,_buffer
	mov	c,_Consumer_sloc0_1_0
	mov	ea,c
;	test3threads.c:73: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:74: SemaphoreSignal(empty);
	INC _empty 
;	test3threads.c:76: while( !TI ){}
00101$:
;	test3threads.c:77: TI = 0;
;	assignBit
	jbc	_TI,00105$
;	test3threads.c:79: }
	sjmp	00101$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	test3threads.c:81: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	test3threads.c:82: SemaphoreCreate(full, 0);
	mov	_full,#0x00
;	test3threads.c:83: SemaphoreCreate(mutex, 1);
	mov	_mutex,#0x01
;	test3threads.c:84: SemaphoreCreate(empty,1);
	mov	_empty,#0x01
;	test3threads.c:85: SemaphoreCreate(turn, 0);
	mov	_turn,#0x00
;	test3threads.c:86: SemaphoreCreate(turn2, 1);
	mov	_turn2,#0x01
;	test3threads.c:89: ThreadCreate( Producer1 );
	mov	dptr,#_Producer1
	lcall	_ThreadCreate
;	test3threads.c:90: ThreadCreate( Producer2 );
	mov	dptr,#_Producer2
	lcall	_ThreadCreate
;	test3threads.c:91: Consumer();
;	test3threads.c:94: }
	ljmp	_Consumer
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	test3threads.c:96: void _sdcc_gsinit_startup(void) {
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	test3threads.c:99: __endasm;
	ljmp	_Bootstrap
;	test3threads.c:100: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	test3threads.c:102: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	test3threads.c:103: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	test3threads.c:104: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	test3threads.c:105: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	test3threads.c:108: __endasm;
	ljmp	_myTimer0Handler
;	test3threads.c:109: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop not_psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
