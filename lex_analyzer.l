%{
#include <stdio.h>
%}

%option noyywrap

%%

\/\/[^\n]*              { printf("COMMENT"); }
[0-9]+\.[0-9]+          { printf("fnum "); }
[0-9]+                  { printf("inum "); }
f                      	{ printf("floatdcl "); }
i                      	{ printf("intdcl "); }
p                      	{ printf("print "); }
[a-zA-Z][a-zA-Z0-9]*    { printf("id "); }
\+                      { printf("plus "); }
\-                      { printf("minus "); }
\*                      { printf("times "); }
\/                      { printf("div "); }
=                       { printf("assign "); }
\n                      { printf("\n"); }
[ \t]+                  ;
.                       ;

%%

int main(int argc, char* argv[]) {
	if(argc > 1) {
		FILE *fp = fopen(argv[1], "r");
		if(fp) {
			yyin = fp;
		}
		else {
			perror(argv[1]);
			return 1;
		}
	}
	yylex();
	printf("\n");
	return 0;
}