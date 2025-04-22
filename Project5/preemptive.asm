;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Mac OS X x86_64)
;--------------------------------------------------------
	.module preemptive
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Bootstrap
	.globl _main
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
	.globl _new_thread
	.globl _sp_temp
	.globl _mask
	.globl _saved_sp
	.globl _time_temp
	.globl _timer
	.globl _time
	.globl _cur_thread
	.globl _now
	.globl _myTimer0Handler
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
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
_saved_sp	=	0x0030
_mask	=	0x0034
_sp_temp	=	0x0036
_new_thread	=	0x0037
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
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
_ThreadYield_sloc0_1_0:
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'now'
;------------------------------------------------------------
;	preemptive.c:66: unsigned char now(void){
;	-----------------------------------------
;	 function now
;	-----------------------------------------
_now:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	preemptive.c:67: return time;
	mov	dpl,_time
;	preemptive.c:68: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:70: void Bootstrap(void) {
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
;	preemptive.c:71: mask = 0;
	mov	_mask,#0x00
;	preemptive.c:72: TMOD = 0;  // timer 0 mode 0 (timer 1 is already used by UART)
	mov	_TMOD,#0x00
;	preemptive.c:73: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
	mov	_IE,#0x82
;	preemptive.c:75: TR0 = 1; // set bit TR0 to start running timer 0
;	assignBit
	setb	_TR0
;	preemptive.c:77: cur_thread = ThreadCreate( main );
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_cur_thread,dpl
;	preemptive.c:78: RESTORESTATE;
	mov	a,_cur_thread
	add	a,#_saved_sp
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:80: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:82: void myTimer0Handler(){
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	preemptive.c:83: EA = 0;             // disable interrupt
;	assignBit
	clr	_EA
;	preemptive.c:84: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,_cur_thread
	add	a,#_saved_sp
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:103: __endasm;
	MOV	A, R0
	PUSH	ACC
	MOV	A, R1
	PUSH	ACC
	MOV	A, R2
	PUSH	ACC
	MOV	A, R3
	PUSH	ACC
	MOV	A, R4
	PUSH	ACC
	MOV	A, R5
	PUSH	ACC
	MOV	A, R6
	PUSH	ACC
	MOV	A, R7
	PUSH	ACC
;	preemptive.c:105: timer = timer + 1;  // enter ISR then add 1
	mov	a,_timer
	mov	r7,a
	inc	a
	mov	_timer,a
;	preemptive.c:106: if(timer == 8){ 
	mov	a,#0x08
	cjne	a,_timer,00118$
;	preemptive.c:107: timer = 0;
	mov	_timer,#0x00
;	preemptive.c:108: time = time + 1; 
	mov	a,_time
	mov	r7,a
	inc	a
	mov	_time,a
;	preemptive.c:111: do{
00118$:
;	preemptive.c:112: cur_thread = (cur_thread < 3 ) ?  (cur_thread+1) : 0;
	mov	a,#0x100 - 0x03
	add	a,_cur_thread
	jc	00123$
	mov	r7,_cur_thread
	inc	r7
	mov	a,r7
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	sjmp	00124$
00123$:
	mov	r6,#0x00
	mov	r7,#0x00
00124$:
	mov	_cur_thread,r6
;	preemptive.c:113: if( cur_thread == 0 && (mask & 1) )break;
	mov	a,_cur_thread
	jnz	00115$
	mov	a,_mask
	jb	acc.0,00120$
00115$:
;	preemptive.c:114: else if( cur_thread == 1 && (mask & 2) )break;
	mov	a,#0x01
	cjne	a,_cur_thread,00111$
	mov	a,_mask
	jb	acc.1,00120$
00111$:
;	preemptive.c:115: else if( cur_thread == 2 && (mask & 4))break;
	mov	a,#0x02
	cjne	a,_cur_thread,00107$
	mov	a,_mask
	jb	acc.2,00120$
00107$:
;	preemptive.c:116: else if( cur_thread == 3 && (mask & 8))break; 
	mov	a,#0x03
	cjne	a,_cur_thread,00118$
	mov	a,_mask
	jnb	acc.3,00118$
;	preemptive.c:117: } while (1);
00120$:
;	preemptive.c:136: __endasm;  
	POP	ACC
	MOV	R7, A
	POP	ACC
	MOV	R6, A
	POP	ACC
	MOV	R5, A
	POP	ACC
	MOV	R4, A
	POP	ACC
	MOV	R3, A
	POP	ACC
	MOV	R2, A
	POP	ACC
	MOV	R1, A
	POP	ACC
	MOV	R0, A
;	preemptive.c:137: RESTORESTATE;
	mov	a,_cur_thread
	add	a,#_saved_sp
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:138: EA = 1;                  // enable interrupts
;	assignBit
	setb	_EA
;	preemptive.c:141: __endasm;
	RETI
;	preemptive.c:143: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;------------------------------------------------------------
;	preemptive.c:151: ThreadID ThreadCreate(FunctionPtr fp) {
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemptive.c:152: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:154: if( mask == 15 )   // mask = 0b1111, max threads = four 
	mov	a,#0x0f
	cjne	a,_mask,00102$
;	preemptive.c:155: return -1;      // invalid thread ID
	mov	dpl,#0xff
	ret
00102$:
;	preemptive.c:158: if( !( mask & 1 ) ){
	mov	a,_mask
	jb	acc.0,00112$
;	preemptive.c:159: mask = mask | 1;
	orl	_mask,#0x01
;	preemptive.c:160: new_thread = 0;
	mov	_new_thread,#0x00
	sjmp	00113$
00112$:
;	preemptive.c:161: }else if( !( mask & 2 ) ){
	mov	a,_mask
	jb	acc.1,00109$
;	preemptive.c:162: mask = mask | 2;
	orl	_mask,#0x02
;	preemptive.c:163: new_thread = 1;
	mov	_new_thread,#0x01
	sjmp	00113$
00109$:
;	preemptive.c:164: }else if( !( mask & 4 ) ){
	mov	a,_mask
	jb	acc.2,00106$
;	preemptive.c:165: mask = mask | 4;
	orl	_mask,#0x04
;	preemptive.c:166: new_thread = 2;
	mov	_new_thread,#0x02
	sjmp	00113$
00106$:
;	preemptive.c:167: }else if( !( mask & 8 ) ){
	mov	a,_mask
	jb	acc.3,00113$
;	preemptive.c:168: mask = mask | 8;
	orl	_mask,#0x08
;	preemptive.c:169: new_thread = 3;
	mov	_new_thread,#0x03
00113$:
;	preemptive.c:172: sp_temp = SP;
	mov	_sp_temp,_SP
;	preemptive.c:173: SP = (0x3F) + (0x10) * new_thread; // set to the starting location for new thread
	mov	a,_new_thread
	swap	a
	anl	a,#0xf0
	mov	r7,a
	add	a,#0x3f
	mov	_SP,a
;	preemptive.c:180: __endasm;
	PUSH	DPL
	PUSH	DPH
;	preemptive.c:192: __endasm;
	ANL	A, #0
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
;	preemptive.c:200: PSW = new_thread << 3;
	mov	a,_new_thread
	mov	r7,a
	swap	a
	rr	a
	anl	a,#0xf8
	mov	_PSW,a
;	preemptive.c:203: __endasm;
	PUSH	PSW
;	preemptive.c:206: saved_sp[new_thread] = SP;
	mov	a,_new_thread
	add	a,#_saved_sp
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:208: SP = sp_temp;
	mov	_SP,_sp_temp
;	preemptive.c:210: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:211: return new_thread;
	mov	dpl,_new_thread
;	preemptive.c:214: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:225: void ThreadYield(void) {
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	preemptive.c:235: }
	setb	_ThreadYield_sloc0_1_0
	jbc	ea,00122$
	clr	_ThreadYield_sloc0_1_0
00122$:
;	preemptive.c:227: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,_cur_thread
	add	a,#_saved_sp
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:228: do{
00103$:
;	preemptive.c:229: cur_thread = (cur_thread < 3 ) ?  cur_thread+1 : 0;
	mov	a,#0x100 - 0x03
	add	a,_cur_thread
	jc	00108$
	mov	r7,_cur_thread
	inc	r7
	mov	a,r7
	mov	r6,a
	rlc	a
	subb	a,acc
	mov	r7,a
	sjmp	00109$
00108$:
	mov	r6,#0x00
	mov	r7,#0x00
00109$:
	mov	_cur_thread,r6
;	preemptive.c:230: if( mask & (1<<cur_thread) ){
	mov	r7,_cur_thread
	mov	b,r7
	inc	b
	mov	r7,#0x01
	mov	r6,#0x00
	sjmp	00125$
00124$:
	mov	a,r7
	add	a,r7
	mov	r7,a
	mov	a,r6
	rlc	a
	mov	r6,a
00125$:
	djnz	b,00124$
	mov	r4,_mask
	mov	r5,#0x00
	mov	a,r4
	anl	ar7,a
	mov	a,r5
	anl	ar6,a
	mov	a,r7
	orl	a,r6
	jz	00103$
;	preemptive.c:234: RESTORESTATE;
	mov	a,_cur_thread
	add	a,#_saved_sp
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
	mov	c,_ThreadYield_sloc0_1_0
	mov	ea,c
;	preemptive.c:236: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemptive.c:244: void ThreadExit(void) {
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	preemptive.c:245: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:249: if(cur_thread == 0) mask = mask - 1;
	mov	a,_cur_thread
	jnz	00110$
	mov	a,_mask
	mov	r7,a
	dec	a
	mov	_mask,a
	sjmp	00111$
00110$:
;	preemptive.c:250: else if( cur_thread == 1 )mask = mask - 2;
	mov	a,#0x01
	cjne	a,_cur_thread,00107$
	mov	a,_mask
	mov	r7,a
	add	a,#0xfe
	mov	_mask,a
	sjmp	00111$
00107$:
;	preemptive.c:251: else if( cur_thread == 2 )mask = mask - 4;
	mov	a,#0x02
	cjne	a,_cur_thread,00104$
	mov	a,_mask
	mov	r7,a
	add	a,#0xfc
	mov	_mask,a
	sjmp	00111$
00104$:
;	preemptive.c:252: else if( cur_thread == 3 )mask = mask - 8;
	mov	a,#0x03
	cjne	a,_cur_thread,00111$
	mov	a,_mask
	mov	r7,a
	add	a,#0xf8
	mov	_mask,a
00111$:
;	preemptive.c:254: if(  mask & 1  ){
	mov	a,_mask
	jnb	acc.0,00125$
;	preemptive.c:255: cur_thread = 0;
	mov	_cur_thread,#0x00
	sjmp	00126$
00125$:
;	preemptive.c:256: }else if(  mask & 2  ){
	mov	a,_mask
	jnb	acc.1,00122$
;	preemptive.c:257: cur_thread = 1;
	mov	_cur_thread,#0x01
	sjmp	00126$
00122$:
;	preemptive.c:258: }else if(  mask & 4  ){
	mov	a,_mask
	jnb	acc.2,00119$
;	preemptive.c:259: cur_thread = 2;
	mov	_cur_thread,#0x02
	sjmp	00126$
00119$:
;	preemptive.c:260: }else if(  mask & 8  ){
	mov	a,_mask
	jnb	acc.3,00113$
;	preemptive.c:261: cur_thread = 3;
	mov	_cur_thread,#0x03
;	preemptive.c:264: while(1){}
	sjmp	00126$
00113$:
	sjmp	00113$
00126$:
;	preemptive.c:267: RESTORESTATE;
	mov	a,_cur_thread
	add	a,#_saved_sp
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:268: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:269: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
