                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Bootstrap
                                     12 	.globl _main
                                     13 	.globl _CY
                                     14 	.globl _AC
                                     15 	.globl _F0
                                     16 	.globl _RS1
                                     17 	.globl _RS0
                                     18 	.globl _OV
                                     19 	.globl _F1
                                     20 	.globl _P
                                     21 	.globl _PS
                                     22 	.globl _PT1
                                     23 	.globl _PX1
                                     24 	.globl _PT0
                                     25 	.globl _PX0
                                     26 	.globl _RD
                                     27 	.globl _WR
                                     28 	.globl _T1
                                     29 	.globl _T0
                                     30 	.globl _INT1
                                     31 	.globl _INT0
                                     32 	.globl _TXD
                                     33 	.globl _RXD
                                     34 	.globl _P3_7
                                     35 	.globl _P3_6
                                     36 	.globl _P3_5
                                     37 	.globl _P3_4
                                     38 	.globl _P3_3
                                     39 	.globl _P3_2
                                     40 	.globl _P3_1
                                     41 	.globl _P3_0
                                     42 	.globl _EA
                                     43 	.globl _ES
                                     44 	.globl _ET1
                                     45 	.globl _EX1
                                     46 	.globl _ET0
                                     47 	.globl _EX0
                                     48 	.globl _P2_7
                                     49 	.globl _P2_6
                                     50 	.globl _P2_5
                                     51 	.globl _P2_4
                                     52 	.globl _P2_3
                                     53 	.globl _P2_2
                                     54 	.globl _P2_1
                                     55 	.globl _P2_0
                                     56 	.globl _SM0
                                     57 	.globl _SM1
                                     58 	.globl _SM2
                                     59 	.globl _REN
                                     60 	.globl _TB8
                                     61 	.globl _RB8
                                     62 	.globl _TI
                                     63 	.globl _RI
                                     64 	.globl _P1_7
                                     65 	.globl _P1_6
                                     66 	.globl _P1_5
                                     67 	.globl _P1_4
                                     68 	.globl _P1_3
                                     69 	.globl _P1_2
                                     70 	.globl _P1_1
                                     71 	.globl _P1_0
                                     72 	.globl _TF1
                                     73 	.globl _TR1
                                     74 	.globl _TF0
                                     75 	.globl _TR0
                                     76 	.globl _IE1
                                     77 	.globl _IT1
                                     78 	.globl _IE0
                                     79 	.globl _IT0
                                     80 	.globl _P0_7
                                     81 	.globl _P0_6
                                     82 	.globl _P0_5
                                     83 	.globl _P0_4
                                     84 	.globl _P0_3
                                     85 	.globl _P0_2
                                     86 	.globl _P0_1
                                     87 	.globl _P0_0
                                     88 	.globl _B
                                     89 	.globl _ACC
                                     90 	.globl _PSW
                                     91 	.globl _IP
                                     92 	.globl _P3
                                     93 	.globl _IE
                                     94 	.globl _P2
                                     95 	.globl _SBUF
                                     96 	.globl _SCON
                                     97 	.globl _P1
                                     98 	.globl _TH1
                                     99 	.globl _TH0
                                    100 	.globl _TL1
                                    101 	.globl _TL0
                                    102 	.globl _TMOD
                                    103 	.globl _TCON
                                    104 	.globl _PCON
                                    105 	.globl _DPH
                                    106 	.globl _DPL
                                    107 	.globl _SP
                                    108 	.globl _P0
                                    109 	.globl _new_thread
                                    110 	.globl _sp_temp
                                    111 	.globl _mask
                                    112 	.globl _saved_sp
                                    113 	.globl _time_temp
                                    114 	.globl _timer
                                    115 	.globl _time
                                    116 	.globl _cur_thread
                                    117 	.globl _now
                                    118 	.globl _myTimer0Handler
                                    119 	.globl _ThreadCreate
                                    120 	.globl _ThreadYield
                                    121 	.globl _ThreadExit
                                    122 ;--------------------------------------------------------
                                    123 ; special function registers
                                    124 ;--------------------------------------------------------
                                    125 	.area RSEG    (ABS,DATA)
      000000                        126 	.org 0x0000
                           000080   127 _P0	=	0x0080
                           000081   128 _SP	=	0x0081
                           000082   129 _DPL	=	0x0082
                           000083   130 _DPH	=	0x0083
                           000087   131 _PCON	=	0x0087
                           000088   132 _TCON	=	0x0088
                           000089   133 _TMOD	=	0x0089
                           00008A   134 _TL0	=	0x008a
                           00008B   135 _TL1	=	0x008b
                           00008C   136 _TH0	=	0x008c
                           00008D   137 _TH1	=	0x008d
                           000090   138 _P1	=	0x0090
                           000098   139 _SCON	=	0x0098
                           000099   140 _SBUF	=	0x0099
                           0000A0   141 _P2	=	0x00a0
                           0000A8   142 _IE	=	0x00a8
                           0000B0   143 _P3	=	0x00b0
                           0000B8   144 _IP	=	0x00b8
                           0000D0   145 _PSW	=	0x00d0
                           0000E0   146 _ACC	=	0x00e0
                           0000F0   147 _B	=	0x00f0
                                    148 ;--------------------------------------------------------
                                    149 ; special function bits
                                    150 ;--------------------------------------------------------
                                    151 	.area RSEG    (ABS,DATA)
      000000                        152 	.org 0x0000
                           000080   153 _P0_0	=	0x0080
                           000081   154 _P0_1	=	0x0081
                           000082   155 _P0_2	=	0x0082
                           000083   156 _P0_3	=	0x0083
                           000084   157 _P0_4	=	0x0084
                           000085   158 _P0_5	=	0x0085
                           000086   159 _P0_6	=	0x0086
                           000087   160 _P0_7	=	0x0087
                           000088   161 _IT0	=	0x0088
                           000089   162 _IE0	=	0x0089
                           00008A   163 _IT1	=	0x008a
                           00008B   164 _IE1	=	0x008b
                           00008C   165 _TR0	=	0x008c
                           00008D   166 _TF0	=	0x008d
                           00008E   167 _TR1	=	0x008e
                           00008F   168 _TF1	=	0x008f
                           000090   169 _P1_0	=	0x0090
                           000091   170 _P1_1	=	0x0091
                           000092   171 _P1_2	=	0x0092
                           000093   172 _P1_3	=	0x0093
                           000094   173 _P1_4	=	0x0094
                           000095   174 _P1_5	=	0x0095
                           000096   175 _P1_6	=	0x0096
                           000097   176 _P1_7	=	0x0097
                           000098   177 _RI	=	0x0098
                           000099   178 _TI	=	0x0099
                           00009A   179 _RB8	=	0x009a
                           00009B   180 _TB8	=	0x009b
                           00009C   181 _REN	=	0x009c
                           00009D   182 _SM2	=	0x009d
                           00009E   183 _SM1	=	0x009e
                           00009F   184 _SM0	=	0x009f
                           0000A0   185 _P2_0	=	0x00a0
                           0000A1   186 _P2_1	=	0x00a1
                           0000A2   187 _P2_2	=	0x00a2
                           0000A3   188 _P2_3	=	0x00a3
                           0000A4   189 _P2_4	=	0x00a4
                           0000A5   190 _P2_5	=	0x00a5
                           0000A6   191 _P2_6	=	0x00a6
                           0000A7   192 _P2_7	=	0x00a7
                           0000A8   193 _EX0	=	0x00a8
                           0000A9   194 _ET0	=	0x00a9
                           0000AA   195 _EX1	=	0x00aa
                           0000AB   196 _ET1	=	0x00ab
                           0000AC   197 _ES	=	0x00ac
                           0000AF   198 _EA	=	0x00af
                           0000B0   199 _P3_0	=	0x00b0
                           0000B1   200 _P3_1	=	0x00b1
                           0000B2   201 _P3_2	=	0x00b2
                           0000B3   202 _P3_3	=	0x00b3
                           0000B4   203 _P3_4	=	0x00b4
                           0000B5   204 _P3_5	=	0x00b5
                           0000B6   205 _P3_6	=	0x00b6
                           0000B7   206 _P3_7	=	0x00b7
                           0000B0   207 _RXD	=	0x00b0
                           0000B1   208 _TXD	=	0x00b1
                           0000B2   209 _INT0	=	0x00b2
                           0000B3   210 _INT1	=	0x00b3
                           0000B4   211 _T0	=	0x00b4
                           0000B5   212 _T1	=	0x00b5
                           0000B6   213 _WR	=	0x00b6
                           0000B7   214 _RD	=	0x00b7
                           0000B8   215 _PX0	=	0x00b8
                           0000B9   216 _PT0	=	0x00b9
                           0000BA   217 _PX1	=	0x00ba
                           0000BB   218 _PT1	=	0x00bb
                           0000BC   219 _PS	=	0x00bc
                           0000D0   220 _P	=	0x00d0
                           0000D1   221 _F1	=	0x00d1
                           0000D2   222 _OV	=	0x00d2
                           0000D3   223 _RS0	=	0x00d3
                           0000D4   224 _RS1	=	0x00d4
                           0000D5   225 _F0	=	0x00d5
                           0000D6   226 _AC	=	0x00d6
                           0000D7   227 _CY	=	0x00d7
                                    228 ;--------------------------------------------------------
                                    229 ; overlayable register banks
                                    230 ;--------------------------------------------------------
                                    231 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        232 	.ds 8
                                    233 ;--------------------------------------------------------
                                    234 ; internal ram data
                                    235 ;--------------------------------------------------------
                                    236 	.area DSEG    (DATA)
                           000035   237 _cur_thread	=	0x0035
                           000039   238 _time	=	0x0039
                           000024   239 _timer	=	0x0024
                           000020   240 _time_temp	=	0x0020
                           000030   241 _saved_sp	=	0x0030
                           000034   242 _mask	=	0x0034
                           000036   243 _sp_temp	=	0x0036
                           000037   244 _new_thread	=	0x0037
                                    245 ;--------------------------------------------------------
                                    246 ; overlayable items in internal ram
                                    247 ;--------------------------------------------------------
                                    248 	.area	OSEG    (OVR,DATA)
                                    249 ;--------------------------------------------------------
                                    250 ; indirectly addressable internal ram data
                                    251 ;--------------------------------------------------------
                                    252 	.area ISEG    (DATA)
                                    253 ;--------------------------------------------------------
                                    254 ; absolute internal ram data
                                    255 ;--------------------------------------------------------
                                    256 	.area IABS    (ABS,DATA)
                                    257 	.area IABS    (ABS,DATA)
                                    258 ;--------------------------------------------------------
                                    259 ; bit data
                                    260 ;--------------------------------------------------------
                                    261 	.area BSEG    (BIT)
      000000                        262 _ThreadYield_sloc0_1_0:
      000000                        263 	.ds 1
                                    264 ;--------------------------------------------------------
                                    265 ; paged external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area PSEG    (PAG,XDATA)
                                    268 ;--------------------------------------------------------
                                    269 ; external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area XSEG    (XDATA)
                                    272 ;--------------------------------------------------------
                                    273 ; absolute external ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area XABS    (ABS,XDATA)
                                    276 ;--------------------------------------------------------
                                    277 ; external initialized ram data
                                    278 ;--------------------------------------------------------
                                    279 	.area XISEG   (XDATA)
                                    280 	.area HOME    (CODE)
                                    281 	.area GSINIT0 (CODE)
                                    282 	.area GSINIT1 (CODE)
                                    283 	.area GSINIT2 (CODE)
                                    284 	.area GSINIT3 (CODE)
                                    285 	.area GSINIT4 (CODE)
                                    286 	.area GSINIT5 (CODE)
                                    287 	.area GSINIT  (CODE)
                                    288 	.area GSFINAL (CODE)
                                    289 	.area CSEG    (CODE)
                                    290 ;--------------------------------------------------------
                                    291 ; global & static initialisations
                                    292 ;--------------------------------------------------------
                                    293 	.area HOME    (CODE)
                                    294 	.area GSINIT  (CODE)
                                    295 	.area GSFINAL (CODE)
                                    296 	.area GSINIT  (CODE)
                                    297 ;--------------------------------------------------------
                                    298 ; Home
                                    299 ;--------------------------------------------------------
                                    300 	.area HOME    (CODE)
                                    301 	.area HOME    (CODE)
                                    302 ;--------------------------------------------------------
                                    303 ; code
                                    304 ;--------------------------------------------------------
                                    305 	.area CSEG    (CODE)
                                    306 ;------------------------------------------------------------
                                    307 ;Allocation info for local variables in function 'now'
                                    308 ;------------------------------------------------------------
                                    309 ;	preemptive.c:66: unsigned char now(void){
                                    310 ;	-----------------------------------------
                                    311 ;	 function now
                                    312 ;	-----------------------------------------
      000280                        313 _now:
                           000007   314 	ar7 = 0x07
                           000006   315 	ar6 = 0x06
                           000005   316 	ar5 = 0x05
                           000004   317 	ar4 = 0x04
                           000003   318 	ar3 = 0x03
                           000002   319 	ar2 = 0x02
                           000001   320 	ar1 = 0x01
                           000000   321 	ar0 = 0x00
                                    322 ;	preemptive.c:67: return time;
      000280 85 39 82         [24]  323 	mov	dpl,_time
                                    324 ;	preemptive.c:68: }
      000283 22               [24]  325 	ret
                                    326 ;------------------------------------------------------------
                                    327 ;Allocation info for local variables in function 'Bootstrap'
                                    328 ;------------------------------------------------------------
                                    329 ;	preemptive.c:70: void Bootstrap(void) {
                                    330 ;	-----------------------------------------
                                    331 ;	 function Bootstrap
                                    332 ;	-----------------------------------------
      000284                        333 _Bootstrap:
                                    334 ;	preemptive.c:71: mask = 0;
      000284 75 34 00         [24]  335 	mov	_mask,#0x00
                                    336 ;	preemptive.c:72: TMOD = 0;  // timer 0 mode 0 (timer 1 is already used by UART)
      000287 75 89 00         [24]  337 	mov	_TMOD,#0x00
                                    338 ;	preemptive.c:73: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
      00028A 75 A8 82         [24]  339 	mov	_IE,#0x82
                                    340 ;	preemptive.c:75: TR0 = 1; // set bit TR0 to start running timer 0
                                    341 ;	assignBit
      00028D D2 8C            [12]  342 	setb	_TR0
                                    343 ;	preemptive.c:77: cur_thread = ThreadCreate( main );
      00028F 90 01 EC         [24]  344 	mov	dptr,#_main
      000292 12 03 54         [24]  345 	lcall	_ThreadCreate
      000295 85 82 35         [24]  346 	mov	_cur_thread,dpl
                                    347 ;	preemptive.c:78: RESTORESTATE;
      000298 E5 35            [12]  348 	mov	a,_cur_thread
      00029A 24 30            [12]  349 	add	a,#_saved_sp
      00029C F9               [12]  350 	mov	r1,a
      00029D 87 81            [24]  351 	mov	_SP,@r1
      00029F D0 D0            [24]  352 	POP PSW 
      0002A1 D0 83            [24]  353 	POP DPH 
      0002A3 D0 82            [24]  354 	POP DPL 
      0002A5 D0 F0            [24]  355 	POP B 
      0002A7 D0 E0            [24]  356 	POP ACC 
                                    357 ;	preemptive.c:80: }
      0002A9 22               [24]  358 	ret
                                    359 ;------------------------------------------------------------
                                    360 ;Allocation info for local variables in function 'myTimer0Handler'
                                    361 ;------------------------------------------------------------
                                    362 ;	preemptive.c:82: void myTimer0Handler(){
                                    363 ;	-----------------------------------------
                                    364 ;	 function myTimer0Handler
                                    365 ;	-----------------------------------------
      0002AA                        366 _myTimer0Handler:
                                    367 ;	preemptive.c:83: EA = 0;             // disable interrupt
                                    368 ;	assignBit
      0002AA C2 AF            [12]  369 	clr	_EA
                                    370 ;	preemptive.c:84: SAVESTATE;
      0002AC C0 E0            [24]  371 	PUSH ACC 
      0002AE C0 F0            [24]  372 	PUSH B 
      0002B0 C0 82            [24]  373 	PUSH DPL 
      0002B2 C0 83            [24]  374 	PUSH DPH 
      0002B4 C0 D0            [24]  375 	PUSH PSW 
      0002B6 E5 35            [12]  376 	mov	a,_cur_thread
      0002B8 24 30            [12]  377 	add	a,#_saved_sp
      0002BA F8               [12]  378 	mov	r0,a
      0002BB A6 81            [24]  379 	mov	@r0,_SP
                                    380 ;	preemptive.c:103: __endasm;
      0002BD E8               [12]  381 	MOV	A, R0
      0002BE C0 E0            [24]  382 	PUSH	ACC
      0002C0 E9               [12]  383 	MOV	A, R1
      0002C1 C0 E0            [24]  384 	PUSH	ACC
      0002C3 EA               [12]  385 	MOV	A, R2
      0002C4 C0 E0            [24]  386 	PUSH	ACC
      0002C6 EB               [12]  387 	MOV	A, R3
      0002C7 C0 E0            [24]  388 	PUSH	ACC
      0002C9 EC               [12]  389 	MOV	A, R4
      0002CA C0 E0            [24]  390 	PUSH	ACC
      0002CC ED               [12]  391 	MOV	A, R5
      0002CD C0 E0            [24]  392 	PUSH	ACC
      0002CF EE               [12]  393 	MOV	A, R6
      0002D0 C0 E0            [24]  394 	PUSH	ACC
      0002D2 EF               [12]  395 	MOV	A, R7
      0002D3 C0 E0            [24]  396 	PUSH	ACC
                                    397 ;	preemptive.c:105: timer = timer + 1;  // enter ISR then add 1
      0002D5 E5 24            [12]  398 	mov	a,_timer
      0002D7 FF               [12]  399 	mov	r7,a
      0002D8 04               [12]  400 	inc	a
      0002D9 F5 24            [12]  401 	mov	_timer,a
                                    402 ;	preemptive.c:106: if(timer == 8){ 
      0002DB 74 08            [12]  403 	mov	a,#0x08
      0002DD B5 24 09         [24]  404 	cjne	a,_timer,00118$
                                    405 ;	preemptive.c:107: timer = 0;
      0002E0 75 24 00         [24]  406 	mov	_timer,#0x00
                                    407 ;	preemptive.c:108: time = time + 1; 
      0002E3 E5 39            [12]  408 	mov	a,_time
      0002E5 FF               [12]  409 	mov	r7,a
      0002E6 04               [12]  410 	inc	a
      0002E7 F5 39            [12]  411 	mov	_time,a
                                    412 ;	preemptive.c:111: do{
      0002E9                        413 00118$:
                                    414 ;	preemptive.c:112: cur_thread = (cur_thread < 3 ) ?  (cur_thread+1) : 0;
      0002E9 74 FD            [12]  415 	mov	a,#0x100 - 0x03
      0002EB 25 35            [12]  416 	add	a,_cur_thread
      0002ED 40 0B            [24]  417 	jc	00123$
      0002EF AF 35            [24]  418 	mov	r7,_cur_thread
      0002F1 0F               [12]  419 	inc	r7
      0002F2 EF               [12]  420 	mov	a,r7
      0002F3 FE               [12]  421 	mov	r6,a
      0002F4 33               [12]  422 	rlc	a
      0002F5 95 E0            [12]  423 	subb	a,acc
      0002F7 FF               [12]  424 	mov	r7,a
      0002F8 80 04            [24]  425 	sjmp	00124$
      0002FA                        426 00123$:
      0002FA 7E 00            [12]  427 	mov	r6,#0x00
      0002FC 7F 00            [12]  428 	mov	r7,#0x00
      0002FE                        429 00124$:
      0002FE 8E 35            [24]  430 	mov	_cur_thread,r6
                                    431 ;	preemptive.c:113: if( cur_thread == 0 && (mask & 1) )break;
      000300 E5 35            [12]  432 	mov	a,_cur_thread
      000302 70 05            [24]  433 	jnz	00115$
      000304 E5 34            [12]  434 	mov	a,_mask
      000306 20 E0 1E         [24]  435 	jb	acc.0,00120$
      000309                        436 00115$:
                                    437 ;	preemptive.c:114: else if( cur_thread == 1 && (mask & 2) )break;
      000309 74 01            [12]  438 	mov	a,#0x01
      00030B B5 35 05         [24]  439 	cjne	a,_cur_thread,00111$
      00030E E5 34            [12]  440 	mov	a,_mask
      000310 20 E1 14         [24]  441 	jb	acc.1,00120$
      000313                        442 00111$:
                                    443 ;	preemptive.c:115: else if( cur_thread == 2 && (mask & 4))break;
      000313 74 02            [12]  444 	mov	a,#0x02
      000315 B5 35 05         [24]  445 	cjne	a,_cur_thread,00107$
      000318 E5 34            [12]  446 	mov	a,_mask
      00031A 20 E2 0A         [24]  447 	jb	acc.2,00120$
      00031D                        448 00107$:
                                    449 ;	preemptive.c:116: else if( cur_thread == 3 && (mask & 8))break; 
      00031D 74 03            [12]  450 	mov	a,#0x03
      00031F B5 35 C7         [24]  451 	cjne	a,_cur_thread,00118$
      000322 E5 34            [12]  452 	mov	a,_mask
      000324 30 E3 C2         [24]  453 	jnb	acc.3,00118$
                                    454 ;	preemptive.c:117: } while (1);
      000327                        455 00120$:
                                    456 ;	preemptive.c:136: __endasm;  
      000327 D0 E0            [24]  457 	POP	ACC
      000329 FF               [12]  458 	MOV	R7, A
      00032A D0 E0            [24]  459 	POP	ACC
      00032C FE               [12]  460 	MOV	R6, A
      00032D D0 E0            [24]  461 	POP	ACC
      00032F FD               [12]  462 	MOV	R5, A
      000330 D0 E0            [24]  463 	POP	ACC
      000332 FC               [12]  464 	MOV	R4, A
      000333 D0 E0            [24]  465 	POP	ACC
      000335 FB               [12]  466 	MOV	R3, A
      000336 D0 E0            [24]  467 	POP	ACC
      000338 FA               [12]  468 	MOV	R2, A
      000339 D0 E0            [24]  469 	POP	ACC
      00033B F9               [12]  470 	MOV	R1, A
      00033C D0 E0            [24]  471 	POP	ACC
      00033E F8               [12]  472 	MOV	R0, A
                                    473 ;	preemptive.c:137: RESTORESTATE;
      00033F E5 35            [12]  474 	mov	a,_cur_thread
      000341 24 30            [12]  475 	add	a,#_saved_sp
      000343 F9               [12]  476 	mov	r1,a
      000344 87 81            [24]  477 	mov	_SP,@r1
      000346 D0 D0            [24]  478 	POP PSW 
      000348 D0 83            [24]  479 	POP DPH 
      00034A D0 82            [24]  480 	POP DPL 
      00034C D0 F0            [24]  481 	POP B 
      00034E D0 E0            [24]  482 	POP ACC 
                                    483 ;	preemptive.c:138: EA = 1;                  // enable interrupts
                                    484 ;	assignBit
      000350 D2 AF            [12]  485 	setb	_EA
                                    486 ;	preemptive.c:141: __endasm;
      000352 32               [24]  487 	RETI
                                    488 ;	preemptive.c:143: }
      000353 22               [24]  489 	ret
                                    490 ;------------------------------------------------------------
                                    491 ;Allocation info for local variables in function 'ThreadCreate'
                                    492 ;------------------------------------------------------------
                                    493 ;fp                        Allocated to registers 
                                    494 ;------------------------------------------------------------
                                    495 ;	preemptive.c:151: ThreadID ThreadCreate(FunctionPtr fp) {
                                    496 ;	-----------------------------------------
                                    497 ;	 function ThreadCreate
                                    498 ;	-----------------------------------------
      000354                        499 _ThreadCreate:
                                    500 ;	preemptive.c:152: EA = 0;
                                    501 ;	assignBit
      000354 C2 AF            [12]  502 	clr	_EA
                                    503 ;	preemptive.c:154: if( mask == 15 )   // mask = 0b1111, max threads = four 
      000356 74 0F            [12]  504 	mov	a,#0x0f
      000358 B5 34 04         [24]  505 	cjne	a,_mask,00102$
                                    506 ;	preemptive.c:155: return -1;      // invalid thread ID
      00035B 75 82 FF         [24]  507 	mov	dpl,#0xff
      00035E 22               [24]  508 	ret
      00035F                        509 00102$:
                                    510 ;	preemptive.c:158: if( !( mask & 1 ) ){
      00035F E5 34            [12]  511 	mov	a,_mask
      000361 20 E0 08         [24]  512 	jb	acc.0,00112$
                                    513 ;	preemptive.c:159: mask = mask | 1;
      000364 43 34 01         [24]  514 	orl	_mask,#0x01
                                    515 ;	preemptive.c:160: new_thread = 0;
      000367 75 37 00         [24]  516 	mov	_new_thread,#0x00
      00036A 80 25            [24]  517 	sjmp	00113$
      00036C                        518 00112$:
                                    519 ;	preemptive.c:161: }else if( !( mask & 2 ) ){
      00036C E5 34            [12]  520 	mov	a,_mask
      00036E 20 E1 08         [24]  521 	jb	acc.1,00109$
                                    522 ;	preemptive.c:162: mask = mask | 2;
      000371 43 34 02         [24]  523 	orl	_mask,#0x02
                                    524 ;	preemptive.c:163: new_thread = 1;
      000374 75 37 01         [24]  525 	mov	_new_thread,#0x01
      000377 80 18            [24]  526 	sjmp	00113$
      000379                        527 00109$:
                                    528 ;	preemptive.c:164: }else if( !( mask & 4 ) ){
      000379 E5 34            [12]  529 	mov	a,_mask
      00037B 20 E2 08         [24]  530 	jb	acc.2,00106$
                                    531 ;	preemptive.c:165: mask = mask | 4;
      00037E 43 34 04         [24]  532 	orl	_mask,#0x04
                                    533 ;	preemptive.c:166: new_thread = 2;
      000381 75 37 02         [24]  534 	mov	_new_thread,#0x02
      000384 80 0B            [24]  535 	sjmp	00113$
      000386                        536 00106$:
                                    537 ;	preemptive.c:167: }else if( !( mask & 8 ) ){
      000386 E5 34            [12]  538 	mov	a,_mask
      000388 20 E3 06         [24]  539 	jb	acc.3,00113$
                                    540 ;	preemptive.c:168: mask = mask | 8;
      00038B 43 34 08         [24]  541 	orl	_mask,#0x08
                                    542 ;	preemptive.c:169: new_thread = 3;
      00038E 75 37 03         [24]  543 	mov	_new_thread,#0x03
      000391                        544 00113$:
                                    545 ;	preemptive.c:172: sp_temp = SP;
      000391 85 81 36         [24]  546 	mov	_sp_temp,_SP
                                    547 ;	preemptive.c:173: SP = (0x3F) + (0x10) * new_thread; // set to the starting location for new thread
      000394 E5 37            [12]  548 	mov	a,_new_thread
      000396 C4               [12]  549 	swap	a
      000397 54 F0            [12]  550 	anl	a,#0xf0
      000399 FF               [12]  551 	mov	r7,a
      00039A 24 3F            [12]  552 	add	a,#0x3f
      00039C F5 81            [12]  553 	mov	_SP,a
                                    554 ;	preemptive.c:180: __endasm;
      00039E C0 82            [24]  555 	PUSH	DPL
      0003A0 C0 83            [24]  556 	PUSH	DPH
                                    557 ;	preemptive.c:192: __endasm;
      0003A2 54 00            [12]  558 	ANL	A, #0
      0003A4 C0 E0            [24]  559 	PUSH	ACC
      0003A6 C0 E0            [24]  560 	PUSH	ACC
      0003A8 C0 E0            [24]  561 	PUSH	ACC
      0003AA C0 E0            [24]  562 	PUSH	ACC
                                    563 ;	preemptive.c:200: PSW = new_thread << 3;
      0003AC E5 37            [12]  564 	mov	a,_new_thread
      0003AE FF               [12]  565 	mov	r7,a
      0003AF C4               [12]  566 	swap	a
      0003B0 03               [12]  567 	rr	a
      0003B1 54 F8            [12]  568 	anl	a,#0xf8
      0003B3 F5 D0            [12]  569 	mov	_PSW,a
                                    570 ;	preemptive.c:203: __endasm;
      0003B5 C0 D0            [24]  571 	PUSH	PSW
                                    572 ;	preemptive.c:206: saved_sp[new_thread] = SP;
      0003B7 E5 37            [12]  573 	mov	a,_new_thread
      0003B9 24 30            [12]  574 	add	a,#_saved_sp
      0003BB F8               [12]  575 	mov	r0,a
      0003BC A6 81            [24]  576 	mov	@r0,_SP
                                    577 ;	preemptive.c:208: SP = sp_temp;
      0003BE 85 36 81         [24]  578 	mov	_SP,_sp_temp
                                    579 ;	preemptive.c:210: EA = 1;
                                    580 ;	assignBit
      0003C1 D2 AF            [12]  581 	setb	_EA
                                    582 ;	preemptive.c:211: return new_thread;
      0003C3 85 37 82         [24]  583 	mov	dpl,_new_thread
                                    584 ;	preemptive.c:214: }
      0003C6 22               [24]  585 	ret
                                    586 ;------------------------------------------------------------
                                    587 ;Allocation info for local variables in function 'ThreadYield'
                                    588 ;------------------------------------------------------------
                                    589 ;	preemptive.c:225: void ThreadYield(void) {
                                    590 ;	-----------------------------------------
                                    591 ;	 function ThreadYield
                                    592 ;	-----------------------------------------
      0003C7                        593 _ThreadYield:
                                    594 ;	preemptive.c:235: }
      0003C7 D2 00            [12]  595 	setb	_ThreadYield_sloc0_1_0
      0003C9 10 AF 02         [24]  596 	jbc	ea,00122$
      0003CC C2 00            [12]  597 	clr	_ThreadYield_sloc0_1_0
      0003CE                        598 00122$:
                                    599 ;	preemptive.c:227: SAVESTATE;
      0003CE C0 E0            [24]  600 	PUSH ACC 
      0003D0 C0 F0            [24]  601 	PUSH B 
      0003D2 C0 82            [24]  602 	PUSH DPL 
      0003D4 C0 83            [24]  603 	PUSH DPH 
      0003D6 C0 D0            [24]  604 	PUSH PSW 
      0003D8 E5 35            [12]  605 	mov	a,_cur_thread
      0003DA 24 30            [12]  606 	add	a,#_saved_sp
      0003DC F8               [12]  607 	mov	r0,a
      0003DD A6 81            [24]  608 	mov	@r0,_SP
                                    609 ;	preemptive.c:228: do{
      0003DF                        610 00103$:
                                    611 ;	preemptive.c:229: cur_thread = (cur_thread < 3 ) ?  cur_thread+1 : 0;
      0003DF 74 FD            [12]  612 	mov	a,#0x100 - 0x03
      0003E1 25 35            [12]  613 	add	a,_cur_thread
      0003E3 40 0B            [24]  614 	jc	00108$
      0003E5 AF 35            [24]  615 	mov	r7,_cur_thread
      0003E7 0F               [12]  616 	inc	r7
      0003E8 EF               [12]  617 	mov	a,r7
      0003E9 FE               [12]  618 	mov	r6,a
      0003EA 33               [12]  619 	rlc	a
      0003EB 95 E0            [12]  620 	subb	a,acc
      0003ED FF               [12]  621 	mov	r7,a
      0003EE 80 04            [24]  622 	sjmp	00109$
      0003F0                        623 00108$:
      0003F0 7E 00            [12]  624 	mov	r6,#0x00
      0003F2 7F 00            [12]  625 	mov	r7,#0x00
      0003F4                        626 00109$:
      0003F4 8E 35            [24]  627 	mov	_cur_thread,r6
                                    628 ;	preemptive.c:230: if( mask & (1<<cur_thread) ){
      0003F6 AF 35            [24]  629 	mov	r7,_cur_thread
      0003F8 8F F0            [24]  630 	mov	b,r7
      0003FA 05 F0            [12]  631 	inc	b
      0003FC 7F 01            [12]  632 	mov	r7,#0x01
      0003FE 7E 00            [12]  633 	mov	r6,#0x00
      000400 80 06            [24]  634 	sjmp	00125$
      000402                        635 00124$:
      000402 EF               [12]  636 	mov	a,r7
      000403 2F               [12]  637 	add	a,r7
      000404 FF               [12]  638 	mov	r7,a
      000405 EE               [12]  639 	mov	a,r6
      000406 33               [12]  640 	rlc	a
      000407 FE               [12]  641 	mov	r6,a
      000408                        642 00125$:
      000408 D5 F0 F7         [24]  643 	djnz	b,00124$
      00040B AC 34            [24]  644 	mov	r4,_mask
      00040D 7D 00            [12]  645 	mov	r5,#0x00
      00040F EC               [12]  646 	mov	a,r4
      000410 52 07            [12]  647 	anl	ar7,a
      000412 ED               [12]  648 	mov	a,r5
      000413 52 06            [12]  649 	anl	ar6,a
      000415 EF               [12]  650 	mov	a,r7
      000416 4E               [12]  651 	orl	a,r6
      000417 60 C6            [24]  652 	jz	00103$
                                    653 ;	preemptive.c:234: RESTORESTATE;
      000419 E5 35            [12]  654 	mov	a,_cur_thread
      00041B 24 30            [12]  655 	add	a,#_saved_sp
      00041D F9               [12]  656 	mov	r1,a
      00041E 87 81            [24]  657 	mov	_SP,@r1
      000420 D0 D0            [24]  658 	POP PSW 
      000422 D0 83            [24]  659 	POP DPH 
      000424 D0 82            [24]  660 	POP DPL 
      000426 D0 F0            [24]  661 	POP B 
      000428 D0 E0            [24]  662 	POP ACC 
      00042A A2 00            [12]  663 	mov	c,_ThreadYield_sloc0_1_0
      00042C 92 AF            [24]  664 	mov	ea,c
                                    665 ;	preemptive.c:236: }
      00042E 22               [24]  666 	ret
                                    667 ;------------------------------------------------------------
                                    668 ;Allocation info for local variables in function 'ThreadExit'
                                    669 ;------------------------------------------------------------
                                    670 ;	preemptive.c:244: void ThreadExit(void) {
                                    671 ;	-----------------------------------------
                                    672 ;	 function ThreadExit
                                    673 ;	-----------------------------------------
      00042F                        674 _ThreadExit:
                                    675 ;	preemptive.c:245: EA = 0;
                                    676 ;	assignBit
      00042F C2 AF            [12]  677 	clr	_EA
                                    678 ;	preemptive.c:249: if(cur_thread == 0) mask = mask - 1;
      000431 E5 35            [12]  679 	mov	a,_cur_thread
      000433 70 08            [24]  680 	jnz	00110$
      000435 E5 34            [12]  681 	mov	a,_mask
      000437 FF               [12]  682 	mov	r7,a
      000438 14               [12]  683 	dec	a
      000439 F5 34            [12]  684 	mov	_mask,a
      00043B 80 28            [24]  685 	sjmp	00111$
      00043D                        686 00110$:
                                    687 ;	preemptive.c:250: else if( cur_thread == 1 )mask = mask - 2;
      00043D 74 01            [12]  688 	mov	a,#0x01
      00043F B5 35 09         [24]  689 	cjne	a,_cur_thread,00107$
      000442 E5 34            [12]  690 	mov	a,_mask
      000444 FF               [12]  691 	mov	r7,a
      000445 24 FE            [12]  692 	add	a,#0xfe
      000447 F5 34            [12]  693 	mov	_mask,a
      000449 80 1A            [24]  694 	sjmp	00111$
      00044B                        695 00107$:
                                    696 ;	preemptive.c:251: else if( cur_thread == 2 )mask = mask - 4;
      00044B 74 02            [12]  697 	mov	a,#0x02
      00044D B5 35 09         [24]  698 	cjne	a,_cur_thread,00104$
      000450 E5 34            [12]  699 	mov	a,_mask
      000452 FF               [12]  700 	mov	r7,a
      000453 24 FC            [12]  701 	add	a,#0xfc
      000455 F5 34            [12]  702 	mov	_mask,a
      000457 80 0C            [24]  703 	sjmp	00111$
      000459                        704 00104$:
                                    705 ;	preemptive.c:252: else if( cur_thread == 3 )mask = mask - 8;
      000459 74 03            [12]  706 	mov	a,#0x03
      00045B B5 35 07         [24]  707 	cjne	a,_cur_thread,00111$
      00045E E5 34            [12]  708 	mov	a,_mask
      000460 FF               [12]  709 	mov	r7,a
      000461 24 F8            [12]  710 	add	a,#0xf8
      000463 F5 34            [12]  711 	mov	_mask,a
      000465                        712 00111$:
                                    713 ;	preemptive.c:254: if(  mask & 1  ){
      000465 E5 34            [12]  714 	mov	a,_mask
      000467 30 E0 05         [24]  715 	jnb	acc.0,00125$
                                    716 ;	preemptive.c:255: cur_thread = 0;
      00046A 75 35 00         [24]  717 	mov	_cur_thread,#0x00
      00046D 80 20            [24]  718 	sjmp	00126$
      00046F                        719 00125$:
                                    720 ;	preemptive.c:256: }else if(  mask & 2  ){
      00046F E5 34            [12]  721 	mov	a,_mask
      000471 30 E1 05         [24]  722 	jnb	acc.1,00122$
                                    723 ;	preemptive.c:257: cur_thread = 1;
      000474 75 35 01         [24]  724 	mov	_cur_thread,#0x01
      000477 80 16            [24]  725 	sjmp	00126$
      000479                        726 00122$:
                                    727 ;	preemptive.c:258: }else if(  mask & 4  ){
      000479 E5 34            [12]  728 	mov	a,_mask
      00047B 30 E2 05         [24]  729 	jnb	acc.2,00119$
                                    730 ;	preemptive.c:259: cur_thread = 2;
      00047E 75 35 02         [24]  731 	mov	_cur_thread,#0x02
      000481 80 0C            [24]  732 	sjmp	00126$
      000483                        733 00119$:
                                    734 ;	preemptive.c:260: }else if(  mask & 8  ){
      000483 E5 34            [12]  735 	mov	a,_mask
      000485 30 E3 05         [24]  736 	jnb	acc.3,00113$
                                    737 ;	preemptive.c:261: cur_thread = 3;
      000488 75 35 03         [24]  738 	mov	_cur_thread,#0x03
                                    739 ;	preemptive.c:264: while(1){}
      00048B 80 02            [24]  740 	sjmp	00126$
      00048D                        741 00113$:
      00048D 80 FE            [24]  742 	sjmp	00113$
      00048F                        743 00126$:
                                    744 ;	preemptive.c:267: RESTORESTATE;
      00048F E5 35            [12]  745 	mov	a,_cur_thread
      000491 24 30            [12]  746 	add	a,#_saved_sp
      000493 F9               [12]  747 	mov	r1,a
      000494 87 81            [24]  748 	mov	_SP,@r1
      000496 D0 D0            [24]  749 	POP PSW 
      000498 D0 83            [24]  750 	POP DPH 
      00049A D0 82            [24]  751 	POP DPL 
      00049C D0 F0            [24]  752 	POP B 
      00049E D0 E0            [24]  753 	POP ACC 
                                    754 ;	preemptive.c:268: EA = 1;
                                    755 ;	assignBit
      0004A0 D2 AF            [12]  756 	setb	_EA
                                    757 ;	preemptive.c:269: }
      0004A2 22               [24]  758 	ret
                                    759 	.area CSEG    (CODE)
                                    760 	.area CONST   (CODE)
                                    761 	.area XINIT   (CODE)
                                    762 	.area CABS    (ABS,CODE)
