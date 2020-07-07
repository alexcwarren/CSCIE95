# Last revised: 5:59 PM 30-Jan-2018

all:	standalone parser recursiveDescentParser symbolTables

standalone:	lexer-standalone.lex lexer.c
		flex lexer-standalone.lex
			gcc lex.yy.c -c
				gcc -pedantic -Wall lex.yy.o lexer.c -lfl -o lexer

parser:	lexer.lex parser.y
		flex lexer.lex
			yacc parser.y
				gcc -pedantic -Wall y.tab.c -ly -lfl -o parser

recursive:	recursiveDescentParser

recursiveDescentParser:	recursiveDescentParser.c
		gcc -pedantic -Wall recursiveDescentParser.c -o recursiveDescentParser

symbol:	symbolTables

symbolTables:	symbolTables.c
		gcc -pedantic -Wall symbolTables.c -o symbolTables

clean:
		-rm -f lexer lex.yy.c lex.yy.o y.tab.c parser recursiveDescentParser symbolTables
