global _start

_start:
	call _print_msg 
	mov eax, 1
	mov ebx, 0
	int 0x80

_print_chr: ; doesn't work
	mov eax, 4
	mov ebx, 1
	

	mov edx, 1
	int 0x80
	ret
	

_print_msg: ; SPOILS eax, ebx, ecx, edx REGISTERS!
	mov eax, 4; <- 4 means "WRITE" for syscall
	mov ebx, 1; <- file descriptor (1 means "monitor")
	mov ecx, esp
	mov ecx, msg; <- address of string 
	mov edx, msglen; <- length of string
	int 0x80; <- syscall 
	ret 

;----------------------------------------------------------
section .data

msg: db "Линукс рулез, асм заебись",0x0A,0
msglen equ $-msg


