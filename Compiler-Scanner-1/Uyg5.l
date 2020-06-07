%{
int COMMENT=0;
%}
identifier[a-zA-z][a-zA-Z0-9]*

%%

#.* {printf("\n%s bir kutuphanedir",yytext);}

int | 
float |
char |
double |
while |
for |
struct |
typedef |
do |
if |
break |
continue |
void {printf("\n%s GGGGGG",yytext);}
switch |
return |
else |
goto {printf("\n%s bir keyword",yytext);}

"/*" {COMMENT=1;} {printf("\n%s bir yorumdur",yytext);} 

{identifier}\( {if(!COMMENT) printf("\n%s bir fonksiyondur\n",yytext);}

\{ {if(!COMMENT) printf("\nBlok baslangici");}

\} {if(!COMMENT) printf("\nBlok sonu");}

{identifier}(\[[0-9]*\])? {if(!COMMENT) printf("\n%s bir tanımlayici(identifier)",yytext);}

\".*\" {if(!COMMENT) printf("\n%s bir katar",yytext);}

[0-9]+ {if(!COMMENT) printf("\n%s bir rakam",yytext);}

\)(\;)? {if(!COMMENT) printf("\n\t"); ECHO; printf("\n");}

\( ECHO;

= {if(!COMMENT) printf("\n%s bir atama operatoru",yytext);}

\<= |
\>= |
\< |
== |
\> 
= {if(!COMMENT) printf("\n%s bir iliskisel operator",yytext);}

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
