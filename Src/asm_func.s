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
	LDR R6, [R2], #4
	ADD R5, R5, R6
	SUB R4, R4, #1

	CMP R4, #0
	BNE SUM_LOOP

	BX LR

SUBROUTINE:

	BX LR
