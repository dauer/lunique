CC=gcc
CFLAGS=-Wall -g -O2 -fPIC -pedantic -ansi
LFLAGS=-shared -luuid
INC=-I/usr/include/lua5.1

all: ../lib/lunique.so

../lib/lunique.so: lunique.o
		$(CC) lunique.o $(LFLAGS) -o ../lib/lunique.so

lunique.o: lunique.c
		$(CC) $(CFLAGS) $(INC) -c lunique.c -o lunique.o

clean:
		rm -rf *.o ../lib/*.so
