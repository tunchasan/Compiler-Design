%%
[ \t]	;
[ \n]   { yylineno = yylineno + 1;}
int	    return INT;
float   return FLOAT;
while	return WHILE;
if	    return IF;
else	return ELSE;
^"#include ".+ ;
[0-9]+(\.[0-9]*)?      return NUM;
[a-zA-Z_][a-zA-Z_0-9]* return ID;
"<="    return LE;
">="    return GE;
"=="    return EQ;
"!="    return NE;
">"	    return GT;
"<"	    return LT;
"."     return DOT;
\/\/.* ;
\/\*(.*\n)*.*\*\/ ;
.       return yytext[0];
%%