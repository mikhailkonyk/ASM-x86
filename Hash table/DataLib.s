	.file	"DataLib.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"DataLib.c"
.LC1:
	.string	"file"
	.text
	.globl	file_size
	.type	file_size, @function
file_size:
.LFB5:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	cmp	QWORD PTR -24[rbp], 0
	jne	.L2
	lea	rcx, __PRETTY_FUNCTION__.2979[rip]
	mov	edx, 13
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	__assert_fail@PLT
.L2:
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, 2
	mov	esi, 0
	mov	rdi, rax
	call	fseek@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	ftell@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	edx, 0
	mov	esi, 0
	mov	rdi, rax
	call	fseek@PLT
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	file_size, .-file_size
	.section	.rodata
.LC2:
	.string	"mode == 1 || mode == 2"
	.text
	.globl	create_array
	.type	create_array, @function
create_array:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	DWORD PTR -44[rbp], esi
	cmp	QWORD PTR -40[rbp], 0
	jne	.L5
	lea	rcx, __PRETTY_FUNCTION__.2985[rip]
	mov	edx, 38
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	__assert_fail@PLT
.L5:
	cmp	DWORD PTR -44[rbp], 1
	je	.L6
	cmp	DWORD PTR -44[rbp], 2
	je	.L6
	lea	rcx, __PRETTY_FUNCTION__.2985[rip]
	mov	edx, 39
	lea	rsi, .LC0[rip]
	lea	rdi, .LC2[rip]
	call	__assert_fail@PLT
.L6:
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	file_size
	mov	QWORD PTR -32[rbp], rax
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	copy_data
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	count_lines
	cdqe
	mov	QWORD PTR -16[rbp], rax
	mov	esi, 16
	mov	edi, 1
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 1
	mov	esi, 16
	mov	rdi, rax
	call	calloc@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	mov	QWORD PTR 8[rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	edit_data
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	create_array, .-create_array
	.section	.rodata
.LC3:
	.string	"f_size > 0"
.LC4:
	.string	"(data)"
	.text
	.globl	copy_data
	.type	copy_data, @function
copy_data:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	cmp	QWORD PTR -24[rbp], 0
	jne	.L9
	lea	rcx, __PRETTY_FUNCTION__.2994[rip]
	mov	edx, 66
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	__assert_fail@PLT
.L9:
	cmp	QWORD PTR -32[rbp], 0
	jne	.L10
	lea	rcx, __PRETTY_FUNCTION__.2994[rip]
	mov	edx, 67
	lea	rsi, .LC0[rip]
	lea	rdi, .LC3[rip]
	call	__assert_fail@PLT
.L10:
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 1
	mov	esi, 1
	mov	rdi, rax
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	jne	.L11
	lea	rcx, __PRETTY_FUNCTION__.2994[rip]
	mov	edx, 70
	lea	rsi, .LC0[rip]
	lea	rdi, .LC4[rip]
	call	__assert_fail@PLT
.L11:
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	esi, 1
	mov	rdi, rax
	call	fread@PLT
	mov	DWORD PTR -12[rbp], eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	copy_data, .-copy_data
	.section	.rodata
.LC5:
	.string	"data"
	.text
	.globl	count_lines
	.type	count_lines, @function
count_lines:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	cmp	QWORD PTR -24[rbp], 0
	jne	.L14
	lea	rcx, __PRETTY_FUNCTION__.3000[rip]
	mov	edx, 87
	lea	rsi, .LC0[rip]
	lea	rdi, .LC5[rip]
	call	__assert_fail@PLT
.L14:
	mov	DWORD PTR -16[rbp], 1
	mov	DWORD PTR -12[rbp], 0
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR -8[rbp], rax
.L18:
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	DWORD PTR -12[rbp], eax
	add	QWORD PTR -8[rbp], 1
	cmp	DWORD PTR -12[rbp], 10
	jne	.L15
	add	DWORD PTR -16[rbp], 1
	jmp	.L18
.L15:
	cmp	DWORD PTR -12[rbp], 0
	je	.L21
	jmp	.L18
.L21:
	nop
	mov	eax, DWORD PTR -16[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	count_lines, .-count_lines
	.section	.rodata
.LC6:
	.string	"text"
	.text
	.globl	edit_data
	.type	edit_data, @function
edit_data:
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
	cmp	QWORD PTR -24[rbp], 0
	jne	.L23
	lea	rcx, __PRETTY_FUNCTION__.3010[rip]
	mov	edx, 116
	lea	rsi, .LC0[rip]
	lea	rdi, .LC6[rip]
	call	__assert_fail@PLT
.L23:
	cmp	QWORD PTR -32[rbp], 0
	jne	.L24
	lea	rcx, __PRETTY_FUNCTION__.3010[rip]
	mov	edx, 117
	lea	rsi, .LC0[rip]
	lea	rdi, .LC5[rip]
	call	__assert_fail@PLT
.L24:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR [rax], rdx
	mov	DWORD PTR -12[rbp], 0
	mov	QWORD PTR -8[rbp], 0
	mov	rax, QWORD PTR -32[rbp]
	mov	esi, 10
	mov	rdi, rax
	call	strchr@PLT
	mov	QWORD PTR -8[rbp], rax
	jmp	.L25
.L26:
	add	DWORD PTR -12[rbp], 1
	mov	rax, QWORD PTR -8[rbp]
	mov	BYTE PTR [rax], 0
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	sal	rax, 4
	mov	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rdx, QWORD PTR -8[rbp]
	add	rdx, 1
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -8[rbp]
	mov	edx, DWORD PTR -12[rbp]
	movsx	rdx, edx
	sal	rdx, 4
	lea	rcx, -16[rdx]
	mov	rdx, QWORD PTR -24[rbp]
	add	rdx, rcx
	mov	rdx, QWORD PTR [rdx]
	sub	rax, rdx
	mov	rdx, rax
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	sal	rax, 4
	lea	rcx, -16[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rcx
	mov	DWORD PTR 8[rax], edx
	mov	rax, QWORD PTR -8[rbp]
	add	rax, 1
	mov	esi, 10
	mov	rdi, rax
	call	strchr@PLT
	mov	QWORD PTR -8[rbp], rax
.L25:
	cmp	QWORD PTR -8[rbp], 0
	jne	.L26
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	edit_data, .-edit_data
	.section	.rodata
.LC7:
	.string	"my_array"
	.text
	.globl	free_memory
	.type	free_memory, @function
free_memory:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	cmp	QWORD PTR -8[rbp], 0
	jne	.L29
	lea	rcx, __PRETTY_FUNCTION__.3019[rip]
	mov	edx, 134
	lea	rsi, .LC0[rip]
	lea	rdi, .LC7[rip]
	call	__assert_fail@PLT
.L29:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	free_memory, .-free_memory
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.2979, @object
	.size	__PRETTY_FUNCTION__.2979, 10
__PRETTY_FUNCTION__.2979:
	.string	"file_size"
	.align 8
	.type	__PRETTY_FUNCTION__.2985, @object
	.size	__PRETTY_FUNCTION__.2985, 13
__PRETTY_FUNCTION__.2985:
	.string	"create_array"
	.align 8
	.type	__PRETTY_FUNCTION__.2994, @object
	.size	__PRETTY_FUNCTION__.2994, 10
__PRETTY_FUNCTION__.2994:
	.string	"copy_data"
	.align 8
	.type	__PRETTY_FUNCTION__.3000, @object
	.size	__PRETTY_FUNCTION__.3000, 12
__PRETTY_FUNCTION__.3000:
	.string	"count_lines"
	.align 8
	.type	__PRETTY_FUNCTION__.3010, @object
	.size	__PRETTY_FUNCTION__.3010, 10
__PRETTY_FUNCTION__.3010:
	.string	"edit_data"
	.align 8
	.type	__PRETTY_FUNCTION__.3019, @object
	.size	__PRETTY_FUNCTION__.3019, 12
__PRETTY_FUNCTION__.3019:
	.string	"free_memory"
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
