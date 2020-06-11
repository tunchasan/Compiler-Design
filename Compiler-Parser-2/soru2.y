%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *fp;
int flag = 0;

%}

%token INT FLOAT 
%token WHILE 
%token IF ELSE 
%token SAYI TANIMLAYICI
%token INCLUDE

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
Assignment: TANIMLAYICI '=' Assignment
	| TANIMLAYICI '=' FunctionCall
	| TANIMLAYICI '=' ArrayUsage
	| ArrayUsage '=' Assignment
	| ArrayUsage ',' Assignment
    | ArrayUsage '+' Assignment
    | ArrayUsage '-' Assignment
    | ArrayUsage '/' Assignment
    | ArrayUsage '*' Assignment
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
    |   ArrayUsage
	|   SAYI
	|   TANIMLAYICI
	;

FunctionCall: TANIMLAYICI'('')'
	| TANIMLAYICI'('Assignment')'
	;

ArrayUsage: TANIMLAYICI'['Assignment']'
    | TANIMLAYICI'['Assignment']''['Assignment']'
	;

Function: Type TANIMLAYICI '(' ArgListOpt ')' CompoundStmt 
	;
    
ArgListOpt: ArgList
	|
	;

ArgList:  ArgList ',' Arg
	| Arg
	;

Arg:	Type TANIMLAYICI
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

Type: INT 
	| FLOAT
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
	FILE* outputFile;

	outputFile = fopen("G171210377_soru2.txt", "w");

	yyin = fopen(argv[1], "r");

	yyparse();

    if(flag == 0){

	   printf("Girilen ifade gecerlidir.\n");

	   fprintf(outputFile, "\nGirilen ifade gecerlidir.\n");

	   fclose(outputFile);
	}
		
	else {

		printf("\nGirilen ifade gecersizdir.\n");

	    fprintf(outputFile, "\nGirilen ifade gecersizdir.\n");

		fclose(outputFile);
	}

	fclose(yyin);

    return 0;
}

yyerror(char *s) {
	
	flag = 1;

	FILE* outputFile;

	outputFile = fopen("G171210377_soru2.txt", "w");

    if (outputFile == NULL) {

        printf("Cikti dosyasi olusturma hatasi...");

        exit(1);
    }

	fprintf(outputFile, "%d : %s %s\n", yylineno, s, yytext );

	printf("%d : %s %s\n", yylineno, s, yytext );

	

	printf("\nKod Derleneme Hatası.\n");

	fclose(outputFile);
}