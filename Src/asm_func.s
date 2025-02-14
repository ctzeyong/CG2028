/*
 * asm_func.s
 *
 *  Created on: 7/2/2025
 *      Author: Hou Linxin
 */
   .syntax unified
	.cpu cortex-m4
	.fpu softvfp
	.thumb

		.global asm_func

@ Start of executable code
.section .text

@ CG/[T]EE2028 Assignment 1, Sem 2, AY 2024/25
@ (c) ECE NUS, 2025

@ Write Student 1’s Name here: Cheng Tze Yong
@ Write Student 2’s Name here: Goh Eng Hui, Jeremy

@ Look-up table for registers:

@ R0 ...
@ R1 ...
@ R4 counter (for loops)
@ R5 sum register (to store sum of entry vehicles)

@ write your program from here:

asm_func:
 	@ PUSH {R14}

	@ BL SUBROUTINE

 	@ POP {R14}

	@ Init count and sum registers
	MOV R4, #5
	MOV R5, #0

SUM_LOOP:
	@ Add up values in entry
	LDR R6, [R1], #4
	ADD R5, R6

	SUBS R4, R4, #1
	BNE SUM_LOOP

	@ Set new count value (for second loop)
	LDR R4, [R3]
	LDR R6, [R3, #4]
	MUL R4, R6

COM_LOOP:
	LDR R6, [R0], #4
	LDR R9, [R2], #4

	ADD R8, R6, R5

	@ Adjust result values based on current sum
	CMP R8, #11

	ITTEE GT
		MOVGT R6, #12
		SUBGT R5, R8, #12
		MOVLE R6, R8
		MOVLE R5, #0

	SUB R6, R6, R9
	STR R6, [R3], #4

	SUBS R4, #1
	BNE COM_LOOP

	BX LR

SUBROUTINE:

	BX LR
