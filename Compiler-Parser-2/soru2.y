%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *fp;
char* fileName;
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
	if(argc < 2){
		printf("Yanlış kullanım. Örnek (./a.out input.c)\n");
		return 0;
	}

	fileName = argv[1];

	yyin = fopen(argv[1], "r");

	yyparse();

	fclose(yyin);

    if(flag == 0){

	   printf("Girilen ifade gecerlidir.\n");

	   createOutput(0, yyin);
	}
		
	else {

		printf("\nGirilen ifade gecersizdir.\n");

		createOutput(1, yyin);
	}

    return 0;
}

yyerror(char *s) {
	
	flag = 1;

	printf("%d : %s %s\n", yylineno, s, yytext );

	printf("\nKod Derleneme Hatası.\n");
}

void createOutput(int status){

   FILE* file;

   file = fopen(fileName, "r");

   if (file == NULL)
   {
      fclose(file);
      printf("Press any key to exit...\n");
      exit(EXIT_FAILURE);
   }

   char ch;

   FILE* target;

   target = fopen("G171210377_soru2.txt", "w");

   if (target == NULL)
   {
      fclose(target);
      printf("Press any key to exit...\n");
      exit(EXIT_FAILURE);
   }

   while ((ch = fgetc(file)) != EOF)
      fputc(ch, target);

   if(status == 0)
	    fprintf(target,"\n\n+++++++++++++++++++++++++++++++++++++++++++++++++++\n\nGirilen ifade gecerlidir.\n");
   else
	    fprintf(target,"\n\n---------------------------------------------------\n\nGirilen ifade gecersizdir.\n"); 
   
   fclose(file);

   fclose(target);
}
