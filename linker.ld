/* The bootloader will look at this image and start execution at the symbol
   designated as the entry point. */
ENTRY(_start)

/* Tell where the various sections of the object files will be put in the final
   kernel image. */
SECTIONS
{
    /* It should be at the same address as the physical memory offset in Rust code */
    . = 0xffffffff80000000;
    KERNEL_START = .;

    .text ALIGN(4K) : AT (ADDR(.text) - 0xffff800000000000)
    {
        *(.text .text.*)
    }

    .rodata ALIGN(4K) : AT (ADDR(.rodata) - 0xffff800000000000)
    {
        *(.rodata .rodata.*)
    }

    .data ALIGN(4K) : AT (ADDR(.data) - 0xffff800000000000)
    {
        *(.data .data.*)
    }

    .bss ALIGN(4K) : AT (ADDR(.bss) - 0xffff800000000000)
    {
        *(COMMON)
        *(.bss .bss.*)
    }

    KERNEL_END = .;
}
