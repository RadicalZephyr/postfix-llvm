#include "ast.h"



void AstVisitor::visit(List *e) {

}

void AstVisitor::visit(Atom *e) {

}


Command::Command(Atom *e) {

}

Integer::Integer(Atom *e) {

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
