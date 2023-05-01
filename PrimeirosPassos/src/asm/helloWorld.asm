[ORG 0x7c00]

   mov ah, 0x0e ; tty mode
   mov al, 'H'
   int 0x10
   mov al, 'e'
   int 0x10
   mov al, 'l'
   int 0x10
   mov al, 'l'
   int 0x10
   mov al, 'o'
   int 0x10
   mov al, ' '
   int 0x10
   mov al, 'W'
   int 0x10
   mov al, 'o'
   int 0x10
   mov al, 'r'
   int 0x10
   mov al, 'l'
   int 0x10
   mov al, 'd'
   int 0x10

jmp $ ; jmp to current address = infinit loop

; padding and magic number
times 510-($-$$) db 0

dw 0xaa55