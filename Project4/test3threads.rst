                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module test3threads
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _timer0_ISR
                                     12 	.globl __mcs51_genXRAMCLEAR
                                     13 	.globl __mcs51_genXINIT
                                     14 	.globl __mcs51_genRAMCLEAR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _Consumer
                                     18 	.globl _Producer2
                                     19 	.globl _Producer1
                                     20 	.globl _ThreadCreate
                                     21 	.globl _CY
                                     22 	.globl _AC
                                     23 	.globl _F0
                                     24 	.globl _RS1
                                     25 	.globl _RS0
                                     26 	.globl _OV
                                     27 	.globl _F1
                                     28 	.globl _P
                                     29 	.globl _PS
                                     30 	.globl _PT1
                                     31 	.globl _PX1
                                     32 	.globl _PT0
                                     33 	.globl _PX0
                                     34 	.globl _RD
                                     35 	.globl _WR
                                     36 	.globl _T1
                                     37 	.globl _T0
                                     38 	.globl _INT1
                                     39 	.globl _INT0
                                     40 	.globl _TXD
                                     41 	.globl _RXD
                                     42 	.globl _P3_7
                                     43 	.globl _P3_6
                                     44 	.globl _P3_5
                                     45 	.globl _P3_4
                                     46 	.globl _P3_3
                                     47 	.globl _P3_2
                                     48 	.globl _P3_1
                                     49 	.globl _P3_0
                                     50 	.globl _EA
                                     51 	.globl _ES
                                     52 	.globl _ET1
                                     53 	.globl _EX1
                                     54 	.globl _ET0
                                     55 	.globl _EX0
                                     56 	.globl _P2_7
                                     57 	.globl _P2_6
                                     58 	.globl _P2_5
                                     59 	.globl _P2_4
                                     60 	.globl _P2_3
                                     61 	.globl _P2_2
                                     62 	.globl _P2_1
                                     63 	.globl _P2_0
                                     64 	.globl _SM0
                                     65 	.globl _SM1
                                     66 	.globl _SM2
                                     67 	.globl _REN
                                     68 	.globl _TB8
                                     69 	.globl _RB8
                                     70 	.globl _TI
                                     71 	.globl _RI
                                     72 	.globl _P1_7
                                     73 	.globl _P1_6
                                     74 	.globl _P1_5
                                     75 	.globl _P1_4
                                     76 	.globl _P1_3
                                     77 	.globl _P1_2
                                     78 	.globl _P1_1
                                     79 	.globl _P1_0
                                     80 	.globl _TF1
                                     81 	.globl _TR1
                                     82 	.globl _TF0
                                     83 	.globl _TR0
                                     84 	.globl _IE1
                                     85 	.globl _IT1
                                     86 	.globl _IE0
                                     87 	.globl _IT0
                                     88 	.globl _P0_7
                                     89 	.globl _P0_6
                                     90 	.globl _P0_5
                                     91 	.globl _P0_4
                                     92 	.globl _P0_3
                                     93 	.globl _P0_2
                                     94 	.globl _P0_1
                                     95 	.globl _P0_0
                                     96 	.globl _B
                                     97 	.globl _ACC
                                     98 	.globl _PSW
                                     99 	.globl _IP
                                    100 	.globl _P3
                                    101 	.globl _IE
                                    102 	.globl _P2
                                    103 	.globl _SBUF
                                    104 	.globl _SCON
                                    105 	.globl _P1
                                    106 	.globl _TH1
                                    107 	.globl _TH0
                                    108 	.globl _TL1
                                    109 	.globl _TL0
                                    110 	.globl _TMOD
                                    111 	.globl _TCON
                                    112 	.globl _PCON
                                    113 	.globl _DPH
                                    114 	.globl _DPL
                                    115 	.globl _SP
                                    116 	.globl _P0
                                    117 	.globl _turn2
                                    118 	.globl _turn
                                    119 	.globl _Token2
                                    120 	.globl _empty
                                    121 	.globl _mutex
                                    122 	.globl _full
                                    123 	.globl _Token
                                    124 	.globl _buffer
                                    125 ;--------------------------------------------------------
                                    126 ; special function registers
                                    127 ;--------------------------------------------------------
                                    128 	.area RSEG    (ABS,DATA)
      000000                        129 	.org 0x0000
                           000080   130 _P0	=	0x0080
                           000081   131 _SP	=	0x0081
                           000082   132 _DPL	=	0x0082
                           000083   133 _DPH	=	0x0083
                           000087   134 _PCON	=	0x0087
                           000088   135 _TCON	=	0x0088
                           000089   136 _TMOD	=	0x0089
                           00008A   137 _TL0	=	0x008a
                           00008B   138 _TL1	=	0x008b
                           00008C   139 _TH0	=	0x008c
                           00008D   140 _TH1	=	0x008d
                           000090   141 _P1	=	0x0090
                           000098   142 _SCON	=	0x0098
                           000099   143 _SBUF	=	0x0099
                           0000A0   144 _P2	=	0x00a0
                           0000A8   145 _IE	=	0x00a8
                           0000B0   146 _P3	=	0x00b0
                           0000B8   147 _IP	=	0x00b8
                           0000D0   148 _PSW	=	0x00d0
                           0000E0   149 _ACC	=	0x00e0
                           0000F0   150 _B	=	0x00f0
                                    151 ;--------------------------------------------------------
                                    152 ; special function bits
                                    153 ;--------------------------------------------------------
                                    154 	.area RSEG    (ABS,DATA)
      000000                        155 	.org 0x0000
                           000080   156 _P0_0	=	0x0080
                           000081   157 _P0_1	=	0x0081
                           000082   158 _P0_2	=	0x0082
                           000083   159 _P0_3	=	0x0083
                           000084   160 _P0_4	=	0x0084
                           000085   161 _P0_5	=	0x0085
                           000086   162 _P0_6	=	0x0086
                           000087   163 _P0_7	=	0x0087
                           000088   164 _IT0	=	0x0088
                           000089   165 _IE0	=	0x0089
                           00008A   166 _IT1	=	0x008a
                           00008B   167 _IE1	=	0x008b
                           00008C   168 _TR0	=	0x008c
                           00008D   169 _TF0	=	0x008d
                           00008E   170 _TR1	=	0x008e
                           00008F   171 _TF1	=	0x008f
                           000090   172 _P1_0	=	0x0090
                           000091   173 _P1_1	=	0x0091
                           000092   174 _P1_2	=	0x0092
                           000093   175 _P1_3	=	0x0093
                           000094   176 _P1_4	=	0x0094
                           000095   177 _P1_5	=	0x0095
                           000096   178 _P1_6	=	0x0096
                           000097   179 _P1_7	=	0x0097
                           000098   180 _RI	=	0x0098
                           000099   181 _TI	=	0x0099
                           00009A   182 _RB8	=	0x009a
                           00009B   183 _TB8	=	0x009b
                           00009C   184 _REN	=	0x009c
                           00009D   185 _SM2	=	0x009d
                           00009E   186 _SM1	=	0x009e
                           00009F   187 _SM0	=	0x009f
                           0000A0   188 _P2_0	=	0x00a0
                           0000A1   189 _P2_1	=	0x00a1
                           0000A2   190 _P2_2	=	0x00a2
                           0000A3   191 _P2_3	=	0x00a3
                           0000A4   192 _P2_4	=	0x00a4
                           0000A5   193 _P2_5	=	0x00a5
                           0000A6   194 _P2_6	=	0x00a6
                           0000A7   195 _P2_7	=	0x00a7
                           0000A8   196 _EX0	=	0x00a8
                           0000A9   197 _ET0	=	0x00a9
                           0000AA   198 _EX1	=	0x00aa
                           0000AB   199 _ET1	=	0x00ab
                           0000AC   200 _ES	=	0x00ac
                           0000AF   201 _EA	=	0x00af
                           0000B0   202 _P3_0	=	0x00b0
                           0000B1   203 _P3_1	=	0x00b1
                           0000B2   204 _P3_2	=	0x00b2
                           0000B3   205 _P3_3	=	0x00b3
                           0000B4   206 _P3_4	=	0x00b4
                           0000B5   207 _P3_5	=	0x00b5
                           0000B6   208 _P3_6	=	0x00b6
                           0000B7   209 _P3_7	=	0x00b7
                           0000B0   210 _RXD	=	0x00b0
                           0000B1   211 _TXD	=	0x00b1
                           0000B2   212 _INT0	=	0x00b2
                           0000B3   213 _INT1	=	0x00b3
                           0000B4   214 _T0	=	0x00b4
                           0000B5   215 _T1	=	0x00b5
                           0000B6   216 _WR	=	0x00b6
                           0000B7   217 _RD	=	0x00b7
                           0000B8   218 _PX0	=	0x00b8
                           0000B9   219 _PT0	=	0x00b9
                           0000BA   220 _PX1	=	0x00ba
                           0000BB   221 _PT1	=	0x00bb
                           0000BC   222 _PS	=	0x00bc
                           0000D0   223 _P	=	0x00d0
                           0000D1   224 _F1	=	0x00d1
                           0000D2   225 _OV	=	0x00d2
                           0000D3   226 _RS0	=	0x00d3
                           0000D4   227 _RS1	=	0x00d4
                           0000D5   228 _F0	=	0x00d5
                           0000D6   229 _AC	=	0x00d6
                           0000D7   230 _CY	=	0x00d7
                                    231 ;--------------------------------------------------------
                                    232 ; overlayable register banks
                                    233 ;--------------------------------------------------------
                                    234 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        235 	.ds 8
                                    236 ;--------------------------------------------------------
                                    237 ; internal ram data
                                    238 ;--------------------------------------------------------
                                    239 	.area DSEG    (DATA)
                           00003A   240 _buffer	=	0x003a
                           00003B   241 _Token	=	0x003b
                           00003C   242 _full	=	0x003c
                           00003D   243 _mutex	=	0x003d
                           00003E   244 _empty	=	0x003e
                           00003F   245 _Token2	=	0x003f
                           00002A   246 _turn	=	0x002a
                           00002B   247 _turn2	=	0x002b
                                    248 ;--------------------------------------------------------
                                    249 ; overlayable items in internal ram
                                    250 ;--------------------------------------------------------
                                    251 ;--------------------------------------------------------
                                    252 ; Stack segment in internal ram
                                    253 ;--------------------------------------------------------
                                    254 	.area	SSEG
      000021                        255 __start__stack:
      000021                        256 	.ds	1
                                    257 
                                    258 ;--------------------------------------------------------
                                    259 ; indirectly addressable internal ram data
                                    260 ;--------------------------------------------------------
                                    261 	.area ISEG    (DATA)
                                    262 ;--------------------------------------------------------
                                    263 ; absolute internal ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area IABS    (ABS,DATA)
                                    266 	.area IABS    (ABS,DATA)
                                    267 ;--------------------------------------------------------
                                    268 ; bit data
                                    269 ;--------------------------------------------------------
                                    270 	.area BSEG    (BIT)
      000000                        271 _Producer1_sloc0_1_0:
      000000                        272 	.ds 1
      000001                        273 _Producer2_sloc0_1_0:
      000001                        274 	.ds 1
      000002                        275 _Consumer_sloc0_1_0:
      000002                        276 	.ds 1
                                    277 ;--------------------------------------------------------
                                    278 ; paged external ram data
                                    279 ;--------------------------------------------------------
                                    280 	.area PSEG    (PAG,XDATA)
                                    281 ;--------------------------------------------------------
                                    282 ; external ram data
                                    283 ;--------------------------------------------------------
                                    284 	.area XSEG    (XDATA)
                                    285 ;--------------------------------------------------------
                                    286 ; absolute external ram data
                                    287 ;--------------------------------------------------------
                                    288 	.area XABS    (ABS,XDATA)
                                    289 ;--------------------------------------------------------
                                    290 ; external initialized ram data
                                    291 ;--------------------------------------------------------
                                    292 	.area XISEG   (XDATA)
                                    293 	.area HOME    (CODE)
                                    294 	.area GSINIT0 (CODE)
                                    295 	.area GSINIT1 (CODE)
                                    296 	.area GSINIT2 (CODE)
                                    297 	.area GSINIT3 (CODE)
                                    298 	.area GSINIT4 (CODE)
                                    299 	.area GSINIT5 (CODE)
                                    300 	.area GSINIT  (CODE)
                                    301 	.area GSFINAL (CODE)
                                    302 	.area CSEG    (CODE)
                                    303 ;--------------------------------------------------------
                                    304 ; interrupt vector
                                    305 ;--------------------------------------------------------
                                    306 	.area HOME    (CODE)
      000000                        307 __interrupt_vect:
      000000 02 00 FE         [24]  308 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  309 	reti
      000004                        310 	.ds	7
      00000B 02 01 05         [24]  311 	ljmp	_timer0_ISR
                                    312 ;--------------------------------------------------------
                                    313 ; global & static initialisations
                                    314 ;--------------------------------------------------------
                                    315 	.area HOME    (CODE)
                                    316 	.area GSINIT  (CODE)
                                    317 	.area GSFINAL (CODE)
                                    318 	.area GSINIT  (CODE)
                                    319 	.globl __sdcc_gsinit_startup
                                    320 	.globl __sdcc_program_startup
                                    321 	.globl __start__stack
                                    322 	.globl __mcs51_genXINIT
                                    323 	.globl __mcs51_genXRAMCLEAR
                                    324 	.globl __mcs51_genRAMCLEAR
                                    325 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  326 	ljmp	__sdcc_program_startup
                                    327 ;--------------------------------------------------------
                                    328 ; Home
                                    329 ;--------------------------------------------------------
                                    330 	.area HOME    (CODE)
                                    331 	.area HOME    (CODE)
      00000E                        332 __sdcc_program_startup:
      00000E 02 00 E0         [24]  333 	ljmp	_main
                                    334 ;	return from main will return to caller
                                    335 ;--------------------------------------------------------
                                    336 ; code
                                    337 ;--------------------------------------------------------
                                    338 	.area CSEG    (CODE)
                                    339 ;------------------------------------------------------------
                                    340 ;Allocation info for local variables in function 'Producer1'
                                    341 ;------------------------------------------------------------
                                    342 ;	test3threads.c:17: void Producer1(void) {
                                    343 ;	-----------------------------------------
                                    344 ;	 function Producer1
                                    345 ;	-----------------------------------------
      000014                        346 _Producer1:
                           000007   347 	ar7 = 0x07
                           000006   348 	ar6 = 0x06
                           000005   349 	ar5 = 0x05
                           000004   350 	ar4 = 0x04
                           000003   351 	ar3 = 0x03
                           000002   352 	ar2 = 0x02
                           000001   353 	ar1 = 0x01
                           000000   354 	ar0 = 0x00
                                    355 ;	test3threads.c:18: Token = 'A';
      000014 75 3B 41         [24]  356 	mov	_Token,#0x41
                                    357 ;	test3threads.c:19: while (1) {
      000017                        358 00102$:
                                    359 ;	test3threads.c:23: SemaphoreWaitBody(turn,  L(__COUNTER__));
      000017                        360 		0$:
      000017 E5 2A            [12]  361 	MOV A, _turn 
      000019 60 FC            [24]  362 	JZ 0$ 
      00001B 20 E7 F9         [24]  363 	JB ACC.7, 0$ 
      00001E 15 2A            [12]  364 	dec _turn 
                                    365 ;	test3threads.c:24: SemaphoreWaitBody(empty, L(__COUNTER__) );
      000020                        366 		1$:
      000020 E5 3E            [12]  367 	MOV A, _empty 
      000022 60 FC            [24]  368 	JZ 1$ 
      000024 20 E7 F9         [24]  369 	JB ACC.7, 1$ 
      000027 15 3E            [12]  370 	dec _empty 
                                    371 ;	test3threads.c:25: SemaphoreWaitBody(mutex, L(__COUNTER__) );
      000029                        372 		2$:
      000029 E5 3D            [12]  373 	MOV A, _mutex 
      00002B 60 FC            [24]  374 	JZ 2$ 
      00002D 20 E7 F9         [24]  375 	JB ACC.7, 2$ 
      000030 15 3D            [12]  376 	dec _mutex 
                                    377 ;	test3threads.c:30: }
      000032 D2 00            [12]  378 	setb	_Producer1_sloc0_1_0
      000034 10 AF 02         [24]  379 	jbc	ea,00116$
      000037 C2 00            [12]  380 	clr	_Producer1_sloc0_1_0
      000039                        381 00116$:
                                    382 ;	test3threads.c:27: buffer = Token;
      000039 85 3B 3A         [24]  383 	mov	_buffer,_Token
                                    384 ;	test3threads.c:28: Token = ( Token == 'Z' ) ? 'A' :  Token + 1;
      00003C 74 5A            [12]  385 	mov	a,#0x5a
      00003E B5 3B 06         [24]  386 	cjne	a,_Token,00106$
      000041 7E 41            [12]  387 	mov	r6,#0x41
      000043 7F 00            [12]  388 	mov	r7,#0x00
      000045 80 09            [24]  389 	sjmp	00107$
      000047                        390 00106$:
      000047 AD 3B            [24]  391 	mov	r5,_Token
      000049 0D               [12]  392 	inc	r5
      00004A ED               [12]  393 	mov	a,r5
      00004B FE               [12]  394 	mov	r6,a
      00004C 33               [12]  395 	rlc	a
      00004D 95 E0            [12]  396 	subb	a,acc
      00004F FF               [12]  397 	mov	r7,a
      000050                        398 00107$:
      000050 8E 3B            [24]  399 	mov	_Token,r6
      000052 A2 00            [12]  400 	mov	c,_Producer1_sloc0_1_0
      000054 92 AF            [24]  401 	mov	ea,c
                                    402 ;	test3threads.c:31: SemaphoreSignal(mutex);
      000056 05 3D            [12]  403 	INC _mutex 
                                    404 ;	test3threads.c:32: SemaphoreSignal(full);
      000058 05 3C            [12]  405 	INC _full 
                                    406 ;	test3threads.c:33: SemaphoreSignal(turn2);
      00005A 05 2B            [12]  407 	INC _turn2 
                                    408 ;	test3threads.c:36: }
      00005C 80 B9            [24]  409 	sjmp	00102$
                                    410 ;------------------------------------------------------------
                                    411 ;Allocation info for local variables in function 'Producer2'
                                    412 ;------------------------------------------------------------
                                    413 ;	test3threads.c:37: void Producer2(void) {
                                    414 ;	-----------------------------------------
                                    415 ;	 function Producer2
                                    416 ;	-----------------------------------------
      00005E                        417 _Producer2:
                                    418 ;	test3threads.c:38: Token2 = '0';
      00005E 75 3F 30         [24]  419 	mov	_Token2,#0x30
                                    420 ;	test3threads.c:39: while (1) {
      000061                        421 00102$:
                                    422 ;	test3threads.c:43: SemaphoreWaitBody(turn2,  L(__COUNTER__));
      000061                        423 		3$:
      000061 E5 2B            [12]  424 	MOV A, _turn2 
      000063 60 FC            [24]  425 	JZ 3$ 
      000065 20 E7 F9         [24]  426 	JB ACC.7, 3$ 
      000068 15 2B            [12]  427 	dec _turn2 
                                    428 ;	test3threads.c:44: SemaphoreWaitBody(empty, L(__COUNTER__) );
      00006A                        429 		4$:
      00006A E5 3E            [12]  430 	MOV A, _empty 
      00006C 60 FC            [24]  431 	JZ 4$ 
      00006E 20 E7 F9         [24]  432 	JB ACC.7, 4$ 
      000071 15 3E            [12]  433 	dec _empty 
                                    434 ;	test3threads.c:45: SemaphoreWaitBody(mutex, L(__COUNTER__) );
      000073                        435 		5$:
      000073 E5 3D            [12]  436 	MOV A, _mutex 
      000075 60 FC            [24]  437 	JZ 5$ 
      000077 20 E7 F9         [24]  438 	JB ACC.7, 5$ 
      00007A 15 3D            [12]  439 	dec _mutex 
                                    440 ;	test3threads.c:50: }
      00007C D2 01            [12]  441 	setb	_Producer2_sloc0_1_0
      00007E 10 AF 02         [24]  442 	jbc	ea,00116$
      000081 C2 01            [12]  443 	clr	_Producer2_sloc0_1_0
      000083                        444 00116$:
                                    445 ;	test3threads.c:47: buffer = Token2;
      000083 85 3F 3A         [24]  446 	mov	_buffer,_Token2
                                    447 ;	test3threads.c:48: Token2 = ( Token2 == '9' ) ? '0' :  Token2 + 1;
      000086 74 39            [12]  448 	mov	a,#0x39
      000088 B5 3F 06         [24]  449 	cjne	a,_Token2,00106$
      00008B 7E 30            [12]  450 	mov	r6,#0x30
      00008D 7F 00            [12]  451 	mov	r7,#0x00
      00008F 80 09            [24]  452 	sjmp	00107$
      000091                        453 00106$:
      000091 AD 3F            [24]  454 	mov	r5,_Token2
      000093 0D               [12]  455 	inc	r5
      000094 ED               [12]  456 	mov	a,r5
      000095 FE               [12]  457 	mov	r6,a
      000096 33               [12]  458 	rlc	a
      000097 95 E0            [12]  459 	subb	a,acc
      000099 FF               [12]  460 	mov	r7,a
      00009A                        461 00107$:
      00009A 8E 3F            [24]  462 	mov	_Token2,r6
      00009C A2 01            [12]  463 	mov	c,_Producer2_sloc0_1_0
      00009E 92 AF            [24]  464 	mov	ea,c
                                    465 ;	test3threads.c:51: SemaphoreSignal(mutex);
      0000A0 05 3D            [12]  466 	INC _mutex 
                                    467 ;	test3threads.c:52: SemaphoreSignal(full);
      0000A2 05 3C            [12]  468 	INC _full 
                                    469 ;	test3threads.c:53: SemaphoreSignal(turn);
      0000A4 05 2A            [12]  470 	INC _turn 
                                    471 ;	test3threads.c:56: }
      0000A6 80 B9            [24]  472 	sjmp	00102$
                                    473 ;------------------------------------------------------------
                                    474 ;Allocation info for local variables in function 'Consumer'
                                    475 ;------------------------------------------------------------
                                    476 ;	test3threads.c:58: void Consumer(void) {
                                    477 ;	-----------------------------------------
                                    478 ;	 function Consumer
                                    479 ;	-----------------------------------------
      0000A8                        480 _Consumer:
                                    481 ;	test3threads.c:60: EA = 0;
                                    482 ;	assignBit
      0000A8 C2 AF            [12]  483 	clr	_EA
                                    484 ;	test3threads.c:61: TMOD |= 0x20; // TMOD is also assigned by the (modified) Bootstrap code to set up the timer interrupt in timer-0 for preemption 
      0000AA 43 89 20         [24]  485 	orl	_TMOD,#0x20
                                    486 ;	test3threads.c:62: TH1 = -6;
      0000AD 75 8D FA         [24]  487 	mov	_TH1,#0xfa
                                    488 ;	test3threads.c:63: SCON = 0x50;
      0000B0 75 98 50         [24]  489 	mov	_SCON,#0x50
                                    490 ;	test3threads.c:64: TR1 = 1;
                                    491 ;	assignBit
      0000B3 D2 8E            [12]  492 	setb	_TR1
                                    493 ;	test3threads.c:65: EA = 1;
                                    494 ;	assignBit
      0000B5 D2 AF            [12]  495 	setb	_EA
                                    496 ;	test3threads.c:66: while (1) {
      0000B7                        497 00105$:
                                    498 ;	test3threads.c:67: SemaphoreWaitBody(full,  L(__COUNTER__));
      0000B7                        499 		6$:
      0000B7 E5 3C            [12]  500 	MOV A, _full 
      0000B9 60 FC            [24]  501 	JZ 6$ 
      0000BB 20 E7 F9         [24]  502 	JB ACC.7, 6$ 
      0000BE 15 3C            [12]  503 	dec _full 
                                    504 ;	test3threads.c:68: SemaphoreWaitBody(mutex,  L(__COUNTER__));
      0000C0                        505 		7$:
      0000C0 E5 3D            [12]  506 	MOV A, _mutex 
      0000C2 60 FC            [24]  507 	JZ 7$ 
      0000C4 20 E7 F9         [24]  508 	JB ACC.7, 7$ 
      0000C7 15 3D            [12]  509 	dec _mutex 
                                    510 ;	test3threads.c:72: }
      0000C9 D2 02            [12]  511 	setb	_Consumer_sloc0_1_0
      0000CB 10 AF 02         [24]  512 	jbc	ea,00121$
      0000CE C2 02            [12]  513 	clr	_Consumer_sloc0_1_0
      0000D0                        514 00121$:
                                    515 ;	test3threads.c:70: SBUF = buffer;
      0000D0 85 3A 99         [24]  516 	mov	_SBUF,_buffer
      0000D3 A2 02            [12]  517 	mov	c,_Consumer_sloc0_1_0
      0000D5 92 AF            [24]  518 	mov	ea,c
                                    519 ;	test3threads.c:73: SemaphoreSignal(mutex);
      0000D7 05 3D            [12]  520 	INC _mutex 
                                    521 ;	test3threads.c:74: SemaphoreSignal(empty);
      0000D9 05 3E            [12]  522 	INC _empty 
                                    523 ;	test3threads.c:76: while( !TI ){}
      0000DB                        524 00101$:
                                    525 ;	test3threads.c:77: TI = 0;
                                    526 ;	assignBit
      0000DB 10 99 D9         [24]  527 	jbc	_TI,00105$
                                    528 ;	test3threads.c:79: }
      0000DE 80 FB            [24]  529 	sjmp	00101$
                                    530 ;------------------------------------------------------------
                                    531 ;Allocation info for local variables in function 'main'
                                    532 ;------------------------------------------------------------
                                    533 ;	test3threads.c:81: void main(void) {
                                    534 ;	-----------------------------------------
                                    535 ;	 function main
                                    536 ;	-----------------------------------------
      0000E0                        537 _main:
                                    538 ;	test3threads.c:82: SemaphoreCreate(full, 0);
      0000E0 75 3C 00         [24]  539 	mov	_full,#0x00
                                    540 ;	test3threads.c:83: SemaphoreCreate(mutex, 1);
      0000E3 75 3D 01         [24]  541 	mov	_mutex,#0x01
                                    542 ;	test3threads.c:84: SemaphoreCreate(empty,1);
      0000E6 75 3E 01         [24]  543 	mov	_empty,#0x01
                                    544 ;	test3threads.c:85: SemaphoreCreate(turn, 0);
      0000E9 75 2A 00         [24]  545 	mov	_turn,#0x00
                                    546 ;	test3threads.c:86: SemaphoreCreate(turn2, 1);
      0000EC 75 2B 01         [24]  547 	mov	_turn2,#0x01
                                    548 ;	test3threads.c:89: ThreadCreate( Producer1 );
      0000EF 90 00 14         [24]  549 	mov	dptr,#_Producer1
      0000F2 12 01 C5         [24]  550 	lcall	_ThreadCreate
                                    551 ;	test3threads.c:90: ThreadCreate( Producer2 );
      0000F5 90 00 5E         [24]  552 	mov	dptr,#_Producer2
      0000F8 12 01 C5         [24]  553 	lcall	_ThreadCreate
                                    554 ;	test3threads.c:91: Consumer();
                                    555 ;	test3threads.c:94: }
      0000FB 02 00 A8         [24]  556 	ljmp	_Consumer
                                    557 ;------------------------------------------------------------
                                    558 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    559 ;------------------------------------------------------------
                                    560 ;	test3threads.c:96: void _sdcc_gsinit_startup(void) {
                                    561 ;	-----------------------------------------
                                    562 ;	 function _sdcc_gsinit_startup
                                    563 ;	-----------------------------------------
      0000FE                        564 __sdcc_gsinit_startup:
                                    565 ;	test3threads.c:99: __endasm;
      0000FE 02 01 09         [24]  566 	ljmp	_Bootstrap
                                    567 ;	test3threads.c:100: }
      000101 22               [24]  568 	ret
                                    569 ;------------------------------------------------------------
                                    570 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    571 ;------------------------------------------------------------
                                    572 ;	test3threads.c:102: void _mcs51_genRAMCLEAR(void) {}
                                    573 ;	-----------------------------------------
                                    574 ;	 function _mcs51_genRAMCLEAR
                                    575 ;	-----------------------------------------
      000102                        576 __mcs51_genRAMCLEAR:
      000102 22               [24]  577 	ret
                                    578 ;------------------------------------------------------------
                                    579 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    580 ;------------------------------------------------------------
                                    581 ;	test3threads.c:103: void _mcs51_genXINIT(void) {}
                                    582 ;	-----------------------------------------
                                    583 ;	 function _mcs51_genXINIT
                                    584 ;	-----------------------------------------
      000103                        585 __mcs51_genXINIT:
      000103 22               [24]  586 	ret
                                    587 ;------------------------------------------------------------
                                    588 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    589 ;------------------------------------------------------------
                                    590 ;	test3threads.c:104: void _mcs51_genXRAMCLEAR(void) {}
                                    591 ;	-----------------------------------------
                                    592 ;	 function _mcs51_genXRAMCLEAR
                                    593 ;	-----------------------------------------
      000104                        594 __mcs51_genXRAMCLEAR:
      000104 22               [24]  595 	ret
                                    596 ;------------------------------------------------------------
                                    597 ;Allocation info for local variables in function 'timer0_ISR'
                                    598 ;------------------------------------------------------------
                                    599 ;	test3threads.c:105: void timer0_ISR(void) __interrupt(1) {
                                    600 ;	-----------------------------------------
                                    601 ;	 function timer0_ISR
                                    602 ;	-----------------------------------------
      000105                        603 _timer0_ISR:
                                    604 ;	test3threads.c:108: __endasm;
      000105 02 01 2F         [24]  605 	ljmp	_myTimer0Handler
                                    606 ;	test3threads.c:109: }
      000108 32               [24]  607 	reti
                                    608 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    609 ;	eliminated unneeded push/pop not_psw
                                    610 ;	eliminated unneeded push/pop dpl
                                    611 ;	eliminated unneeded push/pop dph
                                    612 ;	eliminated unneeded push/pop b
                                    613 ;	eliminated unneeded push/pop acc
                                    614 	.area CSEG    (CODE)
                                    615 	.area CONST   (CODE)
                                    616 	.area XINIT   (CODE)
                                    617 	.area CABS    (ABS,CODE)
