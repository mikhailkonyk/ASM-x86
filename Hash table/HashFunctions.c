//
// Created by mikhail on 22.04.19.
//

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "List/List.h"
#include "DataLib.h"
#include "hash_table.h"

unsigned int HashFunct_constant(struct Line * string) {
    assert(string);

    return 1;
}

unsigned int HashFunct_first_letter(struct Line * string) {
    assert(string);

    return string->line_begin[0];
}

unsigned int HashFunct_ASCII_sum(struct Line * string) {
    assert(string);

    int symbol_sum = 0;
    for (int i = 0; i < string->len; ++i)
        symbol_sum += string->line_begin[i];
    return symbol_sum;
}

unsigned int HashFunct_lenght(struct Line * string) {
    assert(string);

    return (string->len);
}

unsigned int HashFunct_sumlen(struct Line * string) {
    assert(string);

    if (string->len)
        return HashFunct_ASCII_sum(string) / string->len;
    else
        return 1;
}

unsigned int Hash_gnu(struct Line * string) {
    u_int64_t hash = 5381;
    int c = 0;
    char* ptr = string->line_begin;
  /*
#ifdef _ASM_TEST_
    asm("xor rcx, rcx;"
        "push rsi;"
        ".go:"
        "   inc rsi;"
        "   mov cl, byte ptr [rsi];"
        "   test rcx, rcx;"
        "   je .exit;"
        "   mov rbx, rax;"
        "   sal rbx, 5;"
        "   add rax, rbx;"
        "   add rax, rcx;"
        "   jmp .go;"
        ".exit:"
        "pop rsi;"
        :"=a"(hash)
        :"a"(hash), "S"(ptr)
            );
#else
*/
    while ((c = *ptr++))
        hash = ((hash << 5) + hash) + c; /* hash * 33 + c */
//#endif
    return hash;
}


unsigned int ELFHash(struct Line * string) {
    unsigned int hash = 0;
    unsigned int x = 0;

    for (int i = 0; i < string->len; i++)
    {
        hash = (hash << 4) + string->line_begin[i];

        if ((x = hash & 0xF0000000L) != 0)
        {
            hash ^= (x >> 24);
        }

        hash &= ~x;
    }

    return hash;
}

unsigned int jenkins_hash(struct Line * string)
{
    unsigned int hash = 0;
#ifndef _ASM_TEST_
    asm("push rbx;"
        "xor rsi, rsi;"
        ".next:"
        "   add rdx, [rbx + rsi];"
        "   mov rax, rdx;"
        "   sal rax, 10;"
        "   add rdx, rax;"
        "   mov rax, rdx;"
        "   sar rax, 6;"
        "   xor rdx, rax;"
        "   cmp rsi, rcx;"
        "   inc rsi;"
        "jb .next;"
        "   "
        "   mov rax, rdx;"
        "   sal rax, 3;"
        "   add rdx, rax;"
        "   mov rax, rdx;"
        "   sar rax, 11;"
        "   xor rdx, rax;"
        "   mov rax, rdx;"
        "   sal rax, 15;"
        "   add rdx, rax;"
        "pop rbx;"
    :"=d"(hash)
    :"a"(hash), "c"(string->len), "b"(string->line_begin)
    );
#else
   for (unsigned int i = 0; i < string->len; ++i) {
        hash += string->line_begin[i];
        hash += (hash << 10);
        hash ^= (hash >> 6);
    }
    hash += (hash << 3);
    hash ^= (hash >> 11);
    hash += (hash << 15);
#endif
    return hash;
}

unsigned int MurmurHash2 (struct Line * string)
{
    const unsigned int m = 0x5bd1e995;
    const unsigned int seed = 0;
    unsigned int len = string->len;
    char * key = string->line_begin;

    unsigned int h = seed ^ len;

    const unsigned char * data = (const unsigned char *)key;
    unsigned int k = 0;

#ifdef _ASM_TEST_
    asm("push rsi;"
        "cmp rdi, 4;"
        "jb lower;"
        "next:"
        "   xor rbx, rbx;"
        "   xor r8, r8;"
        "   mov rbx, [rsi];"
        "   xor r8, r8;"
        "   mov r8b, [rsi + 1];"
        "   sal r8, 8;"
        "   or rbx, r8;"
        "   xor r8, r8;"
        "   mov r8b, [rsi + 2];"
        "   sal r8, 16;"
        "   or rbx, r8;"
        "   xor r8, r8;"
        "   mov r8b, [rsi + 3];"
        "   sal r8, 24;"
        "   or rbx, r8;"
        "   mov r8, rax;"
        "   mul rbx;"
        "   mov rbx, rax;"
        "   mov rax, r8;"
        "   sar rbx, 24;"
        "   mov r8, rax;"
        "   mov rax, rbx;"
        "   mul rcx;"
        "   mov rax, r8;"
        "   mov r8, rax;"
        "   mul rcx;"
        "   mov rax, r8;"
        "   xor rax, rbx;"
        "   add rsi, 4;"
        "   sub rdi, 4;"
        "   cmp rdi, 4;"
       "jae next;"
        ""
        ""
        "lower:"
        "xor r8, r8;"
        "cmp rdi, 1;"
        "je one;"
        "cmp rdi, 2;"
        "je two;"
        "cmp rdi, 3;"
        "je three;"
        ""
        "one:"
        "   xor rax, [rsi];"
        "   mul rcx;"
        "   jmp exit;"
        "two:"
        "   mov r8, [rsi + 1];"
        "   sal r8, 8;"
        "   xor rax, r8;"
        "   jmp exit;"
        "three:"
        "   mov r8, [rsi + 2];"
        "   sal r8, 16;"
        "   xor rax, r8;"
        "   jmp exit;"
        "exit:"
        "   mov r8, rax;"
        "   sar r8, 13;"
        "   mul rcx;"
        "   sar r8, 15;"
        "   xor rax, r8;"
        "   pop rsi"
        :"=a"(h)
        :"S"(data), "a"(h), "c"(m), "b"(k), "D"(len)
            );

#else
    while (len >= 4)
    {
        k  = data[0];
        k |= data[1] << 8;
        k |= data[2] << 16;
        k |= data[3] << 24;

        k *= m;
        k ^= k >> 24;
        k *= m;

        h *= m;
        h ^= k;

        data += 4;
        len -= 4;
    }

    switch (len)
    {
        case 3:
            h ^= data[2] << 16;
        case 2:
            h ^= data[1] << 8;
        case 1:
            h ^= data[0];
            h *= m;
    };

    h ^= h >> 13;
    h *= m;
    h ^= h >> 15;
#endif

    return h;
}


