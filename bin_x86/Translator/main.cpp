#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <zconf.h>
#include <string.h>
#include <elf.h>
#include "Components.h"
#include "Dict.h"
#include "../MyAssembler/DataLib/DataLib.h"


int CreateTokens(char ** str_tokens, struct ByteCode * source){
    assert(str_tokens);
    assert(source);

    source->buffer = (struct byte *) calloc(source->buf_size, sizeof(struct byte));
    char* end;

    for (unsigned int i = 0; i < source->buf_size; ++i) {
        source->buffer[i] = {strtol(str_tokens[i], &end, 10), nullptr, false};
    }

    return 0;
};

struct ByteCode * LoadByteCode() {
    FILE * input = fopen("/home/mikhail/Документы/PROJECTS/xxBinaryTranslatorxx/bytecode.txt", "rb");
    assert(input);

    struct ByteCode * source = (struct ByteCode *) calloc (1, sizeof(struct ByteCode));
    char ** str_tokens = nullptr;
    char * data =  copy_data(input, file_size(input));
    edit_data(str_tokens, data, 1);
    str_tokens = (char **) calloc((size_t)count_lines(data), sizeof(char *));
    source->buf_size = (size_t) edit_data(str_tokens, data, 3);

    CreateTokens(str_tokens, source);

    free(data);
    free(str_tokens);
    free(data);
    fclose(input);
    return source;
}

struct ExeCode * Translate(struct ByteCode * source) {
    assert(source);

    type * executable = (type*) calloc(FILESIZE, 1);
    type * begin_exe = executable;
    unsigned int curr_token = 0;
    int curr_exe = 0;
    for (curr_token = 0; (curr_token) < (source->buf_size); ++(curr_token)) {

        #define TRN( cmd, instrc )  \
                                    \
            case (cmd): {           \
                instrc;             \
                break;              \
            }

        switch (source->buffer[curr_token].cmd_num)
        {

            #include "CodeTables.h"

        }

        #undef TRN

    }

    struct ExeCode * com = (struct ExeCode *) calloc(1, sizeof(struct ExeCode));
    com->exe = begin_exe;
    com->lenght = (size_t) curr_exe;

    return com;

}

int TransformLabels (struct ExeCode * com, struct ByteCode * source) {
    assert(com);
    assert(source);

    unsigned char * ptr_src = nullptr;
    unsigned char * ptr_dst = nullptr;
    unsigned char * executable = nullptr;
    unsigned char * begin_exe = nullptr;
    int curr_exe = 0;

    for(unsigned int curr_token = 0; curr_token < source->buf_size ; ++curr_token) {
        long cmd = source->buffer[curr_token].cmd_num;
        if (cmd == CMD_JMP &&
            source->buffer[curr_token].is_jmp)
        {

            long str_num = source->buffer[curr_token + 1].cmd_num ;

            ptr_dst = source->buffer[str_num ].trn_ptr;
            ptr_src = source->buffer[curr_token ].trn_ptr;
            assert(ptr_dst && ptr_src);

            int curr_exe = 0;
            long rel_adr = (ptr_dst - ptr_src);
            begin_exe = source->buffer[curr_token].trn_ptr;
            executable = begin_exe;


            if (rel_adr > 0) rel_adr -= 2;
            else rel_adr -= 2;

                if (-128 <= rel_adr && rel_adr <= 127) {
                    loadbyte(jmp_short)
                    loadbyte(rel_adr)
                    loadbyte(nop)
                    loadbyte(nop)
                    loadbyte(nop)
                } else {
                    loadbyte(jmp_near)
                    loadint(rel_adr)
                }

        }

        else if (source->buffer[curr_token].is_jmp &&
                (cmd == CMD_JE || cmd == CMD_JNE || cmd == CMD_JA ||
                 cmd == CMD_JAE || cmd == CMD_JB || cmd == CMD_JBE))
        {
            long str_num = source->buffer[curr_token + 1].cmd_num;

            ptr_dst = source->buffer[str_num].trn_ptr;
            ptr_src = source->buffer[curr_token + 2].trn_ptr;

            curr_exe = 0;
            long rel_adr = ptr_dst - ptr_src;
            begin_exe = source->buffer[curr_token].trn_ptr+1;
            executable = begin_exe;
            loadbyte(rel_adr)

        }

        else if (cmd == CMD_CALL && source->buffer[curr_token].is_jmp)
        {
            long str_num = source->buffer[curr_token + 1].cmd_num;

            ptr_dst = source->buffer[str_num].trn_ptr;
            ptr_src = source->buffer[curr_token + 2].trn_ptr;
            assert(ptr_dst && ptr_src);

            curr_exe = 0;
            long rel_adr = ptr_dst - ptr_src;
            begin_exe = source->buffer[curr_token].trn_ptr + 1;
            executable = begin_exe;
            loadint(rel_adr)

        }

    }
    return 0;
}

int CreateELF(struct ExeCode * com) {
    assert(com);

    unsigned char * FunnyElf = (unsigned char *) calloc(FILESIZE, sizeof(char));

    type * ptr = FunnyElf;

//_________________Creating header__________________________________
    Elf32_Ehdr header;
    char a[] = {0x7f, 'E', 'L', 'F', 1, 1, 1, 0, 0};
    memcpy(header.e_ident, a, 9);
    header.e_type = 2;
    header.e_machine = 3;
    header.e_version = 1;
    header.e_entry = ENTRY_POINT + sizeof(Elf32_Ehdr) + 4 * sizeof(Elf32_Phdr);
    header.e_phoff = 52;
    header.e_shoff = 0;
    header.e_flags = 0;
    header.e_ehsize = 52;
    header.e_phentsize = 32;
    header.e_phnum = 3;
    header.e_shentsize = 0;
    header.e_shnum = 0;
    header.e_shstrndx = 0;

    memcpy(ptr, &header, sizeof(Elf32_Ehdr));
    ptr += sizeof(Elf32_Ehdr);
//_________________Creating Program hearer table____________________
    Elf32_Phdr CODE;
    CODE.p_type = PT_LOAD;
    CODE.p_offset = 0;
    CODE.p_vaddr = ENTRY_POINT ;
    CODE.p_paddr = ENTRY_POINT ;
    CODE.p_filesz = com->lenght;
    CODE.p_memsz = com->lenght;
    CODE.p_flags = PF_R | PF_X;
    CODE.p_align = 0x10;

    Elf32_Phdr DATA;
    DATA.p_type = PT_LOAD;
    DATA.p_offset = 0x100;
    DATA.p_vaddr = 0x08049100;
    DATA.p_paddr = 0x08049100;
    DATA.p_filesz = DATA_SEG_SIZE;
    DATA.p_memsz = DATA_SEG_SIZE;
    DATA.p_flags = PF_R | PF_W;
    DATA.p_align = 0x10;

    Elf32_Phdr OUTPUT;
    OUTPUT.p_type = PT_LOAD;
    OUTPUT.p_offset = 0x500;
    OUTPUT.p_vaddr = ENTRY_POINT + 0x500;
    OUTPUT.p_paddr = ENTRY_POINT + 0x500;
    OUTPUT.p_filesz = 100;
    OUTPUT.p_memsz = 100;
    OUTPUT.p_flags = PF_R | PF_X;
    OUTPUT.p_align = 0x10;

    Elf32_Phdr INPUT;
    INPUT.p_type = PT_LOAD;
    INPUT.p_offset = 0x600;
    INPUT.p_vaddr = ENTRY_POINT + 0x600;
    INPUT.p_paddr = ENTRY_POINT + 0x600;
    INPUT.p_filesz = 100;
    INPUT.p_memsz = 100;
    INPUT.p_flags = PF_R | PF_X;
    INPUT.p_align = 0x01;

    memcpy(ptr, &CODE, sizeof(Elf32_Phdr));
    ptr += sizeof(Elf32_Phdr);

    memcpy(ptr, &DATA, sizeof(Elf32_Phdr));
    ptr += sizeof(Elf32_Phdr);

    memcpy(ptr, &OUTPUT, sizeof(Elf32_Phdr));
    ptr += sizeof(Elf32_Phdr);

    memcpy(ptr, &INPUT, sizeof(Elf32_Phdr));
    ptr += sizeof(Elf32_Phdr);


    unsigned char * lib_in = (unsigned char *) calloc(100, 1);
    unsigned char * lib_out = (unsigned char *) calloc(100, 1);
    FILE * libfile1 = fopen("/home/mikhail/Документы/PROJECTS/xxBinaryTranslatorxx/IOLib/NEWFILE", "rb");
    assert(libfile1);
    fread(lib_out, 1, 100, libfile1);
    fclose(libfile1);

    FILE * libfile2 = fopen("/home/mikhail/Документы/PROJECTS/xxBinaryTranslatorxx/IOLib/INPUTLIB", "rb");
    assert(libfile2);
    fread(lib_in, 1, 100, libfile2);
    fclose(libfile2);

    memcpy(ptr, com->exe, com->lenght);
    memcpy(FunnyElf+0x500, lib_out, 100);
    memcpy(FunnyElf+0x600, lib_in, 100);

    FILE * output = fopen("/home/mikhail/Документы/PROJECTS/xxBinaryTranslatorxx/output", "wb");
    assert(output);

    fwrite(FunnyElf, sizeof(char), FILESIZE, output);
    fclose(output);

    return 0;
}

int main() {


    struct ByteCode * source = LoadByteCode();


    struct ExeCode * com = Translate(source);


    TransformLabels(com, source);


    CreateELF(com);


    free(com->exe);
    free(com);
    free(source->buffer);
    free(source);
    return 0;
}