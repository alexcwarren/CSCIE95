CC=gcc
CFLAGS=-I.
#DEPS=<header file(s)>

word-count.out: word-count.c
	$(CC) -o word-count.out word-count.c $(CFLAGS) `pkg-config --cflags --libs glib-2.0`

debug:
	$(CC) -o word-count.out word-count.c -g $(CFLAGS) `pkg-config --cflags --libs glib-2.0`

clean:
	rm -f ./*.out
