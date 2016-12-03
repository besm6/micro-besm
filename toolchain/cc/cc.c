
#include <stdio.h>
#include <signal.h>

#define CCOM    "ccom"
#define CPP     "cpp"
#define AS      "as"
#define LD      "ld"
#define M4      "m4"
#define MCRT    "/usr/local/lib/mkb-mcrt0.o"

#define MAXARGC 512
#define MAXNAMLEN 32

char *cpp   = "/usr/bin/cpp";
char *m4    = "/usr/bin/m4";
char *ccom  = "/usr/local/bin/mkb-ccom";
char *as    = "/usr/local/bin/mkb-as";
char *ld    = "/usr/local/bin/mkb-ld";
char *crt0  = "/usr/local/lib/mkb-crt0.o";

char tmpi[] = "/tmp/cciXXXXXX";
char tmps[] = "/tmp/ccsXXXXXX";

char *outfile;
char *av [MAXARGC], *clist [MAXARGC], *llist [MAXARGC], *plist [MAXARGC];
int cflag, errflag, Pflag, Sflag, Eflag, pflag, gflag, aflag, Oflag;
int xflag, Xflag, mflag, vflag, Mflag, Aflag, Lflag;
int nc, nl, np, nxo, na;

main(argc, argv)
char **argv;
{
    char *t;
    char *assource;
    int i, j, c;

    /* ld currently adds upto 5 args; 10 is room to spare */

    if (argc > MAXARGC-10) {
        error("too many arguments");
        exit(1);
    }
    for (i=1; i<argc; i++) {
        if (*argv[i] == '-')
            switch (argv[i][1]) {
            case 'L':       /* enable inline functions */
                Lflag++;
                continue;
            case 'A':       /* skip ccom, preprocess & assemble only */
                Aflag++;
                continue;
            case 'M':       /* generate dependency list to stdout */
                Mflag++;
                cflag++;
                continue;
            case 'v':       /* print passes */
                vflag++;
                continue;
            case 'm':       /* m4 rather than cpp */
                mflag++;
                continue;
            case 'a':       /* no preprocessor */
                aflag++;
                continue;
            case 'x':       /* pass to as */
                xflag++;
                continue;
            case 'X':       /* pass to as */
                Xflag++;
                continue;
            case 'S':       /* compile to assembler only */
                Sflag++;
                cflag++;
                continue;
            case 'O':       /* optimize */
                Oflag++;
                continue;
            case 'o':       /* output file name */
                if (++i < argc) {
                    outfile = argv[i];
                    switch (getsuf(outfile)) {
                    case 'c':
                    case 'o':
                        error("-o would overwrite %s", outfile);
                        exit(1);
                    }
                }
                continue;
            case 'p':       /* profile */
                pflag++;
                crt0 = MCRT;
                continue;
            case 'g':       /* save debugger info */
                gflag++;
                continue;
            case 'E':       /* preprocess to stdout */
                Eflag++;
            case 'P':       /* preprocess to .i */
                Pflag++;
                plist[np++] = argv[i];
            case 'c':       /* compile to object */
                cflag++;
                continue;
            case 'D':       /* cpp flags */
            case 'I':
            case 'U':
            case 'C':
                plist[np++] = argv[i];
                continue;
            }
        }
        t = argv[i];
        c = getsuf(t);
        if (c == 'c' || c == 's' || Eflag || Mflag) {
            clist[nc++] = t;
            t = setsuf(t, 'o');
        }
        if (nodup(llist, t)) {
            llist[nl++] = t;
            if (getsuf(t) == 'o')
                nxo++;
        }
    }
    if (!nc)
        goto load;
    if (Aflag && (Pflag || Eflag || Mflag)) {
        if (Pflag)
            error("flags -A and -P incompatible");
        if (Eflag)
            error("flags -A and -E incompatible");
        if (Mflag)
            error("flags -A and -M incompatible");
        exit(1);
    }
    if (aflag && (Pflag || Eflag || Mflag)) {
        if (Pflag)
            error("flags -a and -P incompatible");
        if (Eflag)
            error("flags -a and -E incompatible");
        if (Mflag)
            error("flags -a and -M incompatible");
        exit(1);
    }
    if (signal(SIGINT, SIG_IGN) != SIG_IGN)
        signal(SIGINT, idexit);
    if (signal(SIGTERM, SIG_IGN) != SIG_IGN)
        signal(SIGTERM, idexit);
    mktemp(tmpi);
    mktemp(tmps);
    for (i=0; i<nc; i++) {
        if (nc > 1 && ! Mflag)
            printf("%s:\n", clist[i]);

        if (Sflag)
            tmps = setsuf(clist[i], 's');

        if (getsuf(clist[i]) == 's') {
            assource = clist[i];
            goto assemble;
        } else
            assource = tmps;

        if (Pflag)
            tmpi = setsuf(clist[i], 'i');
        else if (Aflag)
            tmpi = tmps;
        else if (aflag) {
            tmpi = clist[i];
            goto compile;
        }

        na = 0;
        if (mflag) {
            av [na++] = M4;
            if (! Eflag) {
                av [na++] = "-o";
                av [na++] = tmpi;
            }
            av [na++] = clist[i];
        } else {
            av [na++] = CPP;
            if (Mflag)
                av [na++] = "-M";
            av [na++] = clist[i];
            if (! Mflag)
                av [na++] = Eflag ? "-" : tmpi;
            for (j=0; j<np; j++)
                av [na++] = plist[j];
        }
        av [na++] = 0;
        if (callsys(mflag ? m4 : cpp, av)) {
            errflag++;
            cflag++;
        }

        if (Pflag || Eflag || Mflag)
            continue;

        if (Aflag)
            goto assemble;

compile:
        na = 0;
        av [na++] = CCOM;
        av [na++] = tmpi;
        av [na++] = tmps;
        if (pflag)
            av [na++] = "-Xp";
        if (gflag)
            av [na++] = "-l";
        if (Lflag)
            av [na++] = "-L";
        av [na] = 0;
        if (callsys(ccom, av)) {
            cflag++;
            errflag++;
            continue;
        }
        if (Sflag)
            continue;

assemble:
        if (!aflag && !Aflag)
            unlink(tmpi);
        na = 0;
        av [na++] = AS;
        av [na++] = xflag ? "-x" : "-X";
        av [na++] = "-o";
        av [na++] = setsuf(clist[i], 'o');
        av [na++] = assource;
        av [na] = 0;
        if (callsys(as, av)) {
            cflag++;
            errflag++;
            continue;
        }
    }

load:
    if (!cflag && nl) {
        na = 0;
        av [na++] = LD;
        av [na++] = xflag ? "-x" : "-X";
        av [na++] = crt0;
        if (outfile) {
            av [na++] = "-o";
            av [na++] = outfile;
        }
        i = 0;
        while (i < nl)
            av [na++] = llist[i++];
        if (pflag)
            av [na++] = "-lc_p";
        else
            av [na++] = "-lc";
        av [na++] = 0;
        if (callsys(ld, av))
            errflag++;

        if (nc==1 && nxo==1 && !errflag)
            unlink(setsuf(clist[0], 'o'));
    }
    dexit();
}

idexit()
{
    errflag++;
    dexit();
}

dexit()
{
    if (!Pflag) {
        if (!Sflag)
            unlink(tmps);
        if (!aflag)
            unlink(tmpi);
    }
    exit(errflag != 0);
}

/* VARARGS1 */

error(s, x)
char *s, *x;
{
    fprintf(stderr, "cc: ");
    fprintf(stderr, s, x);
    fprintf(stderr, "\n");
    cflag++;
    errflag++;
}

getsuf(as)
char as[];
{
    register int c;
    register char *s;
    register int t;

    s = as;
    c = 0;
    while (t = *s++)
        if (t == '/')
            c = 0;
        else
            c++;
    s -= 3;
    if (c<=MAXNAMLEN && c>2 && *s++ == '.')
        return *s;
    return 0;
}

char *setsuf(as, ch)
char *as;
{
    register char *s, *s1;

    s = s1 = savestr(as);
    while (*s)
        if (*s++ == '/')
            s1 = s;
    s[-1] = ch;
    return s1;
}

callsys(f, v)
char *f, **v;
{
    int t, status;

    if (vflag) {
        register char **p;

        for (p=v; *p; ++p)
            printf("%s ", *p);
        putchar('\n');
    }
    t = fork();
    if (t == -1) {
        error("cannot create process");
        return 1;
    }
    if (t == 0) {
        /* порожденный процесс */
        execv(f, v);
        error("cannot find %s", f);
        exit(1);
    }
    while (t != wait(&status));
    t = status & 0377;
    if (t) {
        if (t != SIGINT)
            error("fatal error in %s", f);
        dexit();
    }
    return (status >> 8) & 0377;
}

nodup(l, os)
char **l, *os;
{
    register char *t, *s;
    register int c;

    s = os;
    if (getsuf(s) != 'o')
        return 1;
    while (t = *l++) {
        while (c = *s++)
            if (c != *t++)
                break;
        if (!*t && !c)
            return 0;
        s = os;
    }
    return 1;
}

char *savestr(cp)
register char *cp;
{
    register int len;
    register char *new;

    len = strlen(cp) + 1;
    new = malloc(len);
    if (!new) {
        error("out of memory");
        exit(1);
    }
    return strncpy(new, cp, len);
}
