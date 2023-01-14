
#include <8051.h>
#include "preemptive.h"

__data __at (0x3A) char buffer;
__data __at (0x3B) char spot;
__data __at (0x3C) char full;
__data __at (0x3D) char mutex;
__data __at (0x3E) char empty;
__data __at (0x3F) char spot2;
__data __at (0x2A) char turn1;
__data __at (0x2B) char turn2;

#define L(x) LABEL(x)
#define LABEL(x) x##$

void Producer1(void) {
		spot = 'A';
        while (1) {
                /* @@@ [6 pt]
                 * wait for the buffer to be available, 
                 * and then write the new data into the buffer */
                SemaphoreWaitBody(turn1,  L(__COUNTER__));
                SemaphoreWaitBody(empty, L(__COUNTER__) );
                SemaphoreWaitBody(mutex, L(__COUNTER__) );
                __critical{
                buffer = spot;
                spot = ( spot == 'Z' ) ? 'A' :  spot + 1;
                //P1 = 0x0;
                }
                SemaphoreSignal(mutex);
                SemaphoreSignal(full);
                SemaphoreSignal(turn2);
                
        }
}
void Producer2(void) {
		spot2 = '0';
        while (1) {
                /* @@@ [6 pt]
                 * wait for the buffer to be available, 
                 * and then write the new data into the buffer */
                SemaphoreWaitBody(turn2,  L(__COUNTER__));
                SemaphoreWaitBody(empty, L(__COUNTER__) );
                SemaphoreWaitBody(mutex, L(__COUNTER__) );
                __critical{
                buffer = spot2;
                spot2 = ( spot2 == '9' ) ? '0' :  spot2 + 1;
                //P1 = 0x5;
                }
                SemaphoreSignal(mutex);
                SemaphoreSignal(full);
                SemaphoreSignal(turn1);
                
        }
}

void Consumer(void) {
        /* @@@ [2 pt] initialize Tx for polling */
        EA = 0;
        TMOD |= 0x20; // TMOD is also assigned by the (modified) Bootstrap code to set up the timer interrupt in timer-0 for preemption 
        TH1 = -6;
        SCON = 0x50;
        TR1 = 1;
        EA = 1;
        while (1) {
                SemaphoreWaitBody(full,  L(__COUNTER__));
                SemaphoreWaitBody(mutex,  L(__COUNTER__));
                __critical{
                SBUF = buffer;
                //P1 = 0xFF;
                }
                SemaphoreSignal(mutex);
                SemaphoreSignal(empty);

                while( !TI ){}
                TI = 0;
        }
}

void main(void) {
        SemaphoreCreate(full, 0);
        SemaphoreCreate(mutex, 1);
        SemaphoreCreate(empty,1);
        //order: A0B1
        SemaphoreCreate(turn1, 1); 
        SemaphoreCreate(turn2, 0);
        /*
        order: 0A1B
        SemaphoreCreate(turn1, 0); 
        SemaphoreCreate(turn2, 1);
        */
        
        ThreadCreate( Producer1 );
        ThreadCreate( Producer2 );
        Consumer();
        
        
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
