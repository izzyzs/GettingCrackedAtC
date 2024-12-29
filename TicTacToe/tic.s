	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 0	sdk_version 15, 0
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	str	wzr, [sp, #36]
	mov	x0, #0                          ; =0x0
	bl	_time
                                        ; kill: def $w0 killed $w0 killed $x0
	bl	_srand
	bl	_make_default_board
	stur	x0, [x29, #-24]
	stur	x1, [x29, #-16]
	ldur	x8, [x29, #-24]
	add	x9, sp, #24
	str	x9, [sp, #8]                    ; 8-byte Folded Spill
	str	x8, [sp, #24]
	ldurb	w8, [x29, #-16]
	strb	w8, [sp, #32]
	ldr	x8, [sp, #24]
	str	x8, [sp, #40]
	ldrb	w8, [sp, #32]
	strb	w8, [sp, #48]
	ldr	x0, [sp, #40]
	ldr	x1, [sp, #48]
	bl	_print_board
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	x9, sp
	add	x8, sp, #23
	str	x8, [x9]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_scanf
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	ldrsb	w0, [sp, #23]
	bl	_play_game
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB0_2
	b	LBB0_1
LBB0_1:
	bl	___stack_chk_fail
LBB0_2:
	mov	w0, #0                          ; =0x0
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_print_board                    ; -- Begin function print_board
	.p2align	2
_print_board:                           ; @print_board
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	stur	x0, [x29, #-24]
	stur	x1, [x29, #-16]
	ldur	x8, [x29, #-24]
	str	x8, [sp, #40]
	ldurb	w8, [x29, #-16]
	strb	w8, [sp, #48]
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	str	x0, [sp, #32]                   ; 8-byte Folded Spill
	bl	_printf
	ldrsb	w12, [sp, #40]
	ldrsb	w11, [sp, #41]
	ldrsb	w10, [sp, #42]
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x12
	str	x8, [x9]
                                        ; implicit-def: $x8
	mov	x8, x11
	str	x8, [x9, #8]
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9, #16]
	adrp	x0, l_.str.4@PAGE
	add	x0, x0, l_.str.4@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	str	x0, [sp, #24]                   ; 8-byte Folded Spill
	bl	_printf
	ldrsb	w12, [sp, #43]
	ldrsb	w11, [sp, #44]
	ldrsb	w10, [sp, #45]
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x12
	str	x8, [x9]
                                        ; implicit-def: $x8
	mov	x8, x11
	str	x8, [x9, #8]
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9, #16]
	adrp	x0, l_.str.6@PAGE
	add	x0, x0, l_.str.6@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #24]                   ; 8-byte Folded Reload
	bl	_printf
	ldrsb	w12, [sp, #46]
	ldrsb	w11, [sp, #47]
	ldrsb	w10, [sp, #48]
	mov	x9, sp
                                        ; implicit-def: $x8
	mov	x8, x12
	str	x8, [x9]
                                        ; implicit-def: $x8
	mov	x8, x11
	str	x8, [x9, #8]
                                        ; implicit-def: $x8
	mov	x8, x10
	str	x8, [x9, #16]
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #32]                   ; 8-byte Folded Reload
	bl	_printf
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB1_2
	b	LBB1_1
LBB1_1:
	bl	___stack_chk_fail
LBB1_2:
	ldp	x29, x30, [sp, #80]             ; 16-byte Folded Reload
	add	sp, sp, #96
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_play_game                      ; -- Begin function play_game
	.p2align	2
_play_game:                             ; @play_game
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	sturb	w0, [x29, #-25]
	str	x1, [sp, #24]
	str	wzr, [sp, #8]
	ldursb	w8, [x29, #-25]
	subs	w8, w8, #121
	cset	w8, ne
	tbnz	w8, #0, LBB2_2
	b	LBB2_1
LBB2_1:
	str	wzr, [sp, #12]
	b	LBB2_3
LBB2_2:
	mov	w8, #1                          ; =0x1
	str	w8, [sp, #12]
	b	LBB2_3
LBB2_3:
	b	LBB2_4
LBB2_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x0, [sp, #24]
	bl	_spot_left
	tbz	w0, #0, LBB2_11
	b	LBB2_5
LBB2_5:                                 ;   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [sp, #8]
	mov	w10, #2                         ; =0x2
	sdiv	w9, w8, w10
	mul	w9, w9, w10
	subs	w8, w8, w9
	ldr	w9, [sp, #12]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB2_7
	b	LBB2_6
LBB2_6:                                 ;   in Loop: Header=BB2_4 Depth=1
	ldr	x0, [sp, #24]
	bl	_user_move
	b	LBB2_8
LBB2_7:                                 ;   in Loop: Header=BB2_4 Depth=1
	ldr	x0, [sp, #24]
	bl	_computer_move
	b	LBB2_8
LBB2_8:                                 ;   in Loop: Header=BB2_4 Depth=1
	ldr	x8, [sp, #24]
	ldr	x9, [x8]
	stur	x9, [x29, #-24]
	ldrb	w8, [x8, #8]
	sturb	w8, [x29, #-16]
	ldur	x0, [x29, #-24]
	ldur	x1, [x29, #-16]
	bl	_print_board
	ldr	x0, [sp, #24]
	bl	_check_win
	str	x0, [sp]
	ldr	x8, [sp]
	str	x8, [sp, #16]
	ldrb	w8, [sp, #17]
	tbz	w8, #0, LBB2_10
	b	LBB2_9
LBB2_9:
	b	LBB2_11
LBB2_10:                                ;   in Loop: Header=BB2_4 Depth=1
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB2_4
LBB2_11:
	ldr	x0, [sp, #16]
	bl	_present_winner
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB2_13
	b	LBB2_12
LBB2_12:
	bl	___stack_chk_fail
LBB2_13:
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_make_default_board             ; -- Begin function make_default_board
	.p2align	2
_make_default_board:                    ; @make_default_board
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-8]
	adrp	x8, l___const.make_default_board.b@PAGE
	add	x8, x8, l___const.make_default_board.b@PAGEOFF
	ldr	x9, [x8]
	str	x9, [sp, #24]
	ldrb	w8, [x8, #8]
	strb	w8, [sp, #32]
	ldr	x8, [sp, #24]
	stur	x8, [x29, #-24]
	ldrb	w8, [sp, #32]
	sturb	w8, [x29, #-16]
	ldur	x8, [x29, #-24]
	str	x8, [sp, #8]                    ; 8-byte Folded Spill
	ldur	x8, [x29, #-16]
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	ldur	x9, [x29, #-8]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	subs	x8, x8, x9
	cset	w8, eq
	tbnz	w8, #0, LBB3_2
	b	LBB3_1
LBB3_1:
	bl	___stack_chk_fail
LBB3_2:
	ldr	x1, [sp, #16]                   ; 8-byte Folded Reload
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_spot_left                      ; -- Begin function spot_left
	.p2align	2
_spot_left:                             ; @spot_left
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #16]
	strb	wzr, [sp, #7]
	str	wzr, [sp, #12]
	b	LBB4_1
LBB4_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_3 Depth 2
	ldr	w8, [sp, #12]
	subs	w8, w8, #3
	cset	w8, ge
	tbnz	w8, #0, LBB4_10
	b	LBB4_2
LBB4_2:                                 ;   in Loop: Header=BB4_1 Depth=1
	str	wzr, [sp, #8]
	b	LBB4_3
LBB4_3:                                 ;   Parent Loop BB4_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #8]
	subs	w8, w8, #3
	cset	w8, ge
	tbnz	w8, #0, LBB4_8
	b	LBB4_4
LBB4_4:                                 ;   in Loop: Header=BB4_3 Depth=2
	ldr	x8, [sp, #16]
	ldrsw	x9, [sp, #12]
	mov	x10, #3                         ; =0x3
	mul	x9, x9, x10
	add	x8, x8, x9
	ldrsw	x9, [sp, #8]
	ldrsb	w8, [x8, x9]
	subs	w8, w8, #45
	cset	w8, ne
	tbnz	w8, #0, LBB4_6
	b	LBB4_5
LBB4_5:
	mov	w8, #1                          ; =0x1
	and	w8, w8, #0x1
	and	w8, w8, #0x1
	strb	w8, [sp, #31]
	b	LBB4_11
LBB4_6:                                 ;   in Loop: Header=BB4_3 Depth=2
	b	LBB4_7
LBB4_7:                                 ;   in Loop: Header=BB4_3 Depth=2
	ldr	w8, [sp, #8]
	add	w8, w8, #1
	str	w8, [sp, #8]
	b	LBB4_3
LBB4_8:                                 ;   in Loop: Header=BB4_1 Depth=1
	b	LBB4_9
LBB4_9:                                 ;   in Loop: Header=BB4_1 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB4_1
LBB4_10:
	mov	w8, #0                          ; =0x0
	and	w8, w8, #0x1
	and	w8, w8, #0x1
	strb	w8, [sp, #31]
	b	LBB4_11
LBB4_11:
	ldrb	w8, [sp, #31]
	and	w0, w8, #0x1
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_user_move                      ; -- Begin function user_move
	.p2align	2
_user_move:                             ; @user_move
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	adrp	x0, l_.str.12@PAGE
	add	x0, x0, l_.str.12@PAGEOFF
	bl	_printf
	adrp	x0, l_.str.13@PAGE
	add	x0, x0, l_.str.13@PAGEOFF
	bl	_printf
	mov	x9, sp
	sub	x8, x29, #12
	str	x8, [x9]
	adrp	x0, l_.str.14@PAGE
	add	x0, x0, l_.str.14@PAGEOFF
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	bl	_scanf
	adrp	x0, l_.str.15@PAGE
	add	x0, x0, l_.str.15@PAGEOFF
	bl	_printf
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	mov	x9, sp
	add	x8, sp, #16
	str	x8, [x9]
	bl	_scanf
	ldur	w8, [x29, #-12]
	subs	w8, w8, #1
	stur	w8, [x29, #-12]
	ldr	w8, [sp, #16]
	subs	w8, w8, #1
	str	w8, [sp, #16]
	b	LBB5_1
LBB5_1:                                 ; =>This Inner Loop Header: Depth=1
	ldur	x8, [x29, #-8]
	ldursw	x9, [x29, #-12]
	mov	x10, #3                         ; =0x3
	mul	x9, x9, x10
	add	x8, x8, x9
	ldrsw	x9, [sp, #16]
	ldrsb	w8, [x8, x9]
	subs	w8, w8, #45
	cset	w8, eq
	tbnz	w8, #0, LBB5_3
	b	LBB5_2
LBB5_2:                                 ;   in Loop: Header=BB5_1 Depth=1
	adrp	x0, l_.str.16@PAGE
	add	x0, x0, l_.str.16@PAGEOFF
	bl	_printf
	ldur	x0, [x29, #-8]
	bl	_user_move
	b	LBB5_1
LBB5_3:
	ldur	x8, [x29, #-8]
	ldursw	x9, [x29, #-12]
	mov	x10, #3                         ; =0x3
	mul	x9, x9, x10
	add	x8, x8, x9
	ldrsw	x9, [sp, #16]
	add	x9, x8, x9
	mov	w8, #111                        ; =0x6f
	strb	w8, [x9]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_computer_move                  ; -- Begin function computer_move
	.p2align	2
_computer_move:                         ; @computer_move
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	adrp	x0, l_.str.8@PAGE
	add	x0, x0, l_.str.8@PAGEOFF
	bl	_printf
	mov	w8, #9                          ; =0x9
	stur	w8, [x29, #-12]
	b	LBB6_1
LBB6_1:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w8, [x29, #-12]
	subs	w8, w8, #0
	cset	w8, le
	tbnz	w8, #0, LBB6_7
	b	LBB6_2
LBB6_2:                                 ;   in Loop: Header=BB6_1 Depth=1
	bl	_computer_pick
	stur	w0, [x29, #-16]
	bl	_computer_pick
	stur	w0, [x29, #-20]
	ldur	x8, [x29, #-8]
	ldursw	x9, [x29, #-16]
	mov	x10, #3                         ; =0x3
	mul	x9, x9, x10
	add	x8, x8, x9
	ldursw	x9, [x29, #-20]
	ldrsb	w8, [x8, x9]
	subs	w8, w8, #45
	cset	w8, ne
	tbnz	w8, #0, LBB6_4
	b	LBB6_3
LBB6_3:
	ldur	x8, [x29, #-8]
	ldursw	x9, [x29, #-16]
	mov	x10, #3                         ; =0x3
	mul	x9, x9, x10
	add	x8, x8, x9
	ldursw	x9, [x29, #-20]
	add	x9, x8, x9
	mov	w8, #120                        ; =0x78
	strb	w8, [x9]
	ldur	w8, [x29, #-16]
                                        ; implicit-def: $x10
	mov	x10, x8
	ldur	w9, [x29, #-20]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str.9@PAGE
	add	x0, x0, l_.str.9@PAGEOFF
	bl	_printf
	b	LBB6_8
LBB6_4:                                 ;   in Loop: Header=BB6_1 Depth=1
	ldur	w8, [x29, #-16]
                                        ; implicit-def: $x10
	mov	x10, x8
	ldur	w9, [x29, #-20]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x10, [x9]
	str	x8, [x9, #8]
	adrp	x0, l_.str.10@PAGE
	add	x0, x0, l_.str.10@PAGEOFF
	bl	_printf
	b	LBB6_5
LBB6_5:                                 ;   in Loop: Header=BB6_1 Depth=1
	b	LBB6_6
LBB6_6:                                 ;   in Loop: Header=BB6_1 Depth=1
	ldur	w8, [x29, #-12]
	subs	w8, w8, #1
	stur	w8, [x29, #-12]
	b	LBB6_1
LBB6_7:
	adrp	x0, l_.str.11@PAGE
	add	x0, x0, l_.str.11@PAGEOFF
	bl	_printf
	b	LBB6_8
LBB6_8:
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_check_win                      ; -- Begin function check_win
	.p2align	2
_check_win:                             ; @check_win
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	ldur	x0, [x29, #-16]
	bl	_is_row_win
	str	x0, [sp, #24]
	ldr	x8, [sp, #24]
	stur	x8, [x29, #-8]
	ldurb	w8, [x29, #-7]
	tbz	w8, #0, LBB7_2
	b	LBB7_1
LBB7_1:
	b	LBB7_7
LBB7_2:
	ldur	x0, [x29, #-16]
	bl	_is_column_win
	str	x0, [sp, #16]
	ldr	x8, [sp, #16]
	stur	x8, [x29, #-8]
	ldurb	w8, [x29, #-7]
	tbz	w8, #0, LBB7_4
	b	LBB7_3
LBB7_3:
	b	LBB7_7
LBB7_4:
	ldur	x0, [x29, #-16]
	bl	_is_diagonal_win
	str	x0, [sp, #8]
	ldr	x8, [sp, #8]
	stur	x8, [x29, #-8]
	ldurb	w8, [x29, #-7]
	tbz	w8, #0, LBB7_6
	b	LBB7_5
LBB7_5:
	b	LBB7_7
LBB7_6:
	strb	wzr, [sp]
	strb	wzr, [sp, #1]
	str	wzr, [sp, #4]
	ldr	x8, [sp]
	stur	x8, [x29, #-8]
	b	LBB7_7
LBB7_7:
	ldur	x0, [x29, #-8]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_present_winner                 ; -- Begin function present_winner
	.p2align	2
_present_winner:                        ; @present_winner
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	ldurb	w10, [x29, #-7]
	adrp	x9, l_.str.19@PAGE
	add	x9, x9, l_.str.19@PAGEOFF
	adrp	x8, l_.str.18@PAGE
	add	x8, x8, l_.str.18@PAGEOFF
	and	w10, w10, #0x1
	ands	w10, w10, #0x1
	csel	x8, x8, x9, ne
	stur	x8, [x29, #-16]                 ; 8-byte Folded Spill
	ldursb	w8, [x29, #-8]
	subs	w8, w8, #120
	cset	w8, ne
	tbnz	w8, #0, LBB8_2
	b	LBB8_1
LBB8_1:
	adrp	x8, l_.str.20@PAGE
	add	x8, x8, l_.str.20@PAGEOFF
	stur	x8, [x29, #-24]                 ; 8-byte Folded Spill
	b	LBB8_3
LBB8_2:
	ldursb	w8, [x29, #-8]
	subs	w8, w8, #111
	cset	w10, eq
	adrp	x9, l_.str.22@PAGE
	add	x9, x9, l_.str.22@PAGEOFF
	adrp	x8, l_.str.21@PAGE
	add	x8, x8, l_.str.21@PAGEOFF
	and	w10, w10, #0x1
	ands	w10, w10, #0x1
	csel	x8, x8, x9, ne
	stur	x8, [x29, #-24]                 ; 8-byte Folded Spill
	b	LBB8_3
LBB8_3:
	ldur	x8, [x29, #-24]                 ; 8-byte Folded Reload
	str	x8, [sp, #32]                   ; 8-byte Folded Spill
	ldur	w0, [x29, #-4]
	bl	_how_won
	ldur	x10, [x29, #-16]                ; 8-byte Folded Reload
	ldr	x9, [sp, #32]                   ; 8-byte Folded Reload
	mov	x8, sp
	str	x10, [x8]
	str	x9, [x8, #8]
	str	x0, [x8, #16]
	adrp	x0, l_.str.17@PAGE
	add	x0, x0, l_.str.17@PAGEOFF
	bl	_printf
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3, 0x0                          ; -- Begin function computer_pick
lCPI9_0:
	.quad	0x3fd51eb851eb851f              ; double 0.33000000000000002
lCPI9_1:
	.quad	0x3fe51eb851eb851f              ; double 0.66000000000000003
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_computer_pick
	.p2align	2
_computer_pick:                         ; @computer_pick
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	_rand
	scvtf	s0, w0
	movi.2s	v1, #79, lsl #24
                                        ; kill: def $s1 killed $s1 killed $d1
	fdiv	s0, s0, s1
	str	s0, [sp, #8]
	ldr	s0, [sp, #8]
	fcvt	d0, s0
	adrp	x8, lCPI9_1@PAGE
	ldr	d1, [x8, lCPI9_1@PAGEOFF]
	fcmp	d0, d1
	cset	w8, le
	tbnz	w8, #0, LBB9_2
	b	LBB9_1
LBB9_1:
	mov	w8, #2                          ; =0x2
	stur	w8, [x29, #-4]
	b	LBB9_5
LBB9_2:
	ldr	s0, [sp, #8]
	fcvt	d0, s0
	adrp	x8, lCPI9_0@PAGE
	ldr	d1, [x8, lCPI9_0@PAGEOFF]
	fcmp	d0, d1
	cset	w8, le
	tbnz	w8, #0, LBB9_4
	b	LBB9_3
LBB9_3:
	mov	w8, #1                          ; =0x1
	stur	w8, [x29, #-4]
	b	LBB9_5
LBB9_4:
	stur	wzr, [x29, #-4]
	b	LBB9_5
LBB9_5:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_is_row_win                     ; -- Begin function is_row_win
	.p2align	2
_is_row_win:                            ; @is_row_win
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #16]
	str	wzr, [sp, #12]
	b	LBB10_1
LBB10_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #12]
	subs	w8, w8, #3
	cset	w8, ge
	tbnz	w8, #0, LBB10_8
	b	LBB10_2
LBB10_2:                                ;   in Loop: Header=BB10_1 Depth=1
	ldr	x8, [sp, #16]
	ldrsw	x9, [sp, #12]
	mov	x10, #3                         ; =0x3
	mul	x9, x9, x10
	ldrsb	w8, [x8, x9]
	subs	w8, w8, #45
	cset	w8, eq
	tbnz	w8, #0, LBB10_6
	b	LBB10_3
LBB10_3:                                ;   in Loop: Header=BB10_1 Depth=1
	ldr	x8, [sp, #16]
	ldrsw	x9, [sp, #12]
	mov	x11, #3                         ; =0x3
	mul	x9, x9, x11
	ldrsb	w8, [x8, x9]
	ldr	x9, [sp, #16]
	ldrsw	x10, [sp, #12]
	mul	x10, x10, x11
	add	x9, x9, x10
	ldrsb	w9, [x9, #1]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB10_6
	b	LBB10_4
LBB10_4:                                ;   in Loop: Header=BB10_1 Depth=1
	ldr	x8, [sp, #16]
	ldrsw	x9, [sp, #12]
	mov	x11, #3                         ; =0x3
	mul	x9, x9, x11
	add	x8, x8, x9
	ldrsb	w8, [x8, #1]
	ldr	x9, [sp, #16]
	ldrsw	x10, [sp, #12]
	mul	x10, x10, x11
	add	x9, x9, x10
	ldrsb	w9, [x9, #2]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB10_6
	b	LBB10_5
LBB10_5:
	ldr	x8, [sp, #16]
	ldrsw	x9, [sp, #12]
	mov	x10, #3                         ; =0x3
	mul	x9, x9, x10
	add	x8, x8, x9
	ldrb	w8, [x8]
	strb	w8, [sp, #24]
	mov	w8, #1                          ; =0x1
	strb	w8, [sp, #25]
	mov	w8, #1                          ; =0x1
	str	w8, [sp, #28]
	b	LBB10_9
LBB10_6:                                ;   in Loop: Header=BB10_1 Depth=1
	b	LBB10_7
LBB10_7:                                ;   in Loop: Header=BB10_1 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB10_1
LBB10_8:
	str	xzr, [sp, #24]
	b	LBB10_9
LBB10_9:
	ldr	x0, [sp, #24]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_is_column_win                  ; -- Begin function is_column_win
	.p2align	2
_is_column_win:                         ; @is_column_win
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	str	x0, [sp, #16]
	str	wzr, [sp, #12]
	b	LBB11_1
LBB11_1:                                ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #12]
	subs	w8, w8, #3
	cset	w8, ge
	tbnz	w8, #0, LBB11_8
	b	LBB11_2
LBB11_2:                                ;   in Loop: Header=BB11_1 Depth=1
	ldr	x8, [sp, #16]
	ldrsw	x9, [sp, #12]
	ldrsb	w8, [x8, x9]
	subs	w8, w8, #45
	cset	w8, eq
	tbnz	w8, #0, LBB11_6
	b	LBB11_3
LBB11_3:                                ;   in Loop: Header=BB11_1 Depth=1
	ldr	x8, [sp, #16]
	ldrsw	x9, [sp, #12]
	ldrsb	w8, [x8, x9]
	ldr	x9, [sp, #16]
	add	x9, x9, #3
	ldrsw	x10, [sp, #12]
	ldrsb	w9, [x9, x10]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB11_6
	b	LBB11_4
LBB11_4:                                ;   in Loop: Header=BB11_1 Depth=1
	ldr	x8, [sp, #16]
	add	x8, x8, #3
	ldrsw	x9, [sp, #12]
	ldrsb	w8, [x8, x9]
	ldr	x9, [sp, #16]
	add	x9, x9, #6
	ldrsw	x10, [sp, #12]
	ldrsb	w9, [x9, x10]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB11_6
	b	LBB11_5
LBB11_5:
	ldr	x8, [sp, #16]
	ldrsw	x9, [sp, #12]
	add	x8, x8, x9
	ldrb	w8, [x8]
	strb	w8, [sp, #24]
	mov	w8, #1                          ; =0x1
	strb	w8, [sp, #25]
	mov	w8, #2                          ; =0x2
	str	w8, [sp, #28]
	b	LBB11_9
LBB11_6:                                ;   in Loop: Header=BB11_1 Depth=1
	b	LBB11_7
LBB11_7:                                ;   in Loop: Header=BB11_1 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1
	str	w8, [sp, #12]
	b	LBB11_1
LBB11_8:
	str	xzr, [sp, #24]
	b	LBB11_9
LBB11_9:
	ldr	x0, [sp, #24]
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_is_diagonal_win                ; -- Begin function is_diagonal_win
	.p2align	2
_is_diagonal_win:                       ; @is_diagonal_win
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	str	x0, [sp, #32]
	ldr	x8, [sp, #32]
	ldrsb	w8, [x8]
	subs	w8, w8, #45
	cset	w8, eq
	tbnz	w8, #0, LBB12_4
	b	LBB12_1
LBB12_1:
	ldr	x8, [sp, #32]
	ldrsb	w8, [x8]
	ldr	x9, [sp, #32]
	ldrsb	w9, [x9, #4]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB12_4
	b	LBB12_2
LBB12_2:
	ldr	x8, [sp, #32]
	ldrsb	w8, [x8, #4]
	ldr	x9, [sp, #32]
	ldrsb	w9, [x9, #8]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB12_4
	b	LBB12_3
LBB12_3:
	ldr	x8, [sp, #32]
	ldrb	w8, [x8]
	strb	w8, [sp, #24]
	mov	w8, #1                          ; =0x1
	strb	w8, [sp, #25]
	mov	w8, #3                          ; =0x3
	str	w8, [sp, #28]
	ldr	x8, [sp, #24]
	str	x8, [sp, #40]
	b	LBB12_10
LBB12_4:
	ldr	x8, [sp, #32]
	ldrsb	w8, [x8, #2]
	subs	w8, w8, #45
	cset	w8, eq
	tbnz	w8, #0, LBB12_8
	b	LBB12_5
LBB12_5:
	ldr	x8, [sp, #32]
	ldrsb	w8, [x8, #2]
	ldr	x9, [sp, #32]
	ldrsb	w9, [x9, #4]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB12_8
	b	LBB12_6
LBB12_6:
	ldr	x8, [sp, #32]
	ldrsb	w8, [x8, #4]
	ldr	x9, [sp, #32]
	ldrsb	w9, [x9, #6]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB12_8
	b	LBB12_7
LBB12_7:
	ldr	x8, [sp, #32]
	ldrb	w8, [x8, #2]
	strb	w8, [sp, #16]
	mov	w8, #1                          ; =0x1
	strb	w8, [sp, #17]
	mov	w8, #3                          ; =0x3
	str	w8, [sp, #20]
	ldr	x8, [sp, #16]
	str	x8, [sp, #40]
	b	LBB12_10
LBB12_8:
	b	LBB12_9
LBB12_9:
	strb	wzr, [sp, #8]
	strb	wzr, [sp, #9]
	str	wzr, [sp, #12]
	ldr	x8, [sp, #8]
	str	x8, [sp, #40]
	b	LBB12_10
LBB12_10:
	ldr	x0, [sp, #40]
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_how_won                        ; -- Begin function how_won
	.p2align	2
_how_won:                               ; @how_won
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, #4]
	ldr	w8, [sp, #4]
	subs	w8, w8, #1
	cset	w8, ne
	tbnz	w8, #0, LBB13_2
	b	LBB13_1
LBB13_1:
	adrp	x8, l_.str.23@PAGE
	add	x8, x8, l_.str.23@PAGEOFF
	str	x8, [sp, #8]
	b	LBB13_5
LBB13_2:
	ldr	w8, [sp, #4]
	subs	w8, w8, #2
	cset	w8, ne
	tbnz	w8, #0, LBB13_4
	b	LBB13_3
LBB13_3:
	adrp	x8, l_.str.24@PAGE
	add	x8, x8, l_.str.24@PAGEOFF
	str	x8, [sp, #8]
	b	LBB13_5
LBB13_4:
	adrp	x8, l_.str.25@PAGE
	add	x8, x8, l_.str.25@PAGEOFF
	str	x8, [sp, #8]
	b	LBB13_5
LBB13_5:
	ldr	x0, [sp, #8]
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__const
	.globl	_USER                           ; @USER
_USER:
	.byte	111                             ; 0x6f

	.globl	_COMPUTER                       ; @COMPUTER
_COMPUTER:
	.byte	120                             ; 0x78

	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Would you like to go first? enter y for yes and any other key for no: >> "

l_.str.1:                               ; @.str.1
	.asciz	"%c"

	.section	__TEXT,__const
l___const.make_default_board.b:         ; @__const.make_default_board.b
	.space	9,45

	.section	__TEXT,__cstring,cstring_literals
l_.str.2:                               ; @.str.2
	.asciz	"\t    1   2   3\n"

l_.str.3:                               ; @.str.3
	.asciz	"\t  -------------\n"

l_.str.4:                               ; @.str.4
	.asciz	"\t1 | %c | %c | %c |\n"

l_.str.5:                               ; @.str.5
	.asciz	"\t  ----|---|----\n"

l_.str.6:                               ; @.str.6
	.asciz	"\t2 | %c | %c | %c |\n"

l_.str.7:                               ; @.str.7
	.asciz	"\t3 | %c | %c | %c |\n"

l_.str.8:                               ; @.str.8
	.asciz	"computer_move\n"

l_.str.9:                               ; @.str.9
	.asciz	"COMPUTER:\tx_move: %d;\ty_move: %d\n"

l_.str.10:                              ; @.str.10
	.asciz	"I wanted to move be at (%d, %d) but that spot is taken... Trying again :(\n"

l_.str.11:                              ; @.str.11
	.asciz	"All spots are occupied\n"

l_.str.12:                              ; @.str.12
	.asciz	"Your turn! You will pick your move by row and column\n"

l_.str.13:                              ; @.str.13
	.asciz	"Enter your row number >> "

l_.str.14:                              ; @.str.14
	.asciz	"%d"

l_.str.15:                              ; @.str.15
	.asciz	"Enter your column number >> "

l_.str.16:                              ; @.str.16
	.asciz	"That spot is taken\n"

l_.str.17:                              ; @.str.17
	.asciz	"%s: %s won by by %s!!"

l_.str.18:                              ; @.str.18
	.asciz	"true"

l_.str.19:                              ; @.str.19
	.asciz	"false"

l_.str.20:                              ; @.str.20
	.asciz	"The computer"

l_.str.21:                              ; @.str.21
	.asciz	"The user"

l_.str.22:                              ; @.str.22
	.asciz	"error"

l_.str.23:                              ; @.str.23
	.asciz	"row"

l_.str.24:                              ; @.str.24
	.asciz	"column"

l_.str.25:                              ; @.str.25
	.asciz	"diagonal"

.subsections_via_symbols
