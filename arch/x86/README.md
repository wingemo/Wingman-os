0x00000000 ┌───────────────────────────────┐
           │ BIOS, IVT, VGA, MMIO etc.     │  (undvik att lägga kernel här)
0x000A0000 └───────────────────────────────┘
           │                               │
           │ (hålrum reserverat av BIOS)   │
           │                               │
0x00100000 ┌───────────────────────────────┐
           │ .text   (kod: boot.s + C)     │
           ├───────────────────────────────┤
           │ .data   (initierade globala)  │
           ├───────────────────────────────┤
           │ .bss    (nollade globala +    │
           │         stack)                │
           └───────────────────────────────┘
              (stacken växer nedåt i RAM)    
                           │                   
                           ↓                  
