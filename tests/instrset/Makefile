DISPAK          = dispak --input-encoding=utf8

all:            assembler.txt loader.txt test.txt hexdump.txt

assembler.txt:  assembler.b6
		$(DISPAK) $< > $@

loader.txt:     loader.b6
		$(DISPAK) $< > $@

test.txt:       test.b6
		$(DISPAK) $< > $@
#		$(DISPAK) -t $< > $@ 2>&1

hexdump.txt:    hexdump.b6
		$(DISPAK) $< > $@
