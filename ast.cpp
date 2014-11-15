#include <algorithm>
#include <string>
#include <cctype>

#include "ast.h"


void AstVisitor::visit(List *e) {

}

void AstVisitor::visit(Atom *e) {
    std::string text = e->getText();

    if (all_of(text.begin(), text.end(),
               [](char c){return isdigit(c);})) {

        Integer i(text);

    } else {
        Command c(text);

    }
}

Command::Command(std::string &text) {

}

Integer::Integer(std::string &text) {

}

ExecSeq::ExecSeq(AstVisitor &v, List *e) {

    for (auto itr = e->begin(); itr < e->end(); itr++) {
        (*itr)->
    }

}

Program::Program(AstVisitor &v, List *e): ExecSeq(v, e) {
    // Validate that the first element is the command postfix

    // And that the second is
}
