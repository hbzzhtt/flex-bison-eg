flex lex.l
bison -d yacc.y
gcc lex.yy.c yacc.tab.c 
./a.out