	.text
	.align 2
	.global _b__f0
_b__f0:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #24
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f11
	str	v1, [a1, #0]
	mov	v1, a2
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-12]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b__f0_ret
_b__f0_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f11
_b__f11:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #32
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	ldr	v1, [fp, #-12]
	mov	v2, a2
	cmp	v1, v2
	blt	LL_b__f11_0
	mov	v1, #0
	b	LL_b__f11_1
LL_b__f11_0:
	mov	v1, #1
LL_b__f11_1:
	str	v1, [fp, #-16]
	ldr	v1, [fp, #-16]
	cmp	v1, #0
	bne	L_b__f11_0
	mov	v1, a2
	ldr	v2, [fp, #-12]
	cmp	v1, v2
	blt	LL_b__f11_2
	mov	v1, #0
	b	LL_b__f11_3
LL_b__f11_2:
	mov	v1, #1
LL_b__f11_3:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f11_2
	mov	v1, #1
	str	v1, [fp, #-8]
	b	L_b__f11_3
L_b__f11_2:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f11_3:
	b	L_b__f11_1
L_b__f11_0:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f11_1:
	ldr	a1, [fp, #-8]
	b	_b__f11_ret
_b__f11_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f1
_b__f1:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #20
	mov	v1, a2
	ldr	v1, [v1, #0]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b__f1_ret
_b__f1_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f2
_b__f2:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #20
	mov	v1, a2
	ldr	v1, [v1, #4]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b__f2_ret
_b__f2_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_map
_b_map:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #40
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, a1
	ldr	v1, [v1, #12]
	str	v1, [fp, #-20]
	mov	v1, a1
	ldr	v1, [v1, #16]
	str	v1, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #7
	bl	mymalloc
	str	a1, [fp, #-28]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f10
	str	v1, [a1, #0]
	ldr	v1, [fp, #-12]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #8]
	ldr	v1, [fp, #-20]
	str	v1, [a1, #12]
	mov	v1, a2
	str	v1, [a1, #16]
	ldr	v1, [sp, #0]
	str	v1, [a1, #20]
	ldr	v1, [fp, #-24]
	str	v1, [a1, #24]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-28]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b_map_ret
_b_map_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f10
_b__f10:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #100
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, a1
	ldr	v1, [v1, #12]
	str	v1, [fp, #-20]
	mov	v1, a1
	ldr	v1, [v1, #16]
	str	v1, [fp, #-24]
	mov	v1, a1
	ldr	v1, [v1, #20]
	str	v1, [fp, #-28]
	mov	v1, a1
	ldr	v1, [v1, #24]
	str	v1, [fp, #-32]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	v1, [fp, #-36]
	blx	v1
	str	a1, [fp, #-40]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-40]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-44]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-40]
	ldr	a2, [fp, #-16]
	ldr	v1, [fp, #-44]
	blx	v1
	str	a1, [fp, #-48]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-48]
	cmp	v1, #0
	bne	L_b__f10_4
	ldr	v1, [fp, #-20]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-52]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-20]
	ldr	v1, [fp, #-52]
	blx	v1
	str	a1, [fp, #-56]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-60]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	a2, [fp, #-56]
	ldr	v1, [fp, #-60]
	blx	v1
	str	a1, [fp, #-64]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-28]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-68]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-28]
	ldr	a2, [fp, #-24]
	ldr	v1, [fp, #-68]
	blx	v1
	str	a1, [fp, #-72]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-32]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-76]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-32]
	ldr	v1, [fp, #-76]
	blx	v1
	str	a1, [fp, #-80]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-72]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-84]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-72]
	ldr	a2, [fp, #-80]
	ldr	v1, [fp, #-84]
	blx	v1
	str	a1, [fp, #-88]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-8]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-64]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-88]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	b	L_b__f10_5
L_b__f10_4:
	ldr	v1, [fp, #-16]
	str	v1, [fp, #-8]
L_b__f10_5:
	ldr	a1, [fp, #-8]
	b	_b__f10_ret
_b__f10_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f3
_b__f3:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #40
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, a1
	ldr	v1, [v1, #12]
	str	v1, [fp, #-20]
	mov	v1, a1
	ldr	v1, [v1, #16]
	str	v1, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #6
	bl	mymalloc
	str	a1, [fp, #-28]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f7
	str	v1, [a1, #0]
	ldr	v1, [fp, #-12]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #8]
	mov	v1, a2
	str	v1, [a1, #12]
	ldr	v1, [fp, #-20]
	str	v1, [a1, #16]
	ldr	v1, [fp, #-24]
	str	v1, [a1, #20]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-28]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b__f3_ret
_b__f3_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f7
_b__f7:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #44
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, a1
	ldr	v1, [v1, #12]
	str	v1, [fp, #-20]
	mov	v1, a1
	ldr	v1, [v1, #16]
	str	v1, [fp, #-24]
	mov	v1, a1
	ldr	v1, [v1, #20]
	str	v1, [fp, #-28]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #7
	bl	mymalloc
	str	a1, [fp, #-32]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f8
	str	v1, [a1, #0]
	ldr	v1, [fp, #-12]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #8]
	ldr	v1, [fp, #-20]
	str	v1, [a1, #12]
	ldr	v1, [fp, #-24]
	str	v1, [a1, #16]
	ldr	v1, [fp, #-28]
	str	v1, [a1, #20]
	mov	v1, a2
	str	v1, [a1, #24]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-32]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b__f7_ret
_b__f7_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f8
_b__f8:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #60
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, a1
	ldr	v1, [v1, #12]
	str	v1, [fp, #-20]
	mov	v1, a1
	ldr	v1, [v1, #16]
	str	v1, [fp, #-24]
	mov	v1, a1
	ldr	v1, [v1, #20]
	str	v1, [fp, #-28]
	mov	v1, a1
	ldr	v1, [v1, #24]
	str	v1, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #6
	bl	mymalloc
	str	a1, [fp, #-36]
	ldr	a2, [sp, #4]
	ldr	v1, =_b_red
	str	v1, [a1, #0]
	ldr	v1, [fp, #-12]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #8]
	ldr	v1, [fp, #-20]
	str	v1, [a1, #12]
	ldr	v1, [fp, #-24]
	str	v1, [a1, #16]
	ldr	v1, [fp, #-28]
	str	v1, [a1, #20]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-36]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-40]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-36]
	ldr	a2, [fp, #-32]
	ldr	v1, [fp, #-40]
	blx	v1
	str	a1, [fp, #-44]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-44]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-48]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-44]
	ldr	v1, [fp, #-48]
	blx	v1
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a1, [fp, #-8]
	b	_b__f8_ret
_b__f8_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_red
_b_red:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #44
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, a1
	ldr	v1, [v1, #12]
	str	v1, [fp, #-20]
	mov	v1, a1
	ldr	v1, [v1, #16]
	str	v1, [fp, #-24]
	mov	v1, a1
	ldr	v1, [v1, #20]
	str	v1, [fp, #-28]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #8
	bl	mymalloc
	str	a1, [fp, #-32]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f9
	str	v1, [a1, #0]
	ldr	v1, [fp, #-12]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #8]
	mov	v1, a2
	str	v1, [a1, #12]
	ldr	v1, [fp, #-20]
	str	v1, [a1, #16]
	ldr	v1, [fp, #-24]
	str	v1, [a1, #20]
	ldr	v1, [sp, #0]
	str	v1, [a1, #24]
	ldr	v1, [fp, #-28]
	str	v1, [a1, #28]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-32]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b_red_ret
_b_red_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f9
_b__f9:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #108
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	mov	v1, a1
	ldr	v1, [v1, #12]
	str	v1, [fp, #-20]
	mov	v1, a1
	ldr	v1, [v1, #16]
	str	v1, [fp, #-24]
	mov	v1, a1
	ldr	v1, [v1, #20]
	str	v1, [fp, #-28]
	mov	v1, a1
	ldr	v1, [v1, #24]
	str	v1, [fp, #-32]
	mov	v1, a1
	ldr	v1, [v1, #28]
	str	v1, [fp, #-36]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-40]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	v1, [fp, #-40]
	blx	v1
	str	a1, [fp, #-44]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-44]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-48]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-44]
	ldr	a2, [fp, #-16]
	ldr	v1, [fp, #-48]
	blx	v1
	str	a1, [fp, #-52]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-52]
	cmp	v1, #0
	bne	L_b__f9_6
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-56]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	a2, [fp, #-20]
	ldr	v1, [fp, #-56]
	blx	v1
	str	a1, [fp, #-60]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-28]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-64]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-28]
	ldr	v1, [fp, #-64]
	blx	v1
	str	a1, [fp, #-68]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-60]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-72]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-60]
	ldr	a2, [fp, #-68]
	ldr	v1, [fp, #-72]
	blx	v1
	str	a1, [fp, #-76]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-32]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-80]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-32]
	ldr	a2, [fp, #-76]
	ldr	v1, [fp, #-80]
	blx	v1
	str	a1, [fp, #-84]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-36]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-88]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-36]
	ldr	v1, [fp, #-88]
	blx	v1
	str	a1, [fp, #-92]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-84]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-96]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-84]
	ldr	a2, [fp, #-92]
	ldr	v1, [fp, #-96]
	blx	v1
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b__f9_7
L_b__f9_6:
	ldr	v1, [fp, #-20]
	str	v1, [fp, #-8]
L_b__f9_7:
	ldr	a1, [fp, #-8]
	b	_b__f9_ret
_b__f9_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f4
_b__f4:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #24
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f6
	str	v1, [a1, #0]
	mov	v1, a2
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-12]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b__f4_ret
_b__f4_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f6
_b__f6:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #24
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	ldr	v1, [fp, #-12]
	mov	v2, a2
	add	v1, v1, v2
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b__f6_ret
_b__f6_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b__f5
_b__f5:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #20
	mov	v1, a2
	mov	v2, a2
	add	v1, v1, v2
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b__f5_ret
_b__f5_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _toplevel
_toplevel:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #148
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f0
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-12]
	str	v1, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-20]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f1
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-20]
	str	v1, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-28]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f2
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-28]
	str	v1, [fp, #-32]
	mov	v1, #-1
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #5
	bl	mymalloc
	str	a1, [fp, #-40]
	ldr	a2, [sp, #4]
	ldr	v1, =_b_map
	str	v1, [a1, #0]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-36]
	str	v1, [a1, #8]
	ldr	v1, [fp, #-24]
	str	v1, [a1, #12]
	ldr	v1, [fp, #-32]
	str	v1, [a1, #16]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #5
	bl	mymalloc
	str	a1, [fp, #-44]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f3
	str	v1, [a1, #0]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-36]
	str	v1, [a1, #8]
	ldr	v1, [fp, #-24]
	str	v1, [a1, #12]
	ldr	v1, [fp, #-32]
	str	v1, [a1, #16]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-44]
	str	v1, [fp, #-48]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-52]
	ldr	a2, [sp, #4]
	mov	v1, #5
	str	v1, [a1, #0]
	ldr	v1, [fp, #-36]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-56]
	ldr	a2, [sp, #4]
	mov	v1, #4
	str	v1, [a1, #0]
	ldr	v1, [fp, #-52]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-60]
	ldr	a2, [sp, #4]
	mov	v1, #3
	str	v1, [a1, #0]
	ldr	v1, [fp, #-56]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-64]
	ldr	a2, [sp, #4]
	mov	v1, #2
	str	v1, [a1, #0]
	ldr	v1, [fp, #-60]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-68]
	ldr	a2, [sp, #4]
	mov	v1, #1
	str	v1, [a1, #0]
	ldr	v1, [fp, #-64]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-72]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f4
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-72]
	str	v1, [fp, #-76]
	ldr	v1, [fp, #-48]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-80]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-48]
	ldr	a2, [fp, #-76]
	ldr	v1, [fp, #-80]
	blx	v1
	str	a1, [fp, #-84]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-84]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-88]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-84]
	mov	a2, #0
	ldr	v1, [fp, #-88]
	blx	v1
	str	a1, [fp, #-92]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-96]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f5
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-96]
	str	v1, [fp, #-100]
	ldr	v1, [fp, #-40]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-104]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-40]
	ldr	a2, [fp, #-100]
	ldr	v1, [fp, #-104]
	blx	v1
	str	a1, [fp, #-108]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-108]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-112]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-108]
	ldr	a2, [fp, #-68]
	ldr	v1, [fp, #-112]
	blx	v1
	str	a1, [fp, #-116]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-92]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-120]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-92]
	ldr	a2, [fp, #-116]
	ldr	v1, [fp, #-120]
	blx	v1
	str	a1, [fp, #-124]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-128]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-124]
	ldr	v1, [fp, #-128]
	blx	v1
	str	a1, [fp, #-132]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-132]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-136]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-132]
	mov	a2, #30
	ldr	v1, [fp, #-136]
	blx	v1
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a1, [fp, #-8]
	b	_toplevel_ret
_toplevel_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
