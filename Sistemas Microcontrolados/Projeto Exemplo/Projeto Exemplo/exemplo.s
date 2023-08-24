; Exemplo.s
; Desenvolvido para a placa EK-TM4C1294XL
; Prof. Guilherme Peron
; 12/03/2018

; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declarações EQU - Defines
;<NOME>         EQU <VALOR>
; -------------------------------------------------------------------------------
; Área de Dados - Declarações de variáveis
		AREA  DATA, ALIGN=2
		; Se alguma variável for chamada em outro arquivo
		;EXPORT  <var> [DATA,SIZE=<tam>]   ; Permite chamar a variável <var> a 
		                                   ; partir de outro arquivo
;<var>	SPACE <tam>                        ; Declara uma variável de nome <var>
                                           ; de <tam> bytes a partir da primeira 
                                           ; posição da RAM		

; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
        EXPORT Start                ; Permite chamar a função Start a partir de 
			                        ; outro arquivo. No caso startup.s
									
		; Se chamar alguma função externa	
        ;IMPORT <func>              ; Permite chamar dentro deste arquivo uma 
									; função <func>

; -------------------------------------------------------------------------------
; Função main()
Start  
; Comece o código aqui <======================================================

;ex1
	;MOV R0,#65
	;MOV R1,#0x1B001B00
	;MOV R2,#0x5678
	;MOVT R2,#0x1234
	;MOV R4,#0x0040
	;MOVT R4,#0x2000
	;STR R0,[R4], #4
	;STR R1,[R4], #4
	;STR R2,[R4], #4
	;MOV R5, #0x0001
	;MOVT R5, #0x000F
	;STR R5,[R4]
	;MOV R5, #0xCD
	;STRB R5,[R4, #-6]!
	;LDR R7,[R4, #-6]
	;LDR R8,[R4, #2]
	;MOV R9,R7
	;NOP
;ex2
	;MOV R9, #0xF0
	;ANDS R0, R9, #2_01010101
	;MOV R9, #2_11001100
	;ANDS R1,R9, #2_00110011
	;MOV R9, #2_10000000
	;ORRS R2, R9, #2_00110111
	
	;MOV R9,#0xFFFF
	
	;MOV R8,#0xABCD
	;MOVT R8,#0xABCD
	
	;BIC R3,R8,R9
	;NOP
;ex3
;	MOV R9, #701
;	LSRS R0,R9,#5
;	MOV R9,#32067
;	NEG R9,R9
;	LSRS R1,R9,#4
;	MOV R9, #701
;	ASRS R2,R9,#5
;	MOV R9,#32067
;	NEG R9,R9
;	ASRS R3,R9,#4
;	MOV R9,#255
;	LSLS R4,R9,#8
;	MOV R9,#58982
;	NEG R9,R9
;	LSLS R5,R9,#18
;	
;	MOV R9,#0x1234
;	MOVT R9,#0xFABC
;	ROR R6,R9,#10
;	
;	MOV R9,#0x4321
;	RRX R9,R9
;	RRX R9,R9
;	NOP

;ex4
;	MOV R1, #101
;	MOV R9, #253
;	ADDS R1, R9
;	
;	MOV R2, #1500
;	MOV R9, #40543
;	ADD R2, R9
;	
;	MOV R3, #340
;	MOV R9, #123
;	SUBS R3, R9
;	
;	MOV R4, #1000
;	MOV R9, #2000
;	SUBS R4, R9
;	
;	MOV R5, #54378
;	MOV R9, #4
;	MUL R5, R9
;	
;	MOV R6, #0x3344
;	MOVT R6, #0x1122
;	MOV R9, #0x2211
;	MOVT R9, #0x4433
;	UMULL R6,R7,R6,R9
;	
;	MOV R8, #0x7560
;	MOVT R8, #0xFFFF
;	MOV R9, #1000
;	SDIV R8,R9
;	
;	MOV R8, #0x7560
;	MOVT R8, #0xFFFF
;	MOV R9, #1000
;	SDIV R8,R9
;	NOP

;ex5
;	MOV R0, #10
;	CMP R0, #9
;	ITT HS
;		MOVHS R1, #50
;		ADDHS R2, R1, #32
;		MOVCC R3,#75
;	CMP R0, #11
;	ITT HS
;		MOVHS R1, #50
;		ADDHS R2, R1, #32
;		MOVCC R3,#75
;	NOP

;ex6
;	MOV R0, 10
;	MOV R1, #0xCC22
;	MOVT R1, #0xFF11
;	MOV R2, #1234
;	MOV R3, #0x300
;	PUSH {R0}
;	PUSH {R1,R2,R3}
;	MOV R1, #60
;	MOV R2, #0x1234
;	POP {R1}
;	POP {R2}
;	POP {R3}
;	POP {R0}

ex7
	MOV R0, #10
	ADD R0, #5

INIT
	ADD R0,#5
	CMP R0,#50
	BNE INIT
	BEQ FUNC
	
FUNC
	MOV R1,R0
	CMP R1,#50
	ITE CC
		ADDCC R1,#1
		NEGHS R1,R1
	NOP
TRAVA
	B TRAVA
	
	NOP
	
    ALIGN                           ; garante que o fim da seção está alinhada 
    END                             ; fim do arquivo
