;-----------------------------------------------------------------------------
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;::::::::::::::         SYSTEM NUMBERS                ::::::::::::::::::::::::
;:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
;-----------------------------------------------------------------------------


;------------------------------------------------------------------------------
;                       INTEGER -> STR INTEGER
;EXPECT: ax - number, di - pointer to str
;DESTROY: di, cx, dx, bx, ax
;
;------------------------------------------------------------------------------

global digtostr
section .code

digtostr:
	
	;mov rax, rdi
        mov rcx, 5
        add rdi, 4
        xor rdx, rdx
        mov rbx, rax
        std

.next:

        mov rax, rbx
        cmp rax, 0
        je exit
        xor rdx, rdx
        div dword [op]
        mov rbx, rax
        mov al, dl
        add al, '0'
        stosb

loop .next

exit:
ret


;------------------------------------------------------------------------------
;                                INTEGER -> BIN
;------------------------------------------------------------------------------
;EXPECT: ax - number, di - pointer to str
;DESTROY: ax dx cx di *
;------------------------------------------------------------------------------

global digtobin

digtobin:
	push rdi
        mov rdx, rax
        add rdi, 31
        mov rcx, 32
        std

.next:

        mov rax, rdx
        and al, 1
        add al, '0'
        stosb
        shr rdx, 1

loop .next

	mov rcx, 32
	pop rdi
.set_null:
        cmp [rdi], byte '0'
        jne .exit
        mov [rdi], byte 0
        inc rdi
loop .set_null

.exit:
ret


;------------------------------------------------------------------------------
;                               INTEGER -> HEX
;------------------------------------------------------------------------------
;Expect ax - number, di - pointer to str
;Destroy cx, di, si, ax, dx
;------------------------------------------------------------------------------

global digtohex

digtohex:
	push rdi
        mov rcx, 4
        add rdi, 3
        mov rdx, rax
        std
.next:

        mov rax, rdx
        and rax, 000fh
        mov rsi, rax
        mov al, [character + rsi]
        stosb
        shr rdx, 4

loop .next

	pop rdi
	mov rcx, 4
.set_null:
	cmp [rdi], byte '0'
	jne .exit
	mov [rdi], byte 0
	inc rdi
loop .set_null

.exit:
ret
;-----------------------------------------------------------------------------
;
;
;-----------------------------------------------------------------------------

section .data

character: db '0123456789ABCDEF'
op:        dd	10
