// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

//  for(i=0;i<RAM[1];i++){
//  	  RAM[16] = RAM[16] + RAM[0];
//  }
//R1's value is loop counter in ROM[i]
	@R2
	M=0
	@R1
	D=M
	@i
	M=D// RAM[i] = RAM[R1]


(continue)
	@END
	D;JEQ //if D == 0; Jump to END
	@R0
	D=M
	@R2
	M=D+M
	@i
	M=M-1
	D=M
	@continue
	0;JMP

(END)
	@END
	0;JMP
