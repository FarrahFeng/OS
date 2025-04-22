;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Mac OS X x86_64)
;--------------------------------------------------------
	.module testparking
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
	.globl _Producer
	.globl _ThreadExit
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
	.globl _car_id
	.globl _car_name
	.globl _id
	.globl _tok2
	.globl _tok
	.globl _empty
	.globl _mutex
	.globl _car
	.globl _next_car
	.globl _time_temp
	.globl _timer
	.globl _time
	.globl _cur_thread
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
_cur_thread	=	0x0035
_time	=	0x0039
_timer	=	0x0024
_time_temp	=	0x0020
_next_car	=	0x003a
_car	=	0x003b
_mutex	=	0x003c
_empty	=	0x003d
_tok	=	0x003e
_tok2	=	0x003f
_id	=	0x002a
_car_name	=	0x002b
_car_id	=	0x002f
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
;Allocation info for local variables in function 'Producer'
;------------------------------------------------------------
;	testparking.c:41: void Producer(void) {
;	-----------------------------------------
;	 function Producer
;	-----------------------------------------
_Producer:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	testparking.c:47: SemaphoreWaitBody(empty, L(__COUNTER__) );  // make sure one of the spot is empty
		0$:
	MOV A, _empty 
	JZ 0$ 
	JB ACC.7, 0$ 
	dec _empty 
;	testparking.c:48: SemaphoreWaitBody(mutex, L(__COUNTER__) );  // no cars is parking now
		1$:
	MOV A, _mutex 
	JZ 1$ 
	JB ACC.7, 1$ 
	dec _mutex 
;	testparking.c:49: EA = 0;
;	assignBit
	clr	_EA
;	testparking.c:52: if( tok == '0' ){ 
	mov	a,#0x30
	cjne	a,_tok,00368$
	sjmp	00369$
00368$:
	ljmp	00140$
00369$:
;	testparking.c:53: tok = car_name[cur_thread];
	mov	a,_cur_thread
	add	a,#_car_name
	mov	r1,a
	mov	_tok,@r1
;	testparking.c:54: print('1', 'P', car_name[cur_thread]);
	orl	_TMOD,#0x20
	mov	_TH1,#0xfa
	mov	_SCON,#0x50
;	assignBit
	setb	_TR1
	mov	_id,#0x00
00187$:
	mov	a,#0x100 - 0x05
	add	a,_id
	jnc	00370$
	ljmp	00141$
00370$:
	mov	a,_id
	jnz	00113$
	mov	_SBUF,#0x31
	sjmp	00115$
00113$:
	mov	a,#0x01
	cjne	a,_id,00110$
	mov	_SBUF,#0x50
	sjmp	00115$
00110$:
	mov	a,#0x02
	cjne	a,_id,00107$
	mov	a,_cur_thread
	add	a,#_car_name
	mov	r1,a
	mov	_SBUF,@r1
	sjmp	00115$
00107$:
	mov	a,#0x03
	cjne	a,_id,00104$
	mov	r7,_time
	mov	a,#0x07
	anl	a,r7
	add	a,#0x30
	mov	_SBUF,a
	sjmp	00115$
00104$:
	mov	a,#0x04
	cjne	a,_id,00115$
	mov	_SBUF,#0x0a
00115$:
;	assignBit
	jbc	_TI,00380$
	sjmp	00115$
00380$:
	mov	a,_id
	inc	a
	mov	_id,a
	sjmp	00187$
00140$:
;	testparking.c:55: }else if( tok2 == '0' ){
	mov	a,#0x30
	cjne	a,_tok2,00141$
;	testparking.c:56: tok2 = car_name[cur_thread];
	mov	a,_cur_thread
	add	a,#_car_name
	mov	r1,a
	mov	_tok2,@r1
;	testparking.c:57: print('2','P', car_name[cur_thread]);
	orl	_TMOD,#0x20
	mov	_TH1,#0xfa
	mov	_SCON,#0x50
;	assignBit
	setb	_TR1
	mov	_id,#0x00
00190$:
	mov	a,#0x100 - 0x05
	add	a,_id
	jc	00141$
	mov	a,_id
	jnz	00131$
	mov	_SBUF,#0x32
	sjmp	00133$
00131$:
	mov	a,#0x01
	cjne	a,_id,00128$
	mov	_SBUF,#0x50
	sjmp	00133$
00128$:
	mov	a,#0x02
	cjne	a,_id,00125$
	mov	a,_cur_thread
	add	a,#_car_name
	mov	r1,a
	mov	_SBUF,@r1
	sjmp	00133$
00125$:
	mov	a,#0x03
	cjne	a,_id,00122$
	mov	r7,_time
	mov	a,#0x07
	anl	a,r7
	add	a,#0x30
	mov	_SBUF,a
	sjmp	00133$
00122$:
	mov	a,#0x04
	cjne	a,_id,00133$
	mov	_SBUF,#0x0a
00133$:
;	assignBit
	jbc	_TI,00393$
	sjmp	00133$
00393$:
	mov	a,_id
	inc	a
	mov	_id,a
	sjmp	00190$
00141$:
;	testparking.c:59: EA = 1;
;	assignBit
	setb	_EA
;	testparking.c:60: SemaphoreSignal(mutex);     //停完車了
	INC _mutex 
;	testparking.c:62: delay(2);                   // park time
	mov	a,_cur_thread
	add	a,#_time_temp
	mov	r1,a
	mov	r7,_time
	mov	a,#0x02
	add	a,r7
	mov	@r1,a
00142$:
	mov	a,_cur_thread
	add	a,#_time_temp
	mov	r1,a
	mov	a,@r1
	cjne	a,_time,00142$
;	testparking.c:64: EA = 0;
;	assignBit
	clr	_EA
;	testparking.c:65: if( tok == car_name[cur_thread] ){
	mov	a,_cur_thread
	add	a,#_car_name
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	cjne	a,_tok,00184$
;	testparking.c:66: tok = '0';                          // mark as empty
	mov	_tok,#0x30
;	testparking.c:67: print('1', 'O', car_name[cur_thread]);
	orl	_TMOD,#0x20
	mov	_TH1,#0xfa
	mov	_SCON,#0x50
;	assignBit
	setb	_TR1
	mov	_id,#0x00
00193$:
	mov	a,#0x100 - 0x05
	add	a,_id
	jnc	00398$
	ljmp	00185$
00398$:
	mov	a,_id
	jnz	00157$
	mov	_SBUF,#0x31
	sjmp	00159$
00157$:
	mov	a,#0x01
	cjne	a,_id,00154$
	mov	_SBUF,#0x4f
	sjmp	00159$
00154$:
	mov	a,#0x02
	cjne	a,_id,00151$
	mov	a,_cur_thread
	add	a,#_car_name
	mov	r1,a
	mov	_SBUF,@r1
	sjmp	00159$
00151$:
	mov	a,#0x03
	cjne	a,_id,00148$
	mov	r7,_time
	mov	a,#0x07
	anl	a,r7
	add	a,#0x30
	mov	_SBUF,a
	sjmp	00159$
00148$:
	mov	a,#0x04
	cjne	a,_id,00159$
	mov	_SBUF,#0x0a
00159$:
;	assignBit
	jbc	_TI,00408$
	sjmp	00159$
00408$:
	mov	a,_id
	inc	a
	mov	_id,a
	sjmp	00193$
00184$:
;	testparking.c:68: }else if( tok2 == car_name[cur_thread] ){ 
	mov	a,_cur_thread
	add	a,#_car_name
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	cjne	a,_tok2,00185$
;	testparking.c:69: tok2 = '0';
	mov	_tok2,#0x30
;	testparking.c:70: print('2', 'O', car_name[cur_thread]);
	orl	_TMOD,#0x20
	mov	_TH1,#0xfa
	mov	_SCON,#0x50
;	assignBit
	setb	_TR1
	mov	_id,#0x00
00196$:
	mov	a,#0x100 - 0x05
	add	a,_id
	jc	00185$
	mov	a,_id
	jnz	00175$
	mov	_SBUF,#0x32
	sjmp	00177$
00175$:
	mov	a,#0x01
	cjne	a,_id,00172$
	mov	_SBUF,#0x4f
	sjmp	00177$
00172$:
	mov	a,#0x02
	cjne	a,_id,00169$
	mov	a,_cur_thread
	add	a,#_car_name
	mov	r1,a
	mov	_SBUF,@r1
	sjmp	00177$
00169$:
	mov	a,#0x03
	cjne	a,_id,00166$
	mov	r7,_time
	mov	a,#0x07
	anl	a,r7
	add	a,#0x30
	mov	_SBUF,a
	sjmp	00177$
00166$:
	mov	a,#0x04
	cjne	a,_id,00177$
	mov	_SBUF,#0x0a
00177$:
;	assignBit
	jbc	_TI,00421$
	sjmp	00177$
00421$:
	mov	a,_id
	inc	a
	mov	_id,a
	sjmp	00196$
00185$:
;	testparking.c:72: EA = 1;
;	assignBit
	setb	_EA
;	testparking.c:73: SemaphoreSignal(empty);
	INC _empty 
;	testparking.c:74: SemaphoreSignal(next_car); 
	INC _next_car 
;	testparking.c:75: ThreadExit();       //delete thread
;	testparking.c:77: } 
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	testparking.c:79: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	testparking.c:80: SemaphoreCreate(mutex, 1);
	mov	_mutex,#0x01
;	testparking.c:81: SemaphoreCreate(empty, 2);      // only 2 spots
	mov	_empty,#0x02
;	testparking.c:82: SemaphoreCreate(next_car, 0);
	mov	_next_car,#0x00
;	testparking.c:84: EA = 1;
;	assignBit
	setb	_EA
;	testparking.c:86: tok = '0';
	mov	_tok,#0x30
;	testparking.c:87: tok2 = '0';
	mov	_tok2,#0x30
;	testparking.c:88: car = '1';
	mov	_car,#0x31
;	testparking.c:91: car_id = ThreadCreate( Producer );
	mov	dptr,#_Producer
	lcall	_ThreadCreate
	mov	_car_id,dpl
;	testparking.c:92: car_name[ car_id ] = car;
	mov	a,_car_id
	add	a,#_car_name
	mov	r0,a
	mov	@r0,_car
;	testparking.c:93: car = car+1;
	mov	a,_car
	inc	a
	mov	_car,a
;	testparking.c:95: car_id = ThreadCreate( Producer );
	mov	dptr,#_Producer
	lcall	_ThreadCreate
	mov	_car_id,dpl
;	testparking.c:96: car_name[ car_id  ] = car;
	mov	a,_car_id
	add	a,#_car_name
	mov	r0,a
	mov	@r0,_car
;	testparking.c:97: car = car+1;
	mov	a,_car
	inc	a
	mov	_car,a
;	testparking.c:99: car_id = ThreadCreate( Producer );
	mov	dptr,#_Producer
	lcall	_ThreadCreate
	mov	_car_id,dpl
;	testparking.c:100: car_name[ car_id  ] = car;
	mov	a,_car_id
	add	a,#_car_name
	mov	r0,a
	mov	@r0,_car
;	testparking.c:101: car = car+1;
	mov	a,_car
	mov	r7,a
	inc	a
	mov	_car,a
;	testparking.c:103: while(1){
00102$:
;	testparking.c:104: EA = 1; // enable interrupt
;	assignBit
	setb	_EA
;	testparking.c:105: SemaphoreWaitBody(next_car, L(__COUNTER__) ); //must wait until somebody(first three cars) leaves
		2$:
	MOV A, _next_car 
	JZ 2$ 
	JB ACC.7, 2$ 
	dec _next_car 
;	testparking.c:106: EA = 0;
;	assignBit
	clr	_EA
;	testparking.c:108: car_id = ThreadCreate( Producer ); 
	mov	dptr,#_Producer
	lcall	_ThreadCreate
	mov	_car_id,dpl
;	testparking.c:109: car_name[ car_id  ] = car;
	mov	a,_car_id
	add	a,#_car_name
	mov	r0,a
	mov	@r0,_car
;	testparking.c:111: car = (car == '5') ? '1' : (car+1);
	mov	a,#0x35
	cjne	a,_car,00106$
	mov	r6,#0x31
	mov	r7,#0x00
	sjmp	00107$
00106$:
	mov	r5,_car
	inc	r5
	mov	a,r5
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
00107$:
	mov	_car,r6
;	testparking.c:113: ThreadExit();
;	testparking.c:114: }
	sjmp	00102$
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	testparking.c:116: void _sdcc_gsinit_startup(void) {
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	testparking.c:119: __endasm;
	ljmp	_Bootstrap
;	testparking.c:120: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	testparking.c:122: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	testparking.c:123: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	testparking.c:124: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	testparking.c:125: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	testparking.c:128: __endasm;
	ljmp	_myTimer0Handler
;	testparking.c:129: }
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
