%{
#include <stdio.h>
#include "yacc.tab.h"

/*
eg
heat on
Heat turned on or off
heat off
Heat turned on or off
target temperature 10
Temperature set
target humidity 20
error: parse error
*/
%}

%%
[0-9]+ return NUMBER;
heat return TOKHEAT;
on|off return STATE;
target return TOKTARGET;
temperature return TOKTEMPERATURE;
\n /* ignore end of line */;
[ \t]+ /* ignore whitespace */
%%