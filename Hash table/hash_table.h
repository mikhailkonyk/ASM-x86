//
// Created by mikhail on 21.04.19.
//

#ifndef HASH_TABLE_HASH_TABLE_H
#define HASH_TABLE_HASH_TABLE_H
#define _ASM_TEST_ 1;

struct HashTable {
    struct List ** Table;
};
int create_table(struct HashTable * MyTable);
int delete_table(struct HashTable * MyTable);
int hashing (struct text_array * data, struct HashTable * MyTable);
int h1(struct Line * string);

#endif //HASH_TABLE_HASH_TABLE_H
