	.file	"List.c"
	.intel_syntax noprefix
	.text
	.globl	signal
	.section	.rodata
	.align 4
	.type	signal, @object
	.size	signal, 4
signal:
	.long	-1092960550
.LC0:
	.string	"Could not allocate memory"
	.text
	.globl	create_List
	.type	create_List, @function
create_List:
.LFB5:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	esi, 40
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	jne	.L2
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L3
.L2:
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], 0
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rax], 0
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 24[rax], 0
	mov	edx, -1092960550
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR [rax], edx
	mov	edx, -1092960550
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 36[rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -8[rbp]
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	create_List, .-create_List
	.section	.rodata
.LC1:
	.string	"Your List isn't OKAY"
	.text
	.globl	erase_List
	.type	erase_List, @function
erase_List:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L5
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L6
.L5:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L7
.L8:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rax], rdx
.L7:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L8
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
.L6:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	erase_List, .-erase_List
	.globl	create_Node
	.type	create_Node, @function
create_Node:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	esi, 40
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	jne	.L10
	lea	rdi, .LC0[rip]
	call	puts@PLT
	mov	eax, 0
	jmp	.L11
.L10:
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], 0
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 24[rax], 0
	mov	edx, -1092960550
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 16[rax], edx
	mov	edx, -1092960550
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 36[rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -8[rbp]
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	create_Node, .-create_Node
	.section	.rodata
.LC2:
	.string	"Your Node isn't OKAY"
	.text
	.globl	delete_Node
	.type	delete_Node, @function
delete_Node:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L13
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L14
.L13:
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	NodeOk
	cmp	eax, 1
	je	.L15
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L14
.L15:
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L16
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR 24[rax], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L17
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L14
.L17:
	mov	eax, 0
	jmp	.L14
.L16:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L18
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	QWORD PTR 8[rax], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L19
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L14
.L19:
	mov	eax, 0
	jmp	.L14
.L18:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L20
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L14
.L20:
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
.L14:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	delete_Node, .-delete_Node
	.globl	push_back
	.type	push_back, @function
push_back:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L22
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L23
.L22:
	mov	eax, 0
	call	create_Node
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	test	rax, rax
	jne	.L24
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	lea	rdx, 1[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L25
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L23
.L25:
	mov	eax, 0
	jmp	.L23
.L24:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	lea	rdx, 1[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L26
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L23
.L26:
	mov	eax, 0
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	push_back, .-push_back
	.globl	push_front
	.type	push_front, @function
push_front:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L28
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L29
.L28:
	mov	eax, 0
	call	create_Node
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	test	rax, rax
	jne	.L30
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	lea	rdx, 1[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L31
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L29
.L31:
	mov	eax, 0
	jmp	.L29
.L30:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 8[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	lea	rdx, 1[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 8[rax]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L32
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L29
.L32:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	NodeOk
	cmp	eax, 1
	je	.L33
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L29
.L33:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	rax, QWORD PTR 8[rax]
	mov	rdi, rax
	call	NodeOk
	cmp	eax, 1
	je	.L34
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L29
.L34:
	mov	eax, 0
.L29:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	push_front, .-push_front
	.section	.rodata
.LC3:
	.string	"\nYou want to pop clear List"
	.text
	.globl	pop_back
	.type	pop_back, @function
pop_back:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L36
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L37
.L36:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	test	rax, rax
	jne	.L38
	lea	rdi, .LC3[rip]
	call	puts@PLT
	mov	eax, 8
	jmp	.L37
.L38:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	QWORD PTR 8[rax], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	lea	rdx, -1[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L39
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L37
.L39:
	mov	rax, QWORD PTR -8[rbp]
.L37:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	pop_back, .-pop_back
	.section	.rodata
	.align 8
.LC4:
	.string	"\nThere is\n    struct List \"your_list\" [%p]\n    size = %ld\n"
.LC5:
	.string	"    [%d] = %p\n"
	.text
	.globl	print_List
	.type	print_List, @function
print_List:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L41
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L42
.L41:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR 24[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	jmp	.L43
.L44:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
	add	DWORD PTR -12[rbp], 1
.L43:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L44
	mov	eax, 0
.L42:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	print_List, .-print_List
	.section	.rodata
.LC6:
	.string	"List/List.c"
.LC7:
	.string	"begin_search"
.LC8:
	.string	"value_to_find"
	.text
	.globl	Node_FindNext
	.type	Node_FindNext, @function
Node_FindNext:
.LFB13:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	NodeOk
	cmp	eax, 1
	je	.L46
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L47
.L46:
	cmp	QWORD PTR -24[rbp], 0
	jne	.L48
	lea	rcx, __PRETTY_FUNCTION__.3091[rip]
	mov	edx, 241
	lea	rsi, .LC6[rip]
	lea	rdi, .LC7[rip]
	call	__assert_fail@PLT
.L48:
	cmp	QWORD PTR -32[rbp], 0
	jne	.L49
	lea	rcx, __PRETTY_FUNCTION__.3091[rip]
	mov	edx, 242
	lea	rsi, .LC6[rip]
	lea	rdi, .LC8[rip]
	call	__assert_fail@PLT
.L49:
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR -8[rbp], rax
	jmp	.L50
.L52:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR 8[rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR 8[rax]
	cmp	edx, eax
	jne	.L51
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rax, QWORD PTR [rax]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L51
	mov	rax, QWORD PTR -8[rbp]
	jmp	.L47
.L51:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
.L50:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L52
	mov	rax, QWORD PTR -8[rbp]
.L47:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	Node_FindNext, .-Node_FindNext
	.globl	Node_CalculateIndex
	.type	Node_CalculateIndex, @function
Node_CalculateIndex:
.LFB14:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	NodeOk
	cmp	eax, 1
	je	.L54
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L55
.L54:
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L56
.L57:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -8[rbp], rax
	add	DWORD PTR -12[rbp], 1
.L56:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L57
	mov	eax, DWORD PTR -12[rbp]
.L55:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	Node_CalculateIndex, .-Node_CalculateIndex
	.globl	InsertAfter
	.type	InsertAfter, @function
InsertAfter:
.LFB15:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	NodeOk
	cmp	eax, 1
	je	.L59
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L60
.L59:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L61
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L60
.L61:
	mov	eax, 0
	call	create_Node
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	jne	.L62
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	push_back
	mov	eax, 0
	jmp	.L60
.L62:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	lea	rdx, 1[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L63
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L60
.L63:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	NodeOk
	cmp	eax, 1
	je	.L64
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L60
.L64:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	NodeOk
	cmp	eax, 1
	je	.L65
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L60
.L65:
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	NodeOk
	cmp	eax, 1
	je	.L66
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L60
.L66:
	mov	eax, 0
.L60:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	InsertAfter, .-InsertAfter
	.globl	InsertBefore
	.type	InsertBefore, @function
InsertBefore:
.LFB16:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	NodeOk
	cmp	eax, 1
	je	.L68
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L69
.L68:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L70
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L69
.L70:
	mov	eax, 0
	call	create_Node
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	jne	.L71
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	push_front
	mov	eax, 0
	jmp	.L69
.L71:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 24[rax]
	lea	rdx, 1[rax]
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR 24[rax], rdx
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 16[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ListOk
	cmp	eax, 1
	je	.L72
	lea	rdi, .LC1[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L69
.L72:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	NodeOk
	cmp	eax, 1
	je	.L73
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L69
.L73:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	NodeOk
	cmp	eax, 1
	je	.L74
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L69
.L74:
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	NodeOk
	cmp	eax, 1
	je	.L75
	lea	rdi, .LC2[rip]
	call	puts@PLT
	mov	eax, 2
	jmp	.L69
.L75:
	mov	eax, 0
.L69:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	InsertBefore, .-InsertBefore
	.section	.rodata
	.align 8
.LC9:
	.string	"Your List has valid poiner, your_list [NULL]"
	.align 8
.LC10:
	.string	"Security list has been breached,\n                canary 1 == %x, canary 2 == %x, but should be\n                canary 1 == %x, canary 2 == %x\n"
	.align 8
.LC11:
	.string	"Invalid checksum, \nyour_list -> checksum = %d, but should be\n               your_list -> checksum = %d\n"
	.text
	.globl	ListOk
	.type	ListOk, @function
ListOk:
.LFB17:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	cmp	QWORD PTR -8[rbp], 0
	jne	.L77
	lea	rdi, .LC9[rip]
	call	puts@PLT
	mov	eax, 4
	jmp	.L78
.L77:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	mov	edx, -1092960550
	cmp	eax, edx
	jne	.L79
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 36[rax]
	mov	edx, -1092960550
	cmp	eax, edx
	je	.L80
.L79:
	mov	esi, -1092960550
	mov	ecx, -1092960550
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR 36[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR [rax]
	mov	r8d, esi
	mov	esi, eax
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 5
	jmp	.L78
.L80:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 32[rax]
	cmp	edx, eax
	je	.L81
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	ecx, eax
	mov	eax, ecx
	sal	eax, 5
	sub	eax, ecx
	mov	ecx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	imul	eax, eax, 28
	add	eax, ecx
	mov	ecx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 32[rax], ecx
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 32[rax]
	mov	esi, eax
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 7
	jmp	.L78
.L81:
	mov	eax, 1
.L78:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	ListOk, .-ListOk
	.section	.rodata
	.align 8
.LC12:
	.string	"Your Node has valid poiner, your_node [NULL]"
	.align 8
.LC13:
	.string	"Security node has been breached,\n                canary 1 == %x, canary 2 == %x, but should be\n                canary 1 == %x, canary 2 == %x\n"
	.align 8
.LC14:
	.string	"Invalid checksum, \nyour_node -> checksum = %d, but should be\n               your_node -> checksum = %d\n"
	.text
	.globl	NodeOk
	.type	NodeOk, @function
NodeOk:
.LFB18:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	cmp	QWORD PTR -8[rbp], 0
	jne	.L83
	lea	rdi, .LC12[rip]
	call	puts@PLT
	mov	eax, 3
	jmp	.L84
.L83:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	edx, -1092960550
	cmp	eax, edx
	jne	.L85
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 36[rax]
	mov	edx, -1092960550
	cmp	eax, edx
	je	.L86
.L85:
	mov	esi, -1092960550
	mov	ecx, -1092960550
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR 36[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 16[rax]
	mov	r8d, esi
	mov	esi, eax
	lea	rdi, .LC13[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 5
	jmp	.L84
.L86:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	edx, eax
	mov	eax, edx
	sal	eax, 5
	sub	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, edx
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 32[rax], edx
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 32[rax]
	cmp	edx, eax
	je	.L87
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR 32[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	ecx, eax
	mov	eax, ecx
	sal	eax, 5
	sub	eax, ecx
	mov	ecx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 8[rax]
	imul	eax, eax, 28
	add	eax, ecx
	mov	ecx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	DWORD PTR 32[rax], ecx
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 32[rax]
	mov	esi, eax
	lea	rdi, .LC14[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 7
	jmp	.L84
.L87:
	mov	eax, 1
.L84:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	NodeOk, .-NodeOk
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.3091, @object
	.size	__PRETTY_FUNCTION__.3091, 14
__PRETTY_FUNCTION__.3091:
	.string	"Node_FindNext"
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
