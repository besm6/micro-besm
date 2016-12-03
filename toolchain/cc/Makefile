
SHELL   = /bin/sh
DESTDIR = /usr/local
CFLAGS  =
CC      = /bin/cc
cc      = cc
cc2     = cc2

all:    $(cc)

$(cc):  cc.c
	$(CC) $(LDFLAGS) $(CFLAGS) -DONEPASS cc.c -o $(cc)

$(cc2): cc.c
	$(CC) $(LDFLAGS) $(CFLAGS) -DTWOPASS cc.c -o $(cc2)

install: $(DESTDIR)/bin/$(cc)

clean:
	rm -f *.o *.b a.out core $(cc) $(cc2)

$(DESTDIR)/bin/$(cc): $(cc)
	cp $(cc) $(DESTDIR)/bin/$(cc)
	strip $(DESTDIR)/bin/$(cc)

$(DESTDIR)/bin/$(cc2): $(cc2)
	cp $(cc2) $(DESTDIR)/bin/$(cc2)
	strip $(DESTDIR)/bin/$(cc2)
