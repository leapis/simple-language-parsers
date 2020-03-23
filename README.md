
(RPS and Bool need flex/bison, operators needs python3)

### RPS
Program reads a file in the format:
`
rock rock;
paper rock;
scissors paper
`
and determines for each round, which one wins.
to build, run `make`. To run, run `./rps < test.txt`.


### Operators
this program should run on ilab when run as the following:

python3 parser.py INPUTSTRING

This program DOES NOT read from stdin, it reads from the args. Therefore, in order to run from a file, you will need to use the following command:

cat test.txt | xargs python3 parser.py

this will run it on the input string contained in test.txt



### Bool
make
./rps < test2.txt
