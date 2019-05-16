#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include "Vector.h"

struct Stack * InitVector() {
    struct Stack * stc = (Stack *)calloc(1, sizeof(struct Stack));

    stc->data = (elem_t **)calloc(INITIAL_STACK_CAPACITY, sizeof(elem_t *));
    stc->capacity = INITIAL_STACK_CAPACITY;

    return stc;
}


int VectorPush(struct Stack * stc, elem_t * val) {
        assert(stc);
        stc->size += 1;
        if (stc->size > stc->capacity - 1) {
            int incr = IncreaseVector(stc);
            if (incr == 0) {
                stc->data[stc->size - 1] = val;
            }
            else return -1;
        }
        else {
            stc->data[stc->size - 1] = val;
        }
        return 0;
}


int IncreaseVector(struct Stack * stc) {
    assert(stc);
        stc->data = (elem_t**)realloc(stc->data, stc->capacity * 2);
        if (stc->data == NULL) {
            printf("Memory is over, the array can no longer expand\n");
            return -1;
        }
        stc->capacity *= 2;
        return 0;

}

int VectorDestruct(struct Stack * stc) {
    assert(stc);
    free(stc);
    return 0;
}

int VectorDump(struct Stack * stc) {
    assert(stc);
    printf("%p size = %d\n", stc, stc->size);
    for(int i = 0; i < stc->size; ++i)
        printf("name: %s, address: %d\n", stc->data[i]->name, stc->data[i]->address);
    return 0;
}