/* Kernel entrypoint: _start i boot.s */
ENTRY(_start)

SECTIONS {
  /* Placera kernel vid 1 MB */
  . = 1M;

  /* Kodsektion */
  .text : {
    *(.text*)
  }

  /* Initierade globala variabler */
  .data : {
    *(.data*)
  }

  /* Oinitierade globala variabler + stack */
  .bss : {
    *(.bss*)
    *(COMMON)
  }
}
