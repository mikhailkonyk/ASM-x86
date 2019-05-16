#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include "DataLib/DataLib.h"
#include "../ServiceIdentifiers.h"
#include "Vector/Vector.h"

int AssembleCode(FILE * commands, FILE * bytecode_file);
int CheckCommand(char * line, char * help_line, FILE * bytecode_file,
				FILE * commands, struct Stack * Table);

int CreateLabelTable(text_array * code , struct Stack * table) {
	assert(code);
	assert(table);
	int cur_point = 0;
	int i = 0;
	while(strcmp(code->text[i], "end") != 0) {
		if (code->text[i][0] == ':') {
			struct Label * point = (struct Label *) calloc(1, sizeof(Label));
			point->name = &code->text[i][1];
			point->address = cur_point;
			VectorPush(table, point);
		} else ++cur_point;
		++i;
	}
	return 0;
}

int AssembleCode(FILE * commands, FILE * bytecode_file, struct Stack * Table) {
	if (bytecode_file == NULL || commands == NULL) return FILE_ERROR;

	char * line = (char *)calloc(INITIAL_LINE, sizeof(char));
	char * help_line = (char *)calloc(INITIAL_LINE, sizeof(char));

	while (fscanf(commands, " %128s", line) != EOF) {
		int ret = CheckCommand(line, help_line, bytecode_file, commands, Table);
		if (ret < 0) return ret;
	}
	free(line);
	free(help_line);
	return 0;
}


int CheckCommand(char * line, char * help_line, FILE * bytecode_file,
				FILE * commands, struct Stack * Table) {
	if (line == NULL) return PTR_ERROR;
	if (bytecode_file == NULL || commands == NULL) return FILE_ERROR;


	int arg = 0;
	char ch_arg1 = 0;
	char ch_arg2 = 0;
	char reg_name = 0;

	#define DEF_CMD(name, num, CODE_ASM, CODE_CPU) \
    if (strcmp(name, line) == 0){                  \
                                                   \
        CODE_ASM                                   \
												   \
    }

	#include "../commands.h"

	return 0;
}

int main()
{
	FILE * commands = fopen("/home/mikhail/Документы/PROJECTS/xxBinaryTranslatorxx/source.txt", "rb");
	FILE * bytecode_file = fopen("/home/mikhail/Документы/PROJECTS/xxBinaryTranslatorxx/bytecode.txt", "w");

	if (commands == NULL || bytecode_file == NULL) {
		return FILE_ERROR;
	}

	struct Stack * Table = InitVector();
	struct text_array * data = create_array(commands, 2);

	if(CreateLabelTable(data, Table))
		return -1;
	int ret = AssembleCode(commands, bytecode_file, Table);
	if (ret == 0)
		printf("Assembly was successful.\n");
	else
		printf("ASSEMBLY ERROR, CHECK YOUR CODE!!!\n");

	fclose(commands);
	fclose(bytecode_file);
	//VectorDump(Table);
	VectorDestruct(Table);
	free_memory(data);
	return ret;
}