%{
	#include "y.tab.h"
%}

%%

[a-zA-Z_][a-zA-Z_0-9]* return TANIMLAYICI;
[0-9]+(\.[0-9]*)? 	   return SAYI;

int 		return INT;
float 		return FLOAT;
char 		return CHAR;
double 		return DOUBLE;
while 		return WHILE;
for 		return FOR;
struct 		return STRUCT;
typedef 	return TYPEDEF;
do 			return DO;
if 			return IF;
break 		return BREAK; 
continue 	return CONTINUE;
void 		return VOID;
switch 		return SWITCH; 
return 		return RETURN; 
else 		return ELSE;

"/*" 		return YORUM; 
\{ 			return SPARANTEZ_AC;
\} 			return SPARANTEZ_KAPA;
\; 			return NOKTALI_VIRGUL;
\( 			return PARANTEZ_AC;
\) 			return PARANTEZ_KAPA;
\, 			return VIRGUL;
\[ 			return KPARANTEZ_AC;
\] 			return KPARANTEZ_KAPA;

= 			return ATAMA;
\< 			return KUCUK;
== 			return ESIT;
\> 			return BUYUK;
\+ 			return OP;
\- 			return OP;
\* 			return OP;
\/ 			return OP;
\! 			return DEGIL;
"||" 		return VEYA;
"&&" 		return VE;
.  			return yytext[0];
\n 			return 0;

%%

int yywrap()
{
	return (1);
}
