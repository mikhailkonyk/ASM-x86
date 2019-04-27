
	global strlen, strchr, memcpy
	section .code

;----------------------------------------------------------------------
;				STRLEN
;----------------------------------------------------------------------
;EXPECT : edi - pointer to str
;RETURN : eax - strlen
;DESTROY: *
;----------------------------------------------------------------------


strlen:
	push rdi
	xor rcx, rcx
	dec rcx
	xor al, al
	cld
	repne scasb
	pop rsi
	sub rdi, rsi
	mov rax, rdi


ret

;---------------------------------------------------------------------
;				STRCHR********
;---------------------------------------------------------------------
;EXPECT : in stack: [bp + 8] - pointer to str, [bp + 12] - symbol
;RETURN : edi - symbol address (or end of str adress)
;
;---------------------------------------------------------------------


strchr:

	push rbp
	mov rbp, rsp
	push rax
	push rcx



	xor rax, rax
	mov rdi, [rbp + 16]
	call strlen
	mov rcx, rax

	mov rax, [rbp + 24]

	cld
	repne scasb

	pop rcx
	pop rax
	pop rbp
ret

;----------------------------------------------------------------------
;				MEMCPY************
;--------------------------------------------------------------------
;EXPECT: ecx, edi
;
;--------------------------------------------------------------------

memcpy:
.next:
	mov [rdi], byte 0
	inc rdi
loop .next

ret



