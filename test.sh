#!/bin/bash
date > tests/test.log

for i in {1..3}
do
    echo "Test $i";
    ./main.o < "tests/"$i"_in.txt" > "tests/"$i"_out.txt";
    echo "Test $i" >> tests/test.log;
    if diff <(nl "tests/"$i"_out.txt") <(nl "tests/"$i"_ref.txt") >> tests/test.log;
        then echo OK
        else echo failed
    fi
done
