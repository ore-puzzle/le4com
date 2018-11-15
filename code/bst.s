	.text
	.align 2
	.global _b__f0
_b__f0:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f5
	str	a3, [v1, #0]
	str	a2, [v1, #4]
	mov	a1, v1
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
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	cmp	v1, a2
	blt	LL_b__f5_0
	mov	v2, #0
	b	LL_b__f5_1
LL_b__f5_0:
	mov	v2, #1
LL_b__f5_1:
	cmp	v2, #0
	bne	L_b__f5_0
	cmp	a2, v1
	blt	LL_b__f5_2
	mov	v1, #0
	b	LL_b__f5_3
LL_b__f5_2:
	mov	v1, #1
LL_b__f5_3:
	cmp	v1, #0
	bne	L_b__f5_2
	mov	v1, #1
	b	L_b__f5_3
L_b__f5_2:
	mov	v1, #0
L_b__f5_3:
	b	L_b__f5_1
L_b__f5_0:
	mov	v1, #0
L_b__f5_1:
	mov	a1, v1
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
	sub	sp, sp, #16
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f4
	str	a3, [v1, #0]
	str	a2, [v1, #4]
	str	a1, [v1, #8]
	mov	a1, v1
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
	sub	sp, sp, #24
	ldr	v6, [a1, #4]
	ldr	v5, [a1, #8]
	cmp	v6, #0
	blt	LL_b__f4_4
	mov	v1, #0
	b	LL_b__f4_5
LL_b__f4_4:
	mov	v1, #1
LL_b__f4_5:
	cmp	v1, #0
	bne	L_b__f4_4
	ldr	v1, [v6, #4]
	ldr	v1, [v1, #0]
	cmp	a2, v1
	blt	LL_b__f4_6
	mov	v1, #0
	b	LL_b__f4_7
LL_b__f4_6:
	mov	v1, #1
LL_b__f4_7:
	cmp	v1, #0
	bne	L_b__f4_6
	ldr	v1, [v6, #4]
	ldr	v1, [v1, #0]
	cmp	v1, a2
	blt	LL_b__f4_8
	mov	v1, #0
	b	LL_b__f4_9
LL_b__f4_8:
	mov	v1, #1
LL_b__f4_9:
	cmp	v1, #0
	bne	L_b__f4_8
	mov	v3, v6
	b	L_b__f4_9
L_b__f4_8:
	ldr	v4, [v6, #0]
	ldr	v1, [v6, #4]
	ldr	v3, [v1, #0]
	ldr	v1, [v6, #4]
	ldr	v1, [v1, #4]
	ldr	v2, [v5, #0]
	str	v4, [fp, #-8]
	str	v3, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v3, [fp, #-12]
	ldr	v2, [v1, #0]
	str	v4, [fp, #-8]
	str	v3, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v3, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v3, [v2, #0]
	str	v1, [v2, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v4, [v3, #0]
	str	v2, [v3, #4]
L_b__f4_9:
	b	L_b__f4_7
L_b__f4_6:
	ldr	v1, [v6, #0]
	ldr	v2, [v5, #0]
	str	v6, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v2, [v1, #0]
	str	v6, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v1, [v6, #4]
	ldr	v3, [v1, #0]
	ldr	v1, [v6, #4]
	ldr	v1, [v1, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v3, [v2, #0]
	str	v1, [v2, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v4, [v3, #0]
	str	v2, [v3, #4]
L_b__f4_7:
	b	L_b__f4_5
L_b__f4_4:
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	a2, [v1, #0]
	mov	a3, #-1
	str	a3, [v1, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a3, #-1
	str	a3, [v3, #0]
	str	v1, [v3, #4]
L_b__f4_5:
	mov	a1, v3
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
	sub	sp, sp, #16
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f3
	str	a3, [v1, #0]
	str	a2, [v1, #4]
	str	a1, [v1, #8]
	mov	a1, v1
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
	sub	sp, sp, #16
	ldr	v2, [a1, #4]
	ldr	v3, [a1, #8]
	cmp	v2, #0
	blt	LL_b__f3_10
	mov	v1, #0
	b	LL_b__f3_11
LL_b__f3_10:
	mov	v1, #1
LL_b__f3_11:
	cmp	v1, #0
	bne	L_b__f3_10
	ldr	v1, [v2, #4]
	ldr	v1, [v1, #0]
	cmp	a2, v1
	blt	LL_b__f3_12
	mov	v1, #0
	b	LL_b__f3_13
LL_b__f3_12:
	mov	v1, #1
LL_b__f3_13:
	cmp	v1, #0
	bne	L_b__f3_12
	ldr	v1, [v2, #4]
	ldr	v1, [v1, #0]
	cmp	v1, a2
	blt	LL_b__f3_14
	mov	v1, #0
	b	LL_b__f3_15
LL_b__f3_14:
	mov	v1, #1
LL_b__f3_15:
	cmp	v1, #0
	bne	L_b__f3_14
	mov	v1, #1
	b	L_b__f3_15
L_b__f3_14:
	ldr	v1, [v2, #4]
	ldr	v1, [v1, #4]
	ldr	v2, [v3, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v2, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
L_b__f3_15:
	b	L_b__f3_13
L_b__f3_12:
	ldr	v1, [v2, #0]
	ldr	v2, [v3, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v2, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
L_b__f3_13:
	b	L_b__f3_11
L_b__f3_10:
	mov	v1, #0
L_b__f3_11:
	mov	a1, v1
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
	sub	sp, sp, #16
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	a2, [v2, #0]
	mov	a3, #0
	str	a3, [v2, #4]
L_b__f1_16:
	ldr	v1, [v2, #0]
	cmp	v1, #2
	blt	LL_b__f1_16
	mov	v1, #0
	b	LL_b__f1_17
LL_b__f1_16:
	mov	v1, #1
LL_b__f1_17:
	cmp	v1, #0
	bne	L_b__f1_17
	ldr	v1, [v2, #0]
	add	v3, v1, #-2
	ldr	v1, [v2, #4]
	add	v1, v1, #1
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v3, [v2, #0]
	str	v1, [v2, #4]
	b	L_b__f1_16
	b	L_b__f1_18
L_b__f1_17:
	ldr	v1, [v2, #4]
L_b__f1_18:
	mov	a1, v1
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
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	ldr	v2, [a1, #8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #5
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f2
	str	a3, [v3, #0]
	str	a2, [v3, #4]
	str	v1, [v3, #8]
	str	a1, [v3, #12]
	str	v2, [v3, #16]
	mov	v1, v3
	mov	a1, v1
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
	sub	sp, sp, #32
	ldr	v4, [a1, #4]
	ldr	v3, [a1, #8]
	ldr	v5, [a1, #12]
	ldr	v6, [a1, #16]
	cmp	v4, a2
	blt	LL_b__f2_18
	mov	v1, #0
	b	LL_b__f2_19
LL_b__f2_18:
	mov	v1, #1
LL_b__f2_19:
	cmp	v1, #0
	bne	L_b__f2_19
	mov	v1, #-1
	b	L_b__f2_20
L_b__f2_19:
	add	v1, v4, a2
	ldr	v2, [v3, #0]
	str	v6, [fp, #-8]
	str	v5, [fp, #-12]
	str	v4, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v1
	blx	v2
	mov	v7, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v4, [fp, #-16]
	ldr	v2, [v5, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	v5, [fp, #-16]
	str	v4, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v4
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v5, [fp, #-16]
	ldr	v4, [fp, #-20]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	v5, [fp, #-16]
	str	v4, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v7
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v5, [fp, #-16]
	ldr	v4, [fp, #-20]
	ldr	v2, [v6, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	v5, [fp, #-16]
	str	v4, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v6
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v5, [fp, #-16]
	ldr	v4, [fp, #-20]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	v5, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v4
	blx	v2
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v5, [fp, #-16]
	add	v1, v7, #1
	ldr	v2, [v5, #0]
	str	v3, [fp, #-8]
	str	v7, [fp, #-12]
	str	v6, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v3, [fp, #-8]
	ldr	v7, [fp, #-12]
	ldr	v6, [fp, #-16]
	ldr	v2, [v1, #0]
	str	v3, [fp, #-8]
	str	v7, [fp, #-12]
	str	v6, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v3, [fp, #-8]
	ldr	v7, [fp, #-12]
	ldr	v6, [fp, #-16]
	ldr	v2, [v6, #0]
	str	v3, [fp, #-8]
	str	v7, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v6
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v3, [fp, #-8]
	ldr	v7, [fp, #-12]
	ldr	v2, [v1, #0]
	str	v3, [fp, #-8]
	str	v7, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v3, [fp, #-8]
	ldr	v7, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v7, [v2, #0]
	str	v1, [v2, #4]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v3, [v1, #0]
	str	v2, [v1, #4]
L_b__f2_20:
	mov	a1, v1
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
	sub	sp, sp, #44
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f0
	str	a3, [v1, #0]
	str	v1, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_insert
	str	a3, [v2, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v7, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_search
	str	a3, [v7, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f1
	str	a3, [v1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #3
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_mk_tree
	str	a3, [v3, #0]
	str	v1, [v3, #4]
	str	v2, [v3, #8]
	mov	a3, #64
	mov	a4, #64
	mul	ip, a3, a4
	str	ip, [fp, #-12]
	ldr	v1, [v3, #0]
	str	v7, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, #1
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-8]
	ldr	ip, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, ip
	blx	v2
	mov	v6, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	ip, [fp, #-12]
	mov	a4, #2
	mul	v1, ip, a4
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v5, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a3, #0
	str	a3, [v5, #0]
	str	v1, [v5, #4]
L_toplevel_21:
	ldr	v1, [v5, #4]
	cmp	v1, #0
	blt	LL_toplevel_20
	mov	v1, #0
	b	LL_toplevel_21
LL_toplevel_20:
	mov	v1, #1
LL_toplevel_21:
	cmp	v1, #0
	bne	L_toplevel_22
	ldr	v4, [v5, #0]
	ldr	v1, [v7, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	v5, [fp, #-16]
	str	v4, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v7
	mov	a2, v6
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v5, [fp, #-16]
	ldr	v4, [fp, #-20]
	ldr	v2, [v5, #4]
	ldr	v3, [v1, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	v5, [fp, #-16]
	str	v4, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v2
	blx	v3
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v5, [fp, #-16]
	ldr	v4, [fp, #-20]
	add	v3, v4, v1
	ldr	v1, [v5, #4]
	add	v1, v1, #-1
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v3, [v2, #0]
	str	v1, [v2, #4]
	mov	v5, v2
	b	L_toplevel_21
	b	L_toplevel_23
L_toplevel_22:
	ldr	v1, [v5, #0]
L_toplevel_23:
	ldr	ip, [fp, #-16]
	ldr	v2, [ip, #0]
	ldr	ip, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v2, [v1, #0]
	ldr	ip, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, ip
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a1, v1
	b	_toplevel_ret
_toplevel_ret:
	add	sp, fp, #4
	ldr	lr, [fp, #-4]
	ldr	fp, [fp, #0]
	bx	lr
