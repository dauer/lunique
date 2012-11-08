CC=gcc
CFLAGS=-Wall -g -O2 -fPIC -pedantic -ansi -shared -luuid
INC=-I/usr/include/lua5.1
LINK=-L/usr/include

all: ../lib/lunique.so

../lib/lunique.so: lunique.o
		$(CC) lunique.o $(CFLAGS) $(INC) $(LINK) -o ../lib/lunique.so

lunique.o: lunique.c
		$(CC) $(CFLAGS) $(INC) -c lunique.c -o lunique.o

clean:
		rm -rf *.o ../lib/*.so
