//
// DPI-C helper for rtl/tracer.sv.
//
// SystemVerilog DPI-C only requires simple scalar types to be supported by
// every simulator; struct-typed arguments (like the C library's own
// gettimeofday(struct timeval *, ...)) are not universally supported
// (e.g. Verilator rejects them). This wrapper re-exposes gettimeofday()
// through two plain 64-bit outputs instead.
//
#include <sys/time.h>

#ifdef __cplusplus
extern "C" {
#endif

void besm6_gettimeofday(long long *sec, long long *usec)
{
    struct timeval tv;

    gettimeofday(&tv, 0);
    *sec  = (long long) tv.tv_sec;
    *usec = (long long) tv.tv_usec;
}

#ifdef __cplusplus
}
#endif
