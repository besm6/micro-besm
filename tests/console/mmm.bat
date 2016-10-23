MASM %1.asm;
386link %1.obj -HEX %1.HEX
COPY %1.HEX \ST240
exit
