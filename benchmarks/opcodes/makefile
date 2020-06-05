
SREC_DIR  = /home/pdp/pdp/sim/ddr_content

MIPS_PRE  = mips-pdp-elf-
AS_MIPS   = $(MIPS_PRE)as
LD_MIPS   = $(MIPS_PRE)ld
DUMP_MIPS = $(MIPS_PRE)objdump
OBJCOPY   = $(MIPS_PRE)objcopy


AFLAGS = -O4 -march=r2000 -g

all: clean opcodes
	
clean:
	rm -f *.o *.obj *.map *.lst *.hex *.txt *.exe *.axf

opcodes: 
	$(AS_MIPS) $(AFLAGS) -o opcodes.o opcodes.asm
	$(LD_MIPS) -Ttext 0x10000000 -eentry -s -N -o opcodes.axf opcodes.o	
	-@$(DUMP_MIPS) --disassemble opcodes.axf > opcodes.lst
	$(OBJCOPY) -I elf32-big -S -g --strip-unneeded -R .reginfo -O srec opcodes.axf $(SREC_DIR)/opcodes.srec
	rm -f opcodes.axf opcodes.o
    

