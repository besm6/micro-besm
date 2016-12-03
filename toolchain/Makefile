#
# Cross-C compiler for micro-BESM
#
SUBDIR		= as ld #cc pcc lib
DESTDIR		= /usr/local

all:
		for i in ${SUBDIR}; do $(MAKE) DESTDIR=$(DESTDIR) -C $$i; done

install:
		for i in ${SUBDIR}; do $(MAKE) DESTDIR=$(DESTDIR) -C $$i install; done

clean:
		rm -f *~
		for i in ${SUBDIR}; do $(MAKE) -C $$i clean; done
