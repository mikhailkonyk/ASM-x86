;---------------------------------------------------------------------------------------
;				*********************
;				***	PRINTF    ***
;				*********************
;---------------------------------------------------------------------------------------


global printf
extern digtostr, digtohex, digtobin, strlen, memcpy
section .code

;-------------------------------------------------------------------------------------
;
;
;
;-------------------------------------------------------------------------------------


printf:
	pop rbx
	
	push r9
	push r8
	push rcx
	push rdx
	push rsi
	push rdi

	mov r10, rbx ; save return address

	call printf_
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop r8
	pop r9

	push r10     ; relive return address

ret


printf_:
	
	push rbp
	mov rbp, rsp
	mov rbx, [rbp + 16]		; format-string begining
	add rbp, 16
	

.execute:
	cmp [rbx], byte 0
	je .exit

	cmp [rbx], byte '%'
	je .specifier

	mov rax, 0x01
	mov rdi, 1
	mov rsi, rbx
	mov rdx, 1
	syscall

	inc rbx
	jmp .execute

.specifier:
	call special_symbol
	jmp .execute

.exit:

	pop rbp
ret

;--------------------------------------------------------------------------------------
;
;
;
;-------------------------------------------------------------------------------------

special_symbol:
	inc rbx

	cmp [rbx], byte 'd'
	je .print_digit

	cmp [rbx], byte 'b'
	je .print_bin

	cmp [rbx], byte 'x'
	je .print_hex

	cmp [rbx], byte 'c'
	je .print_symbol

	cmp [rbx], byte 's'
	je .print_string

	cmp [rbx], byte '%'
	je .print_percent

	jmp .exit


.print_digit:
	push rbx			; save current position

	mov rax, [rbp + 8]
	mov rdi, digit
	call digtostr
	add rbp, 8

        mov rax, 0x01
        mov rdi, 1
        mov rsi, digit
        mov rdx, 5
        syscall

        mov rcx, 5
        mov rdi, digit
	call memcpy


	pop rbx
	jmp .exit

.print_bin:

	mov rax, [rbp + 8]
	mov rdi, bin
	call digtobin
	add rbp, 8

	mov rax, 0x01
	mov rdi, 1
	mov rsi, bin
	mov rdx, 32
	syscall
	
	mov rcx, 32
	mov rdi, bin
	call memcpy

	jmp .exit


.print_hex:

	mov rax, [rbp + 8]
        mov rdi, hex
        call digtohex
	add rbp, 8

	mov rax, 0x01
	mov rdi, 1
	mov rsi, hex
	mov rdx, 4
	syscall

        mov rcx, 4
        mov rdi, bin
	call memcpy

        jmp .exit

.print_symbol:

	add rbp, 8

	mov rsi, rbp
	mov rax, 0x01
	mov rdi, 1
	mov rdx, 1
	syscall

	jmp .exit

.print_string:

	add rbp, 8
	mov rdi, [rbp]
	call strlen

	mov rdx, rax
	mov rax, 0x01
	mov rdi, 1
	mov rsi, qword [rbp]
	syscall

	jmp .exit

.print_percent:

	mov rax, 0x01
	mov rdi, 1
	mov rsi, rbx
	mov rdx, 1 
	syscall

	jmp .exit

.exit:
	inc rbx    
ret

section .data

digit:	times 5 db 0			;
hex:	times 4 db 0			; there are buffers for numbers
bin:	times 16 db 0			;
