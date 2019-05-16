#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>
#include <time.h>
#include "List/List.h"
#include "DataLib.h"
#include "hash_table.h"
#include "HashFunctions.h"


const unsigned int TABLE_SIZE = 128;

unsigned int (*curr_hash)(struct Line *) = &Hash_gnu;

int create_table(struct HashTable * MyTable) {
    assert(MyTable);

    MyTable->Table = (struct List **) calloc (TABLE_SIZE, sizeof(struct List *));
    for (int i = 0; i < TABLE_SIZE; ++i) {
        MyTable->Table[i] = create_List();
    }
    return 0;
}

int delete_table(struct HashTable * MyTable) {
    assert(MyTable);

    for (int i = 0; i < TABLE_SIZE; ++i) {
        erase_List(MyTable->Table[i]);
    }
    return 0;
}

int hashing(struct text_array * data, struct HashTable * MyTable) {
    assert(data);
    assert(MyTable);

    unsigned int hash = 0;
    for (int i = 0; i < data->len; ++i) {
        hash = (*curr_hash)(&data->text[i]) % TABLE_SIZE;
        push_back(MyTable->Table[hash], &data->text[i]);
    }

    return 0;
}

struct Node * search(struct HashTable * MyTable, char * str_to_search) {
    assert(MyTable);
    struct Line line = {};

#ifdef _ASM_TEST_
    asm(
    "push rdi\n"
    "push rdi\n"
    "\txor rcx, rcx\n"
    "\tdec rcx\n"
    "\txor al, al\n"
    "\tcld\n"
    "\trepne scasb\n"
    "\tpop rsi\n"
    "\tsub rdi, rsi\n"
    "\tsub rdi, 1\n"
    "\tmov rax, rdi\n"
    "\tpop rdi"
    :"=a"(line.len)
    :"D"(str_to_search));
#else
    line.len = strlen(str_to_search);
#endif

    line.line_begin = str_to_search;
    unsigned int hash = curr_hash(&line) % TABLE_SIZE;
    return Node_FindNext(MyTable->Table[hash]->first, &line);
}


int print_result(struct HashTable * MyTable) {
    assert(MyTable);

    FILE * file = fopen("result.csv", "w");
    for (int i = 0; i < TABLE_SIZE; ++i) {
        fprintf(file, "%d; %ld\n", i, MyTable->Table[i]->size);
    }
    fclose(file);
    return 0;
}


int main() {
    struct HashTable MyTable;
    create_table(&MyTable);
    FILE * file = fopen("/home/mikhail/Документы/PROJECTS/Hash table/dict.txt", "rb");

    struct text_array * data = create_array(file, 1);
    fclose(file);

    hashing(data, &MyTable);
    clock_t begin = clock();
    for (int i = 0; i < 10000; ++i) {
        for (int j = 0; j < 6500; ++j)
          search(&MyTable, data->text[j].line_begin);
    }

    clock_t end = clock();


    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    printf("searching time: %f, %ld\n", time_spent, CLOCKS_PER_SEC);
    print_result(&MyTable);

    delete_table(&MyTable);
    free_memory(data);
    return 0;
}