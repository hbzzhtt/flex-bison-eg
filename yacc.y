%{
#include <stdio.h>
#include <string.h>

//在lex.yy.c里定义，会被yyparse()调用。在此声明消除编译和链接错误。
extern int yylex(void); 

// 在此声明，消除yacc生成代码时的告警
extern int yyparse(void); 
extern char* yytext;

int yywrap()
{
	return 1;
}

// 该函数在y.tab.c里会被调用，需要在此定义
void yyerror(const char *s)
{
	printf("[error] %s at %s\n", s, yytext);
}

int main()
{
	yyparse();
	return 0;
}
%}

%token NUMBER TOKHEAT STATE TOKTARGET TOKTEMPERATURE

%%
commands: /* empty */
| commands command
;

command: heat_switch | target_set ;

heat_switch: heat_switch_cmd heat_switch_comment

heat_switch_cmd:
TOKHEAT STATE | TOKHEAT STATE STATE
{
	printf("\tHeat turned on or off\n");
};

heat_switch_comment: | STATE ; /*实现了STATE作为注释的功能，注意这里的归约操作设计*/

target_set:
TOKTARGET TOKTEMPERATURE NUMBER
{
	printf("\tTemperature set\n");
};
%%