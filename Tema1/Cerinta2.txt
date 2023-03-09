.data
	sir: .space 40
	chDelim: .asciz " "
	formatScanf: .asciz "%[^\n]s"
	formatPrintf: .asciz "%d\n"
	formatPrintf_str: .asciz "%s\n"
	res:.space 4
	element_curent:.long 0
	rezultat:.long 0
	
	
.text


.global main


main:
	pushl $sir
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	pushl $chDelim
	
	pushl $sir
	call strtok
	popl %ebx
	popl %ebx

	movl %eax, res
	
	pushl res
	call atoi
	popl %ebx
	

	movl %eax, element_curent
	pushl element_curent
	
et_for:

	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx	
	
	cmp $0, %eax
	je exit

	movl %eax, res

	pushl res
	call atoi
	popl %ebx	
	
	movl %eax, element_curent
	cmp $0, element_curent
	je operatie	
	
 	pushl element_curent
	jmp et_for
operatie:
	movl res, %edi
	xorl %ecx, %ecx
	movb (%edi, %ecx ,1), %al
	cmp $97, %al
	je et_add
	cmp $115, %al
	je et_sub
	cmp $100, %al
	je et_div
	cmp $109, %al
	je et_mul
et_add:
	popl %edx
	popl %ebx
	add %ebx, %edx
	pushl %edx
	jmp et_for
et_sub:
	popl %edx
	popl %ebx
	sub %edx, %ebx
	pushl %ebx
	jmp et_for
et_mul:
	popl %eax
	popl %ebx
	mull %ebx
	pushl %eax
	jmp et_for
et_div:
	xorl %edx,%edx
	popl %ebx
	popl %eax
	div %ebx
	pushl %eax
	jmp et_for
exit:
	popl %ebx
	movl %ebx, rezultat
gdb:
	pushl rezultat
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int  $0x80