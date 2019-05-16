	.file	"HashFunctions.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"HashFunctions.c"
.LC1:
	.string	"string"
	.text
	.globl	HashFunct_constant
	.type	HashFunct_constant, @function
HashFunct_constant:
.LFB5:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	cmp	QWORD PTR -8[rbp], 0
	jne	.L2
	lea	rcx, __PRETTY_FUNCTION__.2864[rip]
	mov	edx, 13
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	__assert_fail@PLT
.L2:
	mov	eax, 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	HashFunct_constant, .-HashFunct_constant
	.globl	HashFunct_first_letter
	.type	HashFunct_first_letter, @function
HashFunct_first_letter:
.LFB6:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	cmp	QWORD PTR -8[rbp], 0
	jne	.L5
	lea	rcx, __PRETTY_FUNCTION__.2868[rip]
	mov	edx, 19
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	__assert_fail@PLT
.L5:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR [rax]
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	HashFunct_first_letter, .-HashFunct_first_letter
	.globl	HashFunct_ASCII_sum
	.type	HashFunct_ASCII_sum, @function
HashFunct_ASCII_sum:
.LFB7:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	cmp	QWORD PTR -24[rbp], 0
	jne	.L8
	lea	rcx, __PRETTY_FUNCTION__.2872[rip]
	mov	edx, 25
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	__assert_fail@PLT
.L8:
	mov	DWORD PTR -8[rbp], 0
	mov	DWORD PTR -4[rbp], 0
	jmp	.L9
.L10:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	add	DWORD PTR -8[rbp], eax
	add	DWORD PTR -4[rbp], 1
.L9:
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 8[rax]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L10
	mov	eax, DWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	HashFunct_ASCII_sum, .-HashFunct_ASCII_sum
	.globl	HashFunct_lenght
	.type	HashFunct_lenght, @function
HashFunct_lenght:
.LFB8:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	cmp	QWORD PTR -8[rbp], 0
	jne	.L13
	lea	rcx, __PRETTY_FUNCTION__.2881[rip]
	mov	edx, 34
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	__assert_fail@PLT
.L13:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 8[rax]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	HashFunct_lenght, .-HashFunct_lenght
	.globl	HashFunct_sumlen
	.type	HashFunct_sumlen, @function
HashFunct_sumlen:
.LFB9:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	cmp	QWORD PTR -8[rbp], 0
	jne	.L16
	lea	rcx, __PRETTY_FUNCTION__.2885[rip]
	mov	edx, 40
	lea	rsi, .LC0[rip]
	lea	rdi, .LC1[rip]
	call	__assert_fail@PLT
.L16:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 8[rax]
	test	eax, eax
	je	.L17
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	HashFunct_ASCII_sum
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 8[rax]
	mov	ecx, eax
	mov	eax, edx
	mov	edx, 0
	div	ecx
	jmp	.L18
.L17:
	mov	eax, 1
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	HashFunct_sumlen, .-HashFunct_sumlen
	.globl	ELFHash
	.type	ELFHash, @function
ELFHash:
.LFB10:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -12[rbp], 0
	mov	DWORD PTR -4[rbp], 0
	mov	DWORD PTR -8[rbp], 0
	jmp	.L20
.L22:
	mov	eax, DWORD PTR -12[rbp]
	sal	eax, 4
	mov	ecx, eax
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	add	eax, ecx
	mov	DWORD PTR -12[rbp], eax
	mov	eax, DWORD PTR -12[rbp]
	and	eax, -268435456
	mov	DWORD PTR -4[rbp], eax
	cmp	DWORD PTR -4[rbp], 0
	je	.L21
	mov	eax, DWORD PTR -4[rbp]
	shr	eax, 24
	xor	DWORD PTR -12[rbp], eax
.L21:
	mov	eax, DWORD PTR -4[rbp]
	not	eax
	and	DWORD PTR -12[rbp], eax
	add	DWORD PTR -8[rbp], 1
.L20:
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 8[rax]
	cmp	DWORD PTR -8[rbp], eax
	jl	.L22
	mov	eax, DWORD PTR -12[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	ELFHash, .-ELFHash
	.globl	jenkins_hash
	.type	jenkins_hash, @function
jenkins_hash:
.LFB11:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -8[rbp], 0
	mov	DWORD PTR -4[rbp], 0
	jmp	.L25
.L26:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -4[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	add	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -8[rbp]
	sal	eax, 10
	add	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -8[rbp]
	shr	eax, 6
	xor	DWORD PTR -8[rbp], eax
	add	DWORD PTR -4[rbp], 1
.L25:
	mov	rax, QWORD PTR -24[rbp]
	mov	eax, DWORD PTR 8[rax]
	cmp	DWORD PTR -4[rbp], eax
	jb	.L26
	mov	eax, DWORD PTR -8[rbp]
	sal	eax, 3
	add	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -8[rbp]
	shr	eax, 11
	xor	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -8[rbp]
	sal	eax, 15
	add	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -8[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	jenkins_hash, .-jenkins_hash
	.globl	MurmurHash2
	.type	MurmurHash2, @function
MurmurHash2:
.LFB12:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -56[rbp], rdi
	mov	DWORD PTR -28[rbp], 1540483477
	mov	DWORD PTR -24[rbp], 0
	mov	rax, QWORD PTR -56[rbp]
	mov	eax, DWORD PTR 8[rax]
	mov	DWORD PTR -36[rbp], eax
	mov	rax, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR [rax]
	mov	QWORD PTR -8[rbp], rax
	mov	eax, DWORD PTR -24[rbp]
	xor	eax, DWORD PTR -36[rbp]
	mov	DWORD PTR -32[rbp], eax
	mov	rax, QWORD PTR -8[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -20[rbp], 0
	jmp	.L29
.L30:
	mov	rax, QWORD PTR -16[rbp]
	movzx	eax, BYTE PTR [rax]
	movzx	eax, al
	mov	DWORD PTR -20[rbp], eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 1
	movzx	eax, BYTE PTR [rax]
	movzx	eax, al
	sal	eax, 8
	or	DWORD PTR -20[rbp], eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 2
	movzx	eax, BYTE PTR [rax]
	movzx	eax, al
	sal	eax, 16
	or	DWORD PTR -20[rbp], eax
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 3
	movzx	eax, BYTE PTR [rax]
	movzx	eax, al
	sal	eax, 24
	or	DWORD PTR -20[rbp], eax
	mov	eax, DWORD PTR -20[rbp]
	imul	eax, DWORD PTR -28[rbp]
	mov	DWORD PTR -20[rbp], eax
	mov	eax, DWORD PTR -20[rbp]
	shr	eax, 24
	xor	DWORD PTR -20[rbp], eax
	mov	eax, DWORD PTR -20[rbp]
	imul	eax, DWORD PTR -28[rbp]
	mov	DWORD PTR -20[rbp], eax
	mov	eax, DWORD PTR -32[rbp]
	imul	eax, DWORD PTR -28[rbp]
	mov	DWORD PTR -32[rbp], eax
	mov	eax, DWORD PTR -20[rbp]
	xor	DWORD PTR -32[rbp], eax
	add	QWORD PTR -16[rbp], 4
	sub	DWORD PTR -36[rbp], 4
.L29:
	cmp	DWORD PTR -36[rbp], 3
	ja	.L30
	mov	eax, DWORD PTR -36[rbp]
	cmp	eax, 2
	je	.L32
	cmp	eax, 3
	je	.L33
	cmp	eax, 1
	je	.L34
	jmp	.L31
.L33:
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 2
	movzx	eax, BYTE PTR [rax]
	movzx	eax, al
	sal	eax, 16
	xor	DWORD PTR -32[rbp], eax
.L32:
	mov	rax, QWORD PTR -16[rbp]
	add	rax, 1
	movzx	eax, BYTE PTR [rax]
	movzx	eax, al
	sal	eax, 8
	xor	DWORD PTR -32[rbp], eax
.L34:
	mov	rax, QWORD PTR -16[rbp]
	movzx	eax, BYTE PTR [rax]
	movzx	eax, al
	xor	DWORD PTR -32[rbp], eax
	mov	eax, DWORD PTR -32[rbp]
	imul	eax, DWORD PTR -28[rbp]
	mov	DWORD PTR -32[rbp], eax
.L31:
	mov	eax, DWORD PTR -32[rbp]
	shr	eax, 13
	xor	DWORD PTR -32[rbp], eax
	mov	eax, DWORD PTR -32[rbp]
	imul	eax, DWORD PTR -28[rbp]
	mov	DWORD PTR -32[rbp], eax
	mov	eax, DWORD PTR -32[rbp]
	shr	eax, 15
	xor	DWORD PTR -32[rbp], eax
	mov	eax, DWORD PTR -32[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	MurmurHash2, .-MurmurHash2
	.section	.rodata
	.align 16
	.type	__PRETTY_FUNCTION__.2864, @object
	.size	__PRETTY_FUNCTION__.2864, 19
__PRETTY_FUNCTION__.2864:
	.string	"HashFunct_constant"
	.align 16
	.type	__PRETTY_FUNCTION__.2868, @object
	.size	__PRETTY_FUNCTION__.2868, 23
__PRETTY_FUNCTION__.2868:
	.string	"HashFunct_first_letter"
	.align 16
	.type	__PRETTY_FUNCTION__.2872, @object
	.size	__PRETTY_FUNCTION__.2872, 20
__PRETTY_FUNCTION__.2872:
	.string	"HashFunct_ASCII_sum"
	.align 16
	.type	__PRETTY_FUNCTION__.2881, @object
	.size	__PRETTY_FUNCTION__.2881, 17
__PRETTY_FUNCTION__.2881:
	.string	"HashFunct_lenght"
	.align 16
	.type	__PRETTY_FUNCTION__.2885, @object
	.size	__PRETTY_FUNCTION__.2885, 17
__PRETTY_FUNCTION__.2885:
	.string	"HashFunct_sumlen"
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
