/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INTEGER = 258,
     FLOAT = 259,
     STRING = 260,
     IDENTIFIER = 261,
     PROGRAM = 262,
     VAR = 263,
     PLUS = 264,
     MINUS = 265,
     MULTIPLICATION = 266,
     DIVISION = 267,
     OPEN_PAREN = 268,
     CLOSE_PAREN = 269,
     OPEN_BRACKET = 270,
     CLOSE_BRACKET = 271,
     COLON = 272,
     SEMICOLON = 273,
     COMMA = 274,
     PRINT = 275,
     IF = 276,
     ELSE = 277,
     EQUALS = 278,
     GREATER_THAN = 279,
     LESS_THAN = 280,
     IS_DIFFERENT = 281,
     TYPE_INTEGER = 282,
     TYPE_FLOAT = 283
   };
#endif
/* Tokens.  */
#define INTEGER 258
#define FLOAT 259
#define STRING 260
#define IDENTIFIER 261
#define PROGRAM 262
#define VAR 263
#define PLUS 264
#define MINUS 265
#define MULTIPLICATION 266
#define DIVISION 267
#define OPEN_PAREN 268
#define CLOSE_PAREN 269
#define OPEN_BRACKET 270
#define CLOSE_BRACKET 271
#define COLON 272
#define SEMICOLON 273
#define COMMA 274
#define PRINT 275
#define IF 276
#define ELSE 277
#define EQUALS 278
#define GREATER_THAN 279
#define LESS_THAN 280
#define IS_DIFFERENT 281
#define TYPE_INTEGER 282
#define TYPE_FLOAT 283




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 12 "Pato.y"
{
    int ival;
    float fval;
    char *sval;
}
/* Line 1529 of yacc.c.  */
#line 111 "Pato.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

