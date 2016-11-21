MCASM           = mcasm/mcasm.py
MCLINK          = mcasm/mclink.py
MCDEF           = mcasm/mcdef.py
MCCONST         = mcasm/mcconst.py

OBJ             = ATX.json ADX.json IJP.json INIC.json ADU.json PSRWIO.json

all:            microcode.v constants.v

clean:
		rm -f *.json *.pyc *.lst

define.json:    $(MCDEF) define.src
		$(MCDEF) define.src

microcode.v:    $(MCLINK) loadcom2.src $(OBJ)
		$(MCLINK) loadcom2.src [%-Z]*.json

ATX.json:       $(MCASM) b6com.src define.json
		$(MCASM) b6com.src

ADX.json:       $(MCASM) fltcom.src define.json
		$(MCASM) fltcom.src

IJP.json:       $(MCASM) intexcom.src define.json
		$(MCASM) intexcom.src

INIC.json:      $(MCASM) melcom.src define.json
		$(MCASM) melcom.src

ADU.json:       $(MCASM) nrcom.src define.json
		$(MCASM) nrcom.src

PSRWIO.json:    $(MCASM) rwiocom.src define.json
		$(MCASM) rwiocom.src

constants.v:    $(MCCONST) define.json
		$(MCCONST)
