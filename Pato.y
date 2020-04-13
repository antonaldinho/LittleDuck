%{
#include <stdio.h>
#include <iostream>
using namespace std;
extern "C" int yylex();
extern "C" int yyparse();
extern "C" char *yytext;
extern "C" int line_number;
extern "C" FILE *yyin;
void yyerror(const char *s);
%}
%union {
    int ival;
    float fval;
    char *sval;
}

/*tokens*/
%token <ival> INTEGER
%token <fval> FLOAT
%token <sval> STRING
%token <sval> IDENTIFIER
%token PROGRAM
%token VAR
%token PLUS
%token MINUS
%token MULTIPLICATION
%token DIVISION
%token OPEN_PAREN
%token CLOSE_PAREN
%token OPEN_BRACKET
%token CLOSE_BRACKET
%token COLON
%token SEMICOLON
%token COMMA
%token PRINT
%token IF
%token ELSE
%token EQUALS
%token GREATER_THAN
%token LESS_THAN
%token IS_DIFFERENT
%token TYPE_INTEGER
%token TYPE_FLOAT

%%

programa:
    PROGRAM IDENTIFIER SEMICOLON programa_vars bloque {printf("Sintaxis válida!\n");};

programa_vars:
    vars
    | ;

vars:
    VAR vars_1;

vars_1:
    vars_2 COLON tipo SEMICOLON vars_4;

vars_2:
    IDENTIFIER vars_3;

vars_3:
    COMMA vars_2
    | ;

vars_4:
    vars_1
    | ;

tipo:
    TYPE_INTEGER
    | TYPE_FLOAT;

bloque:
    OPEN_BRACKET bloque_1 CLOSE_BRACKET;

bloque_1:
    estatuto bloque_1
    | ;

estatuto:
    asignacion
    | condicion
    | escritura;

asignacion:
    IDENTIFIER EQUALS expresion SEMICOLON;

expresion:
    exp expresion_1;

expresion_1:
    GREATER_THAN exp
    | LESS_THAN exp
    | IS_DIFFERENT exp
    | ;

exp:
    termino exp_1;

exp_1:
    PLUS exp
    | MINUS exp
    | ;

termino:
    factor termino_1;

termino_1:
    MULTIPLICATION termino |
    DIVISION termino
    | ;

factor:
    factor_1;

factor_1:
    OPEN_PAREN expresion CLOSE_PAREN
    | factor_2 var_cte;

factor_2:
    PLUS
    | MINUS
    | ;

var_cte:
    IDENTIFIER
    | INTEGER
    | FLOAT;

condicion:
    IF OPEN_PAREN expresion CLOSE_PAREN bloque condicion_1 SEMICOLON;

condicion_1:
    ELSE bloque
    | ;

escritura:
    PRINT OPEN_PAREN escritura_1 CLOSE_PAREN SEMICOLON;

escritura_1:
    expresion escritura_2
    | STRING escritura_2;

escritura_2:
    COMMA escritura_1
    | ;

%%

int main(){
    char *fName;
    cout << "Entra el nombre del archivo: " << endl;
    cin >> fName;
    FILE *myfile = fopen(fName, "r");
    if (!myfile) {
        cout << "Cannot open the file" << endl;
        return -1;
    }
    yyin = myfile;
    do {
        yyparse();
    } while (!feof(yyin));
    
    return 0;
}

void yyerror(const char *s) {
    // printf("Error de sintaxis en la línea %d: token inesperado '%s'\n", line_number, yytext);
    cout << "Error de sintaxis en la línea " << line_number << ": token inesperado '" << yytext << "'." << endl;
    exit(-1);
}