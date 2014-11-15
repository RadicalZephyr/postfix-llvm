#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/raw_ostream.h"

#include <fstream>
#include <iostream>
#include <sstream>

#include "sexp/sexp.h"

using namespace llvm;

static cl::opt<std::string>
InputProgram(cl::Positional, cl::desc("<postfix input>"));

static cl::opt<std::string>
OutputFilename("o", cl::desc("Output filename"), cl::value_desc("filename"));

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
        SexpPtr exprs = sexper.getNextSexp();
    } catch (ParseExceptionPtr e) {
        std::cerr << e->what() << std::endl;
        return 1;
    }

    return 0;
}
