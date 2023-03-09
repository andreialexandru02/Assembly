.data
	m: .space 31
	n: .space 31
	n_mare: .space 121
	x: .long 0
	vector_frecventa: .space 400	
	vector_numere: .space 400
	rezultat: .space 400
	index: .long 0
	formatScanf: .asciz "%s"
	formatPrintf: .asciz "%d "
	formatPrintf_n: .asciz "\n"
	formatPrintf_str: .asciz "%s\n"
.text

.global main

	verificare_m:
		// verficare_m(rezultat,element,pozitie)
		pushl %ebp
		movl %esp, %ebp
			// %esp:%ebp:(%ebp v)(<adr de in>)(rezultat)(element)(pozitie)
			//		0	    4		8	  12	  16
		pushl %edi
			// %esp:(%edi v)%ebp:(%ebp v)(<adr de in>)(*rezultat)(element)(pozitie)
			
		movl 8(%ebp), %edi #rezultat
		movl 12(%ebp), %eax #element
		movl 16(%ebp), %edx #pozitie
		movl m, %ecx
		cmp $0, %edx
		je e_ok
		cmp %ecx, %edx
		jg et_for_dupa_m
		
		movl %edx, %ecx
	
	et_for_dupa_m:
		cmp $0, %ecx
		je e_ok
	
		decl %edx

		cmp %eax,(%edi,%edx,4)
		je nu_e_ok
		
		decl %ecx	
		jmp et_for_dupa_m
	e_ok:
		movl $1, %eax
		popl %edi
		popl %ebp
		ret
	nu_e_ok:
		movl $0, %eax
		popl %edi
		popl %ebp
		ret
	
	creare_copil_nou:
		//creare_copil(rezultat,elementul_curent,index,vector_frecventa_local)
		pushl %ebp
		movl %esp, %ebp
			// %esp:%ebp:(%ebp v)(<adr de in>)(rezultat)(element_curent)(index)(vector_frecventa)
			//		0	    4		8	      12	 16		20
		pushl %esi
		 	// %esp:(%edi v)%ebp:(%ebp v)(<adr de in>)(rezultat)(element_curent)(index)
		movl 8(%ebp), %esi #rezultat
		movl 12(%ebp), %eax
		movl 16(%ebp), %edx
		
		movl %eax,(%esi, %edx,4)
		
	
		incl %edx
		pushl %edx
		movl $vector_numere, %edi
		pushl %edi
		movl 20(%ebp), %edi
		pushl %edi
		pushl %esi			
		call parcurgere_rezultat
		popl %esi
	
		popl %edi
	
		popl %ebx
		popl %edx 
	
		popl %esi
		popl %ebp
		//jmp exit_parcurgere_rezultat
		ret
	parcurgere_rezultat:
		//parcurgere_rezultat(rezultat,vector_frecventa_local,vector_elemente,index)
		pushl %ebp
		movl %esp, %ebp
			// %esp:%ebp:(%ebp v)(<adr de in>)(rezultat)(vector_frecventa_local)(vector_elemente)(index)
			//		0	    4		8	      12    		       16	   20	
		pushl %edi
		 	// %esp:(%edi v)%ebp:(%ebp v)(<adr de in>)(rezultat)(vector_frecventa_local)
		pushl %esi
		 	// %esp:(%esi v)(%edi v)%ebp:(%ebp v)(<adr de in>)(rezultat)(vector_frecventa_local)(vector_elemente)(index)
		movl 16(%ebp), %edi #vectorul de numere
		movl 8(%ebp), %esi	#rezultat
		movl 20(%ebp), %edx	#index
		
	verificare_terminare_vector:
		cmp n_mare, %edx
		je afisare_rezultat
		
		
	verificare_fixat:
		cmp $0,(%edi, %edx, 4)
		jne fixat
	
	nefixat:
		movl $1, %ecx
	et_for_nefixat:
		cmp n, %ecx
		jg exit_parcurgere_rezultat
		
		//verficare_m(rezultat,element,pozitie)
	verifica_m_elementul_nefixat:	
		pushl %edx
		pushl %ecx
		pushl %esi
		call verificare_m	
		popl %ebx
		popl %ecx
		popl %edx
		
		cmp $1, %eax 
		je verifica_vectorul_frecventa
	
	continuare_et_for_nefixat:
		incl %ecx
		jmp et_for_nefixat
	verifica_vectorul_frecventa:
		movl 12(%ebp), %edi
		cmp $0, (%edi,%ecx,4)	
		jg apeleaza_creare_copil
		
		jmp continuare_et_for_nefixat
	
	fixat:
		pushl %edx
		pushl (%edi,%edx,4)
		pushl %esi
		call verificare_m	
		popl %esi
		popl %ebx
		popl %edx
		
		cmp $1, %eax 
		je pune_element_fixat
		
		jmp exit_parcurgere_rezultat
	pune_element_fixat:
		movl (%edi,%edx,4),%eax
		movl %eax, (%esi, %edx, 4)
		jmp reapelare_parcurgere_rezultat
	
	reapelare_parcurgere_rezultat:	
		//parcurgere_rezultat(rezultat,vector_frecventa_local,vector_elemente,index)
		incl %edx
		pushl %edx
		movl 16(%ebp), %edi
		pushl %edi
		movl 12(%ebp), %edi
		pushl %edi
		pushl %esi			
		call parcurgere_rezultat
	
		popl %ebx
		popl %ebx
		popl %ebx
		popl %ebx 
		jmp exit_parcurgere_rezultat
	apeleaza_creare_copil:
		//creare_copil_nou(rezultat,elementul_curent,index)
		addl $-1, (%edi,%ecx,4)	
		pushl %edi
		pushl %edx
		pushl %ecx
		pushl %esi
		call creare_copil_nou
	
		popl %esi
		popl %ecx
		popl %edx
		popl %edi
	
		addl $1, (%edi,%ecx,4)
		jmp continuare_et_for_nefixat
	exit_parcurgere_rezultat:
		popl %esi
		popl %edi
		popl %ebp
		ret
main:	
	pushl $n
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx


	pushl $n
	call atoi
	popl %ebx
	movl %eax, n
	
	pushl $m
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx


	pushl $m
	call atoi
	popl %ebx
	movl %eax, m
	
	xorl %ecx, %ecx
	movl $vector_frecventa, %edi
	movl $3, %ebx
golire_vector:
	cmp n,%ecx
	jg continuare
	
	movl %ebx,(%edi, %ecx, 4)
	incl %ecx
	jmp golire_vector	
continuare:		
	movl $3, %eax
	movl n, %edx
	mull %edx
	movl %eax, n_mare #n_mare=n*3
	
	xorl %ecx, %ecx
	movl $vector_numere, %esi
et_for:
	cmp n_mare,%ecx
	je incepere_rezolvare
	pushl %ecx

	pushl $x
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	pushl $x
	call atoi
	popl %ebx
	movl %eax, x
	popl %ecx
	movl x, %eax
	movl %eax, (%esi, %ecx, 4)
	pushl %ecx
	
	movl x, %ebx
	decl (%edi, %ebx, 4)

	popl %ecx
	incl %ecx
	jmp et_for
incepere_rezolvare:
	
	xorl %ecx,%ecx
	movl $vector_numere, %esi
	movl $vector_frecventa, %edi
	
	//parcurgere_rezultat(rezultat,vector_frecventa_local,vector_elemente,index)
	pushl %ecx		
	pushl %esi
	pushl %edi
	movl $rezultat, %edi
	pushl %edi
	call parcurgere_rezultat
	popl %edi
	popl %ebx
	popl %ebx
	popl %ebx
afisare_rezultat:	
	xorl %ecx,%ecx
	movl $rezultat, %edi
verificare_exista:
	cmp n_mare, %ecx
	je exista
	
	cmp $0, (%edi,%ecx,4)
	je nu_exista
	
	incl %ecx
	jmp verificare_exista

exista:
	xorl %ecx,%ecx
	jmp et_for_afisare_rezultat
	
nu_exista:
	movl $-1, %ebx
	pushl %ebx
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	jmp exit

et_for_afisare_rezultat:
	cmp n_mare, %ecx
	je exit
	
	pushl %ecx
	pushl (%edi,%ecx,4)
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	popl %ecx
	incl %ecx
	jmp et_for_afisare_rezultat


exit:
		
	pushl $formatPrintf_n
	call printf
	popl %ebx

	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
	
	