                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 4.2.0 #13081 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module testparking
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
                                     17 	.globl _Producer
                                     18 	.globl _ThreadExit
                                     19 	.globl _ThreadCreate
                                     20 	.globl _CY
                                     21 	.globl _AC
                                     22 	.globl _F0
                                     23 	.globl _RS1
                                     24 	.globl _RS0
                                     25 	.globl _OV
                                     26 	.globl _F1
                                     27 	.globl _P
                                     28 	.globl _PS
                                     29 	.globl _PT1
                                     30 	.globl _PX1
                                     31 	.globl _PT0
                                     32 	.globl _PX0
                                     33 	.globl _RD
                                     34 	.globl _WR
                                     35 	.globl _T1
                                     36 	.globl _T0
                                     37 	.globl _INT1
                                     38 	.globl _INT0
                                     39 	.globl _TXD
                                     40 	.globl _RXD
                                     41 	.globl _P3_7
                                     42 	.globl _P3_6
                                     43 	.globl _P3_5
                                     44 	.globl _P3_4
                                     45 	.globl _P3_3
                                     46 	.globl _P3_2
                                     47 	.globl _P3_1
                                     48 	.globl _P3_0
                                     49 	.globl _EA
                                     50 	.globl _ES
                                     51 	.globl _ET1
                                     52 	.globl _EX1
                                     53 	.globl _ET0
                                     54 	.globl _EX0
                                     55 	.globl _P2_7
                                     56 	.globl _P2_6
                                     57 	.globl _P2_5
                                     58 	.globl _P2_4
                                     59 	.globl _P2_3
                                     60 	.globl _P2_2
                                     61 	.globl _P2_1
                                     62 	.globl _P2_0
                                     63 	.globl _SM0
                                     64 	.globl _SM1
                                     65 	.globl _SM2
                                     66 	.globl _REN
                                     67 	.globl _TB8
                                     68 	.globl _RB8
                                     69 	.globl _TI
                                     70 	.globl _RI
                                     71 	.globl _P1_7
                                     72 	.globl _P1_6
                                     73 	.globl _P1_5
                                     74 	.globl _P1_4
                                     75 	.globl _P1_3
                                     76 	.globl _P1_2
                                     77 	.globl _P1_1
                                     78 	.globl _P1_0
                                     79 	.globl _TF1
                                     80 	.globl _TR1
                                     81 	.globl _TF0
                                     82 	.globl _TR0
                                     83 	.globl _IE1
                                     84 	.globl _IT1
                                     85 	.globl _IE0
                                     86 	.globl _IT0
                                     87 	.globl _P0_7
                                     88 	.globl _P0_6
                                     89 	.globl _P0_5
                                     90 	.globl _P0_4
                                     91 	.globl _P0_3
                                     92 	.globl _P0_2
                                     93 	.globl _P0_1
                                     94 	.globl _P0_0
                                     95 	.globl _B
                                     96 	.globl _ACC
                                     97 	.globl _PSW
                                     98 	.globl _IP
                                     99 	.globl _P3
                                    100 	.globl _IE
                                    101 	.globl _P2
                                    102 	.globl _SBUF
                                    103 	.globl _SCON
                                    104 	.globl _P1
                                    105 	.globl _TH1
                                    106 	.globl _TH0
                                    107 	.globl _TL1
                                    108 	.globl _TL0
                                    109 	.globl _TMOD
                                    110 	.globl _TCON
                                    111 	.globl _PCON
                                    112 	.globl _DPH
                                    113 	.globl _DPL
                                    114 	.globl _SP
                                    115 	.globl _P0
                                    116 	.globl _car_id
                                    117 	.globl _car_name
                                    118 	.globl _id
                                    119 	.globl _Token2
                                    120 	.globl _empty
                                    121 	.globl _mutex
                                    122 	.globl _car
                                    123 	.globl _Token
                                    124 	.globl _next_car
                                    125 	.globl _time_temp
                                    126 	.globl _time_sec
                                    127 	.globl _time
                                    128 	.globl _cur_thread
                                    129 ;--------------------------------------------------------
                                    130 ; special function registers
                                    131 ;--------------------------------------------------------
                                    132 	.area RSEG    (ABS,DATA)
      000000                        133 	.org 0x0000
                           000080   134 _P0	=	0x0080
                           000081   135 _SP	=	0x0081
                           000082   136 _DPL	=	0x0082
                           000083   137 _DPH	=	0x0083
                           000087   138 _PCON	=	0x0087
                           000088   139 _TCON	=	0x0088
                           000089   140 _TMOD	=	0x0089
                           00008A   141 _TL0	=	0x008a
                           00008B   142 _TL1	=	0x008b
                           00008C   143 _TH0	=	0x008c
                           00008D   144 _TH1	=	0x008d
                           000090   145 _P1	=	0x0090
                           000098   146 _SCON	=	0x0098
                           000099   147 _SBUF	=	0x0099
                           0000A0   148 _P2	=	0x00a0
                           0000A8   149 _IE	=	0x00a8
                           0000B0   150 _P3	=	0x00b0
                           0000B8   151 _IP	=	0x00b8
                           0000D0   152 _PSW	=	0x00d0
                           0000E0   153 _ACC	=	0x00e0
                           0000F0   154 _B	=	0x00f0
                                    155 ;--------------------------------------------------------
                                    156 ; special function bits
                                    157 ;--------------------------------------------------------
                                    158 	.area RSEG    (ABS,DATA)
      000000                        159 	.org 0x0000
                           000080   160 _P0_0	=	0x0080
                           000081   161 _P0_1	=	0x0081
                           000082   162 _P0_2	=	0x0082
                           000083   163 _P0_3	=	0x0083
                           000084   164 _P0_4	=	0x0084
                           000085   165 _P0_5	=	0x0085
                           000086   166 _P0_6	=	0x0086
                           000087   167 _P0_7	=	0x0087
                           000088   168 _IT0	=	0x0088
                           000089   169 _IE0	=	0x0089
                           00008A   170 _IT1	=	0x008a
                           00008B   171 _IE1	=	0x008b
                           00008C   172 _TR0	=	0x008c
                           00008D   173 _TF0	=	0x008d
                           00008E   174 _TR1	=	0x008e
                           00008F   175 _TF1	=	0x008f
                           000090   176 _P1_0	=	0x0090
                           000091   177 _P1_1	=	0x0091
                           000092   178 _P1_2	=	0x0092
                           000093   179 _P1_3	=	0x0093
                           000094   180 _P1_4	=	0x0094
                           000095   181 _P1_5	=	0x0095
                           000096   182 _P1_6	=	0x0096
                           000097   183 _P1_7	=	0x0097
                           000098   184 _RI	=	0x0098
                           000099   185 _TI	=	0x0099
                           00009A   186 _RB8	=	0x009a
                           00009B   187 _TB8	=	0x009b
                           00009C   188 _REN	=	0x009c
                           00009D   189 _SM2	=	0x009d
                           00009E   190 _SM1	=	0x009e
                           00009F   191 _SM0	=	0x009f
                           0000A0   192 _P2_0	=	0x00a0
                           0000A1   193 _P2_1	=	0x00a1
                           0000A2   194 _P2_2	=	0x00a2
                           0000A3   195 _P2_3	=	0x00a3
                           0000A4   196 _P2_4	=	0x00a4
                           0000A5   197 _P2_5	=	0x00a5
                           0000A6   198 _P2_6	=	0x00a6
                           0000A7   199 _P2_7	=	0x00a7
                           0000A8   200 _EX0	=	0x00a8
                           0000A9   201 _ET0	=	0x00a9
                           0000AA   202 _EX1	=	0x00aa
                           0000AB   203 _ET1	=	0x00ab
                           0000AC   204 _ES	=	0x00ac
                           0000AF   205 _EA	=	0x00af
                           0000B0   206 _P3_0	=	0x00b0
                           0000B1   207 _P3_1	=	0x00b1
                           0000B2   208 _P3_2	=	0x00b2
                           0000B3   209 _P3_3	=	0x00b3
                           0000B4   210 _P3_4	=	0x00b4
                           0000B5   211 _P3_5	=	0x00b5
                           0000B6   212 _P3_6	=	0x00b6
                           0000B7   213 _P3_7	=	0x00b7
                           0000B0   214 _RXD	=	0x00b0
                           0000B1   215 _TXD	=	0x00b1
                           0000B2   216 _INT0	=	0x00b2
                           0000B3   217 _INT1	=	0x00b3
                           0000B4   218 _T0	=	0x00b4
                           0000B5   219 _T1	=	0x00b5
                           0000B6   220 _WR	=	0x00b6
                           0000B7   221 _RD	=	0x00b7
                           0000B8   222 _PX0	=	0x00b8
                           0000B9   223 _PT0	=	0x00b9
                           0000BA   224 _PX1	=	0x00ba
                           0000BB   225 _PT1	=	0x00bb
                           0000BC   226 _PS	=	0x00bc
                           0000D0   227 _P	=	0x00d0
                           0000D1   228 _F1	=	0x00d1
                           0000D2   229 _OV	=	0x00d2
                           0000D3   230 _RS0	=	0x00d3
                           0000D4   231 _RS1	=	0x00d4
                           0000D5   232 _F0	=	0x00d5
                           0000D6   233 _AC	=	0x00d6
                           0000D7   234 _CY	=	0x00d7
                                    235 ;--------------------------------------------------------
                                    236 ; overlayable register banks
                                    237 ;--------------------------------------------------------
                                    238 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        239 	.ds 8
                                    240 ;--------------------------------------------------------
                                    241 ; internal ram data
                                    242 ;--------------------------------------------------------
                                    243 	.area DSEG    (DATA)
                           000035   244 _cur_thread	=	0x0035
                           000039   245 _time	=	0x0039
                           000024   246 _time_sec	=	0x0024
                           000020   247 _time_temp	=	0x0020
                           00003A   248 _next_car	=	0x003a
                           00003B   249 _Token	=	0x003b
                           00003C   250 _car	=	0x003c
                           00003D   251 _mutex	=	0x003d
                           00003E   252 _empty	=	0x003e
                           00003F   253 _Token2	=	0x003f
                           00002A   254 _id	=	0x002a
                           00002B   255 _car_name	=	0x002b
                           00002F   256 _car_id	=	0x002f
                                    257 ;--------------------------------------------------------
                                    258 ; overlayable items in internal ram
                                    259 ;--------------------------------------------------------
                                    260 ;--------------------------------------------------------
                                    261 ; Stack segment in internal ram
                                    262 ;--------------------------------------------------------
                                    263 	.area	SSEG
      000021                        264 __start__stack:
      000021                        265 	.ds	1
                                    266 
                                    267 ;--------------------------------------------------------
                                    268 ; indirectly addressable internal ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area ISEG    (DATA)
                                    271 ;--------------------------------------------------------
                                    272 ; absolute internal ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area IABS    (ABS,DATA)
                                    275 	.area IABS    (ABS,DATA)
                                    276 ;--------------------------------------------------------
                                    277 ; bit data
                                    278 ;--------------------------------------------------------
                                    279 	.area BSEG    (BIT)
                                    280 ;--------------------------------------------------------
                                    281 ; paged external ram data
                                    282 ;--------------------------------------------------------
                                    283 	.area PSEG    (PAG,XDATA)
                                    284 ;--------------------------------------------------------
                                    285 ; external ram data
                                    286 ;--------------------------------------------------------
                                    287 	.area XSEG    (XDATA)
                                    288 ;--------------------------------------------------------
                                    289 ; absolute external ram data
                                    290 ;--------------------------------------------------------
                                    291 	.area XABS    (ABS,XDATA)
                                    292 ;--------------------------------------------------------
                                    293 ; external initialized ram data
                                    294 ;--------------------------------------------------------
                                    295 	.area XISEG   (XDATA)
                                    296 	.area HOME    (CODE)
                                    297 	.area GSINIT0 (CODE)
                                    298 	.area GSINIT1 (CODE)
                                    299 	.area GSINIT2 (CODE)
                                    300 	.area GSINIT3 (CODE)
                                    301 	.area GSINIT4 (CODE)
                                    302 	.area GSINIT5 (CODE)
                                    303 	.area GSINIT  (CODE)
                                    304 	.area GSFINAL (CODE)
                                    305 	.area CSEG    (CODE)
                                    306 ;--------------------------------------------------------
                                    307 ; interrupt vector
                                    308 ;--------------------------------------------------------
                                    309 	.area HOME    (CODE)
      000000                        310 __interrupt_vect:
      000000 02 02 4D         [24]  311 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  312 	reti
      000004                        313 	.ds	7
      00000B 02 02 54         [24]  314 	ljmp	_timer0_ISR
                                    315 ;--------------------------------------------------------
                                    316 ; global & static initialisations
                                    317 ;--------------------------------------------------------
                                    318 	.area HOME    (CODE)
                                    319 	.area GSINIT  (CODE)
                                    320 	.area GSFINAL (CODE)
                                    321 	.area GSINIT  (CODE)
                                    322 	.globl __sdcc_gsinit_startup
                                    323 	.globl __sdcc_program_startup
                                    324 	.globl __start__stack
                                    325 	.globl __mcs51_genXINIT
                                    326 	.globl __mcs51_genXRAMCLEAR
                                    327 	.globl __mcs51_genRAMCLEAR
                                    328 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  329 	ljmp	__sdcc_program_startup
                                    330 ;--------------------------------------------------------
                                    331 ; Home
                                    332 ;--------------------------------------------------------
                                    333 	.area HOME    (CODE)
                                    334 	.area HOME    (CODE)
      00000E                        335 __sdcc_program_startup:
      00000E 02 01 BF         [24]  336 	ljmp	_main
                                    337 ;	return from main will return to caller
                                    338 ;--------------------------------------------------------
                                    339 ; code
                                    340 ;--------------------------------------------------------
                                    341 	.area CSEG    (CODE)
                                    342 ;------------------------------------------------------------
                                    343 ;Allocation info for local variables in function 'Producer'
                                    344 ;------------------------------------------------------------
                                    345 ;	testparking.c:37: void Producer(void) {
                                    346 ;	-----------------------------------------
                                    347 ;	 function Producer
                                    348 ;	-----------------------------------------
      000014                        349 _Producer:
                           000007   350 	ar7 = 0x07
                           000006   351 	ar6 = 0x06
                           000005   352 	ar5 = 0x05
                           000004   353 	ar4 = 0x04
                           000003   354 	ar3 = 0x03
                           000002   355 	ar2 = 0x02
                           000001   356 	ar1 = 0x01
                           000000   357 	ar0 = 0x00
                                    358 ;	testparking.c:42: SemaphoreWaitBody(empty, L(__COUNTER__) );
      000014                        359 		0$:
      000014 E5 3E            [12]  360 	MOV A, _empty 
      000016 60 FC            [24]  361 	JZ 0$ 
      000018 20 E7 F9         [24]  362 	JB ACC.7, 0$ 
      00001B 15 3E            [12]  363 	dec _empty 
                                    364 ;	testparking.c:43: SemaphoreWaitBody(mutex, L(__COUNTER__) );
      00001D                        365 		1$:
      00001D E5 3D            [12]  366 	MOV A, _mutex 
      00001F 60 FC            [24]  367 	JZ 1$ 
      000021 20 E7 F9         [24]  368 	JB ACC.7, 1$ 
      000024 15 3D            [12]  369 	dec _mutex 
                                    370 ;	testparking.c:44: EA = 0;
                                    371 ;	assignBit
      000026 C2 AF            [12]  372 	clr	_EA
                                    373 ;	testparking.c:45: if( Token == '0' ){ 
      000028 74 30            [12]  374 	mov	a,#0x30
      00002A B5 3B 59         [24]  375 	cjne	a,_Token,00134$
                                    376 ;	testparking.c:46: Token = car_name[cur_thread];
      00002D E5 35            [12]  377 	mov	a,_cur_thread
      00002F 24 2B            [12]  378 	add	a,#_car_name
      000031 F9               [12]  379 	mov	r1,a
      000032 87 3B            [24]  380 	mov	_Token,@r1
                                    381 ;	testparking.c:47: print(car_name[cur_thread],'i');
      000034 43 89 20         [24]  382 	orl	_TMOD,#0x20
      000037 75 8D FA         [24]  383 	mov	_TH1,#0xfa
      00003A 75 98 50         [24]  384 	mov	_SCON,#0x50
                                    385 ;	assignBit
      00003D D2 8E            [12]  386 	setb	_TR1
      00003F 75 2A 00         [24]  387 	mov	_id,#0x00
      000042                        388 00175$:
      000042 74 FC            [12]  389 	mov	a,#0x100 - 0x04
      000044 25 2A            [12]  390 	add	a,_id
      000046 50 03            [24]  391 	jnc	00342$
      000048 02 00 E1         [24]  392 	ljmp	00135$
      00004B                        393 00342$:
      00004B E5 2A            [12]  394 	mov	a,_id
      00004D 70 09            [24]  395 	jnz	00110$
      00004F E5 35            [12]  396 	mov	a,_cur_thread
      000051 24 2B            [12]  397 	add	a,#_car_name
      000053 F9               [12]  398 	mov	r1,a
      000054 87 99            [24]  399 	mov	_SBUF,@r1
      000056 80 22            [24]  400 	sjmp	00112$
      000058                        401 00110$:
      000058 74 01            [12]  402 	mov	a,#0x01
      00005A B5 2A 05         [24]  403 	cjne	a,_id,00107$
      00005D 75 99 69         [24]  404 	mov	_SBUF,#0x69
      000060 80 18            [24]  405 	sjmp	00112$
      000062                        406 00107$:
      000062 74 02            [12]  407 	mov	a,#0x02
      000064 B5 2A 0B         [24]  408 	cjne	a,_id,00104$
      000067 AF 39            [24]  409 	mov	r7,_time
      000069 74 07            [12]  410 	mov	a,#0x07
      00006B 5F               [12]  411 	anl	a,r7
      00006C 24 30            [12]  412 	add	a,#0x30
      00006E F5 99            [12]  413 	mov	_SBUF,a
      000070 80 08            [24]  414 	sjmp	00112$
      000072                        415 00104$:
      000072 74 03            [12]  416 	mov	a,#0x03
      000074 B5 2A 03         [24]  417 	cjne	a,_id,00112$
      000077 75 99 0A         [24]  418 	mov	_SBUF,#0x0a
      00007A                        419 00112$:
                                    420 ;	assignBit
      00007A 10 99 02         [24]  421 	jbc	_TI,00350$
      00007D 80 FB            [24]  422 	sjmp	00112$
      00007F                        423 00350$:
      00007F E5 2A            [12]  424 	mov	a,_id
      000081 04               [12]  425 	inc	a
      000082 F5 2A            [12]  426 	mov	_id,a
      000084 80 BC            [24]  427 	sjmp	00175$
      000086                        428 00134$:
                                    429 ;	testparking.c:48: }else if( Token2 == '0' ){
      000086 74 30            [12]  430 	mov	a,#0x30
      000088 B5 3F 56         [24]  431 	cjne	a,_Token2,00135$
                                    432 ;	testparking.c:49: Token2 = car_name[cur_thread];
      00008B E5 35            [12]  433 	mov	a,_cur_thread
      00008D 24 2B            [12]  434 	add	a,#_car_name
      00008F F9               [12]  435 	mov	r1,a
      000090 87 3F            [24]  436 	mov	_Token2,@r1
                                    437 ;	testparking.c:50: print(car_name[cur_thread],'i');
      000092 43 89 20         [24]  438 	orl	_TMOD,#0x20
      000095 75 8D FA         [24]  439 	mov	_TH1,#0xfa
      000098 75 98 50         [24]  440 	mov	_SCON,#0x50
                                    441 ;	assignBit
      00009B D2 8E            [12]  442 	setb	_TR1
      00009D 75 2A 00         [24]  443 	mov	_id,#0x00
      0000A0                        444 00178$:
      0000A0 74 FC            [12]  445 	mov	a,#0x100 - 0x04
      0000A2 25 2A            [12]  446 	add	a,_id
      0000A4 40 3B            [24]  447 	jc	00135$
      0000A6 E5 2A            [12]  448 	mov	a,_id
      0000A8 70 09            [24]  449 	jnz	00125$
      0000AA E5 35            [12]  450 	mov	a,_cur_thread
      0000AC 24 2B            [12]  451 	add	a,#_car_name
      0000AE F9               [12]  452 	mov	r1,a
      0000AF 87 99            [24]  453 	mov	_SBUF,@r1
      0000B1 80 22            [24]  454 	sjmp	00127$
      0000B3                        455 00125$:
      0000B3 74 01            [12]  456 	mov	a,#0x01
      0000B5 B5 2A 05         [24]  457 	cjne	a,_id,00122$
      0000B8 75 99 69         [24]  458 	mov	_SBUF,#0x69
      0000BB 80 18            [24]  459 	sjmp	00127$
      0000BD                        460 00122$:
      0000BD 74 02            [12]  461 	mov	a,#0x02
      0000BF B5 2A 0B         [24]  462 	cjne	a,_id,00119$
      0000C2 AF 39            [24]  463 	mov	r7,_time
      0000C4 74 07            [12]  464 	mov	a,#0x07
      0000C6 5F               [12]  465 	anl	a,r7
      0000C7 24 30            [12]  466 	add	a,#0x30
      0000C9 F5 99            [12]  467 	mov	_SBUF,a
      0000CB 80 08            [24]  468 	sjmp	00127$
      0000CD                        469 00119$:
      0000CD 74 03            [12]  470 	mov	a,#0x03
      0000CF B5 2A 03         [24]  471 	cjne	a,_id,00127$
      0000D2 75 99 0A         [24]  472 	mov	_SBUF,#0x0a
      0000D5                        473 00127$:
                                    474 ;	assignBit
      0000D5 10 99 02         [24]  475 	jbc	_TI,00361$
      0000D8 80 FB            [24]  476 	sjmp	00127$
      0000DA                        477 00361$:
      0000DA E5 2A            [12]  478 	mov	a,_id
      0000DC 04               [12]  479 	inc	a
      0000DD F5 2A            [12]  480 	mov	_id,a
      0000DF 80 BF            [24]  481 	sjmp	00178$
      0000E1                        482 00135$:
                                    483 ;	testparking.c:52: EA = 1;
                                    484 ;	assignBit
      0000E1 D2 AF            [12]  485 	setb	_EA
                                    486 ;	testparking.c:53: SemaphoreSignal(mutex);
      0000E3 05 3D            [12]  487 	INC _mutex 
                                    488 ;	testparking.c:55: delay(2);
      0000E5 E5 35            [12]  489 	mov	a,_cur_thread
      0000E7 24 20            [12]  490 	add	a,#_time_temp
      0000E9 F9               [12]  491 	mov	r1,a
      0000EA AF 39            [24]  492 	mov	r7,_time
      0000EC 74 02            [12]  493 	mov	a,#0x02
      0000EE 2F               [12]  494 	add	a,r7
      0000EF F7               [12]  495 	mov	@r1,a
      0000F0                        496 00136$:
      0000F0 E5 35            [12]  497 	mov	a,_cur_thread
      0000F2 24 20            [12]  498 	add	a,#_time_temp
      0000F4 F9               [12]  499 	mov	r1,a
      0000F5 E7               [12]  500 	mov	a,@r1
      0000F6 B5 39 F7         [24]  501 	cjne	a,_time,00136$
                                    502 ;	testparking.c:57: EA = 0;
                                    503 ;	assignBit
      0000F9 C2 AF            [12]  504 	clr	_EA
                                    505 ;	testparking.c:58: if( Token == car_name[cur_thread] ){
      0000FB E5 35            [12]  506 	mov	a,_cur_thread
      0000FD 24 2B            [12]  507 	add	a,#_car_name
      0000FF F9               [12]  508 	mov	r1,a
      000100 E7               [12]  509 	mov	a,@r1
      000101 FF               [12]  510 	mov	r7,a
      000102 B5 3B 55         [24]  511 	cjne	a,_Token,00172$
                                    512 ;	testparking.c:59: Token = '0';
      000105 75 3B 30         [24]  513 	mov	_Token,#0x30
                                    514 ;	testparking.c:60: print(car_name[cur_thread], 'o');
      000108 43 89 20         [24]  515 	orl	_TMOD,#0x20
      00010B 75 8D FA         [24]  516 	mov	_TH1,#0xfa
      00010E 75 98 50         [24]  517 	mov	_SCON,#0x50
                                    518 ;	assignBit
      000111 D2 8E            [12]  519 	setb	_TR1
      000113 75 2A 00         [24]  520 	mov	_id,#0x00
      000116                        521 00181$:
      000116 74 FC            [12]  522 	mov	a,#0x100 - 0x04
      000118 25 2A            [12]  523 	add	a,_id
      00011A 50 03            [24]  524 	jnc	00366$
      00011C 02 01 B6         [24]  525 	ljmp	00173$
      00011F                        526 00366$:
      00011F E5 2A            [12]  527 	mov	a,_id
      000121 70 09            [24]  528 	jnz	00148$
      000123 E5 35            [12]  529 	mov	a,_cur_thread
      000125 24 2B            [12]  530 	add	a,#_car_name
      000127 F9               [12]  531 	mov	r1,a
      000128 87 99            [24]  532 	mov	_SBUF,@r1
      00012A 80 22            [24]  533 	sjmp	00150$
      00012C                        534 00148$:
      00012C 74 01            [12]  535 	mov	a,#0x01
      00012E B5 2A 05         [24]  536 	cjne	a,_id,00145$
      000131 75 99 6F         [24]  537 	mov	_SBUF,#0x6f
      000134 80 18            [24]  538 	sjmp	00150$
      000136                        539 00145$:
      000136 74 02            [12]  540 	mov	a,#0x02
      000138 B5 2A 0B         [24]  541 	cjne	a,_id,00142$
      00013B AF 39            [24]  542 	mov	r7,_time
      00013D 74 07            [12]  543 	mov	a,#0x07
      00013F 5F               [12]  544 	anl	a,r7
      000140 24 30            [12]  545 	add	a,#0x30
      000142 F5 99            [12]  546 	mov	_SBUF,a
      000144 80 08            [24]  547 	sjmp	00150$
      000146                        548 00142$:
      000146 74 03            [12]  549 	mov	a,#0x03
      000148 B5 2A 03         [24]  550 	cjne	a,_id,00150$
      00014B 75 99 0A         [24]  551 	mov	_SBUF,#0x0a
      00014E                        552 00150$:
                                    553 ;	assignBit
      00014E 10 99 02         [24]  554 	jbc	_TI,00374$
      000151 80 FB            [24]  555 	sjmp	00150$
      000153                        556 00374$:
      000153 E5 2A            [12]  557 	mov	a,_id
      000155 04               [12]  558 	inc	a
      000156 F5 2A            [12]  559 	mov	_id,a
      000158 80 BC            [24]  560 	sjmp	00181$
      00015A                        561 00172$:
                                    562 ;	testparking.c:61: }else if( Token2 == car_name[cur_thread] ){ 
      00015A E5 35            [12]  563 	mov	a,_cur_thread
      00015C 24 2B            [12]  564 	add	a,#_car_name
      00015E F9               [12]  565 	mov	r1,a
      00015F E7               [12]  566 	mov	a,@r1
      000160 FF               [12]  567 	mov	r7,a
      000161 B5 3F 52         [24]  568 	cjne	a,_Token2,00173$
                                    569 ;	testparking.c:62: Token2 = '0';
      000164 75 3F 30         [24]  570 	mov	_Token2,#0x30
                                    571 ;	testparking.c:63: print(car_name[cur_thread], 'o');
      000167 43 89 20         [24]  572 	orl	_TMOD,#0x20
      00016A 75 8D FA         [24]  573 	mov	_TH1,#0xfa
      00016D 75 98 50         [24]  574 	mov	_SCON,#0x50
                                    575 ;	assignBit
      000170 D2 8E            [12]  576 	setb	_TR1
      000172 75 2A 00         [24]  577 	mov	_id,#0x00
      000175                        578 00184$:
      000175 74 FC            [12]  579 	mov	a,#0x100 - 0x04
      000177 25 2A            [12]  580 	add	a,_id
      000179 40 3B            [24]  581 	jc	00173$
      00017B E5 2A            [12]  582 	mov	a,_id
      00017D 70 09            [24]  583 	jnz	00163$
      00017F E5 35            [12]  584 	mov	a,_cur_thread
      000181 24 2B            [12]  585 	add	a,#_car_name
      000183 F9               [12]  586 	mov	r1,a
      000184 87 99            [24]  587 	mov	_SBUF,@r1
      000186 80 22            [24]  588 	sjmp	00165$
      000188                        589 00163$:
      000188 74 01            [12]  590 	mov	a,#0x01
      00018A B5 2A 05         [24]  591 	cjne	a,_id,00160$
      00018D 75 99 6F         [24]  592 	mov	_SBUF,#0x6f
      000190 80 18            [24]  593 	sjmp	00165$
      000192                        594 00160$:
      000192 74 02            [12]  595 	mov	a,#0x02
      000194 B5 2A 0B         [24]  596 	cjne	a,_id,00157$
      000197 AF 39            [24]  597 	mov	r7,_time
      000199 74 07            [12]  598 	mov	a,#0x07
      00019B 5F               [12]  599 	anl	a,r7
      00019C 24 30            [12]  600 	add	a,#0x30
      00019E F5 99            [12]  601 	mov	_SBUF,a
      0001A0 80 08            [24]  602 	sjmp	00165$
      0001A2                        603 00157$:
      0001A2 74 03            [12]  604 	mov	a,#0x03
      0001A4 B5 2A 03         [24]  605 	cjne	a,_id,00165$
      0001A7 75 99 0A         [24]  606 	mov	_SBUF,#0x0a
      0001AA                        607 00165$:
                                    608 ;	assignBit
      0001AA 10 99 02         [24]  609 	jbc	_TI,00385$
      0001AD 80 FB            [24]  610 	sjmp	00165$
      0001AF                        611 00385$:
      0001AF E5 2A            [12]  612 	mov	a,_id
      0001B1 04               [12]  613 	inc	a
      0001B2 F5 2A            [12]  614 	mov	_id,a
      0001B4 80 BF            [24]  615 	sjmp	00184$
      0001B6                        616 00173$:
                                    617 ;	testparking.c:65: EA = 1;
                                    618 ;	assignBit
      0001B6 D2 AF            [12]  619 	setb	_EA
                                    620 ;	testparking.c:66: SemaphoreSignal(empty);
      0001B8 05 3E            [12]  621 	INC _empty 
                                    622 ;	testparking.c:67: SemaphoreSignal(next_car);
      0001BA 05 3A            [12]  623 	INC _next_car 
                                    624 ;	testparking.c:68: ThreadExit();
                                    625 ;	testparking.c:70: } 
      0001BC 02 04 0D         [24]  626 	ljmp	_ThreadExit
                                    627 ;------------------------------------------------------------
                                    628 ;Allocation info for local variables in function 'main'
                                    629 ;------------------------------------------------------------
                                    630 ;	testparking.c:72: void main(void) {
                                    631 ;	-----------------------------------------
                                    632 ;	 function main
                                    633 ;	-----------------------------------------
      0001BF                        634 _main:
                                    635 ;	testparking.c:73: SemaphoreCreate(mutex, 1);
      0001BF 75 3D 01         [24]  636 	mov	_mutex,#0x01
                                    637 ;	testparking.c:74: SemaphoreCreate(empty,2);
      0001C2 75 3E 02         [24]  638 	mov	_empty,#0x02
                                    639 ;	testparking.c:75: SemaphoreCreate(next_car, 0);
      0001C5 75 3A 00         [24]  640 	mov	_next_car,#0x00
                                    641 ;	testparking.c:77: EA = 1;
                                    642 ;	assignBit
      0001C8 D2 AF            [12]  643 	setb	_EA
                                    644 ;	testparking.c:79: Token = '0';
      0001CA 75 3B 30         [24]  645 	mov	_Token,#0x30
                                    646 ;	testparking.c:80: Token2 = '0';
      0001CD 75 3F 30         [24]  647 	mov	_Token2,#0x30
                                    648 ;	testparking.c:81: car = '1';
      0001D0 75 3C 31         [24]  649 	mov	_car,#0x31
                                    650 ;	testparking.c:83: car_id = ThreadCreate( Producer );
      0001D3 90 00 14         [24]  651 	mov	dptr,#_Producer
      0001D6 12 03 32         [24]  652 	lcall	_ThreadCreate
      0001D9 85 82 2F         [24]  653 	mov	_car_id,dpl
                                    654 ;	testparking.c:84: car_name[ car_id ] = car;
      0001DC E5 2F            [12]  655 	mov	a,_car_id
      0001DE 24 2B            [12]  656 	add	a,#_car_name
      0001E0 F8               [12]  657 	mov	r0,a
      0001E1 A6 3C            [24]  658 	mov	@r0,_car
                                    659 ;	testparking.c:85: car = car+1;
      0001E3 E5 3C            [12]  660 	mov	a,_car
      0001E5 04               [12]  661 	inc	a
      0001E6 F5 3C            [12]  662 	mov	_car,a
                                    663 ;	testparking.c:87: car_id = ThreadCreate( Producer );
      0001E8 90 00 14         [24]  664 	mov	dptr,#_Producer
      0001EB 12 03 32         [24]  665 	lcall	_ThreadCreate
      0001EE 85 82 2F         [24]  666 	mov	_car_id,dpl
                                    667 ;	testparking.c:88: car_name[ car_id  ] = car;
      0001F1 E5 2F            [12]  668 	mov	a,_car_id
      0001F3 24 2B            [12]  669 	add	a,#_car_name
      0001F5 F8               [12]  670 	mov	r0,a
      0001F6 A6 3C            [24]  671 	mov	@r0,_car
                                    672 ;	testparking.c:89: car = car+1;
      0001F8 E5 3C            [12]  673 	mov	a,_car
      0001FA 04               [12]  674 	inc	a
      0001FB F5 3C            [12]  675 	mov	_car,a
                                    676 ;	testparking.c:91: car_id = ThreadCreate( Producer );
      0001FD 90 00 14         [24]  677 	mov	dptr,#_Producer
      000200 12 03 32         [24]  678 	lcall	_ThreadCreate
      000203 85 82 2F         [24]  679 	mov	_car_id,dpl
                                    680 ;	testparking.c:92: car_name[ car_id  ] = car;
      000206 E5 2F            [12]  681 	mov	a,_car_id
      000208 24 2B            [12]  682 	add	a,#_car_name
      00020A F8               [12]  683 	mov	r0,a
      00020B A6 3C            [24]  684 	mov	@r0,_car
                                    685 ;	testparking.c:93: car = car+1;
      00020D E5 3C            [12]  686 	mov	a,_car
      00020F FF               [12]  687 	mov	r7,a
      000210 04               [12]  688 	inc	a
      000211 F5 3C            [12]  689 	mov	_car,a
                                    690 ;	testparking.c:94: while(time < 0x1f){
      000213                        691 00101$:
      000213 74 E1            [12]  692 	mov	a,#0x100 - 0x1f
      000215 25 39            [12]  693 	add	a,_time
      000217 40 31            [24]  694 	jc	00103$
                                    695 ;	testparking.c:95: SemaphoreWaitBody(next_car, L(__COUNTER__) );
      000219                        696 		2$:
      000219 E5 3A            [12]  697 	MOV A, _next_car 
      00021B 60 FC            [24]  698 	JZ 2$ 
      00021D 20 E7 F9         [24]  699 	JB ACC.7, 2$ 
      000220 15 3A            [12]  700 	dec _next_car 
                                    701 ;	testparking.c:96: car_id = ThreadCreate( Producer );
      000222 90 00 14         [24]  702 	mov	dptr,#_Producer
      000225 12 03 32         [24]  703 	lcall	_ThreadCreate
      000228 85 82 2F         [24]  704 	mov	_car_id,dpl
                                    705 ;	testparking.c:100: car_name[ car_id  ] = car;
      00022B E5 2F            [12]  706 	mov	a,_car_id
      00022D 24 2B            [12]  707 	add	a,#_car_name
      00022F F8               [12]  708 	mov	r0,a
      000230 A6 3C            [24]  709 	mov	@r0,_car
                                    710 ;	testparking.c:101: car = (car == '5') ? '1' : car+1;
      000232 74 35            [12]  711 	mov	a,#0x35
      000234 B5 3C 06         [24]  712 	cjne	a,_car,00106$
      000237 7E 31            [12]  713 	mov	r6,#0x31
      000239 7F 00            [12]  714 	mov	r7,#0x00
      00023B 80 09            [24]  715 	sjmp	00107$
      00023D                        716 00106$:
      00023D AD 3C            [24]  717 	mov	r5,_car
      00023F 0D               [12]  718 	inc	r5
      000240 ED               [12]  719 	mov	a,r5
      000241 FE               [12]  720 	mov	r6,a
      000242 33               [12]  721 	rlc	a
      000243 95 E0            [12]  722 	subb	a,acc
      000245 FF               [12]  723 	mov	r7,a
      000246                        724 00107$:
      000246 8E 3C            [24]  725 	mov	_car,r6
      000248 80 C9            [24]  726 	sjmp	00101$
      00024A                        727 00103$:
                                    728 ;	testparking.c:103: ThreadExit();
                                    729 ;	testparking.c:104: }
      00024A 02 04 0D         [24]  730 	ljmp	_ThreadExit
                                    731 ;------------------------------------------------------------
                                    732 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    733 ;------------------------------------------------------------
                                    734 ;	testparking.c:106: void _sdcc_gsinit_startup(void) {
                                    735 ;	-----------------------------------------
                                    736 ;	 function _sdcc_gsinit_startup
                                    737 ;	-----------------------------------------
      00024D                        738 __sdcc_gsinit_startup:
                                    739 ;	testparking.c:109: __endasm;
      00024D 02 02 5C         [24]  740 	ljmp	_Bootstrap
                                    741 ;	testparking.c:110: }
      000250 22               [24]  742 	ret
                                    743 ;------------------------------------------------------------
                                    744 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    745 ;------------------------------------------------------------
                                    746 ;	testparking.c:112: void _mcs51_genRAMCLEAR(void) {}
                                    747 ;	-----------------------------------------
                                    748 ;	 function _mcs51_genRAMCLEAR
                                    749 ;	-----------------------------------------
      000251                        750 __mcs51_genRAMCLEAR:
      000251 22               [24]  751 	ret
                                    752 ;------------------------------------------------------------
                                    753 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    754 ;------------------------------------------------------------
                                    755 ;	testparking.c:113: void _mcs51_genXINIT(void) {}
                                    756 ;	-----------------------------------------
                                    757 ;	 function _mcs51_genXINIT
                                    758 ;	-----------------------------------------
      000252                        759 __mcs51_genXINIT:
      000252 22               [24]  760 	ret
                                    761 ;------------------------------------------------------------
                                    762 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    763 ;------------------------------------------------------------
                                    764 ;	testparking.c:114: void _mcs51_genXRAMCLEAR(void) {}
                                    765 ;	-----------------------------------------
                                    766 ;	 function _mcs51_genXRAMCLEAR
                                    767 ;	-----------------------------------------
      000253                        768 __mcs51_genXRAMCLEAR:
      000253 22               [24]  769 	ret
                                    770 ;------------------------------------------------------------
                                    771 ;Allocation info for local variables in function 'timer0_ISR'
                                    772 ;------------------------------------------------------------
                                    773 ;	testparking.c:115: void timer0_ISR(void) __interrupt(1) {
                                    774 ;	-----------------------------------------
                                    775 ;	 function timer0_ISR
                                    776 ;	-----------------------------------------
      000254                        777 _timer0_ISR:
                                    778 ;	testparking.c:118: __endasm;
      000254 02 02 82         [24]  779 	ljmp	_myTimer0Handler
                                    780 ;	testparking.c:119: }
      000257 32               [24]  781 	reti
                                    782 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    783 ;	eliminated unneeded push/pop not_psw
                                    784 ;	eliminated unneeded push/pop dpl
                                    785 ;	eliminated unneeded push/pop dph
                                    786 ;	eliminated unneeded push/pop b
                                    787 ;	eliminated unneeded push/pop acc
                                    788 	.area CSEG    (CODE)
                                    789 	.area CONST   (CODE)
                                    790 	.area XINIT   (CODE)
                                    791 	.area CABS    (ABS,CODE)
