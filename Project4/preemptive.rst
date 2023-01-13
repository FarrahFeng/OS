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
                                    109 	.globl _i
                                    110 	.globl _next_thread
                                    111 	.globl _new_thread
                                    112 	.globl _sp_temp
                                    113 	.globl _cur_thread
                                    114 	.globl _mask
                                    115 	.globl _saved_sp
                                    116 	.globl _myTimer0Handler
                                    117 	.globl _ThreadCreate
                                    118 	.globl _ThreadYield
                                    119 	.globl _ThreadExit
                                    120 ;--------------------------------------------------------
                                    121 ; special function registers
                                    122 ;--------------------------------------------------------
                                    123 	.area RSEG    (ABS,DATA)
      000000                        124 	.org 0x0000
                           000080   125 _P0	=	0x0080
                           000081   126 _SP	=	0x0081
                           000082   127 _DPL	=	0x0082
                           000083   128 _DPH	=	0x0083
                           000087   129 _PCON	=	0x0087
                           000088   130 _TCON	=	0x0088
                           000089   131 _TMOD	=	0x0089
                           00008A   132 _TL0	=	0x008a
                           00008B   133 _TL1	=	0x008b
                           00008C   134 _TH0	=	0x008c
                           00008D   135 _TH1	=	0x008d
                           000090   136 _P1	=	0x0090
                           000098   137 _SCON	=	0x0098
                           000099   138 _SBUF	=	0x0099
                           0000A0   139 _P2	=	0x00a0
                           0000A8   140 _IE	=	0x00a8
                           0000B0   141 _P3	=	0x00b0
                           0000B8   142 _IP	=	0x00b8
                           0000D0   143 _PSW	=	0x00d0
                           0000E0   144 _ACC	=	0x00e0
                           0000F0   145 _B	=	0x00f0
                                    146 ;--------------------------------------------------------
                                    147 ; special function bits
                                    148 ;--------------------------------------------------------
                                    149 	.area RSEG    (ABS,DATA)
      000000                        150 	.org 0x0000
                           000080   151 _P0_0	=	0x0080
                           000081   152 _P0_1	=	0x0081
                           000082   153 _P0_2	=	0x0082
                           000083   154 _P0_3	=	0x0083
                           000084   155 _P0_4	=	0x0084
                           000085   156 _P0_5	=	0x0085
                           000086   157 _P0_6	=	0x0086
                           000087   158 _P0_7	=	0x0087
                           000088   159 _IT0	=	0x0088
                           000089   160 _IE0	=	0x0089
                           00008A   161 _IT1	=	0x008a
                           00008B   162 _IE1	=	0x008b
                           00008C   163 _TR0	=	0x008c
                           00008D   164 _TF0	=	0x008d
                           00008E   165 _TR1	=	0x008e
                           00008F   166 _TF1	=	0x008f
                           000090   167 _P1_0	=	0x0090
                           000091   168 _P1_1	=	0x0091
                           000092   169 _P1_2	=	0x0092
                           000093   170 _P1_3	=	0x0093
                           000094   171 _P1_4	=	0x0094
                           000095   172 _P1_5	=	0x0095
                           000096   173 _P1_6	=	0x0096
                           000097   174 _P1_7	=	0x0097
                           000098   175 _RI	=	0x0098
                           000099   176 _TI	=	0x0099
                           00009A   177 _RB8	=	0x009a
                           00009B   178 _TB8	=	0x009b
                           00009C   179 _REN	=	0x009c
                           00009D   180 _SM2	=	0x009d
                           00009E   181 _SM1	=	0x009e
                           00009F   182 _SM0	=	0x009f
                           0000A0   183 _P2_0	=	0x00a0
                           0000A1   184 _P2_1	=	0x00a1
                           0000A2   185 _P2_2	=	0x00a2
                           0000A3   186 _P2_3	=	0x00a3
                           0000A4   187 _P2_4	=	0x00a4
                           0000A5   188 _P2_5	=	0x00a5
                           0000A6   189 _P2_6	=	0x00a6
                           0000A7   190 _P2_7	=	0x00a7
                           0000A8   191 _EX0	=	0x00a8
                           0000A9   192 _ET0	=	0x00a9
                           0000AA   193 _EX1	=	0x00aa
                           0000AB   194 _ET1	=	0x00ab
                           0000AC   195 _ES	=	0x00ac
                           0000AF   196 _EA	=	0x00af
                           0000B0   197 _P3_0	=	0x00b0
                           0000B1   198 _P3_1	=	0x00b1
                           0000B2   199 _P3_2	=	0x00b2
                           0000B3   200 _P3_3	=	0x00b3
                           0000B4   201 _P3_4	=	0x00b4
                           0000B5   202 _P3_5	=	0x00b5
                           0000B6   203 _P3_6	=	0x00b6
                           0000B7   204 _P3_7	=	0x00b7
                           0000B0   205 _RXD	=	0x00b0
                           0000B1   206 _TXD	=	0x00b1
                           0000B2   207 _INT0	=	0x00b2
                           0000B3   208 _INT1	=	0x00b3
                           0000B4   209 _T0	=	0x00b4
                           0000B5   210 _T1	=	0x00b5
                           0000B6   211 _WR	=	0x00b6
                           0000B7   212 _RD	=	0x00b7
                           0000B8   213 _PX0	=	0x00b8
                           0000B9   214 _PT0	=	0x00b9
                           0000BA   215 _PX1	=	0x00ba
                           0000BB   216 _PT1	=	0x00bb
                           0000BC   217 _PS	=	0x00bc
                           0000D0   218 _P	=	0x00d0
                           0000D1   219 _F1	=	0x00d1
                           0000D2   220 _OV	=	0x00d2
                           0000D3   221 _RS0	=	0x00d3
                           0000D4   222 _RS1	=	0x00d4
                           0000D5   223 _F0	=	0x00d5
                           0000D6   224 _AC	=	0x00d6
                           0000D7   225 _CY	=	0x00d7
                                    226 ;--------------------------------------------------------
                                    227 ; overlayable register banks
                                    228 ;--------------------------------------------------------
                                    229 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        230 	.ds 8
                                    231 ;--------------------------------------------------------
                                    232 ; internal ram data
                                    233 ;--------------------------------------------------------
                                    234 	.area DSEG    (DATA)
                           000030   235 _saved_sp	=	0x0030
                           000034   236 _mask	=	0x0034
                           000035   237 _cur_thread	=	0x0035
                           000036   238 _sp_temp	=	0x0036
                           000037   239 _new_thread	=	0x0037
                           000038   240 _next_thread	=	0x0038
                           000039   241 _i	=	0x0039
                                    242 ;--------------------------------------------------------
                                    243 ; overlayable items in internal ram
                                    244 ;--------------------------------------------------------
                                    245 	.area	OSEG    (OVR,DATA)
                                    246 ;--------------------------------------------------------
                                    247 ; indirectly addressable internal ram data
                                    248 ;--------------------------------------------------------
                                    249 	.area ISEG    (DATA)
                                    250 ;--------------------------------------------------------
                                    251 ; absolute internal ram data
                                    252 ;--------------------------------------------------------
                                    253 	.area IABS    (ABS,DATA)
                                    254 	.area IABS    (ABS,DATA)
                                    255 ;--------------------------------------------------------
                                    256 ; bit data
                                    257 ;--------------------------------------------------------
                                    258 	.area BSEG    (BIT)
      000003                        259 _ThreadCreate_sloc0_1_0:
      000003                        260 	.ds 1
      000004                        261 _ThreadYield_sloc0_1_0:
      000004                        262 	.ds 1
      000005                        263 _ThreadExit_sloc0_1_0:
      000005                        264 	.ds 1
                                    265 ;--------------------------------------------------------
                                    266 ; paged external ram data
                                    267 ;--------------------------------------------------------
                                    268 	.area PSEG    (PAG,XDATA)
                                    269 ;--------------------------------------------------------
                                    270 ; external ram data
                                    271 ;--------------------------------------------------------
                                    272 	.area XSEG    (XDATA)
                                    273 ;--------------------------------------------------------
                                    274 ; absolute external ram data
                                    275 ;--------------------------------------------------------
                                    276 	.area XABS    (ABS,XDATA)
                                    277 ;--------------------------------------------------------
                                    278 ; external initialized ram data
                                    279 ;--------------------------------------------------------
                                    280 	.area XISEG   (XDATA)
                                    281 	.area HOME    (CODE)
                                    282 	.area GSINIT0 (CODE)
                                    283 	.area GSINIT1 (CODE)
                                    284 	.area GSINIT2 (CODE)
                                    285 	.area GSINIT3 (CODE)
                                    286 	.area GSINIT4 (CODE)
                                    287 	.area GSINIT5 (CODE)
                                    288 	.area GSINIT  (CODE)
                                    289 	.area GSFINAL (CODE)
                                    290 	.area CSEG    (CODE)
                                    291 ;--------------------------------------------------------
                                    292 ; global & static initialisations
                                    293 ;--------------------------------------------------------
                                    294 	.area HOME    (CODE)
                                    295 	.area GSINIT  (CODE)
                                    296 	.area GSFINAL (CODE)
                                    297 	.area GSINIT  (CODE)
                                    298 ;--------------------------------------------------------
                                    299 ; Home
                                    300 ;--------------------------------------------------------
                                    301 	.area HOME    (CODE)
                                    302 	.area HOME    (CODE)
                                    303 ;--------------------------------------------------------
                                    304 ; code
                                    305 ;--------------------------------------------------------
                                    306 	.area CSEG    (CODE)
                                    307 ;------------------------------------------------------------
                                    308 ;Allocation info for local variables in function 'Bootstrap'
                                    309 ;------------------------------------------------------------
                                    310 ;	preemptive.c:57: void Bootstrap(void) {
                                    311 ;	-----------------------------------------
                                    312 ;	 function Bootstrap
                                    313 ;	-----------------------------------------
      000109                        314 _Bootstrap:
                           000007   315 	ar7 = 0x07
                           000006   316 	ar6 = 0x06
                           000005   317 	ar5 = 0x05
                           000004   318 	ar4 = 0x04
                           000003   319 	ar3 = 0x03
                           000002   320 	ar2 = 0x02
                           000001   321 	ar1 = 0x01
                           000000   322 	ar0 = 0x00
                                    323 ;	preemptive.c:58: mask = 0;
      000109 75 34 00         [24]  324 	mov	_mask,#0x00
                                    325 ;	preemptive.c:59: TMOD = 0;  // timer 0 mode 0
      00010C 75 89 00         [24]  326 	mov	_TMOD,#0x00
                                    327 ;	preemptive.c:60: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
      00010F 75 A8 82         [24]  328 	mov	_IE,#0x82
                                    329 ;	preemptive.c:62: TR0 = 1; // set bit TR0 to start running timer 0
                                    330 ;	assignBit
      000112 D2 8C            [12]  331 	setb	_TR0
                                    332 ;	preemptive.c:63: cur_thread = ThreadCreate( main );
      000114 90 00 E0         [24]  333 	mov	dptr,#_main
      000117 12 01 C5         [24]  334 	lcall	_ThreadCreate
      00011A 85 82 35         [24]  335 	mov	_cur_thread,dpl
                                    336 ;	preemptive.c:64: RESTORESTATE;
      00011D E5 35            [12]  337 	mov	a,_cur_thread
      00011F 24 30            [12]  338 	add	a,#_saved_sp
      000121 F9               [12]  339 	mov	r1,a
      000122 87 81            [24]  340 	mov	_SP,@r1
      000124 D0 D0            [24]  341 	POP PSW 
      000126 D0 83            [24]  342 	POP DPH 
      000128 D0 82            [24]  343 	POP DPL 
      00012A D0 F0            [24]  344 	POP B 
      00012C D0 E0            [24]  345 	POP ACC 
                                    346 ;	preemptive.c:66: }
      00012E 22               [24]  347 	ret
                                    348 ;------------------------------------------------------------
                                    349 ;Allocation info for local variables in function 'myTimer0Handler'
                                    350 ;------------------------------------------------------------
                                    351 ;	preemptive.c:67: void myTimer0Handler(){
                                    352 ;	-----------------------------------------
                                    353 ;	 function myTimer0Handler
                                    354 ;	-----------------------------------------
      00012F                        355 _myTimer0Handler:
                                    356 ;	preemptive.c:68: EA = 0;
                                    357 ;	assignBit
      00012F C2 AF            [12]  358 	clr	_EA
                                    359 ;	preemptive.c:69: SAVESTATE;
      000131 C0 E0            [24]  360 	PUSH ACC 
      000133 C0 F0            [24]  361 	PUSH B 
      000135 C0 82            [24]  362 	PUSH DPL 
      000137 C0 83            [24]  363 	PUSH DPH 
      000139 C0 D0            [24]  364 	PUSH PSW 
      00013B E5 35            [12]  365 	mov	a,_cur_thread
      00013D 24 30            [12]  366 	add	a,#_saved_sp
      00013F F8               [12]  367 	mov	r0,a
      000140 A6 81            [24]  368 	mov	@r0,_SP
                                    369 ;	preemptive.c:87: __endasm;
      000142 E8               [12]  370 	MOV	A, R0
      000143 C0 E0            [24]  371 	PUSH	ACC
      000145 E9               [12]  372 	MOV	A, R1
      000146 C0 E0            [24]  373 	PUSH	ACC
      000148 EA               [12]  374 	MOV	A, R2
      000149 C0 E0            [24]  375 	PUSH	ACC
      00014B EB               [12]  376 	MOV	A, R3
      00014C C0 E0            [24]  377 	PUSH	ACC
      00014E EC               [12]  378 	MOV	A, R4
      00014F C0 E0            [24]  379 	PUSH	ACC
      000151 ED               [12]  380 	MOV	A, R5
      000152 C0 E0            [24]  381 	PUSH	ACC
      000154 EE               [12]  382 	MOV	A, R6
      000155 C0 E0            [24]  383 	PUSH	ACC
      000157 EF               [12]  384 	MOV	A, R7
      000158 C0 E0            [24]  385 	PUSH	ACC
                                    386 ;	preemptive.c:89: do{
      00015A                        387 00116$:
                                    388 ;	preemptive.c:90: cur_thread = (cur_thread < 3 ) ?  cur_thread+1 : 0;
      00015A 74 FD            [12]  389 	mov	a,#0x100 - 0x03
      00015C 25 35            [12]  390 	add	a,_cur_thread
      00015E 40 0B            [24]  391 	jc	00121$
      000160 AF 35            [24]  392 	mov	r7,_cur_thread
      000162 0F               [12]  393 	inc	r7
      000163 EF               [12]  394 	mov	a,r7
      000164 FE               [12]  395 	mov	r6,a
      000165 33               [12]  396 	rlc	a
      000166 95 E0            [12]  397 	subb	a,acc
      000168 FF               [12]  398 	mov	r7,a
      000169 80 04            [24]  399 	sjmp	00122$
      00016B                        400 00121$:
      00016B 7E 00            [12]  401 	mov	r6,#0x00
      00016D 7F 00            [12]  402 	mov	r7,#0x00
      00016F                        403 00122$:
      00016F 8E 35            [24]  404 	mov	_cur_thread,r6
                                    405 ;	preemptive.c:91: if( cur_thread == 0 && mask & 1 )break;
      000171 E5 35            [12]  406 	mov	a,_cur_thread
      000173 70 05            [24]  407 	jnz	00113$
      000175 E5 34            [12]  408 	mov	a,_mask
      000177 20 E0 1E         [24]  409 	jb	acc.0,00118$
      00017A                        410 00113$:
                                    411 ;	preemptive.c:92: else if( cur_thread == 1 && mask & 2 )break;
      00017A 74 01            [12]  412 	mov	a,#0x01
      00017C B5 35 05         [24]  413 	cjne	a,_cur_thread,00109$
      00017F E5 34            [12]  414 	mov	a,_mask
      000181 20 E1 14         [24]  415 	jb	acc.1,00118$
      000184                        416 00109$:
                                    417 ;	preemptive.c:93: else if( cur_thread == 2 && mask & 4)break;
      000184 74 02            [12]  418 	mov	a,#0x02
      000186 B5 35 05         [24]  419 	cjne	a,_cur_thread,00105$
      000189 E5 34            [12]  420 	mov	a,_mask
      00018B 20 E2 0A         [24]  421 	jb	acc.2,00118$
      00018E                        422 00105$:
                                    423 ;	preemptive.c:94: else if( cur_thread == 3 && mask & 8 )break; 
      00018E 74 03            [12]  424 	mov	a,#0x03
      000190 B5 35 C7         [24]  425 	cjne	a,_cur_thread,00116$
      000193 E5 34            [12]  426 	mov	a,_mask
      000195 30 E3 C2         [24]  427 	jnb	acc.3,00116$
                                    428 ;	preemptive.c:95: } while (1);
      000198                        429 00118$:
                                    430 ;	preemptive.c:113: __endasm;  
      000198 D0 E0            [24]  431 	POP	ACC
      00019A FF               [12]  432 	MOV	R7, A
      00019B D0 E0            [24]  433 	POP	ACC
      00019D FE               [12]  434 	MOV	R6, A
      00019E D0 E0            [24]  435 	POP	ACC
      0001A0 FD               [12]  436 	MOV	R5, A
      0001A1 D0 E0            [24]  437 	POP	ACC
      0001A3 FC               [12]  438 	MOV	R4, A
      0001A4 D0 E0            [24]  439 	POP	ACC
      0001A6 FB               [12]  440 	MOV	R3, A
      0001A7 D0 E0            [24]  441 	POP	ACC
      0001A9 FA               [12]  442 	MOV	R2, A
      0001AA D0 E0            [24]  443 	POP	ACC
      0001AC F9               [12]  444 	MOV	R1, A
      0001AD D0 E0            [24]  445 	POP	ACC
      0001AF F8               [12]  446 	MOV	R0, A
                                    447 ;	preemptive.c:114: RESTORESTATE;
      0001B0 E5 35            [12]  448 	mov	a,_cur_thread
      0001B2 24 30            [12]  449 	add	a,#_saved_sp
      0001B4 F9               [12]  450 	mov	r1,a
      0001B5 87 81            [24]  451 	mov	_SP,@r1
      0001B7 D0 D0            [24]  452 	POP PSW 
      0001B9 D0 83            [24]  453 	POP DPH 
      0001BB D0 82            [24]  454 	POP DPL 
      0001BD D0 F0            [24]  455 	POP B 
      0001BF D0 E0            [24]  456 	POP ACC 
                                    457 ;	preemptive.c:115: EA = 1;
                                    458 ;	assignBit
      0001C1 D2 AF            [12]  459 	setb	_EA
                                    460 ;	preemptive.c:118: __endasm;
      0001C3 32               [24]  461 	RETI
                                    462 ;	preemptive.c:120: }
      0001C4 22               [24]  463 	ret
                                    464 ;------------------------------------------------------------
                                    465 ;Allocation info for local variables in function 'ThreadCreate'
                                    466 ;------------------------------------------------------------
                                    467 ;fp                        Allocated to registers 
                                    468 ;------------------------------------------------------------
                                    469 ;	preemptive.c:128: ThreadID ThreadCreate(FunctionPtr fp) {
                                    470 ;	-----------------------------------------
                                    471 ;	 function ThreadCreate
                                    472 ;	-----------------------------------------
      0001C5                        473 _ThreadCreate:
                                    474 ;	preemptive.c:131: if( mask == 15 ) //mask = 0b1111, four thread
      0001C5 74 0F            [12]  475 	mov	a,#0x0f
      0001C7 B5 34 04         [24]  476 	cjne	a,_mask,00102$
                                    477 ;	preemptive.c:132: return -1;
      0001CA 75 82 FF         [24]  478 	mov	dpl,#0xff
      0001CD 22               [24]  479 	ret
      0001CE                        480 00102$:
                                    481 ;	preemptive.c:183: }
      0001CE D2 03            [12]  482 	setb	_ThreadCreate_sloc0_1_0
      0001D0 10 AF 02         [24]  483 	jbc	ea,00138$
      0001D3 C2 03            [12]  484 	clr	_ThreadCreate_sloc0_1_0
      0001D5                        485 00138$:
                                    486 ;	preemptive.c:135: if( !( mask & 1 ) ){
      0001D5 E5 34            [12]  487 	mov	a,_mask
      0001D7 20 E0 08         [24]  488 	jb	acc.0,00112$
                                    489 ;	preemptive.c:136: mask = mask | 1;
      0001DA 43 34 01         [24]  490 	orl	_mask,#0x01
                                    491 ;	preemptive.c:137: new_thread = 0;
      0001DD 75 37 00         [24]  492 	mov	_new_thread,#0x00
      0001E0 80 25            [24]  493 	sjmp	00113$
      0001E2                        494 00112$:
                                    495 ;	preemptive.c:138: }else if( !( mask & 2 ) ){
      0001E2 E5 34            [12]  496 	mov	a,_mask
      0001E4 20 E1 08         [24]  497 	jb	acc.1,00109$
                                    498 ;	preemptive.c:139: mask = mask | 2;
      0001E7 43 34 02         [24]  499 	orl	_mask,#0x02
                                    500 ;	preemptive.c:140: new_thread = 1;
      0001EA 75 37 01         [24]  501 	mov	_new_thread,#0x01
      0001ED 80 18            [24]  502 	sjmp	00113$
      0001EF                        503 00109$:
                                    504 ;	preemptive.c:141: }else if( !( mask & 4 ) ){
      0001EF E5 34            [12]  505 	mov	a,_mask
      0001F1 20 E2 08         [24]  506 	jb	acc.2,00106$
                                    507 ;	preemptive.c:142: mask = mask | 4;
      0001F4 43 34 04         [24]  508 	orl	_mask,#0x04
                                    509 ;	preemptive.c:143: new_thread = 2;
      0001F7 75 37 02         [24]  510 	mov	_new_thread,#0x02
      0001FA 80 0B            [24]  511 	sjmp	00113$
      0001FC                        512 00106$:
                                    513 ;	preemptive.c:144: }else if( !( mask & 8 ) ){
      0001FC E5 34            [12]  514 	mov	a,_mask
      0001FE 20 E3 06         [24]  515 	jb	acc.3,00113$
                                    516 ;	preemptive.c:145: mask = mask | 8;
      000201 43 34 08         [24]  517 	orl	_mask,#0x08
                                    518 ;	preemptive.c:146: new_thread = 3;
      000204 75 37 03         [24]  519 	mov	_new_thread,#0x03
      000207                        520 00113$:
                                    521 ;	preemptive.c:149: sp_temp = SP;
      000207 85 81 36         [24]  522 	mov	_sp_temp,_SP
                                    523 ;	preemptive.c:150: SP = (0x3F) + (0x10) * new_thread;
      00020A E5 37            [12]  524 	mov	a,_new_thread
      00020C C4               [12]  525 	swap	a
      00020D 54 F0            [12]  526 	anl	a,#0xf0
      00020F FF               [12]  527 	mov	r7,a
      000210 24 3F            [12]  528 	add	a,#0x3f
      000212 F5 81            [12]  529 	mov	_SP,a
                                    530 ;	preemptive.c:157: __endasm;
      000214 C0 82            [24]  531 	PUSH	DPL
      000216 C0 83            [24]  532 	PUSH	DPH
                                    533 ;	preemptive.c:169: __endasm;
      000218 54 00            [12]  534 	ANL	A, #0
      00021A C0 E0            [24]  535 	PUSH	ACC
      00021C C0 E0            [24]  536 	PUSH	ACC
      00021E C0 E0            [24]  537 	PUSH	ACC
      000220 C0 E0            [24]  538 	PUSH	ACC
                                    539 ;	preemptive.c:173: PSW = new_thread << 3;
      000222 E5 37            [12]  540 	mov	a,_new_thread
      000224 FF               [12]  541 	mov	r7,a
      000225 C4               [12]  542 	swap	a
      000226 03               [12]  543 	rr	a
      000227 54 F8            [12]  544 	anl	a,#0xf8
      000229 F5 D0            [12]  545 	mov	_PSW,a
                                    546 ;	preemptive.c:176: __endasm;
      00022B C0 D0            [24]  547 	PUSH	PSW
                                    548 ;	preemptive.c:179: saved_sp[new_thread] = SP;
      00022D E5 37            [12]  549 	mov	a,_new_thread
      00022F 24 30            [12]  550 	add	a,#_saved_sp
      000231 F8               [12]  551 	mov	r0,a
      000232 A6 81            [24]  552 	mov	@r0,_SP
                                    553 ;	preemptive.c:181: SP = sp_temp;
      000234 85 36 81         [24]  554 	mov	_SP,_sp_temp
      000237 A2 03            [12]  555 	mov	c,_ThreadCreate_sloc0_1_0
      000239 92 AF            [24]  556 	mov	ea,c
                                    557 ;	preemptive.c:184: return new_thread;
      00023B 85 37 82         [24]  558 	mov	dpl,_new_thread
                                    559 ;	preemptive.c:187: }
      00023E 22               [24]  560 	ret
                                    561 ;------------------------------------------------------------
                                    562 ;Allocation info for local variables in function 'ThreadYield'
                                    563 ;------------------------------------------------------------
                                    564 ;	preemptive.c:198: void ThreadYield(void) {
                                    565 ;	-----------------------------------------
                                    566 ;	 function ThreadYield
                                    567 ;	-----------------------------------------
      00023F                        568 _ThreadYield:
                                    569 ;	preemptive.c:208: }
      00023F D2 04            [12]  570 	setb	_ThreadYield_sloc0_1_0
      000241 10 AF 02         [24]  571 	jbc	ea,00122$
      000244 C2 04            [12]  572 	clr	_ThreadYield_sloc0_1_0
      000246                        573 00122$:
                                    574 ;	preemptive.c:200: SAVESTATE;
      000246 C0 E0            [24]  575 	PUSH ACC 
      000248 C0 F0            [24]  576 	PUSH B 
      00024A C0 82            [24]  577 	PUSH DPL 
      00024C C0 83            [24]  578 	PUSH DPH 
      00024E C0 D0            [24]  579 	PUSH PSW 
      000250 E5 35            [12]  580 	mov	a,_cur_thread
      000252 24 30            [12]  581 	add	a,#_saved_sp
      000254 F8               [12]  582 	mov	r0,a
      000255 A6 81            [24]  583 	mov	@r0,_SP
                                    584 ;	preemptive.c:201: do{
      000257                        585 00103$:
                                    586 ;	preemptive.c:202: cur_thread = (cur_thread < 3 ) ?  cur_thread+1 : 0;
      000257 74 FD            [12]  587 	mov	a,#0x100 - 0x03
      000259 25 35            [12]  588 	add	a,_cur_thread
      00025B 40 0B            [24]  589 	jc	00108$
      00025D AF 35            [24]  590 	mov	r7,_cur_thread
      00025F 0F               [12]  591 	inc	r7
      000260 EF               [12]  592 	mov	a,r7
      000261 FE               [12]  593 	mov	r6,a
      000262 33               [12]  594 	rlc	a
      000263 95 E0            [12]  595 	subb	a,acc
      000265 FF               [12]  596 	mov	r7,a
      000266 80 04            [24]  597 	sjmp	00109$
      000268                        598 00108$:
      000268 7E 00            [12]  599 	mov	r6,#0x00
      00026A 7F 00            [12]  600 	mov	r7,#0x00
      00026C                        601 00109$:
      00026C 8E 35            [24]  602 	mov	_cur_thread,r6
                                    603 ;	preemptive.c:203: if( mask & (1<<cur_thread) ){
      00026E AF 35            [24]  604 	mov	r7,_cur_thread
      000270 8F F0            [24]  605 	mov	b,r7
      000272 05 F0            [12]  606 	inc	b
      000274 7F 01            [12]  607 	mov	r7,#0x01
      000276 7E 00            [12]  608 	mov	r6,#0x00
      000278 80 06            [24]  609 	sjmp	00125$
      00027A                        610 00124$:
      00027A EF               [12]  611 	mov	a,r7
      00027B 2F               [12]  612 	add	a,r7
      00027C FF               [12]  613 	mov	r7,a
      00027D EE               [12]  614 	mov	a,r6
      00027E 33               [12]  615 	rlc	a
      00027F FE               [12]  616 	mov	r6,a
      000280                        617 00125$:
      000280 D5 F0 F7         [24]  618 	djnz	b,00124$
      000283 AC 34            [24]  619 	mov	r4,_mask
      000285 7D 00            [12]  620 	mov	r5,#0x00
      000287 EC               [12]  621 	mov	a,r4
      000288 52 07            [12]  622 	anl	ar7,a
      00028A ED               [12]  623 	mov	a,r5
      00028B 52 06            [12]  624 	anl	ar6,a
      00028D EF               [12]  625 	mov	a,r7
      00028E 4E               [12]  626 	orl	a,r6
      00028F 60 C6            [24]  627 	jz	00103$
                                    628 ;	preemptive.c:207: RESTORESTATE;
      000291 E5 35            [12]  629 	mov	a,_cur_thread
      000293 24 30            [12]  630 	add	a,#_saved_sp
      000295 F9               [12]  631 	mov	r1,a
      000296 87 81            [24]  632 	mov	_SP,@r1
      000298 D0 D0            [24]  633 	POP PSW 
      00029A D0 83            [24]  634 	POP DPH 
      00029C D0 82            [24]  635 	POP DPL 
      00029E D0 F0            [24]  636 	POP B 
      0002A0 D0 E0            [24]  637 	POP ACC 
      0002A2 A2 04            [12]  638 	mov	c,_ThreadYield_sloc0_1_0
      0002A4 92 AF            [24]  639 	mov	ea,c
                                    640 ;	preemptive.c:209: }
      0002A6 22               [24]  641 	ret
                                    642 ;------------------------------------------------------------
                                    643 ;Allocation info for local variables in function 'ThreadExit'
                                    644 ;------------------------------------------------------------
                                    645 ;	preemptive.c:217: void ThreadExit(void) {
                                    646 ;	-----------------------------------------
                                    647 ;	 function ThreadExit
                                    648 ;	-----------------------------------------
      0002A7                        649 _ThreadExit:
                                    650 ;	preemptive.c:231: }
      0002A7 D2 05            [12]  651 	setb	_ThreadExit_sloc0_1_0
      0002A9 10 AF 02         [24]  652 	jbc	ea,00127$
      0002AC C2 05            [12]  653 	clr	_ThreadExit_sloc0_1_0
      0002AE                        654 00127$:
                                    655 ;	preemptive.c:219: mask ^= (1<<cur_thread);
      0002AE AF 35            [24]  656 	mov	r7,_cur_thread
      0002B0 8F F0            [24]  657 	mov	b,r7
      0002B2 05 F0            [12]  658 	inc	b
      0002B4 74 01            [12]  659 	mov	a,#0x01
      0002B6 80 02            [24]  660 	sjmp	00130$
      0002B8                        661 00128$:
      0002B8 25 E0            [12]  662 	add	a,acc
      0002BA                        663 00130$:
      0002BA D5 F0 FB         [24]  664 	djnz	b,00128$
      0002BD FF               [12]  665 	mov	r7,a
      0002BE 62 34            [12]  666 	xrl	_mask,a
                                    667 ;	preemptive.c:220: for(i=0 ; i < 4 ; i++)
      0002C0 75 39 00         [24]  668 	mov	_i,#0x00
      0002C3                        669 00107$:
      0002C3 74 FC            [12]  670 	mov	a,#0x100 - 0x04
      0002C5 25 39            [12]  671 	add	a,_i
      0002C7 40 2F            [24]  672 	jc	00103$
                                    673 ;	preemptive.c:221: if( mask & (1<<i) ){
      0002C9 AF 39            [24]  674 	mov	r7,_i
      0002CB 8F F0            [24]  675 	mov	b,r7
      0002CD 05 F0            [12]  676 	inc	b
      0002CF 7F 01            [12]  677 	mov	r7,#0x01
      0002D1 7E 00            [12]  678 	mov	r6,#0x00
      0002D3 80 06            [24]  679 	sjmp	00133$
      0002D5                        680 00132$:
      0002D5 EF               [12]  681 	mov	a,r7
      0002D6 2F               [12]  682 	add	a,r7
      0002D7 FF               [12]  683 	mov	r7,a
      0002D8 EE               [12]  684 	mov	a,r6
      0002D9 33               [12]  685 	rlc	a
      0002DA FE               [12]  686 	mov	r6,a
      0002DB                        687 00133$:
      0002DB D5 F0 F7         [24]  688 	djnz	b,00132$
      0002DE AC 34            [24]  689 	mov	r4,_mask
      0002E0 7D 00            [12]  690 	mov	r5,#0x00
      0002E2 EC               [12]  691 	mov	a,r4
      0002E3 52 07            [12]  692 	anl	ar7,a
      0002E5 ED               [12]  693 	mov	a,r5
      0002E6 52 06            [12]  694 	anl	ar6,a
      0002E8 EF               [12]  695 	mov	a,r7
      0002E9 4E               [12]  696 	orl	a,r6
      0002EA 60 05            [24]  697 	jz	00108$
                                    698 ;	preemptive.c:222: cur_thread = i;
      0002EC 85 39 35         [24]  699 	mov	_cur_thread,_i
                                    700 ;	preemptive.c:223: break;
      0002EF 80 07            [24]  701 	sjmp	00103$
      0002F1                        702 00108$:
                                    703 ;	preemptive.c:220: for(i=0 ; i < 4 ; i++)
      0002F1 E5 39            [12]  704 	mov	a,_i
      0002F3 04               [12]  705 	inc	a
      0002F4 F5 39            [12]  706 	mov	_i,a
      0002F6 80 CB            [24]  707 	sjmp	00107$
      0002F8                        708 00103$:
                                    709 ;	preemptive.c:226: if( i == 4 ) cur_thread = -1;
      0002F8 74 04            [12]  710 	mov	a,#0x04
      0002FA B5 39 03         [24]  711 	cjne	a,_i,00105$
      0002FD 75 35 FF         [24]  712 	mov	_cur_thread,#0xff
      000300                        713 00105$:
                                    714 ;	preemptive.c:229: RESTORESTATE;
      000300 E5 35            [12]  715 	mov	a,_cur_thread
      000302 24 30            [12]  716 	add	a,#_saved_sp
      000304 F9               [12]  717 	mov	r1,a
      000305 87 81            [24]  718 	mov	_SP,@r1
      000307 D0 D0            [24]  719 	POP PSW 
      000309 D0 83            [24]  720 	POP DPH 
      00030B D0 82            [24]  721 	POP DPL 
      00030D D0 F0            [24]  722 	POP B 
      00030F D0 E0            [24]  723 	POP ACC 
                                    724 ;	preemptive.c:230: EA = 1;
                                    725 ;	assignBit
      000311 D2 AF            [12]  726 	setb	_EA
      000313 A2 05            [12]  727 	mov	c,_ThreadExit_sloc0_1_0
      000315 92 AF            [24]  728 	mov	ea,c
                                    729 ;	preemptive.c:232: }
      000317 22               [24]  730 	ret
                                    731 	.area CSEG    (CODE)
                                    732 	.area CONST   (CODE)
                                    733 	.area XINIT   (CODE)
                                    734 	.area CABS    (ABS,CODE)
