/* Last revised 10:19 PM 25-Sep 2016 */

extern long int yylval;
/* extern unsigned char yytext[]; */
extern int yylex();

enum tokens {
  /* kinds of RESVWORDs */
             RW_BREAK = 1, RW_CHAR, RW_CONTINUE, RW_DO, RW_ELSE, RW_FOR,
	     RW_GOTO, RW_IF, RW_INT, RW_LONG, RW_RETURN, RW_SHORT, RW_SIGNED,
	     RW_UNSIGNED, RW_VOID, RW_WHILE,
  /* kinds of IDs */
	     ID,
  /* kinds of NUMBERs */
	     NUMBER,
  /* kinds of STRINGs */
	     STRING,
  /* kinds of PARENs */
	     PAREN_LEFT, PAREN_RIGHT,
  /* kinds of BRACKETs */
	     BRACKET_LEFT, BRACKET_RIGHT,
  /* kinds of BRACEs */
	     BRACE_LEFT, BRACE_RIGHT,
  /* kinds of STMTSEPs */
	     STMTSEP_SEMICOLON,
  /* kinds of INCDECs */
	     INCDEC_INCREMENT, INCDEC_DECREMENT,
  /* kinds of LOGNEGs */
	     LOGNEG,
  /* kinds of BITWISENEGs */
	     BITWISENEG,
  /* kinds of MULOPs */
	     MULOP_MULTIPLY, MULOP_DIVIDE, MULOP_REMAINDER,
  /* kinds of ADDOPs */
	     ADDOP_ADDITION, ADDOP_SUBTRACTION,
  /* kinds of SHIFTOPs */
	     SHIFTOP_LEFT, SHIFTOP_RIGHT,
  /* kinds of RELOPs */
	     RELOP_LT, RELOP_LE, RELOP_GT, RELOP_GE,
  /* kinds of EQUALOPs */
	     EQUALOP_EQ, EQUALOP_NE,
  /* kinds of BITWISEOPs */
	     BITWISEOP_OR, BITWISEOP_XOR, BITWISEOP_AND,
  /* kinds of LOGICALOPs */
	     LOGICALOP_OR, LOGICALOP_AND,
  /* kinds of CONDITIONALs */
	     CONDITIONAL_QUEST, CONDITIONAL_COLON,
  /* kinds of ASSIGNOPs */
	     ASSIGNOP_SIMPLE, ASSIGNOP_ADDITION, ASSIGNOP_SUBTRACTION,
	     ASSIGNOP_MULTIPLICATION, ASSIGNOP_DIVISION, ASSIGNOP_REMAINDER,
	     ASSIGNOP_LEFTSHIFT, ASSIGNOP_RIGHTSHIFT, ASSIGNOP_BITWISEAND,
	     ASSIGNOP_BITWISEXOR, ASSIGNOP_BITWISEOR,
  /* kinds of SEQUENTIALOPs */
	     SEQUENTIALOP_COMMA};
