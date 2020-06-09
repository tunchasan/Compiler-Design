%{
	#include<stdio.h>
	int valid=1;
%}

%token ATAMA KUCUK ESIT BUYUK OP DEGIL VEYA VE SAYI TANIMLAYICI SPARANTEZ_AC SPARANTEZ_KAPA NOKTALI_VIRGUL PARANTEZ_AC PARANTEZ_KAPA VIRGUL KPARANTEZ_AC KPARANTEZ_KAPA YORUM
%token INT FLOAT CHAR DOUBLE WHILE FOR STRUCT TYPEDEF DO IF BREAK CONTINUE VOID SWITCH RETURN ELSE

%%

start:	TANIMLAYICI s
s:	TANIMLAYICI s
	| SAYI s
	|
      	;

%%

int yyerror()
{
    printf("\nIts not a identifier!\n");
    valid=0;
    return 0;
}

int main()
{
    printf("\nEnter a name to tested for identifier ");
    yyparse();
    if(valid)
    {
        printf("\nIt is a identifier!\n");
    }
}

