decode : unlocker.o decode.o libcypher.so
	gcc -m32 unlocker.o decode.o -L. -Wl,-rpath='$$ORIGIN' -lcypher -o decode

unlocker.o : unlocker.c
	gcc -m32 -c $< -o $@

clean:
	rm -f decode
