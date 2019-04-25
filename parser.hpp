/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

#ifndef YY_YY_PARSER_HPP_INCLUDED
# define YY_YY_PARSER_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    T_EXPRESSION = 258,
    T_NUMBER = 259,
    T_ID = 260,
    T_PLUS = 261,
    T_MINUS = 262,
    T_MULTIPLY = 263,
    T_DIVIDE = 264,
    T_LARGERTHAN = 265,
    T_LARGEREQUAL = 266,
    T_LESSTHAN = 267,
    T_LESSEQUAL = 268,
    T_NEGATIVE = 269,
    T_PRINT = 270,
    T_RETURN = 271,
    T_IF = 272,
    T_ELSE = 273,
    T_ELIF = 274,
    T_WHILE = 275,
    T_NEW = 276,
    T_INTEGER = 277,
    T_BOOLEAN = 278,
    T_NONE = 279,
    T_EQUALS = 280,
    T_TYPE = 281,
    T_AND = 282,
    T_OR = 283,
    T_NOT = 284,
    T_TRUE = 285,
    T_FALSE = 286,
    T_EXTENDS = 287,
    T_DO = 288,
    T_CLASSNAME = 289,
    T_ARGUMENT = 290,
    T_ARGUMENT_PRIME = 291,
    T_OPENPAREN = 292,
    T_CLOSEPAREN = 293,
    T_OPENBRACE = 294,
    T_CLOSEBRACE = 295,
    T_COMMENT = 296,
    T_DOT = 297,
    T_COMMA = 298,
    T_SEMICOLON = 299,
    T_ARROW = 300,
    T_ASSIGN = 301,
    T_UNARYMINUS = 302
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_HPP_INCLUDED  */
