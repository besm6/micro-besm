CFLAGS          = -O -g -Wall

all:            test_2904.sv

clean:
		rm -f gen-test-vectors

test_2904.sv:   test_vectors.bits
		$(MAKE) gen-test-vectors
		./gen-test-vectors test_vectors.bits $@

gen-test-vectors: gen-test-vectors.c
		$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
