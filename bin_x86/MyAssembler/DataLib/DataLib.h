//
// Created by mikhail on 20.04.19.
//

#ifndef HASH_TABLE_DATALIB_C_H
#define HASH_TABLE_DATALIB_C_H


struct Line
{
    char * line_begin;
    int len;
};

struct text_array
{
    char ** text;
    size_t len;
};

size_t file_size(FILE * file);
struct text_array * create_array(FILE * file, const int mode);
char * copy_data(FILE * file, size_t f_size);
int count_lines(char * data);
int edit_data(char ** text, char * data, const int mode);
int free_memory(struct text_array * my_array);

#endif //HASH_TABLE_DATALIB_C_H
