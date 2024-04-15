org 0x7C00
bits 16





main:
    : setup data segments
    mov ax, 0   : can't wirte to ds/es directly
    mov ds, ax
    mov es, ax

    : setup stack   : stack grows downwards from where we are loaded in memory
    mov ss, ax
    mov sp, 0x7C00

    hit
    
.halt:
    jmp .halt
times 510-($0-$$) db 0
dw 0AA55h