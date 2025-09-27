; boot.asm
; En 16-bitars bootloader som BIOS laddar på 0x7C00.
; Den skriver "hello world" via BIOS teletype (int 0x10)
; och stänger sedan av maskinen via APM.

BITS 16
ORG 0x7C00

start:
    ; skriv strängen
    mov si, msg
    mov ah, 0x0E

.print:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .print

.done:
    ; försök stänga av via APM
    mov ax, 0x5301     ; APM Installation Check
    xor bx, bx
    int 0x15

    mov ax, 0x5307     ; APM Set Power State
    mov bx, 1          ; all devices
    mov cx, 3          ; power off
    int 0x15

    ; om avstängning misslyckas -> häng CPU
    cli
    hlt

msg db "hello world", 0

; fyll ut till 510 bytes
times 510-($-$$) db 0
dw 0xAA55             ; boot signature
