decode : fix.o libcrack.so libcypher.so
	gcc -m32 decode.o -L. -Wl,-rpath='$$ORIGIN' -lcrack -lcypher -o decode

unlocker.o : unlocker.c
	gcc -m32 -c $< -o $@

fix.o : fix.S
	as -32 $< -o $@

libcrack.so : unlocker.o fix.o
	gcc -m32 --shared $^ -o $@

_PHONY: clean dist

clean:
	rm -f decode unlocker.o fix.o

dist :
	tar zcvf decode.tar.gz Makefile fix.S unlocker.c decode.o libcypher.so
