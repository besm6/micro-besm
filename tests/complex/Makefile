DISPAK          = dispak --input-encoding=utf8

all:            test.hex

clean:
		rm -f *.lst

test.hex:
		$(MAKE) assembler.lst
		$(MAKE) loader.lst
		$(MAKE) test.lst
		$(MAKE) hexdump.lst
		./listing-to-hex.py hexdump.lst > $@

assembler.lst:  assembler.b6
		$(DISPAK) $< > $@

loader.lst:     loader.b6
		$(DISPAK) $< > $@

test.lst:       test.b6
		$(DISPAK) $< > $@

hexdump.lst:    hexdump.b6
		$(DISPAK) $< > $@
