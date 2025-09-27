; boot.asm
; Minimal bootloader (512 bytes) som skriver "hello world" och stannar.

BITS 16
ORG 0x7C00          ; BIOS laddar hit

start:
    mov si, msg     ; SI = pekare till strängen
    mov ah, 0x0E    ; BIOS teletype (print char)

.print:
    lodsb           ; AL = [SI], SI++
    cmp al, 0       ; slut på sträng?
    je .done
    int 0x10        ; skriv tecknet
    jmp .print

.done:
    cli             ; disable interrupts
    hlt             ; stoppa CPU

msg db "hello world", 0

; Fyll ut sektorn till 510 bytes
times 510-($-$$) db 0
dw 0xAA55           ; Boot signature (måste finnas)
