	.file	"main.c"
	.option nopic
	.attribute arch, "rv64i2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"%d "
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	sd	s1,24(sp)
	sd	s2,16(sp)
	sd	s3,8(sp)
	lui	s0,%hi(.LANCHOR0)
	addi	s0,s0,%lo(.LANCHOR0)
	addi	s2,s0,32
	lui	s1,%hi(.LC0)
.L2:
	lw	a1,0(s0)
	addi	a0,s1,%lo(.LC0)
	call	printf
	addi	s0,s0,4
	bne	s2,s0,.L2
	li	a0,10
	call	putchar
	li	a1,2
	lui	s0,%hi(.LC0)
	addi	a0,s0,%lo(.LC0)
	call	printf
	li	a1,3
	addi	a0,s0,%lo(.LC0)
	call	printf
	li	a1,5
	addi	a0,s0,%lo(.LC0)
	call	printf
	li	a1,7
	addi	a0,s0,%lo(.LC0)
	call	printf
	li	a0,10
	call	putchar
	lui	a0,%hi(.LANCHOR0)
	addi	a2,a0,%lo(.LANCHOR0)
	li	a3,4
	addi	a2,a2,32
	li	a1,8
	addi	a0,a0,%lo(.LANCHOR0)
	call	merge
	mv	s3,a0
	mv	s0,a0
	addi	s2,a0,48
	lui	s1,%hi(.LC0)
.L3:
	lw	a1,0(s0)
	addi	a0,s1,%lo(.LC0)
	call	printf
	addi	s0,s0,4
	bne	s0,s2,.L3
	mv	a0,s3
	call	free
	li	a0,0
	ld	ra,40(sp)
	ld	s0,32(sp)
	ld	s1,24(sp)
	ld	s2,16(sp)
	ld	s3,8(sp)
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	.globl	lengthB
	.globl	lengthA
	.globl	arrayB
	.globl	arrayA
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	arrayA, @object
	.size	arrayA, 32
arrayA:
	.word	1
	.word	3
	.word	4
	.word	5
	.word	5
	.word	6
	.word	9
	.word	10
	.type	arrayB, @object
	.size	arrayB, 16
arrayB:
	.word	2
	.word	3
	.word	5
	.word	7
	.section	.srodata,"a"
	.align	3
	.type	lengthB, @object
	.size	lengthB, 8
lengthB:
	.dword	4
	.type	lengthA, @object
	.size	lengthA, 8
lengthA:
	.dword	8
	.ident	"GCC: (SiFive GCC-Metal 10.2.0-2020.12.8) 10.2.0"
