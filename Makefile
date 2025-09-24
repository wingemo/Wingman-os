CC = gcc
LD = ld
CFLAGS = -m32 -ffreestanding -fno-pic -fno-stack-protector -nostdlib -Wall -Wextra
OBJS = arch/x86/boot.o init/main.o

all: kernel.bin

arch/x86/boot.o: arch/x86/boot.s
	$(CC) $(CFLAGS) -c $< -o $@

init/main.o: init/main.c
	$(CC) $(CFLAGS) -c $< -o $@

kernel.bin: $(OBJS)
	$(LD) -m elf_i386 -T arch/x86/linker.ld -o $@ $(OBJS)

run: kernel.bin
	qemu-system-i386 -kernel kernel.bin

symbols: kernel.bin
	objdump -t kernel.bin | less

clean:
	rm -f $(OBJS) kernel.bin

