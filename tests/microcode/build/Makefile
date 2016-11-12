
all:            initest.v sectest.v octtest.v

clean:
		rm -f *.json *.pyc *.lst *.out

define.json:    ../../../microcode/define.src
		../../../microcode/mcasm/mcdef.py $<

initest.v:      INI.json INOUT.json
		../../../microcode/mcasm/mclink.py -pINI INI.json INOUT.json
		mv microcode.out $@

sectest.v:      SEC.json INOUT.json
		../../../microcode/mcasm/mclink.py -pSEC SEC.json INOUT.json
		mv microcode.out $@

octtest.v:      OCT.json INOUT.json
		../../../microcode/mcasm/mclink.py -pOCT OCT.json INOUT.json
		mv microcode.out $@

INI.json:       ../initest.src define.json
		../../../microcode/mcasm/mcasm.py ../initest.src

SEC.json:       ../sectest.src define.json
		../../../microcode/mcasm/mcasm.py ../sectest.src

OCT.json:       ../octtest.src define.json
		../../../microcode/mcasm/mcasm.py ../octtest.src

INOUT.json:     ../iotest.src define.json
		../../../microcode/mcasm/mcasm.py ../iotest.src
