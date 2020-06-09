%{
	#include <stdio.h>
	int flag=0;
%}
%token NUMBER
%left '+''-'
%left '*''/''%'
%left '('')'

%%

AritmetikIfadeler: E {
	printf("\nSonuc=%d\n",$$);
	return 0;
};
E:	E'+'E {$$=$1+$3;}
	|E'-'E {$$=$1-$3;}
	|E'*'E {$$=$1*$3;}
	|E'/'E {$$=$1/$3;}
	|E'%'E {$$=$1%$3;}
	|'('E')' {$$=$2;}
	|NUMBER {$$=$1;}
;

%%

void main()
{
	printf("\nLutfen hesaplanması için bir ifade giriniz (+,-,/,*,%,() desteklenmektedir!): ");
	yyparse();
	if(flag==0)
		printf("Girilen ifade gecerlidir\n");
}
void yyerror()
{
	printf("\nGirilen ifade gecersizdir\n");
	flag=1;
}
start: Declaration;

Declaration: Type Assignment ';'
    | Assignment ';'
    ;

Assignment: TANIMLAYICI '=' Assignment
    | TANIMLAYICI ',' Assignment
    | SAYI ',' Assignment
    | TANIMLAYICI '+' Assignment
    | TANIMLAYICI '-' Assignment
    | TANIMLAYICI '*' Assignment
    | TANIMLAYICI '/' Assignment
    | SAYI '+' Assignment
    | SAYI '-' Assignment
    | SAYI '*' Assignment
    | SAYI '/' Assignment
    | '\'' Assignment '\''
    | '(' Assignment ')'
    | '-' '(' Assignment ')'
    | '-' SAYI
    | '-' TANIMLAYICI
    |   SAYI
    |   TANIMLAYICI
    ;

CompoundStmt:   '{' StmtList '}'
    ;

StmtList:   StmtList Stmt
    |
    ;

Stmt:   WhileStmt
    | Declaration
    | IfStmt
    | ';'
    ;

Type: INT
    | FLOAT
    | CHAR
    | DOUBLE
    ;

WhileStmt: WHILE '(' Expr ')' Stmt
    | WHILE '(' Expr ')' CompoundStmt
    ;

IfStmt: IF '(' Expr ')'
        Stmt
    ;

Expr:
    | Expr ESIT Expr
    | Expr BUYUK Expr
    | Expr KUCUK Expr
    | Expr VE Expr
    | Expr VEYA Expr
    | Assignment
    ;
	int 		return INT;
float 		return FLOAT;
while 		return WHILE;
if 			return IF;
else 		return ELSE;