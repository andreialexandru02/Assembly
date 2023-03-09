.data
	sirb16: .space 20 
	sirb2: .space 80 
	sir12: .space 13
	formatScanf: .asciz "%s"
	formatPrintf_str: .asciz "%s " 
	formatPrintf_nr: .asciz "%d " 
	formatPrintf_var: .asciz "%c "
	indexSb2: .long 0
	cod: .long 0
	verificare_numar: .long 0
	semn: .long 0
	strdiv:.asciz "div"
	strmul:.asciz "mul"
	strsub:.asciz "sub"
	stradd:.asciz "add"
	strlet:.asciz "let"
	
	
	
.text

.global main

main:
	pushl $sirb16
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	movl $sirb16, %edi
	movl $sirb2, %esi
	xorl %ecx, %ecx
et_forb16:
	movb (%edi, %ecx, 1), %al
	cmp $0, %al
	je rezolvare
	cmp $48, %al
	je cif0
	cmp $49, %al
	je cif1
	cmp $50, %al
	je cif2
	cmp $51, %al
	je cif3
	cmp $52, %al
	je cif4
	cmp $53, %al
	je cif5
	cmp $54, %al
	je cif6
	cmp $55, %al
	je cif7
	cmp $56, %al
	je cif8
	cmp $57, %al
	je cif9
	cmp $65, %al
	je cifA
	cmp $66, %al
	je cifB
	cmp $67, %al
	je cifC
	cmp $68, %al
	je cifD
	cmp $69, %al
	je cifE
	cmp $70, %al
	je cifF
cont_et_for16:
	incl %ecx
	jmp et_forb16
cif0:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cif1:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cif2:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cif3:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cif4:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cif5:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cif6:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cif7:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cif8:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cif9:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cifA:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cifB:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cifC:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cifD:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cifE:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $48, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
cifF:	
	pushl %ecx
	movl indexSb2, %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	movl $49, (%esi, %ecx, 1)
	incl %ecx
	
	addl $4, indexSb2
	popl %ecx
	jmp cont_et_for16
rezolvare:	
	xorl %ebx, %ebx
	xorl %ecx, %ecx
et_for_parcurgere:
	movb (%esi, %ecx, 1), %al
	cmp $0, %al
	je exit
	movl %ecx, %ebx
	addl $1, %ebx
	movb (%esi, %ebx, 1), %al
	cmp $49, %al
	je operand
	jmp nr_sau_variabila
cont_parcurgere:
	movl %ebx, %ecx
	jmp et_for_parcurgere
operand:
	addl $8, %ebx
	movb (%esi, %ebx, 1), %al
	cmp $49, %al
	je div
	addl $1, %ebx
	movb (%esi, %ebx, 1), %al
	cmp $49, %al
	je sub_sau_mul
	addl $1, %ebx
	movb (%esi, %ebx, 1), %al
	cmp $49, %al
	je add
	jmp let
sub_sau_mul:
	addl $1, %ebx
	movb (%esi, %ebx, 1), %al
	cmp $49, %al
	je mul
	jmp sub
div:
	pushl %ebx
	pushl $strdiv
	pushl $formatPrintf_str
	call printf
	popl %ebx
	popl %ebx
	popl %ebx
	addl $3, %ebx
	jmp cont_parcurgere
add:	
	/*pushl %eax
	pushl %ebx
	pushl %ecx
	pushl %edx
	movl $4, %eax
	movl $1, %ebx
	movl $stradd, %ecx
	movl $5, %edx
	int $0x80
	popl %edx
	popl %ecx
	popl %ebx
	popl %eax*/
	pushl %ebx
	pushl $stradd
	pushl $formatPrintf_str
	call printf
	popl %ebx
	popl %ebx
	popl %ebx
	addl $1, %ebx
	jmp cont_parcurgere
let:
	
	pushl %ebx
	pushl $strlet
	pushl $formatPrintf_str
	call printf
	popl %ebx
	popl %ebx
	popl %ebx
	addl $1, %ebx
	jmp cont_parcurgere
sub:
	
	pushl %ebx
	pushl $strsub
	pushl $formatPrintf_str
	call printf
	popl %ebx
	popl %ebx
	popl %ebx
	addl $2, %ebx
	jmp cont_parcurgere
mul: 
	pushl %ebx
	pushl $strmul
	pushl $formatPrintf_str
	call printf
	popl %ebx
	popl %ebx
	popl %ebx
	addl $2, %ebx
	jmp cont_parcurgere
nr_sau_variabila:
	addl $1, %ebx
	movb (%esi, %ebx, 1), %al
	cmp $49, %al
	je variabila
	jmp numar
variabila:
	movl $0, verificare_numar
	addl $2, %ebx
	movb (%esi, %ebx, 1), %al
	jmp transb10
transb10:
	movl $0, cod
	cmp $49, %al
	je et_128
c_64:
	addl $1, %ebx
	movb (%esi, %ebx, 1), %al
	cmp $49, %al
	je et_64
c_32:	
	addl $1, %ebx
	movb (%esi, %ebx, 1), %al
	cmp $49, %al
	je et_32
c_16:
	addl $1, %ebx
	movb (%esi, %ebx, 1), %al
	cmp $49, %al
	je et_16
	
c_8:
	addl $1, %ebx
	movb (%esi, %ebx, 1), %al
	cmp $49, %al
	je et_8
c_4:	
	addl $1, %ebx
	movb (%esi, %ebx, 1), %al
	cmp $49, %al
	je et_4
c_2:	
	addl $1, %ebx
	movb (%esi, %ebx, 1), %al
	cmp $49, %al
	je et_2
c_1:	
	addl $1, %ebx
	movb (%esi, %ebx, 1), %al
	cmp $49, %al
	je et_1
c_0:
	addl $1, %ebx
	cmp $1, verificare_numar
	je afisare_numar
	jmp afisare_variabila
et_128:
	addl $128, cod
	jmp c_64
et_64:
	addl $64, cod
	jmp c_32
et_32:
	addl $32, cod
	jmp c_16
et_16:
	addl $16, cod
	jmp c_8
et_8:
	addl $8, cod
	jmp c_4
et_4:
	addl $4, cod
	jmp c_2
et_2:
	addl $2, cod
	jmp c_1
et_1:
	addl $1, cod
	jmp c_0
numar:
	addl $1, %ebx
	movb (%esi, %ebx, 1), %al
	cmp $49, %al
	je et_semn
c_semn:
	addl $1, verificare_numar
	addl $1, %ebx
	movb (%esi, %ebx, 1), %al
	jmp transb10
et_semn:
	addl $1, semn
	jmp c_semn
afisare_numar:
	cmp $1, semn
	je minus
	jmp c_minus
minus:
	pushl %eax
	pushl %edx
	movl $2, %eax
	movl cod, %edx
	mull %edx
	subl %eax, cod
	popl %edx
	popl %eax
	jmp c_minus
c_minus:
	pushl %ebx
	pushl cod
	pushl $formatPrintf_nr
	call printf
	popl %ebx
	popl %ebx
	popl %ebx
	jmp cont_parcurgere
afisare_variabila:
	pushl %ebx
	pushl cod
	pushl $formatPrintf_var
	call printf
	popl %ebx
	popl %ebx
	popl %ebx
	jmp cont_parcurgere

exit:
	pushl $0
	call fflush
	popl %ebx
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
#A78 801 C00 A78 90E C04