
#include <8051.h>
#include "preemptive.h"

__data __at (0x3A) char buffer;
__data __at (0x3B) char spot;
__data __at (0x3C) char full;
__data __at (0x3D) char mutex;
__data __at (0x3E) char empty;
#define L(x) LABEL(x)
#define LABEL(x) x##$

void Producer(void) {
		spot = 'A';
        while (1) {
                /* @@@ [6 pt]
                 * wait for the buffer to be available, 
                 * and then write the new data into the buffer */
                
                SemaphoreWaitBody(empty, L(__COUNTER__) );
                SemaphoreWaitBody(mutex, L(__COUNTER__) );
                __critical{
                buffer = spot;
                spot = ( spot == 'Z' ) ? 'A' :  spot + 1;
                }
                SemaphoreSignal(mutex);
                SemaphoreSignal(full);
        }
}

/* 
 * the consumer in this test program gets the next item from
 * the queue and consume it and writes it to the serial port.
 * The Consumer also does not return.
 */

void Consumer(void) {
        /* initialize Tx for polling */
        EA = 0;        // disable interrupts
        // TMOD is also assigned by the (modified) Bootstrap code to set up the timer interrupt in timer-0 for preemption 
        // preserve Bootstrap code's settings
        TMOD |= 0x20; 
        TH1 = -6;
        SCON = 0x50;
        TR1 = 1;
        EA = 1;         // enable all interrupts
        while (1) {
                SemaphoreWaitBody(full,  L(__COUNTER__));
                SemaphoreWaitBody(mutex,  L(__COUNTER__));
                __critical{
                SBUF = buffer;
                }
                SemaphoreSignal(mutex);
                SemaphoreSignal(empty);

                while( !TI ){}
                TI = 0;
        }
}
/*
 * main() is started by the thread bootstrapper as thread-0.
 * It can create more thread(s) as needed:
 * one thread can acts as producer and another as consumer.
 */
void main(void) {
        SemaphoreCreate(full, 0);
        SemaphoreCreate(mutex, 1);
        SemaphoreCreate(empty,1);
        ThreadCreate( Producer );
        Consumer();    
        
}

void _sdcc_gsinit_startup(void) {
        __asm
            ljmp  _Bootstrap
        __endasm;
}
/*
ISR should be defined in the same file as main() (for SDCC)
This allows ISR to call your routine named myTimer0Handle to handle the actual interrupt. 
*/
void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}

// "_": written in C
void timer0_ISR(void) __interrupt(1) {
        __asm
            ljmp _myTimer0Handler
        __endasm;
}
