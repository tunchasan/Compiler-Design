# C Compiler with Yacc and Lex
A practice to make a C Compiler that allows us to test a code compatibility for C programming language. (Yacc, Lex, C)

# What stages does it consist of?

* Scanner -> Scans C language' keywords in given .c file. End of the scan process, prints found keywords as Symbol Tree.
* Parser -> Parses found keyword by Scanner and controls compatibility for C via defined C grammar rules in yacc file.
* Abstract Syntax Tree -> Creates a AST tree to associate variables and it's values.
* Machine Code -> Converts intermediate code to machine code.
