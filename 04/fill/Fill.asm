// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// save initial cursor (SCREEN pointer) to R0
@SCREEN
D=A
@R0
M=D

(LOOP)
@KBD
D=M

// if keyboard is on, go to ON
@ON
D;JGT


// if keyboard is off, go to OFF
@OFF
0;JMP


(ON)
// fill the area on cursor with black
@R0
A=M
M=-1

// increase the cursor by 1
@R0
M=M+1

@LOOP
0;JMP


(OFF)
// check if cursor is at SCREEN, no job required
@R0
D=M
@SCREEN
D=D-A
@LOOP
D;JEQ


// fill the area on cursor with white
@R0
M=M-1

A=M
M=0

@LOOP
0;JMP

