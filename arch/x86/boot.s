.section .text
.global _start

_start:
    cli                     # stäng av avbrott
    xor %ax, %ax
    mov %ax, %ds            # data-segment = 0
    mov %ax, %es            # extra-segment = 0
    mov %ax, %ss            # stack-segment = 0

    mov $stack_top, %esp    # sätt stackpekaren
    call start_kernel       # hoppa till C

hang:
    hlt
    jmp hang

.section .bss
.lcomm stack, 4096          # reservera 4 KB stack
stack_top:
