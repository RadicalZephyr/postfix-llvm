#include "llvm/Support/CommandLine.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/raw_ostream.h"

#include <fstream>
#include <iostream>

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
        exit(1);
    }

    return 0;
}
