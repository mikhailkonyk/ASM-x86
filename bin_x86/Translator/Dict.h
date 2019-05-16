//
// Created by mikhail on 12.05.19.
//

#ifndef TRANSLATOR_DICT_H
#define TRANSLATOR_DICT_H

enum COMMANDS {
    //--------------------------------
    CMD_PUSH           =     1,   //
    CMD_PUSH_REG       =    11,   //
    CMD_PUSH_RAM       =    12,
    CMD_PUSH_RAM_REG   =    13,
    CMD_PUSH_RAM_REG_SUM=   14,
    //--------------------------------
    CMD_POP            =     2,   //
    CMD_POP_RAM        =    21,
    CMD_POP_REG        =    22,
    CMD_POP_RAM_REG    =    23,
    CMD_POP_RAM_REG_SUM=    24,
    //--------------------------------
    CMD_SUM            =     3,   //
    CMD_MUL            =     4,   //
    CMD_DIV            =     5,   //
    CMD_SUB            =     6,   //
    CMD_SQRT           =     7,   //
    //--------------------------------
    CMD_JMP           =     80,   //
    CMD_JE            =     81,   //
    CMD_JNE           =     82,   //
    CMD_JA            =     83,   //
    CMD_JAE           =     84,   //
    CMD_JB            =     85,   //
    CMD_JBE           =     86,   //
    //--------------------------------
    CMD_CALL          =     30,   //
    CMD_RET           =     31,   //
    //--------------------------------
    CMD_OUT           =     91,
    CMD_IN            =     92,
    CMD_NOP           =     100,  //
    CMD_START         =     101,  //
    CMD_END           =     102   //
    //--------------------------------
};

enum MACHINE_OPCODES {
    push_ax				=	0x50,
    push_bx				=	0x53,
    push_cx				=	0x51,
    push_dx				=	0x52,
    push_m_ax			= 	0xff70,
    pushm_bx			=	0xff73,
    pushm_cx			=	0xff71,
    pushm_dx			=	0xff72,
    push_num			=	0x68,

    pop_ax				=	0x58,
    pop_bx				=	0x5b,
    pop_cx				=	0x59,
    pop_dx				=	0x5a,
    popm_ax				=	0x8f40,
    popm_bx				=	0x8f43,
    popm_cx				=	0x8f41,
    popm_dx				=	0x8f42,

    jmp_short			=	0xeb,
    jmp_near            =   0xe9,
    je					=	0x74,
    jne					=	0x75,
    jb					=	0x72,
    jbe					=	0x76,
    ja					=	0x77,
    jae					=	0x73,
    nop					=	0x90,
    call				=	0xe8,
    ret					=	0xc3
};

#endif //TRANSLATOR_DICT_H
