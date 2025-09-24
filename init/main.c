/* main.c – minimal kernel i C */

void start_kernel(void) {
    const char *msg = "Hello from Wingman kernel!";
    char *vga = (char*)0xb8000;  // VGA text buffer (80x25)

    for (int i = 0; msg[i] != '\0'; i++) {
        vga[i*2] = msg[i];       // tecknet
        vga[i*2+1] = 0x07;       // färg (grå på svart)
    }

    for (;;) {
        __asm__ volatile("hlt"); // sov tills nästa avbrott (loopa för evigt)
    }
}

