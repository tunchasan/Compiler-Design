%{
	#include<stdio.h>
	int valid=1;
%}

%token ATAMA KUCUK ESIT BUYUK OP DEGIL VEYA VE SPARANTEZ_AC SPARANTEZ_KAPA NOKTALI_VIRGUL PARANTEZ_AC PARANTEZ_KAPA VIRGUL KPARANTEZ_AC KPARANTEZ_KAPA YORUM
%token INT FLOAT CHAR DOUBLE
%token WHILE
%token IF ELSE
%token STRUCT
%token SAYI TANIMLAYICI

%right '='
%left VE VEYA
%left '<' '>' KUCUK BUYUK
%%

start: Type Assignment ';'
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

Type: INT
    | FLOAT
    | CHAR
    | DOUBLE
    ;
%%

int yyerror()
{
    printf("\nInvalid!\n");
    valid=0;
    return 0;
}

int main()
{
    yyparse();
    
    if(valid)
    {
        printf("\nValid\n");
    }
}

