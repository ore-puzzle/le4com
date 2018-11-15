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
	ldr	v1, =_b__f6
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
	.global _b__f6
_b__f6:
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
	blt	LL_b__f6_0
	mov	v1, #0
	b	LL_b__f6_1
LL_b__f6_0:
	mov	v1, #1
LL_b__f6_1:
	str	v1, [fp, #-16]
	ldr	v1, [fp, #-16]
	cmp	v1, #0
	bne	L_b__f6_0
	mov	v1, a2
	ldr	v2, [fp, #-12]
	cmp	v1, v2
	blt	LL_b__f6_2
	mov	v1, #0
	b	LL_b__f6_3
LL_b__f6_2:
	mov	v1, #1
LL_b__f6_3:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f6_2
	mov	v1, #1
	str	v1, [fp, #-8]
	b	L_b__f6_3
L_b__f6_2:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f6_3:
	b	L_b__f6_1
L_b__f6_0:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f6_1:
	ldr	a1, [fp, #-8]
	b	_b__f6_ret
_b__f6_ret:
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
	.global _b__f3
_b__f3:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #24
	mov	v1, a2
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b__f3_ret
_b__f3_ret:
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
	mov	v1, a2
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b__f4_ret
_b__f4_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_insert
_b_insert:
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
	ldr	v1, =_b__f5
	str	v1, [a1, #0]
	ldr	v1, [fp, #-12]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #8]
	mov	v1, a2
	str	v1, [a1, #12]
	ldr	v1, [fp, #-20]
	str	v1, [a1, #16]
	ldr	v1, [sp, #0]
	str	v1, [a1, #20]
	ldr	v1, [fp, #-24]
	str	v1, [a1, #24]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-28]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b_insert_ret
_b_insert_ret:
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
	sub	sp, sp, #104
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
	bne	L_b__f5_4
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-52]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	v1, [fp, #-52]
	blx	v1
	str	a1, [fp, #-56]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-20]
	ldr	v2, [fp, #-56]
	cmp	v1, v2
	blt	LL_b__f5_4
	mov	v1, #0
	b	LL_b__f5_5
LL_b__f5_4:
	mov	v1, #1
LL_b__f5_5:
	str	v1, [fp, #-60]
	ldr	v1, [fp, #-60]
	cmp	v1, #0
	bne	L_b__f5_6
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-52]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	v1, [fp, #-52]
	blx	v1
	str	a1, [fp, #-68]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-28]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-72]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-28]
	ldr	a2, [fp, #-20]
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
	ldr	v1, [fp, #-80]
	blx	v1
	str	a1, [fp, #-84]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-76]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-88]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-76]
	ldr	a2, [fp, #-84]
	ldr	v1, [fp, #-88]
	blx	v1
	str	a1, [fp, #-92]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-8]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-68]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-92]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	b	L_b__f5_7
L_b__f5_6:
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-8]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-20]
	str	v1, [a1, #0]
	mov	v1, a2
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
L_b__f5_7:
	b	L_b__f5_5
L_b__f5_4:
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-8]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-20]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
L_b__f5_5:
	ldr	a1, [fp, #-8]
	b	_b__f5_ret
_b__f5_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_sort
_b_sort:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #92
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
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	v1, [fp, #-32]
	blx	v1
	str	a1, [fp, #-36]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-36]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-40]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-36]
	ldr	a2, [fp, #-16]
	ldr	v1, [fp, #-40]
	blx	v1
	str	a1, [fp, #-44]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-44]
	cmp	v1, #0
	bne	L_b_sort_8
	ldr	v1, [fp, #-20]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-48]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-20]
	ldr	v1, [fp, #-48]
	blx	v1
	str	a1, [fp, #-52]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-56]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	a2, [fp, #-52]
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
	mov	v1, a1
	ldr	v1, [v1, #0]
	str	v1, [fp, #-72]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a2, [fp, #-68]
	ldr	v1, [fp, #-72]
	blx	v1
	str	a1, [fp, #-76]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-60]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-80]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-60]
	ldr	a2, [fp, #-76]
	ldr	v1, [fp, #-80]
	blx	v1
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b_sort_9
L_b_sort_8:
	ldr	v1, [fp, #-16]
	str	v1, [fp, #-8]
L_b_sort_9:
	ldr	a1, [fp, #-8]
	b	_b_sort_ret
_b_sort_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_sorted
_b_sorted:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #112
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
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	v1, [fp, #-32]
	blx	v1
	str	a1, [fp, #-36]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-36]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-40]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-36]
	ldr	a2, [fp, #-16]
	ldr	v1, [fp, #-40]
	blx	v1
	str	a1, [fp, #-44]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-44]
	cmp	v1, #0
	bne	L_b_sorted_10
	ldr	v1, [fp, #-20]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-48]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-20]
	ldr	v1, [fp, #-48]
	blx	v1
	str	a1, [fp, #-52]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-12]
	ldr	a2, [fp, #-52]
	ldr	v1, [fp, #-32]
	blx	v1
	str	a1, [fp, #-60]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-60]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-64]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-60]
	ldr	a2, [fp, #-16]
	ldr	v1, [fp, #-64]
	blx	v1
	str	a1, [fp, #-68]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-68]
	cmp	v1, #0
	bne	L_b_sorted_12
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-72]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	v1, [fp, #-72]
	blx	v1
	str	a1, [fp, #-76]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-28]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-80]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-28]
	ldr	v1, [fp, #-80]
	blx	v1
	str	a1, [fp, #-84]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-76]
	ldr	v2, [fp, #-84]
	cmp	v1, v2
	blt	LL_b_sorted_6
	mov	v1, #0
	b	LL_b_sorted_7
LL_b_sorted_6:
	mov	v1, #1
LL_b_sorted_7:
	str	v1, [fp, #-88]
	ldr	v1, [fp, #-88]
	cmp	v1, #0
	bne	L_b_sorted_14
	ldr	v1, [fp, #-20]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-48]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-20]
	ldr	v1, [fp, #-48]
	blx	v1
	str	a1, [fp, #-96]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	v1, a1
	ldr	v1, [v1, #0]
	str	v1, [fp, #-100]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a2, [fp, #-96]
	ldr	v1, [fp, #-100]
	blx	v1
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b_sorted_15
L_b_sorted_14:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b_sorted_15:
	b	L_b_sorted_13
L_b_sorted_12:
	mov	v1, #1
	str	v1, [fp, #-8]
L_b_sorted_13:
	b	L_b_sorted_11
L_b_sorted_10:
	mov	v1, #1
	str	v1, [fp, #-8]
L_b_sorted_11:
	ldr	a1, [fp, #-8]
	b	_b_sorted_ret
_b_sorted_ret:
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
	sub	sp, sp, #132
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
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-36]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f3
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-36]
	str	v1, [fp, #-40]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-44]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f4
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-44]
	str	v1, [fp, #-48]
	mov	v1, #-1
	str	v1, [fp, #-52]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #5
	bl	mymalloc
	str	a1, [fp, #-56]
	ldr	a2, [sp, #4]
	ldr	v1, =_b_insert
	str	v1, [a1, #0]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-52]
	str	v1, [a1, #8]
	ldr	v1, [fp, #-24]
	str	v1, [a1, #12]
	ldr	v1, [fp, #-32]
	str	v1, [a1, #16]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #6
	bl	mymalloc
	str	a1, [fp, #-60]
	ldr	a2, [sp, #4]
	ldr	v1, =_b_sort
	str	v1, [a1, #0]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-52]
	str	v1, [a1, #8]
	ldr	v1, [fp, #-24]
	str	v1, [a1, #12]
	ldr	v1, [fp, #-56]
	str	v1, [a1, #16]
	ldr	v1, [fp, #-32]
	str	v1, [a1, #20]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #6
	bl	mymalloc
	str	a1, [fp, #-64]
	ldr	a2, [sp, #4]
	ldr	v1, =_b_sorted
	str	v1, [a1, #0]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-52]
	str	v1, [a1, #8]
	ldr	v1, [fp, #-32]
	str	v1, [a1, #12]
	ldr	v1, [fp, #-40]
	str	v1, [a1, #16]
	ldr	v1, [fp, #-24]
	str	v1, [a1, #20]
	ldr	a1, [sp, #0]
	mov	v1, #128
	mov	v2, #16
	mul	v1, v1, v2
	str	v1, [fp, #-68]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-72]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-52]
	str	v1, [a1, #0]
	mov	v1, #1
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
L_toplevel_16:
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-76]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	a2, [fp, #-72]
	ldr	v1, [fp, #-76]
	blx	v1
	str	a1, [fp, #-80]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-32]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-84]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-32]
	ldr	a2, [fp, #-72]
	ldr	v1, [fp, #-84]
	blx	v1
	str	a1, [fp, #-88]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-68]
	ldr	v2, [fp, #-88]
	cmp	v1, v2
	blt	LL_toplevel_8
	mov	v1, #0
	b	LL_toplevel_9
LL_toplevel_8:
	mov	v1, #1
LL_toplevel_9:
	str	v1, [fp, #-92]
	ldr	v1, [fp, #-92]
	cmp	v1, #0
	bne	L_toplevel_17
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-100]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-88]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-80]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-88]
	mov	v2, #1
	add	v1, v1, v2
	str	v1, [fp, #-104]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-108]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-100]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-104]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-108]
	str	v1, [fp, #-72]
	b	L_toplevel_16
	b	L_toplevel_18
L_toplevel_17:
	ldr	v1, [fp, #-80]
	str	v1, [fp, #-80]
L_toplevel_18:
	ldr	v1, [fp, #-60]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-112]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-60]
	ldr	a2, [fp, #-80]
	ldr	v1, [fp, #-112]
	blx	v1
	str	a1, [fp, #-116]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-64]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-120]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-64]
	ldr	a2, [fp, #-116]
	ldr	v1, [fp, #-120]
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
