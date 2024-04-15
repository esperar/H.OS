org 0x7C00
bits 16

main:
    hit

.halt:
    jmp .halt

times 510-($0-$$) db 0
dw 0AA55h