import argparse

SPEC_LOGGING = True

class Parser:
    
    def __init__(self, input):
        self.input = input.strip()
        self.runtime_err = False
        self.vars = {}
        self.buffer = ""
        self.allowed_vars = ["a", "b", "c"]

    def syntax_err(self, name):
        print('syntax error')
        print(name) if SPEC_LOGGING else None
        exit(0)

    def gen(self):
        if not self.program():
            self.syntax_err('gen')
        elif self.runtime_err:
            print('exception')
        else:
            print("out:")
            print(self.buffer)

    def program(self):
        if self.stmt_list():
            if self.input == ".":
                return True
            else:
                self.syntax_err('program_ending')
                return False
        else:
            self.syntax_err('program_general')
            return False

    def stmt_list(self):
        if self.stmt() and self.next_stmt():
            return True
        else:
            self.syntax_err('stmt_list')
            return False
    
    def getC(self, index=0):
        return self.input[index]

    def shiftR(self, exception=False):
        if len(self.input) == 0:
            self.syntax_err('shiftR_pre')
        self.input = self.input[1:]
        if not exception and len(self.input) == 0:
            self.syntax_err('shiftR_post')

    def next_stmt(self):
        if self.getC() == ';': #stmt_list
            self.shiftR()
            return self.stmt_list()
        else: #empty
            return True

    def stmt(self):
        if self.print():
            return True
        elif self.assign():
            return True
        else:
            self.syntax_err('stmt_fallthrough')
            return False

    def getVal(self, input):
        if input == False: return 12321
        if input in self.allowed_vars:
            if input not in self.vars:
                self.runtime_err = True
                return 12321
            else: return self.vars[input]
        else:
            return int(input)

    def print(self):
        if self.getC() == '!':
            self.shiftR()
            found, nxt = self.id()
            if not found: #this cannot fail
                self.syntax_err('print')
                return False
            self.buffer += str(self.getVal(nxt))
            return True
        else:
            return False

    def assign(self):
        found, nxt = self.id()
        if found:
            if self.getC() != '=':
                self.syntax_err('assign_eq_missing')
                return False
            self.shiftR()
            nxt2 = self.expr()
            if nxt2 == False:
                self.syntax_err('assign_expr')
            self.vars[nxt] = nxt2
            return True
        else:
            return False

    def id(self):
        if self.getC() in self.allowed_vars:
            ret = self.getC()
            self.shiftR()
            return True, ret
        else:
            return False, 0

    def expr(self): #returns an int
        nxt = self.getC()
        if nxt in ['+', '-', '*', '/']: 
            self.shiftR()
            if nxt == '+': return int( self.getVal(self.expr()) + self.getVal(self.expr()) )
            if nxt == '-': return int( self.getVal(self.expr()) - self.getVal(self.expr()) )
            if nxt == '*': return int( self.getVal(self.expr()) * self.getVal(self.expr()) )
            if nxt == '/': return int( self.getVal(self.expr()) / self.getVal(self.expr()) )
        else:
            found, nxt = self.id()
            if found:
                return self.getVal(nxt)
            found, nxt = self.const()
            if found:
                return self.getVal(nxt)
            #case where nothing is found
            return False

    def const(self):
        nxt = self.getC()
        if nxt in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']:
            self.shiftR()
            return True, int(nxt)
        else:
            return False

if __name__ == "__main__":
    argp = argparse.ArgumentParser(description="process a string or group of strings")
    argp.add_argument("string")
    args = argp.parse_args()
    mp = Parser(args.string)
    mp.gen()
    #argp.add_argument('--string', metavar='S', type=str, nargs='+', help='string to be parsed')
    #argp.add_argument('--list', metavar='S', type=str, nargs='+')