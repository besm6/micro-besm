include config.mak

#SRC             = whetstone.b6
SRC             = extracode.b6
DISPAK          = dispak --input-encoding=utf8

all:            test.hex

clean:
		rm -f *.lst

test.hex:       startup.hex b6-to-hex.py $(SRC)
		cat startup.hex > $@
		./b6-to-hex.py $(SRC) >> $@

startup.hex:    startup.asm $(MICROBESM_HOME)/tests/complex/hexdump.b6
		$(MAKE) assembler.lst
		$(MAKE) loader.lst
		$(DISPAK) startup.asm > startup.lst
		$(DISPAK) $(MICROBESM_HOME)/tests/complex/hexdump.b6 > hexdump.lst
		$(MICROBESM_HOME)/tests/complex/listing-to-hex.py hexdump.lst > $@

assembler.lst:  $(MICROBESM_HOME)/tests/complex/assembler.b6
		$(DISPAK) $< > $@

loader.lst:     $(MICROBESM_HOME)/tests/complex/loader.b6
		$(DISPAK) $< > $@
