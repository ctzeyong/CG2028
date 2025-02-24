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

@ Write Student 1’s Name here: Cheng Tze Yong (A0272343J)
@ Write Student 2’s Name here: Goh Eng Hui, Jeremy (A0272786M)

@ Look-up table for registers:

@ R0 building array
@ R1 entry array
@ R2 exit array
@ R3 result array
@ R4 counter (for loops)
@ R5 sum register (to store sum of entry vehicles)
@ R6 value register (to hold values loaded from entry in SUM_LOOP, or from building in COM_LOOP)
@ R8 result register (holds values to be stored in result array)
@ R9 exit value register (holds values loaded from exit array)

@ write your program from here:

	.EQU SECTION_MAX, 12 @ Change this number to change capacity of each section
	.EQU CAR_ENTRY_ARRAY_SIZE, 5 @ Change this number to change size of array

asm_func:
	@ Init count and sum registers
	MOV R4, #CAR_ENTRY_ARRAY_SIZE
	MOV R5, #0

SUM_LOOP:
	@ Add up values in entry
	LDR R6, [R1], #4
	ADD R5, R6

	SUBS R4, #1
	BNE SUM_LOOP

	@ Set new count value (for second loop)
	LDR R4, [R3]
	LDR R6, [R3, #4]
	MUL R4, R6

COM_LOOP:
	@ Load values at current index from building and exit arrays
	LDR R6, [R0], #4
	LDR R9, [R2], #4

	@ Add current section car count to sum to get current sum
	ADD R8, R6, R5

	@ Adjust result values based on current sum
	CMP R8, #(SECTION_MAX - 1)

	ITTEE GT
		MOVGT R6, #SECTION_MAX
		SUBGT R5, R8, #SECTION_MAX
		MOVLE R6, R8
		MOVLE R5, #0

	@ Subtract exit value and load resultant value into result array
	SUB R6, R9
	STR R6, [R3], #4

	SUBS R4, #1
	BNE COM_LOOP

	BX LR
