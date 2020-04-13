%{
#include <iostream>
using namespace std;
extern "C" int yylex();
#include "Pato.tab.h"
int line_number = 1;
%}

%%
"program"                       {return PROGRAM;}
"var"                           {return VAR;}
"+"                             {return PLUS;}
"-"                             {return MINUS;}
"*"                             {return MULTIPLICATION;}
"/"                             {return DIVISION;}
"("                             {return OPEN_PAREN;}
")"                             {return CLOSE_PAREN;}
"{"                             {return OPEN_BRACKET;}
"}"                             {return CLOSE_BRACKET;}
":"                             {return COLON;}
";"                             {return SEMICOLON;}
","                             {return COMMA;}
"print"                         {return PRINT;}
"if"                            {return IF;}
"else"                          {return ELSE;}
"="                             {return EQUALS;}
">"                             {return GREATER_THAN;}
"<"                             {return LESS_THAN;}
"<>"                            {return IS_DIFFERENT;}
"int"                           {return TYPE_INTEGER;}
"float"                         {return TYPE_FLOAT;}
[\n]                            {line_number++;}
[ \t]                           { /* ignore whitespace */ }
[a-zA-Z](_?([a-zA-Z]|[0-9]))*   {yylval.sval = strdup(yytext); return IDENTIFIER;}
[0-9]+                          {yylval.ival = atoi(yytext); return INTEGER;}
[0-9]+\.[0-9]+                  {yylval.fval = atof(yytext); return FLOAT;}
\"(\\.|[^\\"])*\"               {yylval.sval = strdup(yytext); return STRING;}

%%

int yywrap()
{
    return 1;
}