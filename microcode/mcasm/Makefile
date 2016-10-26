OBJ             = ATX.json ADX.json IJP.json INIC.json ADU.json PSRWIO.json

all:            microcode.out

clean:
		rm -f *.json *.pyc *.out

define.json:    mcdef.py ../define.src
		./mcdef.py ../define.src

microcode.out:  mclink.py ../loadcom2.src $(OBJ)
		./mclink.py ../loadcom2.src [%-Z]*.json

ATX.json:       mcasm.py ../b6com.src define.json
		./mcasm.py ../b6com.src

ADX.json:       mcasm.py ../fltcom.src define.json
		./mcasm.py ../fltcom.src

IJP.json:       mcasm.py ../intexcom.src define.json
		./mcasm.py ../intexcom.src

INIC.json:      mcasm.py ../melcom.src define.json
		./mcasm.py ../melcom.src

ADU.json:       mcasm.py ../nrcom.src define.json
		./mcasm.py ../nrcom.src

PSRWIO.json:    mcasm.py ../rwiocom.src define.json
		./mcasm.py ../rwiocom.src
