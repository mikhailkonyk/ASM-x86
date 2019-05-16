//
// Created by mikhail on 11.05.19.
//

#ifndef TRANSLATOR_CODETABLES_H
#define TRANSLATOR_CODETABLES_H

#include "Dict.h"

#define setptr  source->buffer[curr_token].trn_ptr = executable;

#define loadbyte(byte)  {   int value = byte;                   \
                            memcpy(executable, &value, 1);      \
                            curr_exe++;                         \
                            executable = begin_exe + curr_exe;  \
}

#define loadword(word)  {   int value = word;       \
                            memcpy(executable, &value, 2);      \
                            curr_exe+=2;                        \
                            executable = begin_exe + curr_exe;  \
}


#define loaddword(dword) {  int value = dword;     \
                            memcpy(executable, &value, 4);      \
                            curr_exe+=4;                        \
                            executable = begin_exe + curr_exe;  \
}


#define loadqword(qword) {  long long value = qword;\
                            memcpy(executable, &value, 8);      \
                            curr_exe+=8;                        \
                            executable = begin_exe + curr_exe;  \
}

#define loadint(integer) {  int value = integer;                \
                            memcpy(executable, &value, 4);      \
                            curr_exe+=4;                        \
                            executable = begin_exe + curr_exe;  \
}

#define cond_jmp(CMD)    {  source->buffer[curr_token].is_jmp = true;\
                                                                \
                                                                \
                            loaddword(__bswap_32(0x5e393424))   \
                            loadbyte(0x56)                      \
                            switch(CMD){                        \
                                case(CMD_JE): setptr            \
                                    loadbyte(je) break;         \
                            case(CMD_JNE):    setptr            \
                                loadbyte(jne) break;            \
                            case(CMD_JA):     setptr            \
                                loadbyte(ja) break;             \
                            case(CMD_JAE):   setptr             \
                                loadbyte(jae) break;            \
                            case(CMD_JB):    setptr             \
                                loadbyte(jb) break;             \
                            case(CMD_JBE):   setptr             \
                                loadbyte(jbe) break;            \
                                    }                           \
                                                                \
                            loadbyte(0x00)                      \
                            curr_token++;                       \
                            }

TRN( CMD_END, {     setptr
                    loadqword(__bswap_64(0xb80100000031dbcd))
                    loadbyte(0x80)
});

TRN( CMD_RET, {     setptr loadbyte(ret) });


TRN( CMD_PUSH_REG, {setptr
                    curr_token++;
                    switch(source->buffer[curr_token].cmd_num) {
                        case('a'): loadbyte(push_ax) break;
                        case('b'): loadbyte(push_bx) break;
                        case('c'): loadbyte(push_cx) break;
                        case('d'): loadbyte(push_dx) break;
                    }
});

TRN( CMD_PUSH,     {setptr
                    curr_token++;
                    int num = source->buffer[curr_token].cmd_num;
                    if (num >= 128) { loadbyte(push_num)
                                      loadint(num)
                    }
                    else { loadbyte(0x6a)
                           loadbyte(num)
                    }
});


TRN( CMD_POP_REG,  {setptr
                    curr_token++;
                    switch(source->buffer[curr_token].cmd_num) {
                    case('a'): loadbyte(pop_ax) break;
                    case('b'): loadbyte(pop_bx) break;
                    case('c'): loadbyte(pop_cx) break;
                    case('d'): loadbyte(pop_dx) break;
                    }
});

TRN( CMD_POP,      { setptr
                     loadbyte(0x5e)})

//---------------------------------------------------------------------------------------------------

TRN( CMD_SUM, { setptr
                loaddword(__bswap_32(0x5e013424))});

TRN( CMD_SUB, { setptr
                loaddword(__bswap_32(0x5e293424))});

TRN( CMD_MUL, { setptr
                loadqword(__bswap_64(0x89c789d65a58f7e2))
                loaddword(__bswap_32(0x5089f289))
                loadbyte(0xf8)});

TRN( CMD_DIV, { setptr
                loadqword(__bswap_64(0x5e89c758575231d2))
                loadqword(__bswap_64(0xf7f689c65a585690))});
//----------------------------------------------------------------------------------------------------

TRN( CMD_CALL,{ setptr
                source->buffer[curr_token].is_jmp = true;
                curr_token++;
                loadbyte(call)
                int address_place = 0;
                loadint(address_place)
               });

TRN( CMD_JMP, { setptr
                source->buffer[curr_token].is_jmp = true;
                curr_token++;
                loadbyte(0x00)             // place to jmp(shor or near) cmd
                loaddword(0x00)            // place to address
                });

TRN( CMD_JE,  { cond_jmp(CMD_JE)});

TRN( CMD_JNE,  { cond_jmp(CMD_JNE)});

TRN( CMD_JA,  { cond_jmp(CMD_JA) });

TRN( CMD_JAE,  { cond_jmp(CMD_JAE)});

TRN( CMD_JB,  { cond_jmp(CMD_JB) });

TRN( CMD_JBE,  { cond_jmp(CMD_JBE)});

TRN( CMD_NOP, { setptr loadbyte(nop)});


//-----------------------------------------------------------------------------------------------------

TRN( CMD_OUT, { setptr
                loadbyte(0xc7) loadbyte(0x05) loaddword(0x08049100) loaddword(0x00)
                loadbyte(0xc7) loadbyte(0x05) loaddword(0x08049104) loaddword(0x00)
                loadbyte(0xc6) loadbyte(0x05) loaddword(0x08049108) loadbyte(0xa)
                loadbyte(0xbf) loaddword(0x08049100)
                loadbyte(0x5e)
                int offset = source->buffer[curr_token].trn_ptr - begin_exe;
                loadbyte(call) loaddword(0x500 - sizeof(Elf32_Ehdr)
                - 4 * sizeof(Elf32_Phdr) - offset - 38)
                loadbyte(0xc7) loadbyte(0x05) loaddword(0x08049100) loaddword(0x00)
                loadbyte(0xc6) loadbyte(0x05) loaddword(0x08049108) loadbyte(0xa) });

TRN( CMD_IN, { setptr
               loadbyte(0xc6) loadbyte(0x05) loaddword(0x08049110) loadbyte(0x00)
               int offset = source->buffer[curr_token].trn_ptr - begin_exe;
               loadbyte(call) loaddword(0x600 - sizeof(Elf32_Ehdr)
               - 4 * sizeof(Elf32_Phdr) - offset - 18)
               loadbyte(0xc7) loadbyte(0x05) loaddword(0x08049100) loaddword(0x00)});


#endif //TRANSLATOR_CODETABLES_H
