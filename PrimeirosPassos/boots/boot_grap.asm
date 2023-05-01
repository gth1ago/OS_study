[ORG 0x7c00]

; interrupcao - int
; alterando modo de texto para grafico
; reg responsaveis: AH e AL
; AH = tipo de funcao
; AL = parametros da funcao
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


; preenche os 510 bytes com 0
times 510-($-$$) db 0

; ultimos 2 bytes (word) o "magic number"/assinatura para BIOS saber q e a secao de boot 
db 0x55
db 0xAA