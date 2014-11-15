#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/raw_ostream.h"

#include <fstream>
#include <iostream>
#include <sstream>

#include "sexp/sexp.h"

using namespace llvm;

// Prototypes

void gen_code(SexpPtr expr);


// Options

static cl::opt<std::string>
InputProgram(cl::Positional, cl::desc("<postfix input>"));

static cl::opt<std::string>
OutputFilename("o", cl::desc("Output filename"), cl::value_desc("filename"));


// Main

int main(int argc, char **argv) {
    cl::ParseCommandLineOptions(argc, argv, " Postfix compiler\n");

    if (InputProgram == "") {
        errs() << "Error: You must provide a postfix program as input.\n"
            "Use --help to see the options.\n";
        return 1;
    }

    std::stringstream postfixstream(InputProgram);

    Sexpressionizer sexper(postfixstream);

    try {
        SexpPtr expr = sexper.getNextSexp();

        gen_code(expr);

    } catch (ParseExceptionPtr e) {
        std::cerr << e->what() << std::endl << std::endl;
        std::cerr << InputProgram << std::endl;

        std::cerr.width(postfixstream.gcount());
        std::cerr << "^" << std::endl;
        return 1;
    }
    return 0;
}

void gen_code(SexpPtr expr) {

    // First check that we get 'postfix' then a number

    // The number is the number of arguments that we expect
}
