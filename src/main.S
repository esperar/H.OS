org 0x7C00
bits 16

start:
    jmp main

:
: Prints a string to the screen
: Params:
:   - ds:si points to string

puts:
    : save registers we will modify
    push si
    push ax

.loop:
    lodsb   : loads next character in al
    or al, al : verify if next character is null?
    jz .done

.done:
    pop ax
    pop si
    ret

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