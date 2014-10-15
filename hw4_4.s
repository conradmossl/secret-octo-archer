#the following information will be data
	.data

####
	.globl main


#the following variables will have the corresponding number of bytes
#set aside for use
oper: .space 4

#the following variables will by set to the following data
heading: .asciiz "Welcome to SPIM Calculator 1.0!\n"
first: .asciiz "\nEnter the first number "
second: .asciiz "Enter the second number "
operation: .asciiz "Enter the operation (+,-,*,/), then press enter key: = "
equal: .asciiz "="
remain: .asciiz "\nRemainder ==> " 
quoti: .asciiz "\nQuotient ==> "
calculation: .asciiz "\n \nAnother Calculation [y, n]?\n \n"
terminate: .asciiz "\nCalculator Terminated"

	#the following will be be actual code
	.text

Answer:
	#print the first integer
	li $v0, 1
	add $a0, $s0, $zero
	syscall

	#print the character
	li $v0, 11
	lw $a0, oper
	syscall

	#print the second integer
	li $v0, 1
	add $a0, $s1, $zero
	syscall

	#print an equal sign
	li $v0, 4
	la $a0, equal
	syscall

	#print the answer
	li $v0, 1
	add $a0, $s3, $zero
	syscall

	#set the syscall to print out a string
	li $v0, 4
	#set a point in the memory for the string
	la $a0, calculation
	syscall

	#set the syscall to read in a character
	li $v0, 12
	syscall

	beq $v0, 'n', End

	jal Loop

#subroutine for addition
Add:
	add $s3, $s0, $s1
	jal Answer
	
#subroutine for subtraction
Subtract:
	sub $s3, $s0, $s1
	jal Answer

#subroutine for multiplication
#s3 = s0 X s1
Multiply: 
	# a counter to keep track of how many iterations we've made
	# through the loop
	add $s4, $zero, $zero
	add	$s3, $zero, $zero
	jal Loop_mult
Loop_mult:
	beq $s4, $s1, Answer
	add $s3, $s3, $s0
	addi $s4, $s4, 1
	jal Loop_mult

#subroutine for division
#s3 = s0 / s1 
#s4 = s0 % s1

Divide:
	# a counter to keep track of how many iterations we've made
	# through the loop
	add $s4, $zero, $zero
	add	$s3, $zero, $zero
	jal Loop_div
Print_div:

	#print the Remainder
	li $v0, 4
	la $a0, remain
	syscall
	li $v0, 1
	add $a0, $s0, $zero
	syscall
	
	li $v0, 4
	la $a0, quoti
	syscall
	jal Answer

Loop_div:
	#subtracts the divisor from the dividend until the former is greater
	#than the latter
	slt $t0, $s0, $s1
	bne $t0, $zero, Print_div
	sub $s0, $s0, $s1
	addi $s3, $s3, 1
	jal Loop_div
	
#the following will be the main program
main:
	
	#title section
	#set the syscall to print out a string
	li $v0, 4
	#set a point in the memory for the string
	la $a0, heading
	#carry out the operation labled by $v0
	syscall

	jal Loop

	#make room for 2 integers, a character, the result 
	# and the remainder (if division)
	addi $sp, $sp, -20
	#load variables to these allotments
	sw $s0, 16($sp)	#first integer
	sw $s1, 12($sp)	#second integer
	sw $s2, 8($sp)	#arithmetic oper
	sw $s3, 4($sp) 	#result
	sw $s4, 0($sp)	#resevered for remainder
Loop:
	
	#Prompt user for first input int
	li $v0, 4
	la $a0, first
	syscall
	#set the syscall to read in an integer
	li $v0, 5
	syscall
	#store the first input integer into $s0
	add $s0, $v0, $zero

	#prompt user for second input int
	li $v0, 4
	la $a0, second
	syscall
	#set the syscall to read in an integer
	li $v0, 5
	syscall
	#store the second input integer into $s1
	add $s1, $zero, $v0

	#prompt the user for the operator
	li $v0, 4
	la $a0, operation
	syscall
	li $v0, 12
	syscall
	#take the data from $v0 and store it in the space allocated for oper
	sw $v0, oper
	#take the data from oper and store it in $s2
	lw $s2, oper

	beq $s2, '+', Add
	beq $s2, '-', Subtract
	beq $s2, '*', Multiply
	beq $s2, '/', Divide
	jal End
	
End:
	#restore the registers
	addi $sp, $sp, 20
	lw $s4, 0($sp)
	lw $s3, 4($sp) 
	lw $s2, 8($sp)
	lw $s1, 12($sp)
	lw $s0, 16($sp)

	li $v0, 4
	la $a0, terminate
	syscall

	jr $ra