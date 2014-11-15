#pragma once

#include <vector>

#include "sexp/sexp.h"


class AstVisitor {

 public:
    virtual void visit(List *e);

    virtual void visit(Atom *e);

};


class AST {

 public:
    virtual ~AST() {}

};

class Command: public AST {

    enum Name {add, sub, mul, div, rem, eq, gt, lt,
               exec, nget, pop, sel, swap, postfix};

    Name m_name;

 public:

    Command(Atom *e);

};

class Integer: public AST {

    int m_value;

 public:
    Integer(Atom *e);

};

class ExecSeq: public AST {

    std::vector<AST> m_els;

 public:
    ExecSeq(List *e);

};

class Program: public ExecSeq {

 public:
    Program(List *e);
};