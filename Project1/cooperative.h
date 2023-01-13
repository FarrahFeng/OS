/*
 * file: cooperative.h
 *
 * this is the include file for the cooperative multithreading
 * package.  It is to be compiled by SDCC and targets the EdSim51 as
 * the target architecture.
 *
 * CS 3423 Fall 2018
 */

#ifndef __COOPERATIVE_H__
#define __COOPERATIVE_H__

#define MAXTHREADS 4  /* not including the scheduler */
/* the scheduler does not take up a thread of its own */

typedef char ThreadID;             // ThreadID: type for thread ID, represented by a single byte(native word size for 8051)
typedef void (*FunctionPtr)(void); // SDCC compile it to 2-byte(code space) pointer to function

ThreadID ThreadCreate(FunctionPtr); // Primary API for creating and starting a thread, and return its threadID.Once created, eligible to run
void ThreadYield(void);             // can resume control after ThreadYield()
void ThreadExit(void);

#endif // __COOPERATIVE_H__