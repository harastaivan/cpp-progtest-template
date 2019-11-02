compile:
	g++ -std=c++11 -Wall -pedantic -Wno-long-long -O2 -o main.o main.cpp

fsanitize:
	g++ -std=c++11 -Wall -pedantic -Wno-long-long -O0 -o main.o -fsanitize=address main.cpp
	./main.o

valgrind: compile
	valgrind ./main.o --leak-check=full --leak-resolution=med  --track-origins=yes

run: compile
	./main.o

test: compile
	./test.sh
