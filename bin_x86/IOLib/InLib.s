

section .bss

input resb 1

section .code

global _start

_start:
	pop esi
scanf:
;	push 0
;	mov ebp, esp

	push eax
	push ebx
	push ecx
	push edx
	xor edi, edi
;.next:

	mov edi, [input]

	mov eax, 3
	mov ecx, input
	mov edx, 1
	mov ebx, 0

	cmp byte [input], 0x0a
	je exit
	mov eax, edi
	mov edx, 10
	mul edx
	add [input], eax


	
;jmp .next	

exit:
	pop edx
	pop ecx
	pop ebx
	pop eax
	mov esi, [input]


	mov eax, 4
	mov ebx, 1
	mov ecx, input
	mov edx, 1

	mov eax,1
	mov ebx, 0
	int 0x80

ret
