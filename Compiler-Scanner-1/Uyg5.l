%{
int COMMENT=0;
%}
identifier [a-zA-z]

%%

#.* {printf("\n%s   N/A   Library",yytext);}

int {printf("\n%s       INT       Keyword",yytext);} 
float {printf("\n%s     FLOAT     Keyword",yytext);} 
char {printf("\n%s      CHAR      Keyword",yytext);} 
double {printf("\n%s    DOUBLE    Keyword",yytext);} 
while {printf("\n%s     WHILE     Keyword",yytext);} 
for {printf("\n%s       FOR       Keyword",yytext);} 
struct {printf("\n%s    STRUCT    Keyword",yytext);} 
typedef {printf("\n%s   TYPEDEF   Keyword",yytext);} 
do {printf("\n%s        DO        Keyword",yytext);} 
if {printf("\n%s        IF        Keyword",yytext);} 
break {printf("\n%s     BREAK     Keyword",yytext);} 
continue {printf("\n%s  CONTINUE  Keyword",yytext);} 
void {printf("\n%s      VOID      Keyword",yytext);} 
switch {printf("\n%s    SWITCH    Keyword",yytext);} 
return {printf("\n%s    RETURN    Keyword",yytext);} 
else {printf("\n%s      ELSE      Keyword",yytext);} 

"/*" {COMMENT=1;} {printf("\n%s     Yorum     Identifier",yytext);} 

\{ {if(!COMMENT) printf("\n%s    SParantez_ac     Ayrıştırıcı",yytext);}

\} {if(!COMMENT) printf("\n%s    SParantez_kapa   Ayrıştırıcı",yytext);}

\; {if(!COMMENT) printf("\n%s    Noktali_virgul   Ayrıştırıcı",yytext);}

\( {if(!COMMENT) printf("\n%s    Parantez_ac      Ayrıştırıcı",yytext);}

\) {if(!COMMENT) printf("\n%s    Parantez_kapa    Ayrıştırıcı",yytext);}

\, {if(!COMMENT) printf("\n%s    Virgul           Ayrıştırıcı",yytext);}

\[ {if(!COMMENT) printf("\n%s    Kparantez_ac     Ayrıştırıcı",yytext);}

\] {if(!COMMENT) printf("\n%s    Kparantez_kapa   Ayrıştırıcı",yytext);}

{identifier} {if(!COMMENT) printf("\n%s    ID     Identifier",yytext);}

[0-9]+ {if(!COMMENT) printf("\n%s    N/A     Number",yytext);}

= {if(!COMMENT) printf("\n%s    Atama    Operator",yytext);}
\< {if(!COMMENT) printf("\n%s    Kucuk    Operator",yytext);}
== {if(!COMMENT) printf("\n%s    Esit     Operator",yytext);}
\> {if(!COMMENT) printf("\n%s     Buyuk    Operator",yytext);}
\+ {if(!COMMENT) printf("\n%s    Arti     Operator",yytext);}
\- {if(!COMMENT) printf("\n%s    Eksi     Operator",yytext);}
\* {if(!COMMENT) printf("\n%s    Carpma   Operator",yytext);}
\/ {if(!COMMENT) printf("\n%s    Bolme    Operator",yytext);}
\! {if(!COMMENT) printf("\n%s    Degil    Operator",yytext);}
"||" {if(!COMMENT) printf("\n%s    Veya     Operator",yytext);}
"&&" {if(!COMMENT) printf("\n%s    Ve       Operator",yytext);}
%%

// Belirtilen dosya üstünde gerekli işlemleri başlatan fonksiyon
FILE *DosyaOku(char*);

int yywrap();

int main(int argc,char **argv)
{
	/*******************************************************************************/
	// Kullanıcıdan dosya ismi alma

	printf("%s", "Uzerinde islem yapmak istediginiz .c uzantili dosyayi giriniz.\n");

	printf("%s", "Dosya ismi....: ");

	char* fileName;

	scanf("%s", fileName);

	/*******************************************************************************/

	// DosyaOku methodu çağrıldı.
	FILE *result = DosyaOku(fileName);

	// Eger dosya hatalı yada açılamadıysa, programdan çıkış yapılıyor.
	if(result == NULL) { 
		
		printf("%s", "Dosya hatali yada bulunamadi!");

		exit(0); 
		
		}

	/*******************************************************************************/
	printf("Sembol        Tanım        Tip\n\n");

	// Dosya üstünde ki token arama islemleri baslatılıyor.
	yyin = result;

	yylex();

	/*******************************************************************************/

	printf("\n");

	return(0);
}

//DosyaOku method gövdesi
FILE *DosyaOku(char *fileName){

	FILE *file;

	file=fopen(fileName,"r");

	if(!file) { return NULL; }

	return file;
}

int yywrap()
{
	return (1);
}