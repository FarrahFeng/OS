
#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4  /* not including the scheduler */
/* the scheduler does not take up a thread of its own */

// convert C name into assembly name
#define CNAME(s) _ ## s

// create a counting semaphore s that is initialized to n
#define SemaphoreCreate(s, n)\
            s = n\

/*
  do (busy-)wait() on semaphore s
  jump back to label if ACC<=0
  JZ: conditionally jump back to label if ACC = 0
  JB: jump back if ACC < 0 (if ACC.7 is 1 ) (JB: jump of bit is 1)
*/ 
#define SemaphoreWaitBody(s, label)\
    { __asm \
        label:\
        MOV A, CNAME(s)\
        JZ  label\
        JB ACC.7, label\
        dec  CNAME(s) \
      __endasm; }

// signal() semaphore s
#define SemaphoreSignal(s)\
            __asm \
            INC CNAME(s)\
            __endasm;\


typedef char ThreadID;                   // ThreadID: type for thread ID, represented by a single byte(native word size for 8051)
typedef void (*FunctionPtr)(void);       // SDCC compile it to 2-byte(code space) pointer to function

ThreadID ThreadCreate(FunctionPtr);      // Primary API for creating and starting a thread, and return its threadID.Once created, eligible to run
void ThreadYield(void);                  // can resume control after ThreadYield()
void ThreadExit(void);
void myTimer0Handler();

#endif // __PREEMPTIVE_H__
