%option yylineno
%pointer

%{
    #include <cstdlib>
    #include <cerrno>
    #include <climits>
    #include <limits>
    #include "parser.hpp"
    
    void yyerror(const char *);
%}

/* WRITEME: Write any definitions here. You can find information on
            definitions here:
            ftp://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC10 */


/* WRITEME: If you are going to use start conditions, write them here.
            You can find more information on start conditions here:
            ftp://ftp.gnu.org/old-gnu/Manuals/flex-2.5.4/html_mono/flex.html#SEC11
            You will probably want to use exclusive conditions rather
            than inclusive conditions (use the %x instead of the %s). */
%x COMMENT

%%
"/*" { BEGIN(COMMENT); }
<COMMENT>"*/" { BEGIN(INITIAL); }
<COMMENT>(.|\n) ;
<COMMENT><<EOF>> { yyerror("invalid character"); }

0|[1-9][0-9]*         {return T_NUMBER; }
"+"                   {return T_PLUS; }
"-"                   {return T_MINUS; }
"*"                   {return T_MULTIPLY; }
"/"                   {return T_DIVIDE; }
">"                   {return T_LARGERTHAN; }
">="                  {return T_LARGEREQUAL; }
"<"                   {return T_LESSTHAN; }
"<="                  {return T_LESSEQUAL; }
"=="                  {return T_EQUALS; }
"equals"              {return T_EQUALS; }
"="                   {return T_ASSIGN; }
"if"                  {return T_IF; }
"else"                {return T_ELSE; }
"elif"                {return T_ELIF; }
"print"               {return T_PRINT; }
"return"              {return T_RETURN; }
"while"               {return T_WHILE; }
"new"                 {return T_NEW; }
"integer"             {return T_TYPE; }
"boolean"             {return T_TYPE; }
"NONE"                {return T_NONE; }
"none"                {return T_NONE; }
"not"                 ;
"and"                 {return T_AND; }
"&&"                  {return T_AND; }
"or"                  {return T_OR; }
"||"                  {return T_OR; }
"true"                {return T_TRUE; }
"false"               {return T_FALSE; }
"extends"             {return T_EXTENDS; }
"do"                  {return T_DO; }
"("                   {return T_OPENPAREN; }
"{"                   {return T_OPENBRACE; }
"}"                   {return T_CLOSEBRACE; }
")"                   {return T_CLOSEPAREN; }
[ \t\n]               ;
"."                   {return T_DOT; }
","                   {return T_COMMA; }
";"                   {return T_SEMICOLON; }
"->"                  {return T_ARROW; }
[a-z][a-z0-9]*        {return T_ID; }
.                     { yyerror("invalid character"); }


%%

int yywrap(void) {
  return 1;
}
