
all:            initest.v

clean:
		rm -f *.json *.pyc *.lst *.out

define.json:    ../../../microcode/define.src
		../../../microcode/mcasm/mcdef.py $<

initest.v:      INI.json INOUT.json
		../../../microcode/mcasm/mclink.py -pINI INI.json INOUT.json
		mv microcode.out $@

INI.json:       ../initest.src define.json
		../../../microcode/mcasm/mcasm.py ../initest.src

INOUT.json:     ../iotest.src define.json
		../../../microcode/mcasm/mcasm.py ../iotest.src
