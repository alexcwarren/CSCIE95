# Factorial

# #include <stdio.h>
# #include <stdlib.h>
#
# /* Built-in syscalls */
# void syscall_print_int(int integer);
# void syscall_print_string(char *string);
# int syscall_read_int(void);
# void syscall_read_string(char *buffer, int length);
# void syscall_exit(void);
#
# char *strcpy(char *dest, char *src);
# int factorial(int n);
#
# int main(void) {
#   char prompt[80];
#   int n, f;
#
#   strcpy(prompt, "Factorial of ");
#   syscall_print_string(prompt);
#
#   n = syscall_read_int();
#
#   strcpy(prompt, " equals ");
#   syscall_print_string(prompt);
#
#   f = factorial(n);
#
#   syscall_print_int(f);
#
#   strcpy(prompt, "\n");
#   syscall_print_string(prompt);
#
#   return 0;
# }
#
# char *strcpy(char *dest, char *src) {
#   char *initial_dest;
#
#   initial_dest = dest;
#   do {
#     *dest++ = *src;
#   } while(*src++);
#   return initial_dest;
# }
#
# int factorial(int n) {
#   if(n <= 1)
#     return 1;
#   else
#     return n*factorial(n-1);
# }
#
# /* The functions below allow execution in a standard Posix environment */
#
# void syscall_print_int(int integer) {
#   printf("%d", integer);
# }
#
# void syscall_print_string(char *string) {
#   while(*string) {
#     putchar(*string++);
#   }
# }
#
# int syscall_read_int(void) {
#   int i;
#
#   scanf("%d", &i);
#
#   return i;
# }
#
# void syscall_read_string(char *buffer, int length) {
#   fgets(buffer, length, stdin);
# }
#
# void syscall_exit(void) {
#   exit(0);
# }

	.data
_StringLabel_1:	.asciiz	"Factorial of "
_StringLabel_2:	.asciiz	" equals "
_StringLabel_3:	.asciiz	"\n"

	.text
	.globl	main


# As with the IR code, this code has been generated by a compiler that resets
#   the register/temporary number to zero at the beginning of IR code
#   generation for each statement.

# As with the initial implementation of all compilers being written by
#   students in this class, this code will use registers $s0 through $s7
#   then $t0 throuh $t9 for registers/temporaries.  Also, this code
#   saves all $s registers on entry to functions and restores all $s in
#   function exit code.  Around each function call, all $t registers are
#   saved and restored.


# main calls strcpy & factorial (& syscalls)
#	strcpy requires two words of parameters
#	factorial requires one word of parameters

# Stack frame overhead is 24 words ($a0-$a3, $s0-$s7, $fp, $ra, saved
#   $t0-$t9) = 96 bytes.
# For now, we will always save and restore all $s registers in
#   entry/exit code.
# For now, we will always save and restore all $t registers around
#   function calls.

# Argument build area is not needed because the 8 bytes for parameters for
#   functions we call will fit in the $a registers

# 96 bytes of overhead + 0 bytes for parameters to functions we call +
#   80+4+4 bytes for local variables = 184 bytes
# 184 bytes is double-word aligned (i.e., a multiple of 8), so an alignment
#   word is not required

# Layout of stack frame for "main" of size 184 bytes
#   Name	Offset		Size
#   $a0		$fp		4
#   $a1		$fp+4		4
#   $a2		$fp+8		4
#   $a3		$fp+12		4
#   $s0		$fp+16		4
#   $s1		$fp+20		4
#   $s2		$fp+24		4
#   $s3		$fp+28		4
#   $s4		$fp+32		4
#   $s5		$fp+36		4
#   $s6		$fp+40		4
#   $s7		$fp+44		4
#   old $fp	$fp+48		4
#   $ra		$fp+52		4
#   saved $t0	$fp+56		4
#   saved $t1	$fp+60		4
#   saved $t2	$fp+64		4
#   saved $t3	$fp+68		4
#   saved $t4	$fp+72		4
#   saved $t5	$fp+76		4
#   saved $t6	$fp+80		4
#   saved $t7	$fp+84		4
#   saved $t8	$fp+88		4
#   saved $t9	$fp+92		4
#   prompt	$fp+96		80
#   n		$fp+176		4
#   f		$fp+180		4

# int main(void) {
#   (procBegin, main)
main:
	addiu	$sp, $sp, -184	# push space for our stack frame onto the stack
	sw	$fp, 48($sp)	# save the old $fp
	or	$fp, $sp, $0	# $fp -> stack frame
	sw	$ra, 52($fp)	# save the return address
				# no need to save our parameters (because there
				#   are none)
#	sw	$a0, 0($fp)	# save the first actual parameter
#	sw	$a1, 4($fp)	# save the second actual parameter
#	sw	$a2, 8($fp)	# save the third actual parameter
#	sw	$a3, 12($fp)	# save the fourth actual parameter
	sw	$s0, 16($fp)	# save $s0
	sw	$s1, 20($fp)	# save $s1
	sw	$s2, 24($fp)	# save $s2
	sw	$s3, 28($fp)	# save $s3
	sw	$s4, 32($fp)	# save $s4
	sw	$s5, 36($fp)	# save $s5
	sw	$s6, 40($fp)	# save $s6
	sw	$s7, 44($fp)	# save $s7
	
#   strcpy(prompt, "Factorial of ");
#     (addressOf, $r0, prompt)
	la	$t0, 96($fp)	# $t0 -> prompt
#     (parameter, 0, $r0)
	or	$a0, $t0, $0	# $a0 -> prompt
#     (addressOf, $r1, _StringLabel_1)
	la	$t1, _StringLabel_1	# $t1 -> "Factorial of "
#     (parameter, 1, $r1)
	or	$a1, $t1, $0	# $a1 -> "Factorial of "
#     (call, _Global_strcpy)
	sw	$t0, 56($fp)	# save $t0
	sw	$t1, 60($fp)	# save $t1
	sw	$t2, 64($fp)	# save $t2
	sw	$t3, 68($fp)	# save $t3
	sw	$t4, 72($fp)	# save $t4
	sw	$t5, 76($fp)	# save $t5
	sw	$t6, 80($fp)	# save $t6
	sw	$t7, 84($fp)	# save $t7
	sw	$t8, 88($fp)	# save $t8
	sw	$t9, 92($fp)	# save $t9
	jal	_Global_strcpy		# call "strcpy"
	lw	$t9, 92($fp)	# restore $t9
	lw	$t8, 88($fp)	# restore $t8
	lw	$t7, 84($fp)	# restore $t7
	lw	$t6, 80($fp)	# restore $t6
	lw	$t5, 76($fp)	# restore $t5
	lw	$t4, 72($fp)	# restore $t4
	lw	$t3, 68($fp)	# restore $t3
	lw	$t2, 64($fp)	# restore $t2
	lw	$t1, 60($fp)	# restore $t1
	lw	$t0, 56($fp)	# restore $t0

#   syscall_print_string(prompt);
#     (addressOf, $r0, prompt)
	la	$t0, 96($fp)	# $t0 -> prompt
#     (parameter, 0, $r0)
	or	$a0, $t0, $0	# $a0 -> prompt
#     (syscall, print_string)
	li	$v0, 4		# $v0 <- system call code for print_string
	syscall			# print prompt

#   n = syscall_read_int();
#     (addressOf, $r0, n)
	la	$t0, 176($fp)	# $t0 -> n
#     (syscall, read_int)
	li	$v0, 5		# $v0 <- system call code for read_int
	syscall			# $v0 <- the number of ints to be read
#     (resultWord, $r1)
	or	$t1, $v0, $0	# $t1 <- the number of ints to be read
#     (storeWord, $r0, $r1)
	sw	$t1, 0($t0)	# store read_int return val into n

#   strcpy(prompt, " equals ");
#     (addressOf, $r0, prompt)
	la	$t0, 96($fp)	# $t0 -> prompt
#     (parameter, 0, $r0)
	or	$a0, $t0, $0	# $a0 -> prompt
#     (addressOf, $r1, _StringLabel_2)
	la	$t1, _StringLabel_2	# $t1 -> " equals "
#     (parameter, 1, $r1)
	or	$a1, $t1, $0	# $a1 -> " equals "
#     (call, _Global_strcpy)
	sw	$t0, 56($fp)	# save $t0
	sw	$t1, 60($fp)	# save $t1
	sw	$t2, 64($fp)	# save $t2
	sw	$t3, 68($fp)	# save $t3
	sw	$t4, 72($fp)	# save $t4
	sw	$t5, 76($fp)	# save $t5
	sw	$t6, 80($fp)	# save $t6
	sw	$t7, 84($fp)	# save $t7
	sw	$t8, 88($fp)	# save $t8
	sw	$t9, 92($fp)	# save $t9
	jal	_Global_strcpy		# call "strcpy"
	lw	$t9, 92($fp)	# restore $t9
	lw	$t8, 88($fp)	# restore $t8
	lw	$t7, 84($fp)	# restore $t7
	lw	$t6, 80($fp)	# restore $t6
	lw	$t5, 76($fp)	# restore $t5
	lw	$t4, 72($fp)	# restore $t4
	lw	$t3, 68($fp)	# restore $t3
	lw	$t2, 64($fp)	# restore $t2
	lw	$t1, 60($fp)	# restore $t1
	lw	$t0, 56($fp)	# restore $t0

#   syscall_print_string(prompt);
#     (addressOf, $r0, prompt)
	la	$t0, 96($fp)	# $t0 -> prompt
#     (parameter, 0, $r0)
	or	$a0, $t0, $0	# $a0 -> prompt
#     (syscall, print_string)
	li	$v0, 4		# $v0 <- system call code for print_string
	syscall			# print prompt

#   f = factorial(n);
#     (addressOf, $r0, f)
	la	$t0, 180($fp)	# $t0 -> f
#     (addressOf, $r1, n)
	la	$t1, 176($fp)	# $t1 -> n
#     (loadWord, $r2, $r1)
	lw	$t2, ($t1)	# $t2 <- n
#     (parameter, 0, $r2)
	or	$a0, $t2, $0	# $a0 <- n
#     (call, _Global_factorial)
	sw	$t0, 56($fp)	# save $t0
	sw	$t1, 60($fp)	# save $t1
	sw	$t2, 64($fp)	# save $t2
	sw	$t3, 68($fp)	# save $t3
	sw	$t4, 72($fp)	# save $t4
	sw	$t5, 76($fp)	# save $t5
	sw	$t6, 80($fp)	# save $t6
	sw	$t7, 84($fp)	# save $t7
	sw	$t8, 88($fp)	# save $t8
	sw	$t9, 92($fp)	# save $t9
	jal	_Global_factorial	# call "factorial"
	lw	$t9, 92($fp)	# restore $t9
	lw	$t8, 88($fp)	# restore $t8
	lw	$t7, 84($fp)	# restore $t7
	lw	$t6, 80($fp)	# restore $t6
	lw	$t5, 76($fp)	# restore $t5
	lw	$t4, 72($fp)	# restore $t4
	lw	$t3, 68($fp)	# restore $t3
	lw	$t2, 64($fp)	# restore $t2
	lw	$t1, 60($fp)	# restore $t1
	lw	$t0, 56($fp)	# restore $t0
#     (resultWord, $r3)
	or	$t3, $v0, $0	# $t3 <- factorial(n) return value
#     (storeWord, $r0, $r3)
	sw	$t3, ($t0)	# f <- factorial(n) return value

#   syscall_print_int(f);
#     (addressOf, $r0, f)
	la	$t0, 180($fp)	# $t0 -> f
#     (loadWord, $r1, $r0)
	lw	$t1, 0($t0)	# $t1 <- f
#     (parameter, 0, $r1)
	or	$a0, $t1, $0	# $a0 <- f
#     (syscall, print_int)
	li	$v0, 1		# $v0 <- system call code for print_int
	syscall			# print f

#   strcpy(prompt, "\n");
#     (addressOf, $r0, prompt)
	la	$t0, 96($fp)	# $t0 -> prompt
#     (parameter, 0, $r0)
	or	$a0, $t0, $0	# $a0 -> prompt
#     (addressOf, $r1, _StringLabel_3)
	la	$t1, _StringLabel_3	# $t1 -> "\n"
#     (parameter, 1, $r1)
	or	$a1, $t1, $0	# $a1 -> "\n"
#     (call, _Global_strcpy)
	sw	$t0, 56($fp)	# save $t0
	sw	$t1, 60($fp)	# save $t1
	sw	$t2, 64($fp)	# save $t2
	sw	$t3, 68($fp)	# save $t3
	sw	$t4, 72($fp)	# save $t4
	sw	$t5, 76($fp)	# save $t5
	sw	$t6, 80($fp)	# save $t6
	sw	$t7, 84($fp)	# save $t7
	sw	$t8, 88($fp)	# save $t8
	sw	$t9, 92($fp)	# save $t9
	jal	_Global_strcpy		# call "strcpy"
	lw	$t9, 92($fp)	# restore $t9
	lw	$t8, 88($fp)	# restore $t8
	lw	$t7, 84($fp)	# restore $t7
	lw	$t6, 80($fp)	# restore $t6
	lw	$t5, 76($fp)	# restore $t5
	lw	$t4, 72($fp)	# restore $t4
	lw	$t3, 68($fp)	# restore $t3
	lw	$t2, 64($fp)	# restore $t2
	lw	$t1, 60($fp)	# restore $t1
	lw	$t0, 56($fp)	# restore $t0

#   syscall_print_string(prompt);
#     (addressOf, $r0, prompt)
	la	$t0, 96($fp)	# $t0 -> prompt
#     (parameter, 0, $r0)
	or	$a0, $t0, $0	# $a0 -> prompt
#     (syscall, print_string)
	li	$v0, 4		# $v0 <- system call code for print_string
	syscall			# print prompt

#   return 0;
#     (constInt, $r0, 0)
	li	$t0, 0		# $t0 <- 0
#     (returnWord, $r0)
	or	$v0, $t0, $0	# $v0 <- 0
#     (goto, _GeneratedLabel_1)
	b	_GeneratedLabel_1	# branch to the return code

# }
#   (label, _GeneratedLabel_1)
_GeneratedLabel_1:
#   (procEnd, main)
	lw	$s7, 44($fp)	# restore $s7
	lw	$s6, 40($fp)	# restore $s6
	lw	$s5, 36($fp)	# restore $s5
	lw	$s4, 32($fp)	# restore $s4
	lw	$s3, 28($fp)	# restore $s3
	lw	$s2, 24($fp)	# restore $s2
	lw	$s1, 20($fp)	# restore $s1
	lw	$s0, 16($fp)	# restore $s0
	lw	$ra, 52($fp)	# restore $ra
	lw	$fp, 48($fp)	# restore old $fp
	addiu	$sp, $sp, 184	# pop off our stack frame
	jr	$ra		# return to caller
	
# strcpy calls no functions

# Stack frame overhead is 24 words ($a0-$a3, $s0-$s7, $fp, $ra, saved
#   $t0-$t9) = 96 bytes.
# For now, we will always save and restore all $s registers in
#   entry/exit code.
# For now, we will always save and restore all $t registers around
#   function calls.

# Argument build area is not needed because strcpy calls no functions

# 96 bytes of overhead + 0 bytes for parameters to functions we call +
#   4 bytes for local variables = 100 bytes
# 100 bytes is *not* double-word aligned (i.e., a multiple of 8), so it is
#   rounded up to 104 bytes

# Layout of stack frame for "strcpy" of size 100 bytes
#   Stack frame rounded up to 104 bytes (double word multiple)
#   Name	Offset		Size
#   (unused)	$fp		4	(for alignment purposes)
#   $a0		$fp+4		4	(dest)
#   $a1		$fp+8		4	(src)
#   $a2		$fp+12		4
#   $a3		$fp+16		4
#   $s0		$fp+20		4
#   $s1		$fp+24		4
#   $s2		$fp+28		4
#   $s3		$fp+32		4
#   $s4		$fp+36		4
#   $s5		$fp+40		4
#   $s6		$fp+44		4
#   $s7		$fp+48		4
#   old $fp	$fp+52		4
#   $ra		$fp+56		4
#   saved $t0	$fp+60		4
#   saved $t1	$fp+64		4
#   saved $t2	$fp+68		4
#   saved $t3	$fp+72		4
#   saved $t4	$fp+76		4
#   saved $t5	$fp+80		4
#   saved $t6	$fp+84		4
#   saved $t7	$fp+88		4
#   saved $t8	$fp+92		4
#   saved $t9	$fp+96		4
#   initial_dest $fp+100	4

# char *strcpy(char *dest, char *src) {
#   (procBegin, _Global_strcpy)
_Global_strcpy:
	addiu	$sp, $sp, -104	# push space for our stack frame onto the stack
	sw	$fp, 52($sp)	# save the old $fp
	or	$fp, $sp, $0	# $fp -> stack frame
	sw	$ra, 56($fp)	# save the return address
				# save our parameters so that they can be
				#   referenced as a local variable
	sw	$a0, 4($fp)	# save the first actual parameter
	sw	$a1, 8($fp)	# save the second actual parameter
				# no need to save $a2 & $a3
#	sw	$a2, 12($fp)	# save the third actual parameter
#	sw	$a3, 16($fp)	# save the fourth actual parameter
	sw	$s0, 20($fp)	# save $s0
	sw	$s1, 24($fp)	# save $s1
	sw	$s2, 28($fp)	# save $s2
	sw	$s3, 32($fp)	# save $s3
	sw	$s4, 36($fp)	# save $s4
	sw	$s5, 40($fp)	# save $s5
	sw	$s6, 44($fp)	# save $s6
	sw	$s7, 48($fp)	# save $s7

#   initial_dest = dest;
#     (addressOf, $r0, initial_dest)
	la	$t0, 100($fp)	# $t0 -> initial_dest
#     (addressOf, $r1, dest)
	la	$t1, 4($fp)	# $t1 -> dest
#     (loadWord, $r2, $r1)
	lw	$t2, ($t1)	# $t2 <- dest
#     (storeWord, $r0, $r2)
	sw	$t2, ($t0)	# initial_dest <- dest

#   do {
#     (label, _GeneratedLabel_2)
_GeneratedLabel_2:

#     *dest++ = *src;
#       (addressOf, $r0, dest)
	la	$t0, 4($fp)	# $t0 -> dest
#       (addressOf, $r1, src)
	la	$t1, 8($fp)	# $t1 -> src
#       (loadWord, $r2, $r1)
	lw	$t2, ($t1)	# $t2 <- src
#       (loadSignedByte, $r3, $r2)
	lb	$t3, ($t2)	# $t3 <- *src
#       (loadWord, $r4, $r0)
	lw	$t4, ($t0)	# $t4 <- dest
#       (storeByte, $r4, $r3)
	sb	$t3, ($t4)	# *dest = *src
#       (addressOf, $r5, dest)
	la	$t5, 4($fp)	# $t5 -> dest
#       (loadWord, $r6, $r5)
	lw	$t6, ($t5)	# $t6 <- dest
#       (constInt, $r7, 1)
	li	$t7, 1		# $t7 <- 1
#       (addUnsignedWord, $r8, $r6, $r7)
	addu	$t8, $t6, $t7	# $t8 <- dest+1
#       (storeWord, $r5, $r8)
	sw	$t8, ($t5)	# dest++

#   } while(*src++);
#     (addressOf, $r0, src)
	la	$t0, 8($fp)	# $t0 -> src
#     (loadWord, $r1, $r0)
	lw	$t1, ($t0)	# $t1 <- src
#     (loadSignedByte, $r2, $r1)
	lb	$t2, ($t1)	# $t2 <- *src
#     (addressOf, $r3, src)
	la	$t3, 8($fp)	# $t3 -> src
#     (loadWord, $r4, $r3)
	lw	$t4, ($t3)	# $t4 <- src
#     (constInt, $r5, 1)
	li	$t5, 1		# $t5 <- 1
#     (addUnsignedWord, $r6, $r4, $r5)
	addu	$t6, $t4, $t5	# $t6 <- src+1
#     (storeWord, $r3, $r6)
	sw	$t6, ($t3)	# src++
#     (gotoIfTrue, $r2, _GeneratedLabel_2)
	bnez	$t2, _GeneratedLabel_2	# branch to the beginning of the loop

#   return initial_dest;
#     (addressOf, $r0, initial_dest)
	la	$t0, 100($fp)	# $t0 -> initial_dest
#     (loadWord, $r1, $r0)
	lw	$t1, ($t0)	# $t1 <- initial_dest
#     (returnWord, $r1)
	or	$v0, $t1, $0	# $v0 <- initial_dest
#     (goto, _GeneratedLabel_3)
	b	_GeneratedLabel_3	# branch to the return code

# }
#   (label, _GeneratedLabel_3)
_GeneratedLabel_3:
#   (procEnd, _Global_strcpy)
	lw	$s7, 48($fp)	# restore $s7
	lw	$s6, 44($fp)	# restore $s6
	lw	$s5, 40($fp)	# restore $s5
	lw	$s4, 36($fp)	# restore $s4
	lw	$s3, 32($fp)	# restore $s3
	lw	$s2, 28($fp)	# restore $s2
	lw	$s1, 24($fp)	# restore $s1
	lw	$s0, 20($fp)	# restore $s0
	lw	$ra, 56($fp)	# restore $ra
	lw	$fp, 52($fp)	# restore old $fp
	addiu	$sp, $sp, 104	# pop off our stack frame
	jr	$ra		# return to caller

# factorial calls factorial
#	factorial requires one word of parameters

# Stack frame overhead is 24 words ($a0-$a3, $s0-$s7, $fp, $ra, saved
#   $t0-$t9) = 96 bytes
# For now, we will always save and restore all $s registers in
#   entry/exit code.
# For now, we will always save and restore all $t registers around
#   function calls.

# Argument build area is not needed because the 4 bytes for parameters for
#   functions we call will fit in the $a registers

# 96 bytes of overhead + 0 bytes for parameters to functions we call +
#   0 bytes for local variables = 96 bytes
# 96 bytes is double-word aligned (i.e., a multiple of 8), so an alignment
#   word is not required

# Layout of stack frame for "factorial" of size 96 bytes
#   Name	Offset		Size
#   $a0		$fp		4	(n)
#   $a1		$fp+4		4
#   $a2		$fp+8		4
#   $a3		$fp+12		4
#   $s0		$fp+16		4
#   $s1		$fp+20		4
#   $s2		$fp+24		4
#   $s3		$fp+28		4
#   $s4		$fp+32		4
#   $s5		$fp+36		4
#   $s6		$fp+40		4
#   $s7		$fp+44		4
#   old $fp	$fp+48		4
#   $ra		$fp+52		4
#   saved $t0	$fp+56		4
#   saved $t1	$fp+60		4
#   saved $t2	$fp+64		4
#   saved $t3	$fp+68		4
#   saved $t4	$fp+72		4
#   saved $t5	$fp+76		4
#   saved $t6	$fp+80		4
#   saved $t7	$fp+84		4
#   saved $t8	$fp+88		4
#   saved $t9	$fp+92		4

# int factorial(int n) {
#   (procBegin, _Global_factorial)
_Global_factorial:
	addiu	$sp, $sp, -96	# push space for our stack frame onto the stack
	sw	$fp, 48($sp)	# save the old $fp
	or	$fp, $sp, $0	# $fp -> stack frame
	sw	$ra, 52($fp)	# save the return address
				# save our parameter so that it can be
				#   referenced as a local variable
	sw	$a0, 0($fp)	# save the first actual parameter
				# no need to save $a1, $a2 & $a3
#	sw	$a1, 4($fp)	# save the second actual parameter
#	sw	$a2, 8($fp)	# save the third actual parameter
#	sw	$a3, 12($fp)	# save the fourth actual parameter
	sw	$s0, 16($fp)	# save $s0
	sw	$s1, 20($fp)	# save $s1
	sw	$s2, 24($fp)	# save $s2
	sw	$s3, 28($fp)	# save $s3
	sw	$s4, 32($fp)	# save $s4
	sw	$s5, 36($fp)	# save $s5
	sw	$s6, 40($fp)	# save $s6
	sw	$s7, 44($fp)	# save $s7

#   if(n <= 1)
#     (addressOf, $r0, n)
	la	$t0, 0($fp)	# $t0 -> n
#     (constInt, $r1, 1)
	li	$t1, 1		# $t1 <- 1
#     (loadWord, $r2, $r0)
	lw	$t2, ($t0)	# $t2 <- n
#     (leSignedWord, $r3, $r2, $r1)
	sle	$t3, $t2, $t1	# $t3 <- n <= 1
#     (gotoIfFalse, $r3, _GeneratedLabel_5)
	beqz	$t3, _GeneratedLabel_5	# branch to the else (false) alternative

#     return 1;
#       (constInt, $r0, 1)
	li	$t0, 1		# $t0 <- 1
#       (returnWord, $r0)
	or	$v0, $t0, $0	# $v0 <- 1
#       (goto, _GeneratedLabel_4)
	b	_GeneratedLabel_4	# branch to the return code
	
#   else
#     (goto, _GeneratedLabel_6)
	b	_GeneratedLabel_6	# branch to the end of the if statement
#     (label, _GeneratedLabel_5)
_GeneratedLabel_5:

#     return n*factorial(n-1);
#       (addressOf, $r0, n)
	la	$t0, 0($fp)	# $t0 -> n
#       (addressOf, $r1, n)
	la	$t1, 0($fp)	# $t1 -> n
#       (constInt, $r2, 1)
	li	$t2, 1		# $t2 <- 1
#       (loadWord, $r3, $r1)
	lw	$t3, ($t1)	# $t3 <- n
#       (subSignedWord, $r4, $r3, $r2)
	subu	$t4, $t3, $t2	# $t4 <- n-1
#       (parameter, 0, $r4)
	or	$a0, $t4, $0	# $a0 <- n-1
#       (call, _Global_factorial)
	sw	$t0, 56($fp)	# save $t0
	sw	$t1, 60($fp)	# save $t1
	sw	$t2, 64($fp)	# save $t2
	sw	$t3, 68($fp)	# save $t3
	sw	$t4, 72($fp)	# save $t4
	sw	$t5, 76($fp)	# save $t5
	sw	$t6, 80($fp)	# save $t6
	sw	$t7, 84($fp)	# save $t7
	sw	$t8, 88($fp)	# save $t8
	sw	$t9, 92($fp)	# save $t9
	jal	_Global_factorial	# call "factorial"
	lw	$t9, 92($fp)	# restore $t9
	lw	$t8, 88($fp)	# restore $t8
	lw	$t7, 84($fp)	# restore $t7
	lw	$t6, 80($fp)	# restore $t6
	lw	$t5, 76($fp)	# restore $t5
	lw	$t4, 72($fp)	# restore $t4
	lw	$t3, 68($fp)	# restore $t3
	lw	$t2, 64($fp)	# restore $t2
	lw	$t1, 60($fp)	# restore $t1
	lw	$t0, 56($fp)	# restore $t0
#       (resultWord, $r5)
	or	$t5, $v0, $0	# $t5 <- factorial(n-1)
#       (loadWord, $r6, $r0)
	lw	$t6, ($t0)	# $t6 <- n
#       (multSignedWord, $r7, $r6, $r5)
	mult	$t6, $t5	# $hi,$lo <- n*factorial(n-1)
	mflo	$t7		# $t7 <- n*factorial(n-1)
#       (returnWord, $r7)
	or	$v0, $t7, $0	# $v0 <- n*factorial(n-1)
#       (goto, _GeneratedLabel_4)
	b	_GeneratedLabel_4	# branch to the return code

#       (label, _GeneratedLabel_6)
_GeneratedLabel_6:

# }
#   (label, _GeneratedLabel_4)
_GeneratedLabel_4:
#   (procEnd, _Global_factorial)
	lw	$s7, 44($fp)	# restore $s7
	lw	$s6, 40($fp)	# restore $s6
	lw	$s5, 36($fp)	# restore $s5
	lw	$s4, 32($fp)	# restore $s4
	lw	$s3, 28($fp)	# restore $s3
	lw	$s2, 24($fp)	# restore $s2
	lw	$s1, 20($fp)	# restore $s1
	lw	$s0, 16($fp)	# restore $s0
	lw	$ra, 52($fp)	# restore $ra
	lw	$fp, 48($fp)	# restore old $fp
	addiu	$sp, $sp, 96	# pop off our stack frame
	jr	$ra		# return to caller
