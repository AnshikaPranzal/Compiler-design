%{
    #include<stdio.h>
    int flag = 0;
%}

%{
int yylex();
void yyerror();
%}
%token PREPROCESSOR KEYWORD IDENTIFIER ASSIGNMENT COMMENT ARITHMATIC INTEGER

//context free grammar
//2+4
//NUMBER

%%
Expression: VALUE{
    printf("result %d\n", $$);
    return 0;
};
VALUE: KEYWORD IDENTIFIER ASSIGNMENT INTEGER {$$ = $4;}
;
%%
void main(){
    printf("Enter anything:");
    yyparse();

        if(flag==0)
            printf("Expression is valid!");
}

void yyerror(){
    printf("Expression INVALID!");
    flag=1;
}




