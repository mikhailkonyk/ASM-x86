;--------------------------------------------------------------------
;
;	There is example for the future progs
;
;--------------------------------------------------------------------

section .code

global _start                   ; predefined entry point name for ld
extern strlen, digtostr, digtohex, digtobin, printf

_start:
            mov rdi, msg2
	    call strlen
            
	    mov rcx, 0x0a
	    mov rdx, rax
	    mov rsi, msg2
	    mov rdi, String
	    call printf

            mov rax, 0x3c        ; exit (ebx)
            xor rdi, rdi
            syscall

section     .data

String:	    db 'strlen(%s) %d %c', 0
Msg:        db 'Hello_world', 0x0a, 0
str:	    db 'It is string!', 0
msg2:	    db 'Love and cats', 0
