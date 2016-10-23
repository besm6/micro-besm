/*
 * Generate Verilog sources for Am2904 test vectors.
 * Read "bits" format and create Verilog sources.
 */
#include <stdio.h>
#include <string.h>

#define NO_OF_PORTS             40
#define MAX_LINE_SIZE           256
#define MAX_BIT_VECTOR_SIZE     128

struct signal {
    char name[16];
    char port_type[8];
    char data_type[8];
};

int main(int argc, char **argv)
{
    FILE *infptr;
    FILE *outfptr;

    char *c;
    char *a;
    char *temp;

    char var[MAX_BIT_VECTOR_SIZE];
    char line[MAX_LINE_SIZE];

    int line_cnt;
    int initial_comment_lines;
    int field_cnt;
    int vec_cnt;
    int assert_cnt;
    int printed_vec_no;
    int instr_cnt;

    struct signal ports[NO_OF_PORTS];

    /* Check arguments */

    if (argc != 3) {
        fprintf(stderr,"Usage: %s <vectorfile> <vhdlfile>\n", argv[0]);
        fflush(stderr);
        return 1;
    }

    /* Open Files */

    infptr = fopen(argv[1], "r");
    outfptr = fopen(argv[2], "w");

    fprintf(outfptr, "module testbench();\n\n");

    fprintf(outfptr, "    // Input signals\n");
    fprintf(outfptr, "    logic        clk;\n");
    fprintf(outfptr, "    logic [63:0] word;\n");
    fprintf(outfptr, "    logic        pe;\n");
    fprintf(outfptr, "    logic        tkk;\n\n");

    fprintf(outfptr, "    // Output signals\n");
    fprintf(outfptr, "    logic  [3:0] ir;\n");
    fprintf(outfptr, "    logic  [7:0] op;\n");
    fprintf(outfptr, "    logic        extop;\n");
    fprintf(outfptr, "    logic [19:0] addr;\n\n");

    fprintf(outfptr, "    // Device under test\n");
    fprintf(outfptr, "    standardizer dut(clk, word, pe, tkk,\n");
    fprintf(outfptr, "        ir, op, extop, addr);\n\n");

    fprintf(outfptr, "    // Status\n");
    fprintf(outfptr, "    bit fail;\n\n");

    fprintf(outfptr, "initial begin\n");
    fprintf(outfptr, "$display(\"------------------------\");\n");
    fprintf(outfptr, "$dumpfile(\"test.vcd\");\n");
    fprintf(outfptr, "$dumpvars();\n");
    fprintf(outfptr, "fail = 0;\n");
    fprintf(outfptr, "clk = 0;\n\n");

    /* Initialize counters */

    line_cnt = 0;
    assert_cnt = 0;
    vec_cnt = 0;
    instr_cnt = 0;
    initial_comment_lines = 1;

    /* Start line-by-line processing */

    while ((c = fgets(line, sizeof(line), infptr)) != NULL) { /* while not EOF, get a line */

        /* Skip comments */
        if (line[0] == '\n' || line[0] == '#')
            continue;

        /* Process the initial comment lines */
        if (initial_comment_lines && line[0] == '*') {

            /* If the line is a comment line, print it verbatim */
            fprintf(outfptr, "// %s", line);
            continue;
        }
        initial_comment_lines = 0;

        if (line_cnt < 3) {

            /* Initialize port name(line0), port dir(line1), port type(line2) */

            field_cnt = 0;

            /* Start processing each item in the line, separated by ":" */

            while ((a = strchr(line, ':')) != NULL) { /*till you reach end of line*/

                /* copy next item into "var". Make "line" point to */
                /* the item after that.                            */

                temp = a;           /* copy pointer to next ":" */
                temp++;             /* take pointer to next location after ":" */
                *a = '\0';          /* write "end of string" in place of ":" */
                strcpy(var, line);  /* copy the portion before ":" into "var" */
                strcpy(line, temp); /* copy the portion after ":" into "line" */

                switch (line_cnt) {
                case 0:
                    strcpy(ports[field_cnt].name, var);         /* port names */
                    break;
                case 1:
                    strcpy(ports[field_cnt].port_type, var);    /* port dir */
                    break;
                case 2:
                    strcpy(ports[field_cnt].data_type, var);    /* port type */
                default:
                    break;
                }

                field_cnt++;
            }
        } else {

            /* Process the actual test vector lines */
            if (line[0] == '*') {

                /* If the line is a comment line, print it verbatim */
                fprintf(outfptr, "// %s", line);

            } else {
                fprintf(outfptr, "// %s", line);

                /* Reset the boolean variable to show that vec_no */
                /* has not yet been printed for this line         */

                printed_vec_no = 0;

                /* Print some initial statements for each test vector */
                fprintf(outfptr, "//------------------------\n\n");
                fprintf(outfptr, "#2;\n");

                instr_cnt++;
                field_cnt = 0;

                /* Start processing each item in the line, separated by ":" */
                /* Each item is a signal value (in or out) */

                a = line;
                while ((temp = strchr(a, ':')) != NULL) {

                    /* copy next item into "var". Make "temp" point to */
                    /* the item after that.                            */

                    *temp = '\0';   /* write "end of string" in place of : */
                    strcpy(var, a); /* copy the portion before : into "var" */
                    *temp = ':';    /* restore : */
                    a = temp+1;

                    if (strcmp(ports[field_cnt].port_type, "in") == 0) {
                        /* If its an input port */

                        if (var[0] != '-') {
                            /* If the item is NOT marked blank in this line */

                            fprintf(outfptr, "%s <= %s%s;\n",
                                ports[field_cnt].name,
                                ports[field_cnt].data_type[0] == 'h' ? "'h" : "",
                                var[0]=='Z' ? "'z" : var);
                        }
                    }

                    field_cnt++;
                }

                fprintf(outfptr, "#2;\n");
                fprintf(outfptr, "clk <= 1;\t\t// Cycle No: %i\n", instr_cnt);
                fprintf(outfptr, "#2;\n\n");

                field_cnt = 0;
                a = line;
                while ((temp = strchr(a, ':')) != NULL) {

                    /* copy next item into "var". Make "temp" point to */
                    /* the item after that.                            */

                    *temp = '\0';   /* write "end of string" in place of : */
                    strcpy(var, a); /* copy the portion before : into "var" */
                    *temp = ':';    /* restore : */
                    a = temp+1;

                    if (strcmp(ports[field_cnt].port_type, "out") == 0) {
                        /* If its an output port */

                        if (var[0] != '-') {
                            /* If the item is NOT marked blank in this line */

                            fprintf(outfptr, "assert (%s === %s%s) else begin fail = 1; $display(",
                                ports[field_cnt].name,
                                ports[field_cnt].data_type[0] == 'h' && var[0]!='Z' ? "'h" : "",
                                var[0]=='Z' ? "'z" : var);
                            fprintf(outfptr, "\"Error %i: %s 'h%%h !== %s%s\", %s); end",
                                assert_cnt, ports[field_cnt].name,
                                ports[field_cnt].data_type[0] == 'h' && var[0]!='Z' ? "'h" : "",
                                var[0]=='Z' ? "'z" : var, ports[field_cnt].name);

                            /* Vector Count is printed only when outputs are */
                            /* tested and that too only once for each vector */

                            if (printed_vec_no == 0) {
                                fprintf(outfptr, "\t// Vector No: %i", vec_cnt);
                                vec_cnt++;
                                printed_vec_no = 1;
                            }

                            fprintf(outfptr, "\n");
                            assert_cnt++;
                        }
                    }

                    field_cnt++;
                }

                /* Print ending statements for test vector */
                fprintf(outfptr, "#2;\n");
                fprintf(outfptr, "clk <= 0;\n\n");
            }
        }

        line_cnt++;
    }

    fprintf(outfptr, "#4;\n");
    fprintf(outfptr, "if (fail) begin\n");
    fprintf(outfptr, "    $display(\"Test FAIL\");\n");
    fprintf(outfptr, "    $display(\"------------------------\");\n");
    fprintf(outfptr, "    $finish(1);\n");
    fprintf(outfptr, "end\n");
    fprintf(outfptr, "$display(\"Test PASS\");\n");
    fprintf(outfptr, "$display(\"------------------------\");\n");
    fprintf(outfptr, "$finish;\n\n");

    fprintf(outfptr, "end\n\n");

    fprintf(outfptr, "endmodule\n");
    return 0;
}
