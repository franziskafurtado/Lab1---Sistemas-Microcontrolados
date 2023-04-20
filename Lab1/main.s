; main.s
; Desenvolvido para a placa EK-TM4C1294XL
; Prof. Guilherme Peron
; Ver 1 19/03/2018
; Ver 2 26/08/2018
; Este programa deve esperar o usuário pressionar uma chave.
; Caso o usuário pressione uma chave, um LED deve piscar a cada 1 segundo.


; Lab1 - 2023.1
; Fran 
; Victor 

; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------
		
; Declarações EQU - Defines
;<NOME>         EQU <VALOR>
; ========================
; Definições de Valores


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
		IMPORT  PLL_Init
		IMPORT  SysTick_Init
		IMPORT  SysTick_Wait1ms			
		IMPORT  GPIO_Init
        IMPORT  SSD_Write
		IMPORT 	Habilita_unidade
		IMPORT 	Habilita_dezena
		IMPORT	Habilita_Leds
		IMPORT 	Acende_Leds
        IMPORT  PortJ_Input	


; -------------------------------------------------------------------------------
; Função main()
Start  		
	BL PLL_Init                  ;Chama a subrotina para alterar o clock do microcontrolador para 80MHz
	BL SysTick_Init              ;Chama a subrotina para inicializar o SysTick
	BL GPIO_Init                 ;Chama a subrotina que inicializa os GPIO
	
	
	MOV R12, #0 ;numero
	MOV R8, #1 ;Passo
	MOV R7, #0x0 ;LEDs
MainLoop

	CMP R7, #0xe
	IT HS
		MOVHS R7, #0x0 ;Retorna led para 0 ao chegar no 7
		
	BL PortJ_Input ;lê chaves
	CMP R0, #2_00000010 ;
	IT EQ
		ADDEQ R8, #1 ;  Se apertar o botão 1 aumenta passo		

	CMP R0, #2_00000001;
	IT EQ
;		BLEQ Pisca_Leds ; Ao apertar o botão 2 deve sair da contagem e piscar leds
		BLEQ ParaContagem
		

	CMP R8, #9
	IT HI
		MOVHI R8, #1 ;Limita passo em 9, se maior volta pra 1
		
	CMP R12, #99
	IT HI
		SUBHI R12, #100 ;Faz o número ser ciclico
	BL SSDeLEDs ;Chama função para controlar SSDs e LEDs

	ADD R12, R8 ;Adiciona o valor do passo ao número
	ADD R7, #1 ;Adiciona 1 ao led
	
	B MainLoop

SSDeLEDs
	PUSH {LR}
	MOV R9, #0 ;Iterações
	MOV R11, #10
	UDIV R10, R12, R11 ;R10 = dezenas no número
	MLS R11, R10, R11, R12 ;R11 = Unidades no número

SSDeLEDs_loop
	MOV R0, R10
	BL SSD_Write ;Chama função do SSD com o valor das dezenas
	BL Habilita_dezena ;Chama função que ativa SSD das dezenas e desativa unidades e LEDs
	MOV R0, #6
	BL SysTick_Wait1ms ;Espera 6ms
	
	MOV R0, R11
	BL SSD_Write ;Chama função do SSD com o valor das unidades
	BL Habilita_unidade ;Chama função que ativa SSD das unidades e desativa dezenas e LEDs
	
	MOV R0, #6
	BL SysTick_Wait1ms ;Espera 6ms
	
	BL Habilita_Leds ;Chama função que ativa LEDs e desativa SSDs
	MOV R0, R7
	BL Acende_Leds ;Chama a função que ativa o led específicado e desativa os demais
	MOV R0, #6
	BL SysTick_Wait1ms ;Espera 6ms
	
	ADD R9, #1
	CMP R9, #50
	ITT HS
		POPHS {LR}
		BXHS LR ;Adiciona 1 ao número de iterações. Se chegar a 50, retorna 
	
	B SSDeLEDs_loop
	
ParaContagem
	BL SSDeLEDs ;Chama função para controlar SSDs e LEDs
	
	MOV R7, #0xe
	MOV R0, R7
	
	BL SSDeLEDs ;Chama função para controlar SSDs e LEDs
	
	MOV R7, #0x3
	MOV R0, R7
	
	B ParaContagem


; -------------------------------------------------------------------------------------------------------------------------
; Fim do Arquivo
; -------------------------------------------------------------------------------------------------------------------------	
    ALIGN                        ;Garante que o fim da seção está alinhada 
    END                          ;Fim do arquivo
