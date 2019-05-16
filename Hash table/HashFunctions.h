//
// Created by mikhail on 22.04.19.
//

#ifndef HASH_TABLE_HASHFUNCTIONS_H
#define HASH_TABLE_HASHFUNCTIONS_H


unsigned int HashFunct_first_letter(struct Line * string);
unsigned int HashFunct_ASCII_sum(struct Line * string);
unsigned int HashFunct_lenght(struct Line * string);
unsigned int HashFunct_sumlen(struct Line * string);
unsigned int ELFHash(struct Line * string);
unsigned int Hash_gnu(struct Line * string);
unsigned int jenkins_hash(struct Line * string);
unsigned int HashFunct_constant(struct Line * string);
unsigned int MurmurHash2 (struct Line * string);

#endif //HASH_TABLE_HASHFUNCTIONS_H
