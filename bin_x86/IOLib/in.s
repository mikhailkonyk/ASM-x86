
print_digit:

	push 228

	push eax
        push ebx
        push ecx
        push edx

	push edi
        call digtostr
	pop edi

        mov eax, 4
        mov ebx, 1
        mov ecx, edi
        mov edx, 16
        int 0x80
	
        pop edx
        pop ecx
        pop ebx
        pop eax
ret

digtostr:
	
        mov ecx, 10
        add edi, 8
        xor edx, edx
        mov ebx, esi
        std

.next:

        mov eax, ebx
        cmp eax, 0
        je exit
        xor edx, edx
	mov esi, 10
        div esi
        mov ebx, eax
        mov al, dl
        add al, '0'
        stosb

loop .next

exit:

ret
