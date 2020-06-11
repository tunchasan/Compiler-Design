%{
	#include<stdio.h>
	int valid=1;
%}

%token INT
%token num id op

%%

start:Type id'='s';'
s: 	id x
	| num x       
	| '-' num x   
	| '(' s ')' x 
	;
x:	op s
	| '-' s       
	|             
    ;

Type: INT
	;

%%

int yyerror()
{
	valid=0;
	printf("\nInvalid expression!\n");
	return 0;
}

int main()
{
	printf("\nEnter the expression:\n");
	yyparse();
	if(valid)
	{
	    printf("\nValid expression!\n");
	}
}

