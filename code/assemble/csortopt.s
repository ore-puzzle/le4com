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
	ldr	a3, =_b__f6
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
	.global _b__f6
_b__f6:
	str	fp, [sp, #-4]
	str	lr, [sp, #-8]
	sub	fp, sp, #4
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	cmp	v1, a2
	blt	LL_b__f6_0
	mov	v2, #0
	b	LL_b__f6_1
LL_b__f6_0:
	mov	v2, #1
LL_b__f6_1:
	cmp	v2, #0
	bne	L_b__f6_0
	cmp	a2, v1
	blt	LL_b__f6_2
	mov	v1, #0
	b	LL_b__f6_3
LL_b__f6_2:
	mov	v1, #1
LL_b__f6_3:
	cmp	v1, #0
	bne	L_b__f6_2
	mov	v1, #1
	b	L_b__f6_3
L_b__f6_2:
	mov	v1, #0
L_b__f6_3:
	b	L_b__f6_1
L_b__f6_0:
	mov	v1, #0
L_b__f6_1:
	mov	a1, v1
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
	sub	sp, sp, #16
	ldr	v1, [a2, #0]
	mov	a1, v1
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
	sub	sp, sp, #16
	ldr	v1, [a2, #4]
	mov	a1, v1
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
	sub	sp, sp, #16
	ldr	v1, [a2, #4]
	ldr	v1, [v1, #0]
	mov	a1, v1
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
	sub	sp, sp, #16
	ldr	v1, [a2, #4]
	ldr	v1, [v1, #4]
	mov	a1, v1
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
	sub	sp, sp, #16
	ldr	v1, [a1, #4]
	ldr	v2, [a1, #8]
	ldr	v3, [a1, #12]
	ldr	v4, [a1, #16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #7
	bl	mymalloc
	mov	v5, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f5
	str	a3, [v5, #0]
	str	v1, [v5, #4]
	str	v2, [v5, #8]
	str	a2, [v5, #12]
	str	v3, [v5, #16]
	str	a1, [v5, #20]
	str	v4, [v5, #24]
	mov	a1, v5
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
	sub	sp, sp, #36
	ldr	v1, [a1, #4]
	ldr	v3, [a1, #8]
	ldr	v6, [a1, #12]
	ldr	v4, [a1, #16]
	ldr	v5, [a1, #20]
	ldr	v7, [a1, #24]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-8]
	str	v5, [fp, #-12]
	str	v6, [fp, #-16]
	str	v4, [fp, #-20]
	str	v3, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v6, [fp, #-16]
	ldr	v4, [fp, #-20]
	ldr	v3, [fp, #-24]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-8]
	str	v5, [fp, #-12]
	str	v6, [fp, #-16]
	str	v4, [fp, #-20]
	str	v3, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v3
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v6, [fp, #-16]
	ldr	v4, [fp, #-20]
	ldr	v3, [fp, #-24]
	cmp	v1, #0
	bne	L_b__f5_4
	ldr	v1, [v4, #0]
	str	v7, [fp, #-8]
	str	v5, [fp, #-12]
	str	v6, [fp, #-16]
	str	v4, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v4
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v6, [fp, #-16]
	ldr	v4, [fp, #-20]
	cmp	v6, v1
	blt	LL_b__f5_4
	mov	v1, #0
	b	LL_b__f5_5
LL_b__f5_4:
	mov	v1, #1
LL_b__f5_5:
	cmp	v1, #0
	bne	L_b__f5_6
	ldr	v1, [v4, #0]
	str	v7, [fp, #-8]
	str	v5, [fp, #-12]
	str	v6, [fp, #-16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v4
	blx	v1
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v6, [fp, #-16]
	ldr	v1, [v5, #0]
	str	v4, [fp, #-8]
	str	v7, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v6
	blx	v1
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v7, [fp, #-12]
	ldr	v1, [v7, #0]
	str	v4, [fp, #-8]
	str	v3, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v7
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	ldr	v3, [fp, #-12]
	ldr	v2, [v3, #0]
	str	v4, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v4, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v4, [v2, #0]
	str	v1, [v2, #4]
	b	L_b__f5_7
L_b__f5_6:
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v6, [v2, #0]
	str	a2, [v2, #4]
L_b__f5_7:
	b	L_b__f5_5
L_b__f5_4:
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v6, [v2, #0]
	str	v3, [v2, #4]
L_b__f5_5:
	mov	a1, v2
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
	sub	sp, sp, #32
	ldr	v1, [a1, #4]
	ldr	v3, [a1, #8]
	ldr	v4, [a1, #12]
	ldr	v5, [a1, #16]
	ldr	v6, [a1, #20]
	ldr	v2, [v1, #0]
	str	v6, [fp, #-8]
	str	v5, [fp, #-12]
	str	v4, [fp, #-16]
	str	v3, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v4, [fp, #-16]
	ldr	v3, [fp, #-20]
	ldr	v2, [v1, #0]
	str	v6, [fp, #-8]
	str	v5, [fp, #-12]
	str	v4, [fp, #-16]
	str	v3, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v3
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v4, [fp, #-16]
	ldr	v3, [fp, #-20]
	cmp	v1, #0
	bne	L_b_sort_8
	ldr	v1, [v4, #0]
	str	v6, [fp, #-8]
	str	v5, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v4
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v5, [fp, #-12]
	ldr	v2, [v5, #0]
	str	v6, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v1
	blx	v2
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v6, [fp, #-8]
	ldr	v1, [v6, #0]
	str	v3, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v6
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v3, [fp, #-8]
	ldr	v2, [a1, #0]
	str	v3, [fp, #-8]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v3, [fp, #-8]
	ldr	v2, [v3, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b_sort_9
L_b_sort_8:
	mov	v1, v3
L_b_sort_9:
	mov	a1, v1
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
	sub	sp, sp, #36
	ldr	v3, [a1, #4]
	ldr	v4, [a1, #8]
	ldr	v7, [a1, #12]
	ldr	v5, [a1, #16]
	ldr	v6, [a1, #20]
	ldr	v1, [v3, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	v5, [fp, #-16]
	str	v4, [fp, #-20]
	str	v3, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v5, [fp, #-16]
	ldr	v4, [fp, #-20]
	ldr	v3, [fp, #-24]
	ldr	v2, [v1, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	v5, [fp, #-16]
	str	v4, [fp, #-20]
	str	v3, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v1
	mov	a2, v4
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v5, [fp, #-16]
	ldr	v4, [fp, #-20]
	ldr	v3, [fp, #-24]
	cmp	v1, #0
	bne	L_b_sorted_10
	ldr	v1, [v7, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	v5, [fp, #-16]
	str	v4, [fp, #-20]
	str	v3, [fp, #-24]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v7
	blx	v1
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v5, [fp, #-16]
	ldr	v4, [fp, #-20]
	ldr	v3, [fp, #-24]
	ldr	v1, [v3, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	v5, [fp, #-16]
	str	v4, [fp, #-20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v3
	mov	a2, v2
	blx	v1
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
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v5, [fp, #-16]
	cmp	v1, #0
	bne	L_b_sorted_12
	ldr	v1, [v5, #0]
	str	v7, [fp, #-8]
	str	v6, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	blx	v1
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v6, [fp, #-12]
	ldr	v1, [v6, #0]
	str	v7, [fp, #-8]
	str	v2, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v6
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-8]
	ldr	v2, [fp, #-12]
	cmp	v2, v1
	blt	LL_b_sorted_6
	mov	v1, #0
	b	LL_b_sorted_7
LL_b_sorted_6:
	mov	v1, #1
LL_b_sorted_7:
	cmp	v1, #0
	bne	L_b_sorted_14
	ldr	v1, [v7, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v7
	blx	v1
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v2, [a1, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a2, v1
	blx	v2
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	b	L_b_sorted_15
L_b_sorted_14:
	mov	v1, #0
L_b_sorted_15:
	b	L_b_sorted_13
L_b_sorted_12:
	mov	v1, #1
L_b_sorted_13:
	b	L_b_sorted_11
L_b_sorted_10:
	mov	v1, #1
L_b_sorted_11:
	mov	a1, v1
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
	sub	sp, sp, #40
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f0
	str	a3, [v2, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v5, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f1
	str	a3, [v5, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v6, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f2
	str	a3, [v6, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #1
	bl	mymalloc
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b__f3
	str	a3, [v3, #0]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #5
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_insert
	str	a3, [v1, #0]
	str	v2, [v1, #4]
	mov	a3, #-1
	str	a3, [v1, #8]
	str	v5, [v1, #12]
	str	v6, [v1, #16]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #6
	bl	mymalloc
	mov	v7, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, =_b_sort
	str	a3, [v7, #0]
	str	v2, [v7, #4]
	mov	a3, #-1
	str	a3, [v7, #8]
	str	v5, [v7, #12]
	str	v1, [v7, #16]
	str	v6, [v7, #20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #6
	bl	mymalloc
	str	a1, [fp, #-12]
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	a3, [fp, #-12]
	ldr	a4, =_b_sorted
	str	a4, [a3, #0]
	ldr	a3, [fp, #-12]
	str	v2, [a3, #4]
	ldr	a3, [fp, #-12]
	mov	a4, #-1
	str	a4, [a3, #8]
	ldr	a3, [fp, #-12]
	str	v6, [a3, #12]
	ldr	a3, [fp, #-12]
	str	v3, [a3, #16]
	ldr	a3, [fp, #-12]
	str	v5, [a3, #20]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	mov	a3, #-1
	str	a3, [v1, #0]
	mov	a3, #1
	str	a3, [v1, #4]
L_toplevel_16:
	str	v7, [fp, #-16]
	str	v6, [fp, #-20]
	str	v5, [fp, #-24]
	str	v1, [fp, #-28]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v5
	mov	a2, v1
	bl	_b__f1
	mov	v3, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-16]
	ldr	v6, [fp, #-20]
	ldr	v5, [fp, #-24]
	ldr	v1, [fp, #-28]
	str	v7, [fp, #-16]
	str	v6, [fp, #-20]
	str	v5, [fp, #-24]
	str	v3, [fp, #-28]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v6
	mov	a2, v1
	bl	_b__f2
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	v7, [fp, #-16]
	ldr	v6, [fp, #-20]
	ldr	v5, [fp, #-24]
	ldr	v3, [fp, #-28]
	mov	a3, #2048
	cmp	a3, v2
	blt	LL_toplevel_8
	mov	v1, #0
	b	LL_toplevel_9
LL_toplevel_8:
	mov	v1, #1
LL_toplevel_9:
	cmp	v1, #0
	bne	L_toplevel_17
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v4, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v2, [v4, #0]
	str	v3, [v4, #4]
	add	v1, v2, #1
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, #2
	bl	mymalloc
	mov	v2, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	str	v4, [v2, #0]
	str	v1, [v2, #4]
	mov	v1, v2
	b	L_toplevel_16
	b	L_toplevel_18
L_toplevel_17:
L_toplevel_18:
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, v7
	mov	a2, v3
	bl	_b_sort
	mov	v1, a1
	ldr	a1, [sp, #0]
	ldr	a2, [sp, #4]
	ldr	ip, [fp, #-12]
	str	a1, [sp, #0]
	str	a2, [sp, #4]
	mov	a1, ip
	mov	a2, v1
	bl	_b_sorted
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
