; boot.asm
; En 16-bitars bootloader som BIOS laddar på 0x7C00.
; Den skriver "hello world" via BIOS teletype (int 0x10).

BITS 16
ORG 0x7C00

start:
    mov si, msg       ; pekar på strängen
    mov ah, 0x0E      ; BIOS teletype

.print:
    lodsb             ; läs byte från [SI] -> AL
    cmp al, 0
    je .done
    int 0x10          ; skriv tecken
    jmp .print

.done:
    cli
    hlt

msg db "hello world", 0

; fyll ut till 510 bytes
times 510-($-$$) db 0
dw 0xAA55             ; boot signature
