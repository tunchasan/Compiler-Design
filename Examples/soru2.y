%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *fp;

%}

%token SPARANTEZ_AC SPARANTEZ_KAPA NOKTALI_VIRGUL PARANTEZ_AC PARANTEZ_KAPA VIRGUL KPARANTEZ_AC KPARANTEZ_KAPA YORUM ATAMA OP DEGIL
%token INT FLOAT
%token WHILE 
%token IF ELSE 
%token NUM ID
%token INCLUDE
%token DOT

%right '='
%left VE VEYA
%left '<' '>' ESIT KUCUK BUYUK
%%

start: Function 
	|  Declaration
	;

/* Declaration block */
Declaration: Type Assignment ';' 
	| Assignment ';'  	
	| FunctionCall ';' 	
	| ArrayUsage ';'	
	| Type ArrayUsage ';'   
	| error	
	;

/* Assignment block */
Assignment: ID '=' Assignment
	| ID '=' FunctionCall
	| ID '=' ArrayUsage
	| ArrayUsage '=' Assignment
	| ArrayUsage ',' Assignment
    | ArrayUsage '+' Assignment
    | ArrayUsage '-' Assignment
    | ArrayUsage '/' Assignment
    | ArrayUsage '*' Assignment
	| ID ',' Assignment
	| NUM ',' Assignment
	| ID '+' Assignment
	| ID '-' Assignment
	| ID '*' Assignment
	| ID '/' Assignment	
	| NUM '+' Assignment
	| NUM '-' Assignment
	| NUM '*' Assignment
	| NUM '/' Assignment
	| '\'' Assignment '\''	
	| '(' Assignment ')'
	| '-' '(' Assignment ')'
	| '-' NUM
	| '-' ID
    |   ArrayUsage
	|   NUM
	|   ID
	;

/* Function Call Block */
FunctionCall: ID'('')'
	| ID'('Assignment')'
	;

/* Array Usage */
ArrayUsage: ID'['Assignment']'
    | ID'['Assignment']''['Assignment']'
	;

/* Function block */
Function: Type ID '(' ArgListOpt ')' CompoundStmt 
	;
ArgListOpt: ArgList
	|
	;
ArgList:  ArgList ',' Arg
	| Arg
	;
Arg:	Type ID
	;
CompoundStmt:	'{' StmtList '}'
	;
StmtList:	StmtList Stmt
	|
	;
Stmt:WhileStmt
	| Declaration
	| IfStmt
	| ';'
	;

/* Type Identifier block */
Type: INT 
	| FLOAT
	;

/* Loop Blocks */ 
WhileStmt: WHILE '(' Expr ')' Stmt  
	| WHILE '(' Expr ')' CompoundStmt 
	;

/* IfStmt Block */
IfStmt: IF '(' Expr ')' 
	 	Stmt 
	;

/*Expression Block*/
Expr:	
	| Expr ESIT Expr
	| Expr BUYUK Expr
	| Expr KUCUK Expr
	| Assignment
	| ArrayUsage
    | '(' Expr ')'
    | '!''(' Expr ')'
	;
%%
#include"lex.yy.c"
#include<ctype.h>
int count=0;

int main(int argc, char *argv[])
{
	yyin = fopen(argv[1], "r");
	
   if(!yyparse())
		printf("\nParsing complete\n");
	else
		printf("\nParsing failed\n");
	
	fclose(yyin);
    return 0;
}
         
yyerror(char *s) {
	printf("%d : %s %s\n", yylineno, s, yytext );
}