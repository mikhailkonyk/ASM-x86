global main

extern print_str

section .text

main:
	mov rdi, arg

	mov rax, 0
	call print_str
	
	
	mov rax, 0x3c
	xor rdi, rdi	
	syscall

section .data

arg	db	"this is string", 0xa, 0
