# -*- encoding: utf-8 -*-
#
# Print a listing.
#

#
# Open .lst file for output
#
def listing_start(filename):
    global listing_file, need_header
    idx = filename.rfind("/")
    if idx >= 0:
        filename = filename[idx+1:]

    idx = filename.find(".")
    if idx < 0:
        basename = filename
    else:
        basename = filename[:idx]

    listing_file = open(basename+".lst", 'w')
    listing_file.write("======== " + basename + " ========\n\n")
    need_header = 1

#
# Print a label
#
def listing_label(name):
    global need_header
    listing_file.write(name+":\n")

#
# Finish a subroutine
#
def listing_hline():
    global need_header
    listing_file.write("--------\n")
    need_header = 1

def listing_header():
    global need_header
    if not need_header:
        return
    need_header = 0
    listing_file.write("--------sqi--addr-----map-alu-alud-func")
    listing_file.write("--alus-h-rb---ra---ci--shmux--stopc-mod")
    listing_file.write("-pshf-mnsa-modnm-dsrc---ydst---shf---arbi")
    listing_file.write("--rld-letc-sci-ici-icc-ise-cem")
    listing_file.write("-cen-csm-wem-ecb-wrb-bra-eca-wra")
    listing_file.write("-ara-ydev---wry-ddev---wrd-iomp-ffcnt")
    listing_file.write("--cond---mps\n")

sqi_name = {
     0: "JZ",   1: "CJS",   2: "JMAP",  3: "CJP",
     4: "PUSH", 5: "JSRP",  6: "CJV",   7: "JRP",
     8: "RFCT", 9: "RPCT",  10: "CRTN", 11: "CJPP",
    12: "LDCT", 13: "LOOP", 14: "CONT", 15: "TWB",
}
map_name = {
    0: "PE",    1: "ME",    2: "GRP",   3: "-",
}
alu_name = {
    0: "-",     1: "ALU",
}
alud_name = {
    0: "Q",     1: "-",     2: "BA",    3: "B",
    4: "RSBQ",  5: "RSB",   6: "LSBQ",  7: "LSB",
}
func_name = {
    0: "-",     1: "SUBR",  2: "SUBS",  3: "OR",
    4: "AND",   5: "NOTRS", 6: "EXOR",  7: "EXNOR",
}
alus_name = {
    0: "-",     1: "AB",    2: "ZQ",    3: "ZB",
    4: "ZA",    5: "DA",    6: "DQ",    7: "DZ",
}
h_name = {
    0: "-",     1: "H",
}
ra_name = {
    0: "A",     1: "Y",     2: "INTR",  3: "PC",
    4: "PCCP",  5: "DADR",  6: "HALF",  7: "BYTE",
    8: "EXPN",  9: "MANT",  10: "-",    11: "WR5",
    12: "WR4",  13: "WR3",  14: "WR2",  15: "WR1",
}
ci_name = {
    0: "-",     1: "CI1",   2: "CIX",   3: "CIC",
}
shmux_name = {
    0: "-",     1: "NSNSL", 2: "ASLLS", 3: "NDNS",
    4: "CDLDL", 5: "ADNDL", 6: "LDLD",  7: "LDLND",
    8: "RSLRSL",9: "RSSRSS",10: "RSRS", 11: "IDCS",
    12:"RDSRDS",13:"RDLRDL",14: "VDCD", 15: "RDRD",
}
stopc_name = {
    0: "YTOM",  1: "SETM",  2: "MCN",   3: "CLRN",
                5: "INVM",              7: "OPC7",
    8: "CLRNZ", 9: "SETNZ", 10:"CLRNC", 11:"SETNC",
    12:"CLRNN", 13:"SETNN", 14:"CLRNV", 15:"SETNV",
                            18:"OPC18", 19:"OPC19",
    20:"-",     21:"/NZ",   22:"NV",    23:"/NV",
                            26:"NC",    27:"/NC",
                            30:"NN",    31:"/NN",
    32:"OPC32", 33:"OPC33", 34:"OPC34",
    36:"MZ",    37:"/MZ",   38:"MV",    39:"/MV",
                            42:"MC",    43:"/MC",
                            46:"MN",    47:"/MN",
    52:"IZ",    53:"/IZ",   54:"IV",    55:"/IV",
                            58:"IC",    59:"/IC",
                            62:"IN",    63:"/IN",
}
mod_name = {
    0: "-",     1: "MOD",
}
mnsa_name = {
    0: "U",     1: "IRA",   2: "-",     3: "MP",
}
modnm_name = {
    0: "-",     1: "PROCN", 2: "SVFA",  3: "PCCC",
    4: "PCC",   5: "YCR",   6: "YCL",   7: "ACR",
    8: "ACL",   9: "CTR",   10:"CTL",   11:"CTT",
    12:"SPRAD", 13:"RRR",   14:"RR",    15:"C",
    16:"SP",    17:"M14",   18:"M13",   19:"M12",
    20:"M11",   21:"M10",   22:"M9",    23:"M8",
    24:"M7",    25:"M6",    26:"M5",    27:"M4",
    28:"M3",    29:"M2",    30:"M1",    31:"M0",
}
dsrc_name = {
    0: "-",     1: "MODGN", 2: "PROCN", 3: "CNT",
    4: "PHYSPG",5: "ARBOPC",6: "MULRZ1",7: "MULRZ2",
    8: "COMA",  9: "SHIFT", 10: "OPC",  11: "LOS",
    12: "PROM",             14: "RT",   15: "WT",
}
ydst_name = {
    0: "-",     1: "MODGN", 2: "PROCN", 3: "CNT",
    4: "PHYSPG",5: "ARBOPC",6: "MUL1",  7: "MUL2",
    8: "ADRREG",9: "PSHIFT",10:"CCLR",  11:"BTRCLR",
}
shf_name = {
    0: "-",     1: "LOG",   2: "ARIPH", 3: "EMULF",
}
arbi_name = {
    0: "-",     1: "CCRD",  2: "CCWR",  3: "DCRD",
    4: "DCWR",
    8: "FETCH", 9: "DRD",   10:"DWR",   11:"RDMWR",
    12:"BTRWR", 13:"BTRRD", 14:"BICLR", 15:"BIRD",
}
rld_name = {
    0: "-",     1: "RLD",
}
letc_name = {
    0: "-",     1: "LETC",
}
sci_name = {
    0: "-",     1: "SCI",
}
ici_name = {
    0: "-",     1: "ICI",
}
icc_name = {
    0: "-",     1: "ICC",
}
ise_name = {
    0: "-",     1: "ISE",
}
cem_name = {
    0: "-",     1: "CEM",
}
cen_name = {
    0: "-",     1: "CEN",
}
csm_name = {
    0: "-",     1: "CSM",
}
wem_name = {
    0: "-",     1: "WEM",
}
ecb_name = {
    0: "-",     1: "ECB",
}
wrb_name = {
    0: "-",     1: "WRB",
}
bra_name = {
    0: "RG0",   1: "RG1",   2: "RG2",   3: "-",
}
eca_name = {
    0: "-",     1: "ECA",
}
wra_name = {
    0: "-",     1: "WRA",
}
ydev_name = {
    0: "-",     1: "ECBTAG",2: "PHYSAD",3: "RADRR",
    4: "PSMEM", 5: "MPMEM", 6: "STOPM0",7: "STOPM1",
}
wry_name = {
    0: "-",     1: "WRY",
}
ddev_name = {
    0: "-",     1: "BB",    2: "MODB",  3: "CLRCD",
    4: "CTIME", 5: "STATUS",6: "PPMEM0",7: "PPMEM1",
}
wrd_name = {
    0: "-",     1: "WRD",
}
iomp_name = {
    0: "-",     1: "IOMP",
}
ffcnt_name = {
    0: "-",     1: "LOGGRP",2: "MULGRP",3: "ADDGRP",
                5: "SETC",  6: "CLRRCB",7: "SETRCB",
    8: "CLRJMP",9: "SETJMP",10:"SETEI", 11:"CLREI",
    12:"CLRTR0",13:"SETTR0",14:"CLRTR1",15:"SETTR1",
    16:"CLRCT", 17:"CLRCTT",18:"CLRTKK",19:"SETTKK",
    20:"SETNR", 21:"STRTLD",22:"SETER", 23:"CHTKK",
    24:"SETHLT",25:"CLRINT",26:"CLRRUN",27:"RDMPCP",
    28:"LDMPCP",29:"LDCPMP",30:"PRGINT",31:"EXTINT",
}
mpadr_name = {
    0: "INFB1", 1: "INFB2", 2: "FCP",   3: "FMP",
    4: "ADRB1", 5: "ADRB2", 6: "ADRB3", 7: "ADRB4",
    8: "DATAB1",9: "DATAB2",10:"DATAB3",11:"DATAB4",
    12:"DATAB5",13:"DATAB6",14:"DATAB7",15:"DATAB8",
}
cond_name = {
    0: "-",     1: "NORMB", 2: "RNDB",  3: "OVRIB",
    4: "BNB",   5: "OVRFTB",6: "DRG",   7: "EMLRG",
    8: "RCB",   9: "CB",    10:"CEMLRG",11:"CT",
    12:"TR1",   13:"INTSTP",14:"IR15",  15:"TKKB",
    16:"RUN",   17:"NMLRDY",            19:"INT",
    20:"FULMEM",21:"ARBRDY",22:"TR0",   23:"CPMP",
}
mps_name = {
    0: "-",     1: "MPS",
}

#
# Print opcode
#
def listing_opcode(opcode, ref):
    sqi   = (opcode >> 108) & 0xf
    a     = (opcode >> 96) & 0xfff
    map   = (opcode >> 94) & 0x3
    alu   = (opcode >> 93) & 0x1
    alud  = (opcode >> 90) & 0x7
    func  = (opcode >> 87) & 0x7
    alus  = (opcode >> 84) & 0x7
    h     = (opcode >> 83) & 0x1
    rb    = (opcode >> 79) & 0xf
    ra    = (opcode >> 75) & 0xf
    ci    = (opcode >> 73) & 0x3
    shmux = (opcode >> 69) & 0xf
    stopc = (opcode >> 63) & 0x3f
    mod   = (opcode >> 62) & 0x1
    pshf  = (opcode >> 55) & 0x7f
    mnsa  = (opcode >> 60) & 0x3
    modnm = (opcode >> 55) & 0x1f
    dsrc  = (opcode >> 51) & 0xf
    ydst  = (opcode >> 47) & 0xf
    shf   = (opcode >> 45) & 0x3
    arbi  = (opcode >> 41) & 0xf
    rld   = (opcode >> 40) & 0x1
    letc  = (opcode >> 39) & 0x1
    cystr = (opcode >> 36) & 0x7 # unused
    sci   = (opcode >> 35) & 0x1
    ici   = (opcode >> 34) & 0x1
    icc   = (opcode >> 33) & 0x1
    ise   = (opcode >> 32) & 0x1
    cem   = (opcode >> 31) & 0x1
    cen   = (opcode >> 30) & 0x1
    csm   = (opcode >> 29) & 0x1
    wem   = (opcode >> 28) & 0x1
    ecb   = (opcode >> 27) & 0x1
    wrb   = (opcode >> 26) & 0x1
    bra   = (opcode >> 24) & 0x3
    eca   = (opcode >> 23) & 0x1
    wra   = (opcode >> 22) & 0x1
    ara   = (opcode >> 20) & 0x3
    ydev  = (opcode >> 17) & 0x7
    wry   = (opcode >> 16) & 0x1
    ddev  = (opcode >> 13) & 0x7
    wrd   = (opcode >> 12) & 0x1
    iomp  = (opcode >> 11) & 0x1
    ffcnt = (opcode >> 6) & 0x1f
    mpadr = (opcode >> 6) & 0xf
    cond  = (opcode >> 1) & 0x1f
    mps   = (opcode >> 0) & 0x1

    listing_header()
    listing_file.write("        %-4s" % sqi_name[sqi])

    if ref:      listing_file.write(" %-8s" % ref)
    elif a != 0: listing_file.write(" %-8d" % a)
    else:        listing_file.write(" %-8s" % "-")

    listing_file.write(" %-3s" % map_name[map])
    listing_file.write(" %-3s" % alu_name[alu])
    listing_file.write(" %-4s" % alud_name[alud])
    listing_file.write(" %-5s" % func_name[func])
    listing_file.write(" %-4s" % alus_name[alus])
    listing_file.write(" %-1s" % h_name[h])
    listing_file.write(" %-4s" % ra_name[rb])
    listing_file.write(" %-4s" % ra_name[ra])
    listing_file.write(" %-3s" % ci_name[ci])
    listing_file.write(" %-6s" % shmux_name[shmux])
    listing_file.write(" %-5s" % stopc_name[stopc])
    listing_file.write(" %-3s" % mod_name[mod])
    if pshf == 64: listing_file.write(" -   ")
    else:          listing_file.write(" %-4d" % (pshf - 64))
    listing_file.write(" %-4s" % mnsa_name[mnsa])
    listing_file.write(" %-5s" % modnm_name[modnm])
    listing_file.write(" %-6s" % dsrc_name[dsrc])
    listing_file.write(" %-6s" % ydst_name[ydst])
    listing_file.write(" %-5s" % shf_name[shf])
    listing_file.write(" %-5s" % arbi_name[arbi])
    listing_file.write(" %-3s" % rld_name[rld])
    listing_file.write(" %-4s" % letc_name[letc])
    listing_file.write(" %-3s" % sci_name[sci])
    listing_file.write(" %-3s" % ici_name[ici])
    listing_file.write(" %-3s" % icc_name[icc])
    listing_file.write(" %-3s" % ise_name[ise])
    listing_file.write(" %-3s" % cem_name[cem])
    listing_file.write(" %-3s" % cen_name[cen])
    listing_file.write(" %-3s" % csm_name[csm])
    listing_file.write(" %-3s" % wem_name[wem])
    listing_file.write(" %-3s" % ecb_name[ecb])
    listing_file.write(" %-3s" % wrb_name[wrb])
    listing_file.write(" %-3s" % bra_name[bra])
    listing_file.write(" %-3s" % eca_name[eca])
    listing_file.write(" %-3s" % wra_name[wra])
    listing_file.write(" %-3s" % bra_name[ara])
    listing_file.write(" %-6s" % ydev_name[ydev])
    listing_file.write(" %-3s" % wry_name[wry])
    listing_file.write(" %-6s" % ddev_name[ddev])
    listing_file.write(" %-3s" % wrd_name[wrd])
    listing_file.write(" %-4s" % iomp_name[iomp])
    if not iomp: listing_file.write(" %-6s" % ffcnt_name[ffcnt])
    else:        listing_file.write(" %-6s" % mpadr_name[mpadr])
    listing_file.write(" %-6s" % cond_name[cond])
    listing_file.write(" %s"   % mps_name[mps])
    listing_file.write("\n")
