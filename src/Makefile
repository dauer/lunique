CC=gcc
CFLAGS=-Wall -O2 -fPIC -pedantic -ansi -Wextra -std=c99 -pipe
LFLAGS=-shared -luuid
LUA_VERSION=$(shell lua -e 'print(_VERSION)' | tr -d ' ' | tr '[:upper:]' '[:lower:]')
INC=-I/usr/include/$(LUA_VERSION)

ifeq ($(LUA_VERSION), lua5.1)
	COND=-DLUA51
else
	COND=
endif

all: ../lib/lunique.so

../lib/lunique.so: lunique.o
		$(CC) lunique.o $(LFLAGS) -o ../lib/lunique.so

lunique.o: lunique.c
		$(CC) $(CFLAGS) $(INC) $(COND) -c lunique.c -o lunique.o

clean:
		rm -rf *.o ../lib/*.so
