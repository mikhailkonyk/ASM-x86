//
// Created by mikhail on 20.04.19.
//
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
#include <string.h>
#include "DataLib.h"

size_t file_size(FILE * file)
{
    assert(file);
    size_t symbol_number = 0;

    fseek(file, 0, SEEK_END);
    symbol_number = ftell(file);
    fseek(file, 0, SEEK_SET);

    return symbol_number;
}

/**
@function
The function creates a copy of the file,\n
calculates its size, splits it into lines,\n
calculates the number of lines in it, sorts them.
@param file - Pointer to read file;
@param text - Array with pointers to strings;
@param data - Array - a copy of the file;
@param mode - Sorting mode(1 or 2);
@param n_lines - Pointer to the number of lines in the file;
@return 0 - if program the program was successful.
*/

struct text_array * create_array(FILE * file, const int mode)
{
    assert(file);
    assert(mode == 1 || mode == 2);

    size_t f_size = file_size(file);

    char * data = copy_data (file, f_size);

    size_t n_lines = count_lines(data);

    struct text_array * my_array = (struct text_array *) calloc(1, sizeof(struct text_array));
    my_array->text = (struct Line *) calloc(n_lines + 1, sizeof(struct Line));
    my_array->len = n_lines;
    edit_data(my_array->text, data);

    return my_array;
}

/**
@function
Creates an array into which it copies the data of the file,\n
appends a '\ 0' at the end.
@param file - Pointer to read file;
@param f_size - File size.
@return data - Array - a copy of the file.
*/

char * copy_data(FILE * file, size_t f_size)
{
    assert(file);
    assert(f_size > 0);

    char * data = (char *) calloc(f_size + 1, sizeof(char));
    assert((data));


    fread(data, sizeof(char), f_size, file);

    fclose(file);

    return data;
}

/**
@function
@param file - Pointer to read file;
@return n_lines - Number of lines in file.
*/
int count_lines(char * data)
{
    assert (data);
    int n_lines = 1;

    int symbol = 0;
    char* data_save = data;
    while (true)
    {
        symbol = *data_save;
        data_save++;

        if (symbol == '\n')
            n_lines++;
        else if (symbol == 0)
            break;
    }
    return n_lines;
}

/**
@function
The function replaces '\ n' with
 '\ 0' in the array with file data,
@param text - Array with pointers to strings;
@param data - Array - a copy of the file;
@return 0 - if program the program was successful.
*/

int edit_data(struct Line * text, char * data)
{
    assert(text);
    assert(data);

    text[0].line_begin = data;
    int i = 0;

    char *s = 0;
    for(s = strchr(data, '\n'); s != NULL ; s = strchr(s + 1, '\n'))
    {
        ++i;
        *s = 0;
        text[i].line_begin = s + 1;
        text[i - 1].len = s - text[i-1].line_begin;
    }
    return 0;
}

int free_memory(struct text_array * my_array) {
    assert(my_array);

    free(my_array->text);
    free(my_array);
    return 0;
}