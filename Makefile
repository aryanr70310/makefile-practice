
all: maths_prog maths_prog.o add.o subtract.o add.h subtract.h libmaths.so
	gcc -Wall -Wextra -pedantic -std=c11 -L -libmaths maths_prog.c add.c subtract.c -o maths_prog

libmaths.so: maths_prog.o add.o subtract.o add.h subtract.h
	gcc -Wall -Wextra -pedantic -std=c11 *.o -shared -o libmaths.so

maths_prog:
	touch maths_prog

add.o: add.c add.h
	gcc -Wall -Wextra -pedantic -std=c11 -c add.c

subtract.o: subtract.c subtract.h
	gcc -Wall -Wextra -pedantic -std=c11 -c subtract.c

maths_prog.o: maths_prog.c add.h subtract.h
	gcc -Wall -Wextra -pedantic -std=c11 -c maths_prog.c

clean:
	rm -rf maths_prog maths_prog.o add.o subtract.o libmaths.so

