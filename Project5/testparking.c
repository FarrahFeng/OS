
#include <8051.h>
#include "preemptive.h"

__data __at (0x3A) char next_car;
__data __at (0x3B) char car;
__data __at (0x3C) char mutex;      // mutual exclusive access
__data __at (0x3D) char empty;      // empty buffers
__data __at (0x3E) char tok;        // indicate parking spot1
__data __at (0x3F) char tok2;       // spot2
__data __at (0x2A) char id;
__data __at (0x2B) char car_name[4];    // 5 cars
__data __at (0x2F) char car_id;


// ##: concatenate two symbols
#define L(x) Label(x)
#define Label(x) x##$

// SBUF(serial buffer): contains character buffer
// TI == 1 when ready for next byte
// RI == 1 when byte has been received (read char from SBUF)
// format: (parkind spot)(parking('p') or leaving'O')(car thread)(time)
#define print(a, b, c)\
    TMOD |= 0x20;\
    TH1 = -6;\
    SCON = 0x50;\
    TR1 = 1;\
    for(id = 0; id < 5 ; id++){\
        if( id==0 ) SBUF = a;\
        else if( id == 1 ) SBUF = b;\
        else if (id == 2) SBUF = c;\
        else if( id == 3 ) SBUF = (time&7) + '0';\
        else if( id == 4 ) SBUF = '\n';\
        while( !TI ){}\
        TI = 0;\
    }\
    //EA = 1;


void Producer(void) {
        /* 
        * wait for the buffer to be available, 
        * and then write the new data into the buffer 
        * __COUNTER__ : C preprocessor's (generate new integer literal)
        */
        SemaphoreWaitBody(empty, L(__COUNTER__) );  // make sure one of the spot is empty
        SemaphoreWaitBody(mutex, L(__COUNTER__) );  // no cars is parking now
        EA = 0;
        // check which parking spot(tok) is empty
        // 'P'indicate parking
        if( tok == '0' ){ 
            tok = car_name[cur_thread];
            print('1', 'P', car_name[cur_thread]);
        }else if( tok2 == '0' ){
            tok2 = car_name[cur_thread];
            print('2','P', car_name[cur_thread]);
        }
        EA = 1;
        SemaphoreSignal(mutex);     //停完車了
        //EA = 1;
        delay(2);                   // park time
        
        EA = 0;
        if( tok == car_name[cur_thread] ){
            tok = '0';                          // mark as empty
            print('1', 'O', car_name[cur_thread]);
        }else if( tok2 == car_name[cur_thread] ){ 
            tok2 = '0';
            print('2', 'O', car_name[cur_thread]);
        }
        EA = 1;
        SemaphoreSignal(empty);
        SemaphoreSignal(next_car); 
        ThreadExit();       //delete thread
   
} 
// make 5  cars compete 2 spots
void main(void) {
        SemaphoreCreate(mutex, 1);
        SemaphoreCreate(empty, 2);      // only 2 spots
        SemaphoreCreate(next_car, 0);

        EA = 1;

        tok = '0';
        tok2 = '0';
        car = '1';

        // create three cars in three threads first
        car_id = ThreadCreate( Producer );
        car_name[ car_id ] = car;
        car = car+1;

        car_id = ThreadCreate( Producer );
        car_name[ car_id  ] = car;
        car = car+1;

        car_id = ThreadCreate( Producer );
        car_name[ car_id  ] = car;
        car = car+1;

        while(1){
            EA = 1; // enable interrupt
            SemaphoreWaitBody(next_car, L(__COUNTER__) ); //must wait until somebody(first three cars) leaves
            EA = 0;

            car_id = ThreadCreate( Producer ); 
            car_name[ car_id  ] = car;

            car = (car == '5') ? '1' : (car+1);
        }
        ThreadExit();
}

void _sdcc_gsinit_startup(void) {
        __asm
            ljmp  _Bootstrap
        __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}
void timer0_ISR(void) __interrupt(1) {
        __asm
            ljmp _myTimer0Handler
        __endasm;
}
