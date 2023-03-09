.data
	sir: .space 40
	
	chDelim: .asciz " "
	formatScanf: .asciz "%[^\n]s"
	formatPrintf: .asciz "%d\n"
	formatPrintf_str: .asciz "%s\n"
	res: .space 4
	res_atoi: .space 4
	vector_variabile: .space 20
	index_vectori: .long 0
	vector_valori: .space 20
	verificare_afisare: .space 20
	element_curent:.long 0
	rezultat:.long 0
	cod_variabila: .long 0
	
.text


.global main


main:
	movl $vector_variabile, %edi
	movl $vector_valori, %esi
	xorl %ecx,%ecx
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
	cmp $0, element_curent
	je operatie_sau_variabila
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
	je operatie_sau_variabila
	
 	pushl element_curent
	jmp et_for
operatie_sau_variabila:
	pushl %edi
	movl res, %edi
	pushl %ecx
	movl $1, %ecx
	movb (%edi, %ecx, 1), %al
	popl %ecx
	popl %edi

	cmp $0, %al	
	jne operatie
	
variabila:
	#variabila e in res
	pushl %edi
	movl res, %edi
	xorl %ecx,%ecx
	movb (%edi, %ecx, 1), %bl
	popl %edi
	/*pushl res
	pushl $formatPrintf_str
	call printf
	popl %ebx
	popl %ebx*/
	
	/*pushl (%edi, %ecx ,4)
	pushl $formatPrintf_str
	call printf
	popl %ebx
	popl %ebx
	pushl (%esi, %ecx ,4)
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx*/
	
	xorl %ecx,%ecx
et_cautare_variabila:
	movb (%edi, %ecx ,1), %al
	cmp $0, %al
	je nu_am_gasit_variabila

	cmp %bl, %al
	je gasit_variabila
	incl %ecx
	jmp et_cautare_variabila
gasit_variabila:
	pushl (%esi, %ecx, 4)
	jmp et_for
nu_am_gasit_variabila:
	pushl res
	jmp et_for
operatie:
	pushl %edi
	movl res, %edi
	pushl %ecx
	movl $2, %ecx
	movb (%edi, %ecx ,1), %al
	popl %ecx
	popl %edi
	cmp $100, %al 	
	//ultima litera d (add)
	je et_add

	cmp $116, %al 
	//ultima litera t (let)
	je et_let
	
	cmp $118, %al 
	//ultima litera b (div)
	je et_div
	
	cmp $108, %al 
	// ultima litera l (mul)
	je et_mul
	
	cmp $98, %al
	je et_sub
	// ultima cifra b (sub)
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
et_let:
	popl %ebx	#numarul
	popl %eax	#variabila
	pushl %edi
	movl %eax, %edi
	xorl %ecx,%ecx
	movb (%edi, %ecx, 1), %al
	#movb %al, cod_variabila
	#pushl cod_variabila
	#popl %eax
	popl %edi
	/*movl %eax, verificare_afisare
	pushl verificare_afisare
	pushl $formatPrintf_str
	call printf
	popl %ebx
	popl %ebx*/
	
	movl index_vectori, %ecx
	movb %al, (%edi, %ecx, 1)	#variabilele
	movl %ebx, (%esi, %ecx, 4)	#numerele
	addl $1, index_vectori
	
edi:
	/*pushl (%edi, %ecx ,1)
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	#jmp et_for*\
esi:
	/*movl index_vectori, %ecx
	pushl (%esi, %ecx ,4)
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	addl $1, index_vectori
	jmp et_for*/
	jmp et_for
exit:
	popl %ebx
	movl %ebx, rezultat
	pushl rezultat
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int  $0x80