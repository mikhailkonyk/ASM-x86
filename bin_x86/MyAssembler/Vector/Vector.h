//
// Created by mikhail on 09.05.19.
//

#ifndef MYASSEMBLER_VECTOR_H
#define MYASSEMBLER_VECTOR_H

struct Label {
    char * name;
    int address;
};

typedef Label elem_t;
const int INITIAL_STACK_CAPACITY = 10;

struct Stack {
    int size;
    int capacity;
    elem_t ** data;
};

struct Stack * InitVector();

int VectorPush(struct Stack * stc, elem_t * val);

int IncreaseVector(struct Stack * stc);

int VectorDestruct(struct Stack * stc);

int VectorDump(struct Stack * stc);


#endif //MYASSEMBLER_VECTOR_H
