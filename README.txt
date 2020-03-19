
for part 1:
=========
this program should run on ilab when run as the following:

python3 parser.py INPUTSTRING

This program DOES NOT read from stdin, it reads from the args. Therefore, in order to run from a file, you will need to use the following command:

cat test.txt | xargs python3 parser.py

this will run it on the input string contained in test.txt
=========



for part 2:
=========
make
./rps < test2.txt
=========
