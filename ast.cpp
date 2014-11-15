#include "ast.h"



void AstVisitor::visit(List *e) {

}

void AstVisitor::visit(Atom *e) {

}


Command::Command(Atom *e) {

}

Integer::Integer(Atom *e) {

}

ExecSeq::ExecSeq(List *e) {

}

Program::Program(List *e): ExecSeq(e) {
    // Validate that the first element is the
}
