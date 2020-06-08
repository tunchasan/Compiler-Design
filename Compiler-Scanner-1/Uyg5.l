%{
int COMMENT=0;
%}
identifier [a-zA-Z][a-zA-Z0-9]*

%%

#.* {printf("\n%s   N/A   Kutuphane",yytext);}

int {printf("\n%s       INT       Anahtar Kelime",yytext);} 
float {printf("\n%s     FLOAT     Anahtar Kelime",yytext);} 
char {printf("\n%s      CHAR      Anahtar Kelime",yytext);} 
double {printf("\n%s    DOUBLE    Anahtar Kelime",yytext);} 
while {printf("\n%s     WHILE     Anahtar Kelime",yytext);} 
for {printf("\n%s       FOR       Anahtar Kelime",yytext);} 
struct {printf("\n%s    STRUCT    Anahtar Kelime",yytext);} 
typedef {printf("\n%s   TYPEDEF   Anahtar Kelime",yytext);} 
do {printf("\n%s        DO        Anahtar Kelime",yytext);} 
if {printf("\n%s        IF        Anahtar Kelime",yytext);} 
break {printf("\n%s     BREAK     Anahtar Kelime",yytext);} 
continue {printf("\n%s  CONTINUE  Anahtar Kelime",yytext);} 
void {printf("\n%s      VOID      Anahtar Kelime",yytext);} 
switch {printf("\n%s    SWITCH    Anahtar Kelime",yytext);} 
return {printf("\n%s    RETURN    Anahtar Kelime",yytext);} 
else {printf("\n%s      ELSE      Anahtar Kelime",yytext);} 

"/*" {COMMENT=1;} {printf("\n%s     Yorum     Tanimlayici",yytext);} 

\{ {if(!COMMENT) printf("\n%s    SParantez_ac     Ayristirici",yytext);}

\} {if(!COMMENT) printf("\n%s    SParantez_kapa   Ayristirici",yytext);}

\; {if(!COMMENT) printf("\n%s    Noktali_virgul   Ayristirici",yytext);}

\( {if(!COMMENT) printf("\n%s    Parantez_ac      Ayristirici",yytext);}

\) {if(!COMMENT) printf("\n%s    Parantez_kapa    Ayristirici",yytext);}

\, {if(!COMMENT) printf("\n%s    Virgul           Ayristirici",yytext);}

\[ {if(!COMMENT) printf("\n%s    Kparantez_ac     Ayristirici",yytext);}

\] {if(!COMMENT) printf("\n%s    Kparantez_kapa   Ayrıştırıcı",yytext);}

{identifier}(\[[0-9]*\])*? {if(!COMMENT)printf("\n%s    ID     Tanimlayici",yytext);}

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
