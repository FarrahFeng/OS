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
                                    114 	.globl _time_sec
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
                           000024   239 _time_sec	=	0x0024
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
                                    309 ;	preemptive.c:70: unsigned char now(void){
                                    310 ;	-----------------------------------------
                                    311 ;	 function now
                                    312 ;	-----------------------------------------
      000258                        313 _now:
                           000007   314 	ar7 = 0x07
                           000006   315 	ar6 = 0x06
                           000005   316 	ar5 = 0x05
                           000004   317 	ar4 = 0x04
                           000003   318 	ar3 = 0x03
                           000002   319 	ar2 = 0x02
                           000001   320 	ar1 = 0x01
                           000000   321 	ar0 = 0x00
                                    322 ;	preemptive.c:71: return time;
      000258 85 39 82         [24]  323 	mov	dpl,_time
                                    324 ;	preemptive.c:72: }
      00025B 22               [24]  325 	ret
                                    326 ;------------------------------------------------------------
                                    327 ;Allocation info for local variables in function 'Bootstrap'
                                    328 ;------------------------------------------------------------
                                    329 ;	preemptive.c:74: void Bootstrap(void) {
                                    330 ;	-----------------------------------------
                                    331 ;	 function Bootstrap
                                    332 ;	-----------------------------------------
      00025C                        333 _Bootstrap:
                                    334 ;	preemptive.c:75: mask = 0;
      00025C 75 34 00         [24]  335 	mov	_mask,#0x00
                                    336 ;	preemptive.c:76: TMOD = 0;  // timer 0 mode 0 (timer 1 is already used by UART)
      00025F 75 89 00         [24]  337 	mov	_TMOD,#0x00
                                    338 ;	preemptive.c:77: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
      000262 75 A8 82         [24]  339 	mov	_IE,#0x82
                                    340 ;	preemptive.c:79: TR0 = 1; // set bit TR0 to start running timer 0
                                    341 ;	assignBit
      000265 D2 8C            [12]  342 	setb	_TR0
                                    343 ;	preemptive.c:80: cur_thread = ThreadCreate( main );
      000267 90 01 BF         [24]  344 	mov	dptr,#_main
      00026A 12 03 32         [24]  345 	lcall	_ThreadCreate
      00026D 85 82 35         [24]  346 	mov	_cur_thread,dpl
                                    347 ;	preemptive.c:81: RESTORESTATE;
      000270 E5 35            [12]  348 	mov	a,_cur_thread
      000272 24 30            [12]  349 	add	a,#_saved_sp
      000274 F9               [12]  350 	mov	r1,a
      000275 87 81            [24]  351 	mov	_SP,@r1
      000277 D0 D0            [24]  352 	POP PSW 
      000279 D0 83            [24]  353 	POP DPH 
      00027B D0 82            [24]  354 	POP DPL 
      00027D D0 F0            [24]  355 	POP B 
      00027F D0 E0            [24]  356 	POP ACC 
                                    357 ;	preemptive.c:83: }
      000281 22               [24]  358 	ret
                                    359 ;------------------------------------------------------------
                                    360 ;Allocation info for local variables in function 'myTimer0Handler'
                                    361 ;------------------------------------------------------------
                                    362 ;	preemptive.c:85: void myTimer0Handler(){
                                    363 ;	-----------------------------------------
                                    364 ;	 function myTimer0Handler
                                    365 ;	-----------------------------------------
      000282                        366 _myTimer0Handler:
                                    367 ;	preemptive.c:86: EA = 0;
                                    368 ;	assignBit
      000282 C2 AF            [12]  369 	clr	_EA
                                    370 ;	preemptive.c:87: SAVESTATE;
      000284 C0 E0            [24]  371 	PUSH ACC 
      000286 C0 F0            [24]  372 	PUSH B 
      000288 C0 82            [24]  373 	PUSH DPL 
      00028A C0 83            [24]  374 	PUSH DPH 
      00028C C0 D0            [24]  375 	PUSH PSW 
      00028E E5 35            [12]  376 	mov	a,_cur_thread
      000290 24 30            [12]  377 	add	a,#_saved_sp
      000292 F8               [12]  378 	mov	r0,a
      000293 A6 81            [24]  379 	mov	@r0,_SP
                                    380 ;	preemptive.c:106: __endasm;
      000295 E8               [12]  381 	MOV	A, R0
      000296 C0 E0            [24]  382 	PUSH	ACC
      000298 E9               [12]  383 	MOV	A, R1
      000299 C0 E0            [24]  384 	PUSH	ACC
      00029B EA               [12]  385 	MOV	A, R2
      00029C C0 E0            [24]  386 	PUSH	ACC
      00029E EB               [12]  387 	MOV	A, R3
      00029F C0 E0            [24]  388 	PUSH	ACC
      0002A1 EC               [12]  389 	MOV	A, R4
      0002A2 C0 E0            [24]  390 	PUSH	ACC
      0002A4 ED               [12]  391 	MOV	A, R5
      0002A5 C0 E0            [24]  392 	PUSH	ACC
      0002A7 EE               [12]  393 	MOV	A, R6
      0002A8 C0 E0            [24]  394 	PUSH	ACC
      0002AA EF               [12]  395 	MOV	A, R7
      0002AB C0 E0            [24]  396 	PUSH	ACC
                                    397 ;	preemptive.c:107: time_sec = time_sec + 1;
      0002AD E5 24            [12]  398 	mov	a,_time_sec
      0002AF FF               [12]  399 	mov	r7,a
      0002B0 04               [12]  400 	inc	a
      0002B1 F5 24            [12]  401 	mov	_time_sec,a
                                    402 ;	preemptive.c:108: if(time_sec==8){ time = time + 1; time_sec = 0;}
      0002B3 74 08            [12]  403 	mov	a,#0x08
      0002B5 B5 24 09         [24]  404 	cjne	a,_time_sec,00122$
      0002B8 E5 39            [12]  405 	mov	a,_time
      0002BA FF               [12]  406 	mov	r7,a
      0002BB 04               [12]  407 	inc	a
      0002BC F5 39            [12]  408 	mov	_time,a
      0002BE 75 24 00         [24]  409 	mov	_time_sec,#0x00
                                    410 ;	preemptive.c:110: do{
      0002C1                        411 00122$:
                                    412 ;	preemptive.c:111: cur_thread = (cur_thread < 3 ) ?  cur_thread+1 : 0;
      0002C1 74 FD            [12]  413 	mov	a,#0x100 - 0x03
      0002C3 25 35            [12]  414 	add	a,_cur_thread
      0002C5 40 0B            [24]  415 	jc	00127$
      0002C7 AF 35            [24]  416 	mov	r7,_cur_thread
      0002C9 0F               [12]  417 	inc	r7
      0002CA EF               [12]  418 	mov	a,r7
      0002CB FE               [12]  419 	mov	r6,a
      0002CC 33               [12]  420 	rlc	a
      0002CD 95 E0            [12]  421 	subb	a,acc
      0002CF FF               [12]  422 	mov	r7,a
      0002D0 80 04            [24]  423 	sjmp	00128$
      0002D2                        424 00127$:
      0002D2 7E 00            [12]  425 	mov	r6,#0x00
      0002D4 7F 00            [12]  426 	mov	r7,#0x00
      0002D6                        427 00128$:
      0002D6 8E 35            [24]  428 	mov	_cur_thread,r6
                                    429 ;	preemptive.c:112: if( cur_thread == 0 ){if( mask&1 ){break;}}
      0002D8 E5 35            [12]  430 	mov	a,_cur_thread
      0002DA 70 07            [24]  431 	jnz	00120$
      0002DC E5 34            [12]  432 	mov	a,_mask
      0002DE 30 E0 E0         [24]  433 	jnb	acc.0,00122$
      0002E1 80 22            [24]  434 	sjmp	00124$
      0002E3                        435 00120$:
                                    436 ;	preemptive.c:113: else if( cur_thread == 1 ){if( mask&2 ){break;}}
      0002E3 74 01            [12]  437 	mov	a,#0x01
      0002E5 B5 35 07         [24]  438 	cjne	a,_cur_thread,00117$
      0002E8 E5 34            [12]  439 	mov	a,_mask
      0002EA 30 E1 D4         [24]  440 	jnb	acc.1,00122$
      0002ED 80 16            [24]  441 	sjmp	00124$
      0002EF                        442 00117$:
                                    443 ;	preemptive.c:114: else if( cur_thread == 2 ){if( mask&4 ){break;}}
      0002EF 74 02            [12]  444 	mov	a,#0x02
      0002F1 B5 35 07         [24]  445 	cjne	a,_cur_thread,00114$
      0002F4 E5 34            [12]  446 	mov	a,_mask
      0002F6 30 E2 C8         [24]  447 	jnb	acc.2,00122$
      0002F9 80 0A            [24]  448 	sjmp	00124$
      0002FB                        449 00114$:
                                    450 ;	preemptive.c:115: else if( cur_thread == 3 ){if( mask&8 ){break;}}   
      0002FB 74 03            [12]  451 	mov	a,#0x03
      0002FD B5 35 C1         [24]  452 	cjne	a,_cur_thread,00122$
      000300 E5 34            [12]  453 	mov	a,_mask
      000302 30 E3 BC         [24]  454 	jnb	acc.3,00122$
                                    455 ;	preemptive.c:116: } while (1);
      000305                        456 00124$:
                                    457 ;	preemptive.c:143: __endasm;  
      000305 D0 E0            [24]  458 	POP	ACC
      000307 FF               [12]  459 	MOV	R7, A
      000308 D0 E0            [24]  460 	POP	ACC
      00030A FE               [12]  461 	MOV	R6, A
      00030B D0 E0            [24]  462 	POP	ACC
      00030D FD               [12]  463 	MOV	R5, A
      00030E D0 E0            [24]  464 	POP	ACC
      000310 FC               [12]  465 	MOV	R4, A
      000311 D0 E0            [24]  466 	POP	ACC
      000313 FB               [12]  467 	MOV	R3, A
      000314 D0 E0            [24]  468 	POP	ACC
      000316 FA               [12]  469 	MOV	R2, A
      000317 D0 E0            [24]  470 	POP	ACC
      000319 F9               [12]  471 	MOV	R1, A
      00031A D0 E0            [24]  472 	POP	ACC
      00031C F8               [12]  473 	MOV	R0, A
                                    474 ;	preemptive.c:144: RESTORESTATE;
      00031D E5 35            [12]  475 	mov	a,_cur_thread
      00031F 24 30            [12]  476 	add	a,#_saved_sp
      000321 F9               [12]  477 	mov	r1,a
      000322 87 81            [24]  478 	mov	_SP,@r1
      000324 D0 D0            [24]  479 	POP PSW 
      000326 D0 83            [24]  480 	POP DPH 
      000328 D0 82            [24]  481 	POP DPL 
      00032A D0 F0            [24]  482 	POP B 
      00032C D0 E0            [24]  483 	POP ACC 
                                    484 ;	preemptive.c:145: EA = 1;                  // enable interrupts
                                    485 ;	assignBit
      00032E D2 AF            [12]  486 	setb	_EA
                                    487 ;	preemptive.c:148: __endasm;
      000330 32               [24]  488 	RETI
                                    489 ;	preemptive.c:150: }
      000331 22               [24]  490 	ret
                                    491 ;------------------------------------------------------------
                                    492 ;Allocation info for local variables in function 'ThreadCreate'
                                    493 ;------------------------------------------------------------
                                    494 ;fp                        Allocated to registers 
                                    495 ;------------------------------------------------------------
                                    496 ;	preemptive.c:158: ThreadID ThreadCreate(FunctionPtr fp) {
                                    497 ;	-----------------------------------------
                                    498 ;	 function ThreadCreate
                                    499 ;	-----------------------------------------
      000332                        500 _ThreadCreate:
                                    501 ;	preemptive.c:159: EA = 0;
                                    502 ;	assignBit
      000332 C2 AF            [12]  503 	clr	_EA
                                    504 ;	preemptive.c:161: if( mask == 15 )   // mask = 0b1111, max threads = four 
      000334 74 0F            [12]  505 	mov	a,#0x0f
      000336 B5 34 04         [24]  506 	cjne	a,_mask,00102$
                                    507 ;	preemptive.c:162: return -1;      // invalid thread ID
      000339 75 82 FF         [24]  508 	mov	dpl,#0xff
      00033C 22               [24]  509 	ret
      00033D                        510 00102$:
                                    511 ;	preemptive.c:165: if( !( mask & 1 ) ){
      00033D E5 34            [12]  512 	mov	a,_mask
      00033F 20 E0 08         [24]  513 	jb	acc.0,00112$
                                    514 ;	preemptive.c:166: mask = mask | 1;
      000342 43 34 01         [24]  515 	orl	_mask,#0x01
                                    516 ;	preemptive.c:167: new_thread = 0;
      000345 75 37 00         [24]  517 	mov	_new_thread,#0x00
      000348 80 25            [24]  518 	sjmp	00113$
      00034A                        519 00112$:
                                    520 ;	preemptive.c:168: }else if( !( mask & 2 ) ){
      00034A E5 34            [12]  521 	mov	a,_mask
      00034C 20 E1 08         [24]  522 	jb	acc.1,00109$
                                    523 ;	preemptive.c:169: mask = mask | 2;
      00034F 43 34 02         [24]  524 	orl	_mask,#0x02
                                    525 ;	preemptive.c:170: new_thread = 1;
      000352 75 37 01         [24]  526 	mov	_new_thread,#0x01
      000355 80 18            [24]  527 	sjmp	00113$
      000357                        528 00109$:
                                    529 ;	preemptive.c:171: }else if( !( mask & 4 ) ){
      000357 E5 34            [12]  530 	mov	a,_mask
      000359 20 E2 08         [24]  531 	jb	acc.2,00106$
                                    532 ;	preemptive.c:172: mask = mask | 4;
      00035C 43 34 04         [24]  533 	orl	_mask,#0x04
                                    534 ;	preemptive.c:173: new_thread = 2;
      00035F 75 37 02         [24]  535 	mov	_new_thread,#0x02
      000362 80 0B            [24]  536 	sjmp	00113$
      000364                        537 00106$:
                                    538 ;	preemptive.c:174: }else if( !( mask & 8 ) ){
      000364 E5 34            [12]  539 	mov	a,_mask
      000366 20 E3 06         [24]  540 	jb	acc.3,00113$
                                    541 ;	preemptive.c:175: mask = mask | 8;
      000369 43 34 08         [24]  542 	orl	_mask,#0x08
                                    543 ;	preemptive.c:176: new_thread = 3;
      00036C 75 37 03         [24]  544 	mov	_new_thread,#0x03
      00036F                        545 00113$:
                                    546 ;	preemptive.c:179: sp_temp = SP;
      00036F 85 81 36         [24]  547 	mov	_sp_temp,_SP
                                    548 ;	preemptive.c:180: SP = (0x3F) + (0x10) * new_thread; // set to the starting location for new thread
      000372 E5 37            [12]  549 	mov	a,_new_thread
      000374 C4               [12]  550 	swap	a
      000375 54 F0            [12]  551 	anl	a,#0xf0
      000377 FF               [12]  552 	mov	r7,a
      000378 24 3F            [12]  553 	add	a,#0x3f
      00037A F5 81            [12]  554 	mov	_SP,a
                                    555 ;	preemptive.c:187: __endasm;
      00037C C0 82            [24]  556 	PUSH	DPL
      00037E C0 83            [24]  557 	PUSH	DPH
                                    558 ;	preemptive.c:199: __endasm;
      000380 54 00            [12]  559 	ANL	A, #0
      000382 C0 E0            [24]  560 	PUSH	ACC
      000384 C0 E0            [24]  561 	PUSH	ACC
      000386 C0 E0            [24]  562 	PUSH	ACC
      000388 C0 E0            [24]  563 	PUSH	ACC
                                    564 ;	preemptive.c:207: PSW = new_thread << 3;
      00038A E5 37            [12]  565 	mov	a,_new_thread
      00038C FF               [12]  566 	mov	r7,a
      00038D C4               [12]  567 	swap	a
      00038E 03               [12]  568 	rr	a
      00038F 54 F8            [12]  569 	anl	a,#0xf8
      000391 F5 D0            [12]  570 	mov	_PSW,a
                                    571 ;	preemptive.c:210: __endasm;
      000393 C0 D0            [24]  572 	PUSH	PSW
                                    573 ;	preemptive.c:213: saved_sp[new_thread] = SP;
      000395 E5 37            [12]  574 	mov	a,_new_thread
      000397 24 30            [12]  575 	add	a,#_saved_sp
      000399 F8               [12]  576 	mov	r0,a
      00039A A6 81            [24]  577 	mov	@r0,_SP
                                    578 ;	preemptive.c:215: SP = sp_temp;
      00039C 85 36 81         [24]  579 	mov	_SP,_sp_temp
                                    580 ;	preemptive.c:217: EA = 1;
                                    581 ;	assignBit
      00039F D2 AF            [12]  582 	setb	_EA
                                    583 ;	preemptive.c:218: return new_thread;
      0003A1 85 37 82         [24]  584 	mov	dpl,_new_thread
                                    585 ;	preemptive.c:221: }
      0003A4 22               [24]  586 	ret
                                    587 ;------------------------------------------------------------
                                    588 ;Allocation info for local variables in function 'ThreadYield'
                                    589 ;------------------------------------------------------------
                                    590 ;	preemptive.c:232: void ThreadYield(void) {
                                    591 ;	-----------------------------------------
                                    592 ;	 function ThreadYield
                                    593 ;	-----------------------------------------
      0003A5                        594 _ThreadYield:
                                    595 ;	preemptive.c:242: }
      0003A5 D2 00            [12]  596 	setb	_ThreadYield_sloc0_1_0
      0003A7 10 AF 02         [24]  597 	jbc	ea,00122$
      0003AA C2 00            [12]  598 	clr	_ThreadYield_sloc0_1_0
      0003AC                        599 00122$:
                                    600 ;	preemptive.c:234: SAVESTATE;
      0003AC C0 E0            [24]  601 	PUSH ACC 
      0003AE C0 F0            [24]  602 	PUSH B 
      0003B0 C0 82            [24]  603 	PUSH DPL 
      0003B2 C0 83            [24]  604 	PUSH DPH 
      0003B4 C0 D0            [24]  605 	PUSH PSW 
      0003B6 E5 35            [12]  606 	mov	a,_cur_thread
      0003B8 24 30            [12]  607 	add	a,#_saved_sp
      0003BA F8               [12]  608 	mov	r0,a
      0003BB A6 81            [24]  609 	mov	@r0,_SP
                                    610 ;	preemptive.c:235: do{
      0003BD                        611 00103$:
                                    612 ;	preemptive.c:236: cur_thread = (cur_thread < 3 ) ?  cur_thread+1 : 0;
      0003BD 74 FD            [12]  613 	mov	a,#0x100 - 0x03
      0003BF 25 35            [12]  614 	add	a,_cur_thread
      0003C1 40 0B            [24]  615 	jc	00108$
      0003C3 AF 35            [24]  616 	mov	r7,_cur_thread
      0003C5 0F               [12]  617 	inc	r7
      0003C6 EF               [12]  618 	mov	a,r7
      0003C7 FE               [12]  619 	mov	r6,a
      0003C8 33               [12]  620 	rlc	a
      0003C9 95 E0            [12]  621 	subb	a,acc
      0003CB FF               [12]  622 	mov	r7,a
      0003CC 80 04            [24]  623 	sjmp	00109$
      0003CE                        624 00108$:
      0003CE 7E 00            [12]  625 	mov	r6,#0x00
      0003D0 7F 00            [12]  626 	mov	r7,#0x00
      0003D2                        627 00109$:
      0003D2 8E 35            [24]  628 	mov	_cur_thread,r6
                                    629 ;	preemptive.c:237: if( mask & (1<<cur_thread) ){
      0003D4 AF 35            [24]  630 	mov	r7,_cur_thread
      0003D6 8F F0            [24]  631 	mov	b,r7
      0003D8 05 F0            [12]  632 	inc	b
      0003DA 7F 01            [12]  633 	mov	r7,#0x01
      0003DC 7E 00            [12]  634 	mov	r6,#0x00
      0003DE 80 06            [24]  635 	sjmp	00125$
      0003E0                        636 00124$:
      0003E0 EF               [12]  637 	mov	a,r7
      0003E1 2F               [12]  638 	add	a,r7
      0003E2 FF               [12]  639 	mov	r7,a
      0003E3 EE               [12]  640 	mov	a,r6
      0003E4 33               [12]  641 	rlc	a
      0003E5 FE               [12]  642 	mov	r6,a
      0003E6                        643 00125$:
      0003E6 D5 F0 F7         [24]  644 	djnz	b,00124$
      0003E9 AC 34            [24]  645 	mov	r4,_mask
      0003EB 7D 00            [12]  646 	mov	r5,#0x00
      0003ED EC               [12]  647 	mov	a,r4
      0003EE 52 07            [12]  648 	anl	ar7,a
      0003F0 ED               [12]  649 	mov	a,r5
      0003F1 52 06            [12]  650 	anl	ar6,a
      0003F3 EF               [12]  651 	mov	a,r7
      0003F4 4E               [12]  652 	orl	a,r6
      0003F5 60 C6            [24]  653 	jz	00103$
                                    654 ;	preemptive.c:241: RESTORESTATE;
      0003F7 E5 35            [12]  655 	mov	a,_cur_thread
      0003F9 24 30            [12]  656 	add	a,#_saved_sp
      0003FB F9               [12]  657 	mov	r1,a
      0003FC 87 81            [24]  658 	mov	_SP,@r1
      0003FE D0 D0            [24]  659 	POP PSW 
      000400 D0 83            [24]  660 	POP DPH 
      000402 D0 82            [24]  661 	POP DPL 
      000404 D0 F0            [24]  662 	POP B 
      000406 D0 E0            [24]  663 	POP ACC 
      000408 A2 00            [12]  664 	mov	c,_ThreadYield_sloc0_1_0
      00040A 92 AF            [24]  665 	mov	ea,c
                                    666 ;	preemptive.c:243: }
      00040C 22               [24]  667 	ret
                                    668 ;------------------------------------------------------------
                                    669 ;Allocation info for local variables in function 'ThreadExit'
                                    670 ;------------------------------------------------------------
                                    671 ;	preemptive.c:251: void ThreadExit(void) {
                                    672 ;	-----------------------------------------
                                    673 ;	 function ThreadExit
                                    674 ;	-----------------------------------------
      00040D                        675 _ThreadExit:
                                    676 ;	preemptive.c:252: EA = 0;
                                    677 ;	assignBit
      00040D C2 AF            [12]  678 	clr	_EA
                                    679 ;	preemptive.c:257: if(cur_thread == 0) mask = mask - 1;
      00040F E5 35            [12]  680 	mov	a,_cur_thread
      000411 70 08            [24]  681 	jnz	00110$
      000413 E5 34            [12]  682 	mov	a,_mask
      000415 FF               [12]  683 	mov	r7,a
      000416 14               [12]  684 	dec	a
      000417 F5 34            [12]  685 	mov	_mask,a
      000419 80 28            [24]  686 	sjmp	00111$
      00041B                        687 00110$:
                                    688 ;	preemptive.c:258: else if( cur_thread == 1 )mask = mask - 2;
      00041B 74 01            [12]  689 	mov	a,#0x01
      00041D B5 35 09         [24]  690 	cjne	a,_cur_thread,00107$
      000420 E5 34            [12]  691 	mov	a,_mask
      000422 FF               [12]  692 	mov	r7,a
      000423 24 FE            [12]  693 	add	a,#0xfe
      000425 F5 34            [12]  694 	mov	_mask,a
      000427 80 1A            [24]  695 	sjmp	00111$
      000429                        696 00107$:
                                    697 ;	preemptive.c:259: else if( cur_thread == 2 )mask = mask - 4;
      000429 74 02            [12]  698 	mov	a,#0x02
      00042B B5 35 09         [24]  699 	cjne	a,_cur_thread,00104$
      00042E E5 34            [12]  700 	mov	a,_mask
      000430 FF               [12]  701 	mov	r7,a
      000431 24 FC            [12]  702 	add	a,#0xfc
      000433 F5 34            [12]  703 	mov	_mask,a
      000435 80 0C            [24]  704 	sjmp	00111$
      000437                        705 00104$:
                                    706 ;	preemptive.c:260: else if( cur_thread == 3 )mask = mask - 8;
      000437 74 03            [12]  707 	mov	a,#0x03
      000439 B5 35 07         [24]  708 	cjne	a,_cur_thread,00111$
      00043C E5 34            [12]  709 	mov	a,_mask
      00043E FF               [12]  710 	mov	r7,a
      00043F 24 F8            [12]  711 	add	a,#0xf8
      000441 F5 34            [12]  712 	mov	_mask,a
      000443                        713 00111$:
                                    714 ;	preemptive.c:262: if(  mask & 1  ){
      000443 E5 34            [12]  715 	mov	a,_mask
      000445 30 E0 05         [24]  716 	jnb	acc.0,00125$
                                    717 ;	preemptive.c:263: cur_thread = 0;
      000448 75 35 00         [24]  718 	mov	_cur_thread,#0x00
      00044B 80 20            [24]  719 	sjmp	00126$
      00044D                        720 00125$:
                                    721 ;	preemptive.c:264: }else if(  mask & 2  ){
      00044D E5 34            [12]  722 	mov	a,_mask
      00044F 30 E1 05         [24]  723 	jnb	acc.1,00122$
                                    724 ;	preemptive.c:265: cur_thread = 1;
      000452 75 35 01         [24]  725 	mov	_cur_thread,#0x01
      000455 80 16            [24]  726 	sjmp	00126$
      000457                        727 00122$:
                                    728 ;	preemptive.c:266: }else if(  mask & 4  ){
      000457 E5 34            [12]  729 	mov	a,_mask
      000459 30 E2 05         [24]  730 	jnb	acc.2,00119$
                                    731 ;	preemptive.c:267: cur_thread = 2;
      00045C 75 35 02         [24]  732 	mov	_cur_thread,#0x02
      00045F 80 0C            [24]  733 	sjmp	00126$
      000461                        734 00119$:
                                    735 ;	preemptive.c:268: }else if(  mask & 8  ){
      000461 E5 34            [12]  736 	mov	a,_mask
      000463 30 E3 05         [24]  737 	jnb	acc.3,00113$
                                    738 ;	preemptive.c:269: cur_thread = 3;
      000466 75 35 03         [24]  739 	mov	_cur_thread,#0x03
                                    740 ;	preemptive.c:272: while(1){}
      000469 80 02            [24]  741 	sjmp	00126$
      00046B                        742 00113$:
      00046B 80 FE            [24]  743 	sjmp	00113$
      00046D                        744 00126$:
                                    745 ;	preemptive.c:275: RESTORESTATE;
      00046D E5 35            [12]  746 	mov	a,_cur_thread
      00046F 24 30            [12]  747 	add	a,#_saved_sp
      000471 F9               [12]  748 	mov	r1,a
      000472 87 81            [24]  749 	mov	_SP,@r1
      000474 D0 D0            [24]  750 	POP PSW 
      000476 D0 83            [24]  751 	POP DPH 
      000478 D0 82            [24]  752 	POP DPL 
      00047A D0 F0            [24]  753 	POP B 
      00047C D0 E0            [24]  754 	POP ACC 
                                    755 ;	preemptive.c:276: EA = 1;
                                    756 ;	assignBit
      00047E D2 AF            [12]  757 	setb	_EA
                                    758 ;	preemptive.c:277: }
      000480 22               [24]  759 	ret
                                    760 	.area CSEG    (CODE)
                                    761 	.area CONST   (CODE)
                                    762 	.area XINIT   (CODE)
                                    763 	.area CABS    (ABS,CODE)
