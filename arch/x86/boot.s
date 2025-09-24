.section .text
.global _start

_start:
    cli
    xor %eax, %eax          # nolla EAX (32-bit)
    mov %ax, %ds
    mov %ax, %es
    mov %ax, %ss

    mov $stack_top, %esp    # ställ in stackpekaren
    call start_kernel

hang:
    hlt
    jmp hang

.section .bss
.lcomm stack, 4096
stack_top:
