//
// Created by mikhail on 16.05.19.
//

#ifndef TRANSLATOR_COMPONENTS_H
#define TRANSLATOR_COMPONENTS_H
#include <stdlib.h>

#define FILESIZE 4096
#define ENTRY_POINT 0x8048000
#define DATA_SEG_SIZE 25

typedef unsigned char type;

struct byte {
    long cmd_num;
    unsigned char * trn_ptr;
    bool is_jmp;
};

struct ByteCode {
    struct byte * buffer;
    size_t buf_size;
};

struct ExeCode {
    unsigned char * exe;
    size_t lenght;
};

int CreateTokens(char ** str_tokens, struct ByteCode * source);

struct ByteCode * LoadByteCode();

struct ExeCode * Translate(struct ByteCode * source);

int TransformLabels (struct ExeCode * com, struct ByteCode * source);

int CreateELF(struct ExeCode * com);

#endif //TRANSLATOR_COMPONENTS_H
