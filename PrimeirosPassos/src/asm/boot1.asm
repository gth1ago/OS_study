[ORG 0x7c00]
   ; leitura 512 byter do setor
   ; teste leitura cd
   mov ah, 2 ; leitura do disco que originou o boot (hex. 02h = dec. 2)
   mov al, 1 ; total de setores lido (Sectors To Read Count)
   mov ch, 0 ; numero do cilindro (Cylinder)
   mov cl, 2 ; numero do setor para comecar ler (Sector)
   mov dh, 1 ; numero da cabeca (head)
   mov es, [PRINT_STR]
   mov bx, 0
   int 13h
   jmp PRINT_STR

STR: db 'Hello World',13,10,0

   times 510-($-$$) db 0
   db 0x55
   db 0xAA

; -------- 1 setor --------------

EXTENSION:
   mov ah, 0x00
   mov al, 0x13
   int 0x10

; parametros
   mov al, 0x01 ; cor do pixel
   mov bh, 0x00 ; paginacao
   mov cx, 0x00 ; cursor x
   mov dx, 0x00 ; cursor y

; incrementa a cor
LOOP:
   mov ah, 0x0c
   int 0x10 ; funcao d video
   
   inc cx ; avanca o p pixel a direita
   cmp cx, 0x0140 ; se igual a 320
   jne LOOP
   mov cx, 0x00   ; volta com cursor x ao 0
   
   inc dx   ; avanca prox linha
   cmp dx, 0xC8   ; verifica limite inferior
   jne LOOP
   mov dx, 0x00

   inc al ; incrementa cor
   cmp al, 0xFF
   je RESET_COR
   jmp LOOP

RESET_COR:
   mov al, 0x00
   jmp LOOP

PRINT_STR:
   xor ax, ax  ; zera o acumulador
   mov ds, ax
   mov si, STR
CHAR_LOOP: lodsb
   or al, al   ; checa 0 do acumulador
   jz WAIT1
   mov ah, 0x0E
   int 0x10
   JMP CHAR_LOOP
WAIT1:
   jmp WAIT1