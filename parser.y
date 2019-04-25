%{
    #include <cstdlib>
    #include <cstdio>
    #include <iostream>

    #define YYDEBUG 1

    int yylex(void);
    void yyerror(const char *);
%}

%error-verbose

/* WRITEME: List all your tokens here */
%token T_EXPRESSION
%token T_NUMBER T_ID
%token T_PLUS T_MINUS T_MULTIPLY T_DIVIDE T_LARGERTHAN T_LARGEREQUAL T_LESSTHAN T_LESSEQUAL
%token T_PRINT T_RETURN T_IF T_ELSE T_ELIF T_WHILE T_NEW T_NONE T_EQUALS T_TYPE
%token T_AND T_OR T_NOT T_TRUE T_FALSE T_EXTENDS T_DO
%token T_OPENPAREN T_CLOSEPAREN T_OPENBRACE T_CLOSEBRACE
%token T_DOT T_COMMA T_SEMICOLON T_ARROW T_ASSIGN


/* WRITEME: Specify precedence here */
%left T_OR T_AND T_LARGERTHAN T_LARGEREQUAL T_LESSTHAN T_LESSEQUAL T_EQUALS
%left T_PLUS T_MINUS T_MULTIPLY T_DIVIDE
%precedence T_NOT T_UNARYMINUS


%%

/* WRITEME: This rule is a placeholder, since Bison requires
            at least one rule to run successfully. Replace
            this with your appropriate start rules. */
Start : Class

/* WRITME: Write your Bison grammar specification here */

Class : T_ID T_OPENBRACE Line T_CLOSEBRACE Class
      | T_ID T_EXTENDS Class
      | T_ID T_OPENBRACE T_CLOSEBRACE Class
      | %empty;

Line : T_ID T_ASSIGN Expr T_SEMICOLON Emptable_Line
     | T_ID T_DOT T_ID T_ASSIGN Expr T_SEMICOLON Emptable_Line
     | T_TYPE ID_Series T_SEMICOLON Emptable_Line
     | T_ID ID_Series T_SEMICOLON Emptable_Line
     | T_PRINT Expr T_SEMICOLON Emptable_Line
     | T_ID T_OPENPAREN Parameters T_CLOSEPAREN T_ARROW Lambda Emptable_Line
     | T_IF If Emptable_Line
     | T_WHILE Expr T_OPENBRACE Line T_CLOSEBRACE Emptable_Line
     | T_DO Do_While T_SEMICOLON Emptable_Line

Emptable_Line : T_ID T_ASSIGN Expr T_SEMICOLON Emptable_Line
              | T_ID T_DOT T_ID T_ASSIGN Expr T_SEMICOLON Emptable_Line
              | T_TYPE ID_Series T_SEMICOLON Emptable_Line
              | T_ID ID_Series T_SEMICOLON Emptable_Line
              | T_PRINT Expr T_SEMICOLON Emptable_Line
              | T_ID T_OPENPAREN Parameters T_CLOSEPAREN T_ARROW Lambda Emptable_Line
              | T_IF If Emptable_Line
              | T_WHILE Expr T_OPENBRACE Line T_CLOSEBRACE Emptable_Line
              | T_DO Do_While T_SEMICOLON Emptable_Line
              | %empty;

If : Expr T_OPENBRACE Line T_CLOSEBRACE
   | Expr T_OPENBRACE Line T_CLOSEBRACE T_ELSE Else


Else : T_OPENBRACE Line T_CLOSEBRACE

Do_While : T_OPENBRACE Line T_CLOSEBRACE T_WHILE Expr


Lambda : T_TYPE T_OPENBRACE Emptable_Line Return T_CLOSEBRACE
       | T_ID T_OPENBRACE Emptable_Line Return T_CLOSEBRACE
       | T_NONE T_OPENBRACE Emptable_Line T_CLOSEBRACE

Return : T_RETURN Expr T_SEMICOLON


Expr : Expr T_PLUS Expr
     | Expr T_MINUS Expr
     | Expr T_MULTIPLY Expr
     | Expr T_DIVIDE Expr
     | Expr T_LARGERTHAN Expr
     | Expr T_LARGEREQUAL Expr
     | Expr T_LESSTHAN Expr
     | Expr T_LESSEQUAL Expr
     | Expr T_EQUALS Expr     
     | Expr T_AND Expr
     | Expr T_OR Expr
     | T_NOT Expr
     | T_MINUS Expr     %prec T_UNARYMINUS
     | T_ID
     | T_ID T_DOT T_ID
     | MethodCall
     | T_OPENPAREN Expr T_CLOSEPAREN
     | T_NUMBER
     | T_TRUE
     | T_FALSE
     | T_NEW T_ID
     | T_NEW T_ID T_OPENPAREN Arguments T_CLOSEPAREN
     | T_NEW T_ID T_OPENPAREN T_CLOSEPAREN



Parameters : T_TYPE T_ID T_COMMA NonNull_Parameters
           | T_ID T_ID T_COMMA NonNull_Parameters
           | T_TYPE T_ID
           | T_ID T_ID
           | %empty;
NonNull_Parameters : T_TYPE T_ID T_COMMA NonNull_Parameters
                   | T_ID T_ID T_COMMA NonNull_Parameters
                   | T_TYPE T_ID
                   | T_ID T_ID


ID_Series : T_ID T_COMMA ID_Series
          | T_ID


MethodCall : T_ID T_OPENPAREN T_CLOSEPAREN
           | T_ID T_OPENPAREN Arguments T_CLOSEPAREN
           | T_ID T_DOT T_ID T_OPENPAREN T_CLOSEPAREN
           | T_ID T_DOT T_ID T_OPENPAREN Arguments T_CLOSEPAREN

Arguments : Arguments_prime 

Arguments_prime : Arguments_prime T_COMMA Expr
                | Expr

%%

extern int yylineno;

void yyerror(const char *s) {
  fprintf(stderr, "%s at line %d\n", s, yylineno);
  exit(1);
}