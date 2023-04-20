; gpio.s
; Desenvolvido para a placa EK-TM4C1294XL
; Prof. Guilherme Peron
; 19/03/2018

; -------------------------------------------------------------------------------
        THUMB                        ; Instruções do tipo Thumb-2
; -------------------------------------------------------------------------------
; Declarações EQU - Defines
; ========================
; Definições dos Registradores Gerais
SYSCTL_RCGCGPIO_R	 EQU	0x400FE608
SYSCTL_PRGPIO_R		 EQU    0x400FEA08
; ========================
; Definições dos Ports
; PORT A
GPIO_PORTA_AHB_LOCK_R    	EQU    0x40058520
GPIO_PORTA_AHB_CR_R      	EQU    0x40058524
GPIO_PORTA_AHB_AMSEL_R   	EQU    0x40058528
GPIO_PORTA_AHB_PCTL_R    	EQU    0x4005852C
GPIO_PORTA_AHB_DIR_R     	EQU    0x40058400
GPIO_PORTA_AHB_AFSEL_R   	EQU    0x40058420
GPIO_PORTA_AHB_DEN_R     	EQU    0x4005851C
GPIO_PORTA_AHB_PUR_R     	EQU    0x40058510	
GPIO_PORTA_AHB_DATA_R    	EQU    0x400583FC
GPIO_PORTA               	EQU    2_100000000000000
; PORT Q
GPIO_PORTQ_AHB_LOCK_R    	EQU    0x40066520
GPIO_PORTQ_AHB_CR_R      	EQU    0x40066524
GPIO_PORTQ_AHB_AMSEL_R   	EQU    0x40066528
GPIO_PORTQ_AHB_PCTL_R    	EQU    0x4006652C
GPIO_PORTQ_AHB_DIR_R     	EQU    0x40066400
GPIO_PORTQ_AHB_AFSEL_R   	EQU    0x40066420
GPIO_PORTQ_AHB_DEN_R     	EQU    0x4006651C
GPIO_PORTQ_AHB_PUR_R     	EQU    0x40066510	
GPIO_PORTQ_AHB_DATA_R    	EQU    0x400663FC
GPIO_PORTQ               	EQU    2_000000000000001	

; PORT B
GPIO_PORTB_AHB_LOCK_R    	EQU    0x40059520
GPIO_PORTB_AHB_CR_R      	EQU    0x40059524
GPIO_PORTB_AHB_AMSEL_R   	EQU    0x40059528
GPIO_PORTB_AHB_PCTL_R    	EQU    0x4005952C
GPIO_PORTB_AHB_DIR_R     	EQU    0x40059400
GPIO_PORTB_AHB_AFSEL_R   	EQU    0x40059420
GPIO_PORTB_AHB_DEN_R     	EQU    0x4005951C
GPIO_PORTB_AHB_PUR_R     	EQU    0x40059510	
GPIO_PORTB_AHB_DATA_R    	EQU    0x400593FC
GPIO_PORTB               	EQU    2_000000000000010
	
; PORT J
GPIO_PORTJ_AHB_LOCK_R    	EQU    0x40060520
GPIO_PORTJ_AHB_CR_R      	EQU    0x40060524
GPIO_PORTJ_AHB_AMSEL_R   	EQU    0x40060528
GPIO_PORTJ_AHB_PCTL_R    	EQU    0x4006052C
GPIO_PORTJ_AHB_DIR_R     	EQU    0x40060400
GPIO_PORTJ_AHB_AFSEL_R   	EQU    0x40060420
GPIO_PORTJ_AHB_DEN_R     	EQU    0x4006051C
GPIO_PORTJ_AHB_PUR_R     	EQU    0x40060510	
GPIO_PORTJ_AHB_DATA_R    	EQU    0x400603FC
GPIO_PORTJ               	EQU    2_000000100000000
	
; PORT P
GPIO_PORTP_AHB_LOCK_R    	EQU    0x40065520
GPIO_PORTP_AHB_CR_R      	EQU    0x40065524
GPIO_PORTP_AHB_AMSEL_R   	EQU    0x40065528
GPIO_PORTP_AHB_PCTL_R    	EQU    0x4006552C
GPIO_PORTP_AHB_DIR_R     	EQU    0x40065400
GPIO_PORTP_AHB_AFSEL_R   	EQU    0x40065420
GPIO_PORTP_AHB_DEN_R     	EQU    0x4006551C
GPIO_PORTP_AHB_PUR_R     	EQU    0x40065510	
GPIO_PORTP_AHB_DATA_R    	EQU    0x400653FC
GPIO_PORTP               	EQU    2_010000000000000
	
;Definições SSD
SSD_PORTA_0	EQU 2_110000
SSD_PORTQ_0	EQU	2_1111

SSD_PORTA_1	EQU 0x00
SSD_PORTQ_1	EQU	2_110
	
SSD_PORTA_2	EQU 2_1010000
SSD_PORTQ_2	EQU	2_1011

SSD_PORTA_3	EQU 2_1000000
SSD_PORTQ_3	EQU	2_1111

SSD_PORTA_4	EQU 2_1100000
SSD_PORTQ_4	EQU	2_110

SSD_PORTA_5	EQU 2_1100000
SSD_PORTQ_5	EQU	2_1101

SSD_PORTA_6	EQU 2_1110000
SSD_PORTQ_6	EQU	2_1101
	
SSD_PORTA_7	EQU 0x0
SSD_PORTQ_7	EQU	2_111
	
SSD_PORTA_8	EQU 2_1110000
SSD_PORTQ_8	EQU	2_1111

SSD_PORTA_9	EQU 2_1100000
SSD_PORTQ_9	EQU	2_1111
	
;Definição LEDs
LED0_PORTA EQU 2_10000000
LED0_PORTQ EQU 0x0

LED1_PORTA EQU 2_01000000
LED1_PORTQ EQU 0x0
	
LED2_PORTA EQU 2_00100000
LED2_PORTQ EQU 0x0
	
LED3_PORTA EQU 2_00010000
LED3_PORTQ EQU 0x0
	
LED4_PORTA EQU 0x0
LED4_PORTQ EQU 2_1000
	
LED5_PORTA EQU 0x0
LED5_PORTQ EQU 2_0100
	
LED6_PORTA EQU 0x0
LED6_PORTQ EQU 2_0010
	
LED7_PORTA EQU 0x0
LED7_PORTQ EQU 2_0001

LED8_PORTA EQU 0x0
LED8_PORTQ EQU 2_11111111

LED9_PORTA EQU 0x0
LED9_PORTQ EQU 2_0000

; -------------------------------------------------------------------------------
; Área de Código - Tudo abaixo da diretiva a seguir será armazenado na memória de 
;                  código
        AREA    |.text|, CODE, READONLY, ALIGN=2

		; Se alguma função do arquivo for chamada em outro arquivo	
        EXPORT GPIO_Init            ; Permite chamar GPIO_Init de outro arquivo
		EXPORT SSD_Write
		EXPORT Habilita_unidade
		EXPORT Habilita_dezena
		EXPORT Habilita_Leds
		EXPORT Acende_Leds
		EXPORT PortJ_Input
									

;--------------------------------------------------------------------------------
; Função GPIO_Init
; Parâmetro de entrada: Não tem
; Parâmetro de saída: Não tem
GPIO_Init
;=====================
; 1. Ativar o clock para a porta setando o bit correspondente no registrador RCGCGPIO,
; após isso verificar no PRGPIO se a porta está pronta para uso.
; enable clock to GPIOF at clock gating register
            LDR     R0, =SYSCTL_RCGCGPIO_R  		;Carrega o endereço do registrador RCGCGPIO
			MOV		R1, #GPIO_PORTA                 ;Seta o bit da porta A
			ORR     R1, #GPIO_PORTQ					;Seta o bit da porta Q, fazendo com OR
			ORR     R1, #GPIO_PORTB					;Seta o bit da porta B, fazendo com OR
			ORR     R1, #GPIO_PORTP					;Seta o bit da porta P, fazendo com OR
			ORR		R1, #GPIO_PORTJ					;Seta o bit da porta J, fazendo com OR
			STR     R1, [R0]						;Move para a memória os bits das portas no endereço do RCGCGPIO
 
            LDR     R0, =SYSCTL_PRGPIO_R			;Carrega o endereço do PRGPIO para esperar os GPIO ficarem prontos
EsperaGPIO  LDR     R1, [R0]						;Lê da memória o conteúdo do endereço do registrador
			MOV     R2, #GPIO_PORTA                 ;Seta os bits correspondentes às portas para fazer a comparação
			ORR     R2, #GPIO_PORTQ                 
			ORR     R1, #GPIO_PORTB                 
			ORR     R1, #GPIO_PORTP
			ORR		R1, #GPIO_PORTJ
			TST     R1, R2							;ANDS de R1 com R2
            BEQ     EsperaGPIO					    ;Se o flag Z=1, volta para o laço. Senão continua executando
 
; 2. Limpar o AMSEL para desabilitar a analógica
            MOV     R1, #0x00						;Colocar 0 no registrador para desabilitar a função analógica
            LDR     R0, =GPIO_PORTA_AHB_AMSEL_R     ;Carrega o R0 com o endereço do AMSEL para a porta A
            STR     R1, [R0]						;Guarda no registrador AMSEL da porta J da memória
            LDR     R0, =GPIO_PORTQ_AHB_AMSEL_R		;Carrega o R0 com o endereço do AMSEL para a porta Q
            STR     R1, [R0]					    ;Guarda no registrador AMSEL da porta F da memória
			LDR     R0, =GPIO_PORTB_AHB_AMSEL_R		;Carrega o R0 com o endereço do AMSEL para a porta B
            STR     R1, [R0]
			LDR     R0, =GPIO_PORTP_AHB_AMSEL_R		;Carrega o R0 com o endereço do AMSEL para a porta P
            STR     R1, [R0]
			LDR     R0, =GPIO_PORTJ_AHB_AMSEL_R		;Carrega o R0 com o endereço do AMSEL para a porta J
            STR     R1, [R0]
; 3. Limpar PCTL para selecionar o GPIO
            MOV     R1, #0x00					    ;Colocar 0 no registrador para selecionar o modo GPIO
            LDR     R0, =GPIO_PORTA_AHB_PCTL_R		;Carrega o R0 com o endereço do PCTL para a porta A
            STR     R1, [R0]                        ;Guarda no registrador PCTL da porta J da memória
            LDR     R0, =GPIO_PORTQ_AHB_PCTL_R      ;Carrega o R0 com o endereço do PCTL para a porta Q
            STR     R1, [R0]                        ;Guarda no registrador PCTL da porta F da memória
			LDR     R0, =GPIO_PORTB_AHB_PCTL_R      ;Carrega o R0 com o endereço do PCTL para a porta B
            STR     R1, [R0]
			LDR     R0, =GPIO_PORTP_AHB_PCTL_R      ;Carrega o R0 com o endereço do PCTL para a porta P
            STR     R1, [R0]
			LDR     R0, =GPIO_PORTJ_AHB_PCTL_R      ;Carrega o R0 com o endereço do PCTL para a porta J
            STR     R1, [R0]
; 4. DIR para 0 se for entrada, 1 se for saída
            LDR     R0, =GPIO_PORTA_AHB_DIR_R		
			MOV     R1, #2_11110000					
            STR     R1, [R0]
            LDR     R0, =GPIO_PORTQ_AHB_DIR_R
            MOV     R1, #2_00001111               		
            STR     R1, [R0]						
			LDR     R0, =GPIO_PORTB_AHB_DIR_R		
            MOV     R1, #2_00110000
            STR     R1, [R0]
			LDR     R0, =GPIO_PORTP_AHB_DIR_R		
            MOV     R1, #2_00100000               		
            STR     R1, [R0]
			LDR		R0, =GPIO_PORTJ_AHB_DIR_R
			MOV		R1, #0x0
			STR		R1, [R0]
; 5. Limpar os bits AFSEL para 0 para selecionar GPIO 
;    Sem função alternativa
            MOV     R1, #0x00						;Colocar o valor 0 para não setar função alternativa
            LDR     R0, =GPIO_PORTA_AHB_AFSEL_R		;Carrega o endereço do AFSEL da porta A
            STR     R1, [R0]						;Escreve na porta
            LDR     R0, =GPIO_PORTQ_AHB_AFSEL_R     ;Carrega o endereço do AFSEL da porta Q
            STR     R1, [R0]                        ;Escreve na porta
			LDR     R0, =GPIO_PORTB_AHB_AFSEL_R     ;Carrega o endereço do AFSEL da porta B
            STR     R1, [R0]
			LDR     R0, =GPIO_PORTP_AHB_AFSEL_R     ;Carrega o endereço do AFSEL da porta P
            STR     R1, [R0]
			LDR     R0, =GPIO_PORTJ_AHB_AFSEL_R     ;Carrega o endereço do AFSEL da porta J
            STR     R1, [R0]
; 6. Setar os bits de DEN para habilitar I/O digital
            LDR     R0, =GPIO_PORTA_AHB_DEN_R			
            MOV     R1, #2_11110000                     
            STR     R1, [R0]							
 
            LDR     R0, =GPIO_PORTQ_AHB_DEN_R			
			MOV     R1, #2_00001111                           
            STR     R1, [R0]                           

			LDR     R0, =GPIO_PORTB_AHB_DEN_R			
			MOV     R1, #2_00110000                           
            STR     R1, [R0]
			
			LDR     R0, =GPIO_PORTP_AHB_DEN_R			
			MOV     R1, #2_00100000                     
            STR     R1, [R0]
			
			LDR     R0, =GPIO_PORTJ_AHB_DEN_R		
			MOV     R1, #2_00000011                    
            STR     R1, [R0]
; 7. Para habilitar resistor de pull-up interno, setar PUR para 1
			LDR     R0, =GPIO_PORTJ_AHB_PUR_R			;Carrega o endereço do PUR para a porta J
			MOV     R1, #2_00000011						;Habilitar funcionalidade digital de resistor de pull-up 
                                                        ;nos bits 0 e 1
            STR     R1, [R0]							;Escreve no registrador da memória do resistor de pull-up
            
;retorno            
			BX      LR


SSD_Write ;Compara o número recebido e acende os LEDs do SSD equivalentes ao número
	CMP R0, #0
	ITT EQ
		LDREQ R1, =SSD_PORTA_0 ;Pinos a serem acesos na Port A para o 0 em R1
		LDREQ R2, =SSD_PORTQ_0 ;Pinos a serem acesos na Port Q para o 0 em R2
		
	CMP R0, #1
	ITT EQ
		LDREQ R1, =SSD_PORTA_1 ;De forma semelhante ao feito para 0
		LDREQ R2, =SSD_PORTQ_1
		
	CMP R0, #2
	ITT EQ
		LDREQ R1, =SSD_PORTA_2
		LDREQ R2, =SSD_PORTQ_2
		
	CMP R0, #3
	ITT EQ
		LDREQ R1, =SSD_PORTA_3
		LDREQ R2, =SSD_PORTQ_3
		
	CMP R0, #4
	ITT EQ
		LDREQ R1, =SSD_PORTA_4
		LDREQ R2, =SSD_PORTQ_4
		
	CMP R0, #5
	ITT EQ
		LDREQ R1, =SSD_PORTA_5
		LDREQ R2, =SSD_PORTQ_5
		
	CMP R0, #6
	ITT EQ
		LDREQ R1, =SSD_PORTA_6
		LDREQ R2, =SSD_PORTQ_6
		
	CMP R0, #7
	ITT EQ
		LDREQ R1, =SSD_PORTA_7
		LDREQ R2, =SSD_PORTQ_7
		
	CMP R0, #8
	ITT EQ
		LDREQ R1, =SSD_PORTA_8
		LDREQ R2, =SSD_PORTQ_8
		
	CMP R0, #9
	ITT EQ
		LDREQ R1, =SSD_PORTA_9
		LDREQ R2, =SSD_PORTQ_9
		
	LDR R3, =GPIO_PORTA_AHB_DATA_R
	STR R1, [R3]
	LDR R3, =GPIO_PORTQ_AHB_DATA_R
	STR R2, [R3]							;Grava R1 na Port A e R2 na Port Q
	
	BX LR									;Retorno
	
Habilita_unidade
	LDR R1, =GPIO_PORTB_AHB_DATA_R
	MOV R2, #2_100000						;Habilita transistor SSD unidade e desativa dezena
	STR R2, [R1]
	LDR R1, =GPIO_PORTP_AHB_DATA_R
	MOV R2, #0x0							;Desabilita LEDs
	STR R2, [R1]
	BX LR

Habilita_dezena
	LDR R1, =GPIO_PORTB_AHB_DATA_R
	MOV R2, #2_010000						;Habilita transistor SSD dezena e desativa unidade
	STR R2, [R1]
	LDR R1, =GPIO_PORTP_AHB_DATA_R
	MOV R2, #0x0							;Desabilita LEDs
	STR R2, [R1]
	BX LR
	
Habilita_Leds
	LDR R1, =GPIO_PORTB_AHB_DATA_R
	MOV R2, #0x0							;Desabilita transistores SSDs
	STR R2, [R1]
	LDR R1, =GPIO_PORTP_AHB_DATA_R
	MOV R2, #2_100000						;Habilita LEDs
	STR R2, [R1]
	BX LR
	
Acende_Leds ;Compara o número recebido, ativa LED correspondente, desativa demais
	CMP R0, #0x0
	ITT EQ
		LDREQ R1, =LED0_PORTA ;R1 recebe os pinos da porta A com LED0 ativo e demais inativos
		LDREQ R2, =LED0_PORTQ ;R2 recebe os pinos da porta Q com LED0 ativo e demais inativos
		
	CMP R0, #0x1
	ITT EQ
		LDREQ R1, =LED1_PORTA ;Equivalente ao feito no LED0
		LDREQ R2, =LED1_PORTQ
		
	CMP R0, #0x2
	ITT EQ
		LDREQ R1, =LED2_PORTA
		LDREQ R2, =LED2_PORTQ
		
	CMP R0, #0x3
	ITT EQ
		LDREQ R1, =LED3_PORTA
		LDREQ R2, =LED3_PORTQ
		
	CMP R0, #0x4
	ITT EQ
		LDREQ R1, =LED4_PORTA
		LDREQ R2, =LED4_PORTQ
		
	CMP R0, #0x5
	ITT EQ
		LDREQ R1, =LED5_PORTA
		LDREQ R2, =LED5_PORTQ
		
	CMP R0, #0x6
	ITT EQ
		LDREQ R1, =LED6_PORTA
		LDREQ R2, =LED6_PORTQ
		
	CMP R0, #0x7
	ITT EQ
		LDREQ R1, =LED7_PORTA
		LDREQ R2, =LED7_PORTQ
		
	CMP R0, #0x8
	ITT EQ
		LDREQ R1, =LED6_PORTA
		LDREQ R2, =LED6_PORTQ
		
	CMP R0, #0x9
	ITT EQ
		LDREQ R1, =LED5_PORTA
		LDREQ R2, =LED5_PORTQ
		
	CMP R0, #0xa
	ITT EQ
		LDREQ R1, =LED4_PORTA
		LDREQ R2, =LED4_PORTQ
		
	CMP R0, #0xb
	ITT EQ
		LDREQ R1, =LED3_PORTA
		LDREQ R2, =LED3_PORTQ
		
	CMP R0, #0xc
	ITT EQ
		LDREQ R1, =LED2_PORTA
		LDREQ R2, =LED2_PORTQ
		
	CMP R0, #0xd
	ITT EQ
		LDREQ R1, =LED1_PORTA
		LDREQ R2, =LED1_PORTQ
	
	CMP R0, #0xe
	ITT EQ
	LDREQ R1, =LED8_PORTQ
	LDREQ R2, =LED8_PORTQ

	CMP R0, #0xf
	ITT EQ
	LDREQ R1, =LED2_PORTQ
	LDREQ R2, =LED2_PORTQ
		
	LDR R3, =GPIO_PORTA_AHB_DATA_R	;Grava R1 na Port A e R2 na Port Q
	STR R1, [R3]
	LDR R3, =GPIO_PORTQ_AHB_DATA_R
	STR R2, [R3]
	BX LR
; -------------------------------------------------------------------------------
; Função PortJ_Input
; Parâmetro de entrada: Não tem
; Parâmetro de saída: R0 --> o valor da leitura
PortJ_Input
	LDR	R1, =GPIO_PORTJ_AHB_DATA_R		    ;Carrega o valor do offset do data register
	LDR R0, [R1]                            ;Lê no barramento de dados dos pinos [J1-J0]
	BX LR									;Retorno



    ALIGN                           ; garante que o fim da seção está alinhada 
    END                             ; fim do arquivo