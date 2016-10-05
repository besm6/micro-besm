/*
 * Generate Verilog sources for Am2904 test vectors.
 * Read "bits" format and create Verilog sources.
 *
 * Based on VHDL version by Indraneel Ghosh.
 */
#include <stdio.h>
#include <string.h>

#define INITIAL_COMMENT_LINES 11
#define NO_OF_PORTS 22

#define NAME_LINE INITIAL_COMMENT_LINES
#define DIR_LINE INITIAL_COMMENT_LINES + 1
#define TYPE_LINE INITIAL_COMMENT_LINES + 2

struct signal {
    char name[10];
    char port_type[4];
    char data_type[3];
};

int main(int argc, char **argv)
{
    FILE *infptr;
    FILE *outfptr;

    char *c;
    char *a;
    char *temp;

    char var[10];
    char line[100];

    int line_cnt;
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
    fprintf(outfptr, "    logic [8:0] I;\n");
    fprintf(outfptr, "    logic [3:0] Aadd, Badd;\n");
    fprintf(outfptr, "    logic [3:0] D;\n");
    fprintf(outfptr, "    logic       RAM0, RAM3, Q0, Q3;\n");
    fprintf(outfptr, "    logic       clk, C0, OEbar;\n\n");

    fprintf(outfptr, "    // Output signals\n");
    fprintf(outfptr, "    logic [3:0] Y;\n");
    fprintf(outfptr, "    logic       RAM0out, RAM3out, Q0out, Q3out;\n");
    fprintf(outfptr, "    logic       C4, Gbar, Pbar, OVR, F3, F30;\n\n");

    fprintf(outfptr, "    // Device under test\n");
    fprintf(outfptr, "    am2904 dut (\n");
    fprintf(outfptr, "        I,\n");
    fprintf(outfptr, "        Aadd, Badd,\n");
    fprintf(outfptr, "        D,\n");
    fprintf(outfptr, "        Y,\n");
    fprintf(outfptr, "        RAM0, RAM3, Q0, Q3,\n");
    fprintf(outfptr, "        RAM0out, RAM3out, Q0out, Q3out,\n");
    fprintf(outfptr, "        clk, C0, OEbar,\n");
    fprintf(outfptr, "        C4, Gbar, Pbar, OVR, F3, F30\n");
    fprintf(outfptr, "    );\n\n");

    fprintf(outfptr, "    // Status\n");
    fprintf(outfptr, "    bit fail;\n\n");

    fprintf(outfptr, "    // Read value from the variable.\n");
    fprintf(outfptr, "    task verify(input check, input string message);\n");
    fprintf(outfptr, "        if (!check) begin\n");
    fprintf(outfptr, "            $display (\"%%s\", message);\n");
    fprintf(outfptr, "            fail = 1;\n");
    fprintf(outfptr, "        end\n");
    fprintf(outfptr, "    endtask\n\n");

    fprintf(outfptr, "initial begin\n");
    fprintf(outfptr, "$display(\"------------------------\");\n");
    fprintf(outfptr, "fail = 0;\n\n");

    /* Initialize counters */

    line_cnt = 0;
    assert_cnt = 0;
    vec_cnt = 0;
    instr_cnt = 0;

    /* Start line-by-line processing */

    while ((c = fgets(line, 100, infptr)) != NULL) { /* while not EOF, get a line */

        /* Ignore the first few comment lines */

        if (line_cnt < (INITIAL_COMMENT_LINES + 3) &&
            line_cnt >= INITIAL_COMMENT_LINES) {

            /* Initialize port name(line0), port dir(line1), port type(line2) */

            field_cnt = 0;

            /* Start processing each item in the line, separated by ":" */

            while ((a = strchr(line, ':')) != NULL) { /*till you reach end of line*/

                /* copy next item into "var". Make "line" point to */
                /* the item after that.                            */

                temp = a;          /* copy pointer to next ":" */
                temp++;            /* take pointer to next location after ":" */
                *a = '\0';         /* write "end of string" in place of ":" */
                strcpy(var,line);  /* copy the portion before ":" into "var" */
                strcpy(line,temp); /* copy the portion after ":" into "line" */

                switch (line_cnt) {
                case NAME_LINE:
                    strcpy(ports[field_cnt].name,var); /* port names */
                    break;
                case DIR_LINE:
                    strcpy(ports[field_cnt].port_type,var); /* port dir */
                    break;
                case TYPE_LINE:
                    strcpy(ports[field_cnt].data_type,var); /* port type */
                default:
                    break;
                }

                field_cnt++;
            }
        } else if (line_cnt >= (INITIAL_COMMENT_LINES + 3)) {

            /* Process the actual test vector lines */
            if (line[0] == '*') {

                /* If the line is a comment line, print it verbatim */
                fprintf(outfptr, "// %s", line);

            } else {

                /* Reset the boolean variable to show that vec_no */
                /* has not yet been printed for this line         */

                printed_vec_no = 0;

                /* Print some initial statements for each test vector */

                fprintf(outfptr, "//------------------------\n\n");
                fprintf(outfptr, "clk <= 1;\t\t// Cycle No: %i\n", instr_cnt);
                instr_cnt++;
                fprintf(outfptr, "#1;\n\n");

                field_cnt = 0;

                /* Start processing each item in the line, separated by ":" */
                /* Each item is a signal value (in or out) */

                while ((a = strchr(line, ':')) != NULL) {

                    /* copy next item into "var". Make "line" point to */
                    /* the item after that.                            */

                    temp = a;           /* copy pointer to next : */
                    temp++;             /* take pointer to next location after : */
                    *a = '\0';          /* write "end of string" in place of : */
                    strcpy(var, line);  /* copy the portion before : into "var" */
                    strcpy(line ,temp); /* copy the portion after : into "line") */

                    if (strcmp(ports[field_cnt].port_type,"in") == 0 ) {
                        /* If its an input port */

                        if (var[0] != '-') {
                            /* If the item is NOT marked blank in this line */

                            fprintf(outfptr, "%s <= %s%s;\n",
                                ports[field_cnt].name,
                                ports[field_cnt].data_type[0] == '"' ? "'b" : "",
                                var[0]=='Z' ? "'z" : var);
                        }

                        if (strcmp(ports[field_cnt+1].port_type,"out") == 0) {
                            /* If its the last input port in this line */

                            fprintf(outfptr, "#4;\n\n");
                            fprintf(outfptr, "clk <= 0;\n");
                            fprintf(outfptr, "#4;\n\n");
                        }
                    } else {
                        /* If its an output port */

                        if (var[0] != '-') {
                            /* If the item is NOT marked blank in this line */

                            fprintf(outfptr, "verify(%s === %s%s, ",
                                ports[field_cnt].name,
                                ports[field_cnt].data_type[0] == '"' && var[0]!='Z' ? "'b" : "",
                                var[0]=='Z' ? "'z" : var);
                            fprintf(outfptr, "\"Assert %i : < %s !== %s%s >\");",
                                assert_cnt, ports[field_cnt].name,
                                ports[field_cnt].data_type[0] == '"' && var[0]!='Z' ? "'b" : "",
                                var[0]=='Z' ? "'z" : var);

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
                fprintf(outfptr, "#1;\n\n");
            }
        }

        line_cnt++;
    }

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
