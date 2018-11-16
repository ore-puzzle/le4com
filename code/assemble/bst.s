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
	ldr	v1, =_b__f5
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
	.global _b__f5
_b__f5:
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
	blt	LL_b__f5_0
	mov	v1, #0
	b	LL_b__f5_1
LL_b__f5_0:
	mov	v1, #1
LL_b__f5_1:
	str	v1, [fp, #-16]
	ldr	v1, [fp, #-16]
	cmp	v1, #0
	bne	L_b__f5_0
	mov	v1, a2
	ldr	v2, [fp, #-12]
	cmp	v1, v2
	blt	LL_b__f5_2
	mov	v1, #0
	b	LL_b__f5_3
LL_b__f5_2:
	mov	v1, #1
LL_b__f5_3:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f5_2
	mov	v1, #1
	str	v1, [fp, #-8]
	b	L_b__f5_3
L_b__f5_2:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f5_3:
	b	L_b__f5_1
L_b__f5_0:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f5_1:
	ldr	a1, [fp, #-8]
	b	_b__f5_ret
_b__f5_ret:
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
	sub	sp, sp, #24
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f4
	str	v1, [a1, #0]
	mov	v1, a2
	str	v1, [a1, #4]
	ldr	v1, [sp, #0]
	str	v1, [a1, #8]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-12]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b_insert_ret
_b_insert_ret:
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
	sub	sp, sp, #140
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	ldr	v1, [fp, #-12]
	mov	v2, #0
	cmp	v1, v2
	blt	LL_b__f4_4
	mov	v1, #0
	b	LL_b__f4_5
LL_b__f4_4:
	mov	v1, #1
LL_b__f4_5:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f4_4
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-28]
	ldr	v1, [fp, #-28]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-32]
	mov	v1, a2
	ldr	v2, [fp, #-32]
	cmp	v1, v2
	blt	LL_b__f4_6
	mov	v1, #0
	b	LL_b__f4_7
LL_b__f4_6:
	mov	v1, #1
LL_b__f4_7:
	str	v1, [fp, #-36]
	ldr	v1, [fp, #-36]
	cmp	v1, #0
	bne	L_b__f4_6
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-80]
	ldr	v1, [fp, #-80]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-84]
	ldr	v1, [fp, #-84]
	mov	v2, a2
	cmp	v1, v2
	blt	LL_b__f4_8
	mov	v1, #0
	b	LL_b__f4_9
LL_b__f4_8:
	mov	v1, #1
LL_b__f4_9:
	str	v1, [fp, #-88]
	ldr	v1, [fp, #-88]
	cmp	v1, #0
	bne	L_b__f4_8
	ldr	v1, [fp, #-12]
	str	v1, [fp, #-8]
	b	L_b__f4_9
L_b__f4_8:
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-92]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-96]
	ldr	v1, [fp, #-96]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-100]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-104]
	ldr	v1, [fp, #-104]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-108]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-44]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-108]
	ldr	v1, [fp, #-44]
	blx	v1
	str	a1, [fp, #-116]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-116]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-120]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-116]
	ldr	v1, [fp, #-120]
	blx	v1
	str	a1, [fp, #-124]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-128]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-100]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-124]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-8]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-92]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-128]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
L_b__f4_9:
	b	L_b__f4_7
L_b__f4_6:
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-40]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-44]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-40]
	ldr	v1, [fp, #-44]
	blx	v1
	str	a1, [fp, #-48]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-48]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-52]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-48]
	ldr	v1, [fp, #-52]
	blx	v1
	str	a1, [fp, #-56]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-60]
	ldr	v1, [fp, #-60]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-64]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-68]
	ldr	v1, [fp, #-68]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-72]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-76]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-64]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-72]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-8]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-56]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-76]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
L_b__f4_7:
	b	L_b__f4_5
L_b__f4_4:
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-24]
	ldr	a2, [sp, #4]
	mov	v1, a2
	str	v1, [a1, #0]
	mov	v1, #-1
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-8]
	ldr	a2, [sp, #4]
	mov	v1, #-1
	str	v1, [a1, #0]
	ldr	v1, [fp, #-24]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
L_b__f4_5:
	ldr	a1, [fp, #-8]
	b	_b__f4_ret
_b__f4_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_search
_b_search:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #24
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f3
	str	v1, [a1, #0]
	mov	v1, a2
	str	v1, [a1, #4]
	ldr	v1, [sp, #0]
	str	v1, [a1, #8]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-12]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b_search_ret
_b_search_ret:
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
	sub	sp, sp, #92
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	ldr	v1, [fp, #-12]
	mov	v2, #0
	cmp	v1, v2
	blt	LL_b__f3_10
	mov	v1, #0
	b	LL_b__f3_11
LL_b__f3_10:
	mov	v1, #1
LL_b__f3_11:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f3_10
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-24]
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-28]
	mov	v1, a2
	ldr	v2, [fp, #-28]
	cmp	v1, v2
	blt	LL_b__f3_12
	mov	v1, #0
	b	LL_b__f3_13
LL_b__f3_12:
	mov	v1, #1
LL_b__f3_13:
	str	v1, [fp, #-32]
	ldr	v1, [fp, #-32]
	cmp	v1, #0
	bne	L_b__f3_12
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-52]
	ldr	v1, [fp, #-52]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-56]
	ldr	v1, [fp, #-56]
	mov	v2, a2
	cmp	v1, v2
	blt	LL_b__f3_14
	mov	v1, #0
	b	LL_b__f3_15
LL_b__f3_14:
	mov	v1, #1
LL_b__f3_15:
	str	v1, [fp, #-60]
	ldr	v1, [fp, #-60]
	cmp	v1, #0
	bne	L_b__f3_14
	mov	v1, #1
	str	v1, [fp, #-8]
	b	L_b__f3_15
L_b__f3_14:
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-64]
	ldr	v1, [fp, #-64]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-68]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-40]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-68]
	ldr	v1, [fp, #-40]
	blx	v1
	str	a1, [fp, #-76]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-76]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-80]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-76]
	ldr	v1, [fp, #-80]
	blx	v1
	str	a1, [fp, #-8]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
L_b__f3_15:
	b	L_b__f3_13
L_b__f3_12:
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-36]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-40]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-36]
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
L_b__f3_13:
	b	L_b__f3_11
L_b__f3_10:
	mov	v1, #0
	str	v1, [fp, #-8]
L_b__f3_11:
	ldr	a1, [fp, #-8]
	b	_b__f3_ret
_b__f3_ret:
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
	sub	sp, sp, #52
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a2, [sp, #4]
	mov	v1, a2
	str	v1, [a1, #0]
	mov	v1, #0
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
L_b__f1_16:
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-16]
	ldr	v1, [fp, #-16]
	mov	v2, #2
	cmp	v1, v2
	blt	LL_b__f1_16
	mov	v1, #0
	b	LL_b__f1_17
LL_b__f1_16:
	mov	v1, #1
LL_b__f1_17:
	str	v1, [fp, #-20]
	ldr	v1, [fp, #-20]
	cmp	v1, #0
	bne	L_b__f1_17
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-24]
	ldr	v1, [fp, #-24]
	mov	v2, #-2
	add	v1, v1, v2
	str	v1, [fp, #-28]
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-32]
	ldr	v1, [fp, #-32]
	mov	v2, #1
	add	v1, v1, v2
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-40]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-28]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-36]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-40]
	str	v1, [fp, #-12]
	b	L_b__f1_16
	b	L_b__f1_18
L_b__f1_17:
	ldr	v1, [fp, #-12]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-8]
L_b__f1_18:
	ldr	a1, [fp, #-8]
	b	_b__f1_ret
_b__f1_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
	.align 2
	.global _b_mk_tree
_b_mk_tree:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #32
	mov	v1, a1
	ldr	v1, [v1, #4]
	str	v1, [fp, #-12]
	mov	v1, a1
	ldr	v1, [v1, #8]
	str	v1, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #5
	bl	mymalloc
	str	a1, [fp, #-20]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f2
	str	v1, [a1, #0]
	mov	v1, a2
	str	v1, [a1, #4]
	ldr	v1, [fp, #-12]
	str	v1, [a1, #8]
	ldr	v1, [sp, #0]
	str	v1, [a1, #12]
	ldr	v1, [fp, #-16]
	str	v1, [a1, #16]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-20]
	str	v1, [fp, #-8]
	ldr	a1, [fp, #-8]
	b	_b_mk_tree_ret
_b_mk_tree_ret:
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
	sub	sp, sp, #124
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
	ldr	v1, [fp, #-12]
	mov	v2, a2
	cmp	v1, v2
	blt	LL_b__f2_18
	mov	v1, #0
	b	LL_b__f2_19
LL_b__f2_18:
	mov	v1, #1
LL_b__f2_19:
	str	v1, [fp, #-28]
	ldr	v1, [fp, #-28]
	cmp	v1, #0
	bne	L_b__f2_19
	mov	v1, #-1
	str	v1, [fp, #-8]
	b	L_b__f2_20
L_b__f2_19:
	ldr	v1, [fp, #-12]
	mov	v2, a2
	add	v1, v1, v2
	str	v1, [fp, #-32]
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-36]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-32]
	ldr	v1, [fp, #-36]
	blx	v1
	str	a1, [fp, #-40]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-20]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-44]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-20]
	ldr	a2, [fp, #-12]
	ldr	v1, [fp, #-44]
	blx	v1
	str	a1, [fp, #-48]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-48]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-52]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-48]
	ldr	a2, [fp, #-40]
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
	ldr	v1, [fp, #-64]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-68]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-64]
	ldr	a2, [fp, #-12]
	ldr	v1, [fp, #-68]
	blx	v1
	str	a1, [fp, #-72]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-40]
	mov	v2, #1
	add	v1, v1, v2
	str	v1, [fp, #-76]
	ldr	v1, [fp, #-20]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-44]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-20]
	ldr	a2, [fp, #-76]
	ldr	v1, [fp, #-44]
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
	ldr	v1, [fp, #-88]
	blx	v1
	str	a1, [fp, #-92]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-60]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	a2, [fp, #-92]
	ldr	v1, [fp, #-60]
	blx	v1
	str	a1, [fp, #-100]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-100]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-104]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-100]
	ldr	v1, [fp, #-104]
	blx	v1
	str	a1, [fp, #-108]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-112]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-40]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-108]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-8]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-72]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-112]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
L_b__f2_20:
	ldr	a1, [fp, #-8]
	b	_b__f2_ret
_b__f2_ret:
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
	sub	sp, sp, #140
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
	ldr	v1, =_b_insert
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-24]
	ldr	a2, [sp, #4]
	ldr	v1, =_b_search
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	str	a1, [fp, #-28]
	ldr	a2, [sp, #4]
	ldr	v1, =_b__f1
	str	v1, [a1, #0]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-28]
	str	v1, [fp, #-32]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	str	a1, [fp, #-36]
	ldr	a2, [sp, #4]
	ldr	v1, =_b_mk_tree
	str	v1, [a1, #0]
	ldr	v1, [fp, #-32]
	str	v1, [a1, #4]
	ldr	v1, [fp, #-20]
	str	v1, [a1, #8]
	ldr	a1, [sp, #0]
	mov	v1, #64
	mov	v2, #64
	mul	v1, v1, v2
	str	v1, [fp, #-40]
	ldr	v1, [fp, #-36]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-44]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-36]
	mov	a2, #1
	ldr	v1, [fp, #-44]
	blx	v1
	str	a1, [fp, #-48]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-48]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-52]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-48]
	ldr	a2, [fp, #-40]
	ldr	v1, [fp, #-52]
	blx	v1
	str	a1, [fp, #-56]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-40]
	mov	v2, #2
	mul	v1, v1, v2
	str	v1, [fp, #-60]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-64]
	ldr	a2, [sp, #4]
	mov	v1, #0
	str	v1, [a1, #0]
	ldr	v1, [fp, #-60]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
L_toplevel_21:
	ldr	v1, [fp, #-64]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-68]
	ldr	v1, [fp, #-68]
	mov	v2, #0
	cmp	v1, v2
	blt	LL_toplevel_20
	mov	v1, #0
	b	LL_toplevel_21
LL_toplevel_20:
	mov	v1, #1
LL_toplevel_21:
	str	v1, [fp, #-72]
	ldr	v1, [fp, #-72]
	cmp	v1, #0
	bne	L_toplevel_22
	ldr	v1, [fp, #-64]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-80]
	ldr	v1, [fp, #-24]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-84]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-24]
	ldr	a2, [fp, #-56]
	ldr	v1, [fp, #-84]
	blx	v1
	str	a1, [fp, #-88]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-64]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-92]
	ldr	v1, [fp, #-88]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-96]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-88]
	ldr	a2, [fp, #-92]
	ldr	v1, [fp, #-96]
	blx	v1
	str	a1, [fp, #-100]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-80]
	ldr	v2, [fp, #-100]
	add	v1, v1, v2
	str	v1, [fp, #-104]
	ldr	v1, [fp, #-64]
	ldr	v1, [v1, #4]
	str	v1, [fp, #-108]
	ldr	v1, [fp, #-108]
	mov	v2, #-1
	add	v1, v1, v2
	str	v1, [fp, #-112]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	str	a1, [fp, #-116]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-104]
	str	v1, [a1, #0]
	ldr	v1, [fp, #-112]
	str	v1, [a1, #4]
	ldr	a1, [sp, #0]
	ldr	v1, [fp, #-116]
	str	v1, [fp, #-64]
	b	L_toplevel_21
	b	L_toplevel_23
L_toplevel_22:
	ldr	v1, [fp, #-64]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-76]
L_toplevel_23:
	ldr	v1, [fp, #-16]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-120]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-16]
	ldr	a2, [fp, #-76]
	ldr	v1, [fp, #-120]
	blx	v1
	str	a1, [fp, #-124]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v1, [fp, #-124]
	ldr	v1, [v1, #0]
	str	v1, [fp, #-128]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	ldr	a1, [fp, #-124]
	ldr	a2, [fp, #-40]
	ldr	v1, [fp, #-128]
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
