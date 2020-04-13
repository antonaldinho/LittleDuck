%{
    #include <stdio.h>
    #include <iostream>
    using namespace std;

    extern "C" int yylex();
    extern "C" int yyparse();
    extern "C" char *yytext;
    extern "C" int line_num;
    extern "C" FILE *yyin;
     
    void yyerror(const char *s);
%}

%union {
    int ival;
    float fval;
    char *sval;
}
%start programa
%token <ival> VAR_INT
%token <fval> VAR_FLOAT
%token <sval> VAR_STRING
%token <sval> VAR_IDENTIFIER
%token OP_PLUS
%token OP_MINUS
%token OP_TIMES
%token OP_DIVISION
%token OP_LESS_THAN
%token OP_GREATER_THAN
%token OP_NOT_EQUAL
%token OP_EQUALS
%token SEP_LPAR
%token SEP_RPAR
%token SEP_LCBRACKET
%token SEP_RCBRACKET
%token SEP_COMMA
%token SEP_COLON
%token SEP_SEMICOLON
%token INT
%token FLOAT
%token IF
%token ELSE
%token VAR
%token PRINT
%token PROGRAM

%%

programa : 
    PROGRAM VAR_IDENTIFIER SEP_SEMICOLON pr_a bloque {printf("Syntax is valid!\n");} ;
pr_a : 
    vars
    | ;

vars : 
    VAR v_a;
v_a : 
    v_b SEP_COLON tipo SEP_SEMICOLON v_c;
v_b :
    VAR_IDENTIFIER v_d;
v_d :
    SEP_COMMA v_b
    | ;
v_c :
    v_a
    | ;

tipo : 
    INT 
    | FLOAT;

bloque :
    SEP_LCBRACKET b_a SEP_RCBRACKET;
b_a :
    estatuto b_a
    | ;

estatuto :
    asignacion
    | condicion
    | escritura;

asignacion :
    VAR_IDENTIFIER OP_EQUALS expresion SEP_SEMICOLON;

expresion :
    exp ex_a;
ex_a :
    OP_GREATER_THAN exp
    | OP_LESS_THAN exp
    | OP_NOT_EQUAL exp
    | ;

escritura :
    PRINT SEP_LPAR es_a SEP_RPAR SEP_SEMICOLON;
es_a :
    expresion es_b
    | VAR_STRING es_b;
es_b :
    SEP_COMMA es_a
    | ;

condicion :
    IF SEP_LPAR expresion SEP_RPAR bloque cond_a SEP_SEMICOLON;
cond_a :
    ELSE bloque
    | ;

exp :
    termino e_a;
e_a :
    OP_PLUS exp
    | OP_MINUS exp
    | ;

termino :
    factor t_a;
t_a :
    OP_TIMES termino
    | OP_DIVISION termino
    | ;

factor :
    f_a;
f_a :
    SEP_LPAR expresion SEP_RPAR
    | f_b var_cte;
f_b :
    OP_PLUS
    | OP_MINUS
    | ;

var_cte :
    VAR_IDENTIFIER
    | VAR_INT
    | VAR_FLOAT;

%%

int main(){
    FILE *myfile = fopen("correct_input.txt", "r");
    if (!myfile) {
        cout << "I can't open the file!" << endl;
        return -1;
    }
    yyin = myfile;
    do {
        yyparse();
    } while (!feof(yyin));

    return 0;
}

void yyerror(const char *s) {
    printf("Syntax error (line %d): unexpected token '%s'\n", line_number, yytext);
    exit(-1);
}