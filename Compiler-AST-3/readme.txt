yacc -d soru3.y
lex soru3.l
gcc lex.yy.c y.tab.c -ll -lm -w
./a.out soru3.c