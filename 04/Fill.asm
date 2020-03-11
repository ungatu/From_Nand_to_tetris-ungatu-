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

// Put your code here.
//while(1){
//	if(RAM(KBD)==0){
//		if(RAM(SCREEN)==-1) printscreen(0);
//		else continue;
//	}
//	if(RAM(KBD)!=0){
//		if(RAM(SCREEN)==-1) continue;
//		else printScreen(-1);
//	}
//}
(checkKeyboard)
    @KBD
    D=M
    @No_Key
    D;JEQ  // if(RAM(KBD)==0) go to;
    @Get_Key
    0;JMP  // if(RAM(KBD)!=0) go to;
    
(No_Key)
    @SCREEN
    D=M
    @checkKeyboard
    D;JEQ  // if(RAM(KBD)==0 && RAM(SCREEN)==0) continue;

    @value // if(RAM(KBD)==0 && RAM(SCREEN)==-1) printScreen(0);
    M=0
    @printscreen
    0;JMP

(Get_Key)
    @SCREEN
    D=M
    @checkKeyboard
    D;JLT  // if(RAM(KBD)!=0 && RAM(SCREEN)==-1) goto checkKeyboard;

    @value // if(RAM(KBD)!=0 && RAM(SCREEN)!=-1) printScreen(-1);
    M=-1
    @printscreen
    0;JMP

(printscreen)
	@SCREEN
	D=A
	@NowPosi  
	M=D   //RAM[NowPosi] = NowPosi

	@8192
	D=A
	@i
	M=D  // RAM[i]= 256*512/16

	(loop)
		@i
		D=M
		@checkKeyboard
		D;JEQ // if(RAM[i] == 0) goto checkKeyboard;
		@i
		M=M-1
		@value
		D=M
		@NowPosi
		A=M
		M=D
		@NowPosi
		M=M+1
		@loop
		0;JMP
