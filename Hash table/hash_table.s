	.file	"hash_table.c"
	.intel_syntax noprefix
	.text
	.globl	TABLE_SIZE
	.section	.rodata
	.align 4
	.type	TABLE_SIZE, @object
	.size	TABLE_SIZE, 4
TABLE_SIZE:
	.long	128
	.globl	curr_hash
	.section	.data.rel,"aw",@progbits
	.align 8
	.type	curr_hash, @object
	.size	curr_hash, 8
curr_hash:
	.quad	MurmurHash2
	.section	.rodata
.LC0:
	.string	"hash_table.c"
.LC1:
	.string	"MyTable"
	.text
	.globl	create_table
	.type	create_table, @function
create_table:
.LFB5:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 40
	.cfi_offset 3, -24
	mov	QWORD PTR -40[rbp], rdi
	cmp	QWORD PTR -40[rbp], 0
	jne	.L2
	lea	rcx, __PRETTY_FUNCTION__.3174[rip]
	mov	edx, 17
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	__assert_fail@PLT
.L2:
	mov	eax, 128
	mov	eax, eax
	mov	esi, 8
	mov	rdi, rax
	call	calloc@PLT
	mov	rdx, rax
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR [rax], rdx
	mov	DWORD PTR -20[rbp], 0
	jmp	.L3
.L4:
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -20[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	lea	rbx, [rax+rdx]
	mov	eax, 0
	call	create_List@PLT
	mov	QWORD PTR [rbx], rax
	add	DWORD PTR -20[rbp], 1
.L3:
	mov	eax, DWORD PTR -20[rbp]
	mov	edx, 128
	cmp	eax, edx
	jb	.L4
	mov	eax, 0
	add	rsp, 40
	pop	rbx
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	create_table, .-create_table
	.globl	delete_table
	.type	delete_table, @function
delete_table:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	cmp	QWORD PTR -24[rbp], 0
	jne	.L7
	lea	rcx, __PRETTY_FUNCTION__.3182[rip]
	mov	edx, 27
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	__assert_fail@PLT
.L7:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L8
.L9:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	erase_List@PLT
	add	DWORD PTR -4[rbp], 1
.L8:
	mov	eax, DWORD PTR -4[rbp]
	mov	edx, 128
	cmp	eax, edx
	jb	.L9
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	delete_table, .-delete_table
	.section	.rodata
.LC2:
	.string	"data"
	.text
	.globl	hashing
	.type	hashing, @function
hashing:
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
	jne	.L12
	lea	rcx, __PRETTY_FUNCTION__.3191[rip]
	mov	edx, 36
	lea	rsi, .LC0[rip]
	lea	rdi, .LC2[rip]
	call	__assert_fail@PLT
.L12:
	cmp	QWORD PTR -32[rbp], 0
	jne	.L13
	lea	rcx, __PRETTY_FUNCTION__.3191[rip]
	mov	edx, 37
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	__assert_fail@PLT
.L13:
	mov	DWORD PTR -4[rbp], 0
	mov	DWORD PTR -8[rbp], 0
	jmp	.L14
.L15:
	mov	rax, QWORD PTR curr_hash[rip]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rdx]
	mov	ecx, DWORD PTR -8[rbp]
	movsx	rcx, ecx
	sal	rcx, 4
	add	rdx, rcx
	mov	rdi, rdx
	call	rax
	mov	ecx, 128
	mov	edx, 0
	div	ecx
	mov	DWORD PTR -4[rbp], edx
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -8[rbp]
	movsx	rdx, edx
	sal	rdx, 4
	add	rdx, rax
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR [rax]
	mov	ecx, DWORD PTR -4[rbp]
	sal	rcx, 3
	add	rax, rcx
	mov	rax, QWORD PTR [rax]
	mov	rsi, rdx
	mov	rdi, rax
	call	push_back@PLT
	add	DWORD PTR -8[rbp], 1
.L14:
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR 8[rax]
	cmp	rdx, rax
	jb	.L15
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	hashing, .-hashing
	.globl	search
	.type	search, @function
search:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	QWORD PTR -56[rbp], rdi
	mov	QWORD PTR -64[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	cmp	QWORD PTR -56[rbp], 0
	jne	.L18
	lea	rcx, __PRETTY_FUNCTION__.3201[rip]
	mov	edx, 49
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	__assert_fail@PLT
.L18:
	mov	QWORD PTR -32[rbp], 0
	mov	QWORD PTR -24[rbp], 0
	mov	rax, QWORD PTR -64[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR curr_hash[rip]
	lea	rdx, -32[rbp]
	mov	rdi, rdx
	call	rax
	mov	ecx, 128
	mov	edx, 0
	div	ecx
	mov	DWORD PTR -36[rbp], edx
	mov	rax, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -36[rbp]
	sal	rdx, 3
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rax, QWORD PTR 8[rax]
	lea	rdx, -32[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	Node_FindNext@PLT
	mov	rcx, QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L20
	call	__stack_chk_fail@PLT
.L20:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	search, .-search
	.section	.rodata
.LC3:
	.string	"w"
.LC4:
	.string	"result.csv"
.LC5:
	.string	"%d; %ld\n"
	.text
	.globl	print_result
	.type	print_result, @function
print_result:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	cmp	QWORD PTR -24[rbp], 0
	jne	.L22
	lea	rcx, __PRETTY_FUNCTION__.3207[rip]
	mov	edx, 75
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	__assert_fail@PLT
.L22:
	lea	rsi, .LC3[rip]
	lea	rdi, .LC4[rip]
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L23
.L24:
	mov	rax, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -12[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rcx, QWORD PTR 24[rax]
	mov	edx, DWORD PTR -12[rbp]
	mov	rax, QWORD PTR -8[rbp]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -12[rbp], 1
.L23:
	mov	eax, DWORD PTR -12[rbp]
	mov	edx, 128
	cmp	eax, edx
	jb	.L24
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	print_result, .-print_result
	.section	.rodata
.LC6:
	.string	"rb"
	.align 8
.LC7:
	.string	"/home/mikhail/\320\224\320\276\320\272\321\203\320\274\320\265\320\275\321\202\321\213/PROJECTS/Hash table/random.txt"
.LC9:
	.string	"searching time: %f, %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, -56[rbp]
	mov	rdi, rax
	call	create_table
	lea	rsi, .LC6[rip]
	lea	rdi, .LC7[rip]
	call	fopen@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	esi, 1
	mov	rdi, rax
	call	create_array@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	fclose@PLT
	lea	rdx, -56[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	hashing
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -60[rbp], 0
	jmp	.L26
.L27:
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -60[rbp]
	movsx	rdx, edx
	sal	rdx, 4
	add	rax, rdx
	mov	rdx, QWORD PTR [rax]
	lea	rax, -56[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	search
	add	DWORD PTR -60[rbp], 1
.L26:
	cmp	DWORD PTR -60[rbp], 189999
	jle	.L27
	call	clock@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, QWORD PTR -32[rbp]
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC8[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -16[rbp], xmm0
	mov	rax, QWORD PTR -16[rbp]
	mov	esi, 1000000
	mov	QWORD PTR -72[rbp], rax
	movsd	xmm0, QWORD PTR -72[rbp]
	lea	rdi, .LC9[rip]
	mov	eax, 1
	call	printf@PLT
	lea	rax, -56[rbp]
	mov	rdi, rax
	call	print_result
	lea	rax, -56[rbp]
	mov	rdi, rax
	call	delete_table
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	free_memory@PLT
	mov	eax, 0
	mov	rcx, QWORD PTR -8[rbp]
	xor	rcx, QWORD PTR fs:40
	je	.L29
	call	__stack_chk_fail@PLT
.L29:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.3174, @object
	.size	__PRETTY_FUNCTION__.3174, 13
__PRETTY_FUNCTION__.3174:
	.string	"create_table"
	.align 8
	.type	__PRETTY_FUNCTION__.3182, @object
	.size	__PRETTY_FUNCTION__.3182, 13
__PRETTY_FUNCTION__.3182:
	.string	"delete_table"
	.align 8
	.type	__PRETTY_FUNCTION__.3191, @object
	.size	__PRETTY_FUNCTION__.3191, 8
__PRETTY_FUNCTION__.3191:
	.string	"hashing"
	.type	__PRETTY_FUNCTION__.3201, @object
	.size	__PRETTY_FUNCTION__.3201, 7
__PRETTY_FUNCTION__.3201:
	.string	"search"
	.align 8
	.type	__PRETTY_FUNCTION__.3207, @object
	.size	__PRETTY_FUNCTION__.3207, 13
__PRETTY_FUNCTION__.3207:
	.string	"print_result"
	.align 8
.LC8:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
