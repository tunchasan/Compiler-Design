%%
[ \t]	;
[ \n]   { yylineno = yylineno + 1;}

int	    return INT;
float   return FLOAT;
while	return WHILE;
if	    return IF;
else	return ELSE;

^"#include ".+ ;

[0-9]+(\.[0-9]*)?      return SAYI;
[a-zA-Z_][a-zA-Z_0-9]* return TANIMLAYICI;

"=="    return ESIT;
">"	    return BUYUK;
"<"	    return KUCUK;
"||" 	return VEYA;
"&&" 	return VE;

\/\/.* ;
\/\*(.*\n)*.*\*\/ ;

.       return yytext[0];

%%