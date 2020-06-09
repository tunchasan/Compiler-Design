%{

int COMMENT=0;

FILE* outputFile;

// Çıktıyı dosyaya yazan method
void DosyaYaz(char*, char*, FILE*);

%}

identifier [a-zA-Z_][a-zA-Z_0-9]*

%%

int { DosyaYaz(yytext,"       INT       Anahtar Kelime\n", outputFile); } 
float { DosyaYaz(yytext,"     FLOAT     Anahtar Kelime\n", outputFile);}
char { DosyaYaz(yytext,"      CHAR      Anahtar Kelime\n", outputFile);}
double { DosyaYaz(yytext,"    DOUBLE    Anahtar Kelime\n", outputFile);}
while { DosyaYaz(yytext,"     WHILE     Anahtar Kelime\n", outputFile);}
for { DosyaYaz(yytext,"       FOR       Anahtar Kelime\n", outputFile);}
struct { DosyaYaz(yytext,"    STRUCT    Anahtar Kelime\n", outputFile);} 
typedef { DosyaYaz(yytext,"   TYPEDEF   Anahtar Kelime\n", outputFile);}  
do { DosyaYaz(yytext,"        DO        Anahtar Kelime\n", outputFile);}  
if { DosyaYaz(yytext,"        IF        Anahtar Kelime\n", outputFile);}  
break { DosyaYaz(yytext,"     BREAK     Anahtar Kelime\n", outputFile);}  
continue { DosyaYaz(yytext,"  CONTINUE  Anahtar Kelime\n", outputFile);}  
void { DosyaYaz(yytext,"      VOID      Anahtar Kelime\n", outputFile);}  
switch { DosyaYaz(yytext,"    SWITCH    Anahtar Kelime\n", outputFile);}  
return { DosyaYaz(yytext,"    RETURN    Anahtar Kelime\n", outputFile);}  
else { DosyaYaz(yytext,"      ELSE      Anahtar Kelime\n", outputFile);}  

"/*" {COMMENT=1;} {DosyaYaz(yytext,"  Yorum           Tanimlayici\n", outputFile);} 

\{ {if(!COMMENT) DosyaYaz(yytext,"    SParantez_ac    Ayristirici\n", outputFile);}

\} {if(!COMMENT) DosyaYaz(yytext,"    SParantez_kapa  Ayristirici\n", outputFile);}

\; {if(!COMMENT) DosyaYaz(yytext,"    Noktali_virgul  Ayristirici\n", outputFile);}

\( {if(!COMMENT) DosyaYaz(yytext,"    Parantez_ac     Ayristirici\n", outputFile);}

\) {if(!COMMENT) DosyaYaz(yytext,"    SParantez_kapa  Ayristirici\n", outputFile);}

\, {if(!COMMENT) DosyaYaz(yytext,"    Virgul          Ayristirici\n", outputFile);}

\[ {if(!COMMENT) DosyaYaz(yytext,"    KParantez_ac    Ayristirici\n", outputFile);}

\] {if(!COMMENT) DosyaYaz(yytext,"    KParantez_kapa  Ayristirici\n", outputFile);}

{identifier}(\[[0-9]*\])*? {if(!COMMENT) DosyaYaz(yytext,"    ID  Tanimlayici\n", outputFile);}

[0-9]+(\.[0-9]*)? { if(!COMMENT) printf(" ");}

= {if(!COMMENT) DosyaYaz(yytext,"     Atama   Operator\n", outputFile);}
\< {if(!COMMENT) DosyaYaz(yytext,"    Kucuk   Operator\n", outputFile);}
== {if(!COMMENT) DosyaYaz(yytext,"    Esit    Operator\n", outputFile);}
\> {if(!COMMENT) DosyaYaz(yytext,"    Buyuk   Operator\n", outputFile);}
\+ {if(!COMMENT) DosyaYaz(yytext,"    Arti    Operator\n", outputFile);}
\- {if(!COMMENT) DosyaYaz(yytext,"    Eksi    Operator\n", outputFile);}
\* {if(!COMMENT) DosyaYaz(yytext,"    Carpma  Operator\n", outputFile);}
\/ {if(!COMMENT) DosyaYaz(yytext,"    Bolme   Operator\n", outputFile);}
\! {if(!COMMENT)  DosyaYaz(yytext,"   Degil   Operator\n", outputFile);}
"||" {if(!COMMENT) DosyaYaz(yytext,"  Veya    Operator\n", outputFile);}
"&&" {if(!COMMENT) DosyaYaz(yytext,"  Ve      Operator\n", outputFile);}
%%

// Belirtilen dosya üstünde gerekli işlemleri başlatan method
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
	printf("\n          SEMBOL TABLOSU\n");

	printf("\n**********************************");

	printf("\nSEMBOL        TANIM        TIP\n");

	printf("**********************************\n");
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

// Verilen girdiyi dosyaya yazan method
void DosyaYaz(char* input1, char* input2, FILE* outputFile){

    outputFile = fopen("G171210377_soru1.txt", "a");

    if (outputFile == NULL) {

        printf("Cikti dosyasi olusturma hatasi...");

        exit(1);
    }

    fprintf(outputFile, "%s", input1);

    fprintf(outputFile, "%s", input2);
	
	//Terminale yaz
	printf("\n%s%s", input1, input2);

    fclose(outputFile);
}

int yywrap()
{
	return (1);
}
