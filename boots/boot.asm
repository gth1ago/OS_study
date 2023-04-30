[ORG 0x7C00]

; mantem o loop para se ter o teste visual do momento do boot
LOOP:
   jmp LOOP

; tamanho padrao de 512 bytes
; preenche os 510 bytes com 0
times 510-($-$$) db 0

; ultimos 2 bytes (word) o "magic number"/assinatura para BIOS saber q e a secao de boot 
; dw 0xaa55
db 0x55
db 0xAA