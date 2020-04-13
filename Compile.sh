bison -d Pato.y
flex Pato.l
g++ -x c++ Pato.tab.c lex.yy.c -ll -o Pato
./Pato