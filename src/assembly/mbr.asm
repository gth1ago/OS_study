[ORG 0x7c00]

mov ax, 0x4F02
mov bx, 0x0115
int 0x10

jmp $ ; jmp to current address = infinit loop

; padding and magic number
times 510-($-$$) db 0

dw 0xaa55