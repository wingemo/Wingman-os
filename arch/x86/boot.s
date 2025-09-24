.section .text
.global _start

_start:
    cli                     # stäng av avbrott
    xor %ax, %ax            # AX = 0x0000
    mov %ax, %ds            # data-segment = 0
    mov %ax, %es            # extra-segment = 0
    mov %ax, %ss            # stack-segment = 0

    mov $stack_top, %esp    # sätt stackpekaren till slutet av stack 
    call start_kernel       # hoppa till C

hang:
    hlt
    jmp hang

.section .bss
.lcomm stack, 4096          # reservera 4 KB med variabeln stack
stack_top:                  # variabel för slutet på data sektionen
