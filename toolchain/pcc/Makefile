#
# Build a C cross-compiler for micro-BESM
#
DESTDIR = /usr/local
M       = ../mip
P       = ../pcc
C       = $(CFLAGS) -I$(M) -I$(P) -DFLEXNAMES
CFLAGS  = -O

all:    ccom

ccom:   cgram.o xdefs.o scan.o pftn.o trees.o optim.o code.o local.o reader.o\
		local2.o order.o match.o allo.o comm1.o table.o messages.o
	$(CC) $(LDFLAGS) -o ccom cgram.o xdefs.o scan.o pftn.o trees.o\
		optim.o code.o local.o reader.o local2.o order.o match.o\
		allo.o comm1.o table.o messages.o

trees.o: $(M)/manifest $(P)/macdefs $(M)/mfile1 $(M)/trees.c
	$(CC) -c $(C) $(M)/trees.c

optim.o: $(M)/manifest $(P)/macdefs $(M)/mfile1 $(M)/optim.c
	$(CC) -c $(C) $(M)/optim.c

pftn.o: $(M)/manifest $(P)/macdefs $(M)/mfile1 $(M)/pftn.c
	$(CC) -c $(C) $(M)/pftn.c

code.o: $(M)/manifest $(P)/macdefs $(M)/mfile1 $(P)/code.c
	$(CC) -c $(C) $(P)/code.c

local.o: $(M)/manifest $(P)/macdefs $(M)/mfile1 $(P)/local.c
	$(CC) -c $(C) $(P)/local.c

scan.o: $(M)/manifest $(P)/macdefs $(M)/mfile1 $(M)/scan.c
	$(CC) -c $(C) $(M)/scan.c

tcopy.o: $(M)/manifest $(P)/macdefs $(M)/mfile1 $(M)/tcopy.c
	$(CC) -c $(C) $(M)/tcopy.c

xdefs.o: $(M)/manifest $(M)/mfile1 $(P)/macdefs $(M)/xdefs.c
	$(CC) -c $(C) $(M)/xdefs.c

cgram.o: $(M)/manifest $(M)/mfile1 $(P)/macdefs cgram.c
	$(CC) -c $(C) cgram.c

cgram.c: $(M)/cgram.y
	yacc $(M)/cgram.y
	mv y.tab.c cgram.c

comm1.o: $(M)/manifest $(M)/mfile1 $(M)/common $(P)/macdefs $(M)/comm1.c
	$(CC) -c $(C) $(M)/comm1.c

comm2.o: $(M)/manifest $(M)/mfile2 $(M)/common $(P)/macdefs $(P)/mac2defs $(M)/comm2.c
	$(CC) -c $(C) $(M)/comm2.c

table.o: $(M)/manifest $(M)/mfile2 $(P)/mac2defs $(P)/macdefs $(P)/table.c
	$(CC) -c $(C) $(P)/table.c

reader.o: $(M)/manifest $(M)/mfile2 $(P)/mac2defs $(P)/macdefs $(M)/reader.c
	$(CC) -c $(C) $(M)/reader.c

local2.o: $(M)/manifest $(M)/mfile2 $(P)/mac2defs $(P)/macdefs $(P)/local2.c
	$(CC) -c $(C) $(P)/local2.c

order.o: $(M)/manifest $(M)/mfile2 $(P)/mac2defs $(P)/macdefs $(P)/order.c
	$(CC) -c $(C) $(P)/order.c

match.o: $(M)/manifest $(M)/mfile2 $(P)/mac2defs $(P)/macdefs $(M)/match.c
	$(CC) -c $(C) $(M)/match.c

allo.o: $(M)/manifest $(M)/mfile2 $(P)/mac2defs $(P)/macdefs $(M)/allo.c
	$(CC) -c $(C) $(M)/allo.c

messages.o: $(M)/messages.h $(M)/messages.c
	$(CC) -c $(C) $(M)/messages.c

install: $(DESTDIR)/bin/mkb-ccom

$(DESTDIR)/bin/mkb-ccom: ccom
	install -s ccom $(DESTDIR)/bin/mkb-ccom

clean:
	rm -f *.o *.b a.out core ccom cgram.c
