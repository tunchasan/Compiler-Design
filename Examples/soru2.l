%%

[a-zA-Z_][a-zA-Z_0-9]* return ID;
[0-9]+(\.[0-9]*)?      return NUM;

\ int		return INT;
\ float 	return FLOAT;
\ while 	return WHILE;
\ if 		return IF;
\ else 		return ELSE;

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