%{
#include "y.tab.h"
extern int yylval;
%}

%%
"import "[a-zA-Z_]+ { yytext[1] ;return PREPROCESSOR;}

("int")|("if")|("else")|("while")|("do")|("break")|("continue")|("double")|("float")|("return")|("EOF") {yytext; return KEYWORD;}

[a-zA-Z_][a-zA-Z0-9_]* {yytext[1] ; return IDENTIFIER;}

[0-9]+ {
    yylval = atoi(yytext);
    return INTEGER;
}
"+"|"-"|"*"|"/" {yytext; return ARITHMATIC;}

"=" {return ASSIGNMENT;}

"#".*" "* {return COMMENT;}
%%

int yywrap(){
    return 1;
}



