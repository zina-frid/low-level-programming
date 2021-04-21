	.file	"merge.c"
	.option nopic
	.attribute arch, "rv64i2p0_a2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	merge
	.type	merge, @function
merge:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	sd	s1,40(sp)
	sd	s2,32(sp)
	sd	s3,24(sp)
	sd	s4,16(sp)
	sd	s5,8(sp)
	mv	s1,a0
	mv	s2,a1
	mv	s3,a2
	mv	s0,a3
	add	s5,a1,a3
	slli	s4,s5,2
	mv	a0,s4
	call	malloc
	beq	s5,zero,.L1
	mv	a5,a0
	add	a3,s4,a0
	li	a6,0
	li	a7,0
	j	.L6
.L3:
	slli	a4,a7,2
	add	a4,s1,a4
	lw	a4,0(a4)
	sw	a4,0(a5)
	addiw	a7,a7,1
.L5:
	addi	a5,a5,4
	beq	a5,a3,.L1
.L6:
	mv	a4,a6
	bgeu	a6,s0,.L3
	bgeu	a7,s2,.L4
	slli	a1,a7,2
	add	a1,s1,a1
	slli	a2,a6,2
	add	a2,s3,a2
	lw	a1,0(a1)
	lw	a2,0(a2)
	bltu	a1,a2,.L3
.L4:
	slli	a4,a4,2
	add	a4,s3,a4
	lw	a4,0(a4)
	sw	a4,0(a5)
	addiw	a6,a6,1
	j	.L5
.L1:
	ld	ra,56(sp)
	ld	s0,48(sp)
	ld	s1,40(sp)
	ld	s2,32(sp)
	ld	s3,24(sp)
	ld	s4,16(sp)
	ld	s5,8(sp)
	addi	sp,sp,64
	jr	ra
	.size	merge, .-merge
	.ident	"GCC: (SiFive GCC-Metal 10.2.0-2020.12.8) 10.2.0"
