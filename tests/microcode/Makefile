MCASM           = ../../microcode/mcasm/mcasm.py
MCLINK          = ../../microcode/mcasm/mclink.py
MCDEF           = ../../microcode/mcasm/mcdef.py

all:            initest.v sectest.v octtest.v memtest.v

clean:
		rm -f *.json *.pyc *.lst *.out

define.json:    ../../microcode/define.src
		$(MCDEF) $<

initest.v:      INI.json INOUT.json
		$(MCLINK) -pINI INI.json INOUT.json
		mv microcode.out $@

sectest.v:      SEC.json INOUT.json
		$(MCLINK) -pSEC SEC.json INOUT.json
		mv microcode.out $@

octtest.v:      OCT.json INOUT.json
		$(MCLINK) -pOCT OCT.json INOUT.json
		mv microcode.out $@

memtest.v:      MEM.json INOUT.json
		$(MCLINK) -pMEM MEM.json INOUT.json
		mv microcode.out $@

INI.json:       initest.src define.json
		$(MCASM) initest.src

SEC.json:       sectest.src define.json
		$(MCASM) sectest.src

OCT.json:       octtest.src define.json
		$(MCASM) octtest.src

MEM.json:       memtest.src define.json
		$(MCASM) memtest.src

INOUT.json:     iotest.src define.json
		$(MCASM) iotest.src
