CFLAGS          = -O -g -Wall

all:            test_standardizer.sv

clean:
		rm -f gen-test

test_standardizer.sv: test_vectors.bits
		$(MAKE) gen-test
		./gen-test test_vectors.bits $@

gen-test:       gen-test.c
		$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
