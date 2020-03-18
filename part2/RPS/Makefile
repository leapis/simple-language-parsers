CC = gcc
CFLAGS = -g

OBJ= parse.tab.o lex.yy.o

default: rps

rps: ${OBJ}
		${CC} ${CFLAGS} ${OBJ} -o rps

lex.yy.c: scan.l parse.tab.h
	flex -i scan.l

parse.tab.c: parse.y
	bison -dv parse.y

parse.tab.h: parse.tab.c

clean:
	rm -f rps lex.yy.c *.o parse.tab.[ch] parse.output

depend:
	makedepend -I. *.c
