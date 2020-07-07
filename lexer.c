/* Last revised 10:20 PM 25-Sep 2016 */

#include <stdio.h>
#include "lexer.h"

char *str_token[] = {"",
		     /* RESVWORD */
		     "break", "char", "continue", "do", "else", "for",
		     "goto", "if", "int", "long", "return", "short",
		     "signed", "unsigned", "void", "while",
		     /* ID */
		     "",
		     /* NUMBER */
		     "",
		     /* STRING */
		     "",
		     /* PAREN */
		     "(", ")",
		     /* BRACKET */
		     "[", "]",
		     /* BRACE */
		     "{", "}",
		     /* STMTSEP */
		     ";",
		     /* INCDEC */
		     "++", "--",
		     /* LOGNEG */
		     "!",
		     /* BITWISENEG */
		     "~",
		     /* MULOP */
		     "*", "/", "%",
		     /* ADDOP */
		     "+", "-",
		     /* SHIFTOP */
		     "<<", ">>",
		     /* RELOP */
		     "<", "<=", ">", ">=",
		     /* EQUALOP */
		     "==", "!=",
		     /* BITWISEOP */
		     "|", "^", "&",
		     /* LOGICALOP */
		     "||", "&&",
		     /* CONDITIONAL */
		     "?", ":",
		     /* ASSIGNOP */
		     "=", "+=", "-=", "*=", "/=", "%=", "<<=", ">>=", "&=",
		     "^=", "|=",
		     /* SEQUENTIALOP */
		     ","};

long int yylval;

int main(int argc, char *argv[]) {
  int token;

  while(1) {
    token = yylex();
    if(token == 0) {
      /* yylex returns 0 when end-of-file has been reached */
      break;
    }
    switch(token) {
    case ID:
      printf("main: case ID: ");
      if(yylval == (long int)NULL) {
	printf("***Out of memory***\n");
      } else {
	printf("%s\n", (char *)yylval);
      }
#ifdef DEBUG
      printf("main: yylval == 0x%8lx -> \"%s\"\n", yylval, (char *)yylval);
#endif
      break;
    case NUMBER:
      printf("main: case NUMBER: %ld\n", yylval);
      break;
    case STRING:
      printf("main: case STRING: ");
      if(yylval == (long int)NULL) {
	printf("***Out of memory***\n");
      } else {
	printf("%s\n", (char *)yylval);
      }
#ifdef DEBUG
      printf("main: yylval == 0x%8lx -> \"%s\"\n", yylval, (char *)yylval);
#endif
      break;
    default:
      printf("main: case default: %s\n", str_token[token]);
      break;
    }
  }
  return 0;
}

int yywrap(void) {
  return 1;
}
