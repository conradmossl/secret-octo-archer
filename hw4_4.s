#the following information will be data
	.data

####
	.globl main


#the following variables will have the corresponding number of bytes
#set aside for use
oper: .space 4

#the following variables will by set to the following data
heading: .asciiz "Welcome to SPIM Calculator 1.0!"
first: .asciiz "\nEnter the first number "
second: .asciiz "\nEnter the second number "
operation: .asciiz "\nEnter the operation (+,-,*,/), the press enter key: ="
calculation: .asciiz "Another Calculation"
terminate: .asciiz "Calculator Terminated"

	#the following will be be actual code
	.text

#function for addition
Add:
	add $s3, $s1, $s0
	# jal Answer

	add $a0, $zero, $s3

	#set the syscall to print out an integer
	li $v0, 1
	#carry out the operation labled by $v0
	syscall

	jr $ra

#function for multiplication
#a0 X a1 = 

# Multiply: 
# 	# a counter to keep track of how many times we've iterated
# 	# through the loop
# 	add $s0, $zero, $zero
# 	# a variable to store the result of the operation
# 	add $s1, $zero, $zero	
# 	ja Loop
# Return:
# 	# store result on stack
# 	# adjust stack pointer accordingly

# Loop:
# 	add $s0, $s0, $a0
# 	addi $s0, 1
# 	beq $s0, $s1, Return
# 	ja Loop

#function for division

###
# Answer:
	
# 	add $a0, $zero, $s3

# 	#set the syscall to print out an integer
# 	li $v0, 1
# 	#carry out the operation labled by $v0
# 	syscall

# 	jr $ra

#the following will be the main program
main:
	
	#title section
		#will happen regardless of first equation
	
	#make room for 2 integers and a character on the stack
	addi $sp, $sp, -16
	
	#load variables to these allotments
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $s2, 4($sp)
	sw $s3, 0($sp) 

	#set the syscall to print out a string
	li $v0, 4
	#set a point in the memory for the string
	la $a0, heading
	#carry out the operation labled by $v0
	syscall

	#set the syscall to print out a string
	li $v0, 4
	#set a point in the memory for the string
	la $a0, first
	#carry out the operation labled by $v0
	syscall

	#set the syscall to read in an integer
	li $v0, 5
	#carry out the operation labled by $v0
	syscall

	#store the first input integer into $t0
	add $s0, $zero, $v0

	#set the syscall to print out a string
	li $v0, 4
	#set a point in the memory for the string
	la $a0, second
	#carry out the operation labled by $v0
	syscall

	#set the syscall to read in an integer
	li $v0, 5
	#carry out the operation labled by $v0
	syscall

	#store the second input integer into $t1
	add $s1, $zero, $v0

	#set the syscall to print out a string
	li $v0, 4
	#set a point in the memory for the string
	la $a0, operation
	#carry out the operation labled by $v0
	syscall

	#set the syscall to read in a character
	li $v0, 12
	#carry out the operation labled by $v0
	syscall

	#take the data from $v0 and store it in the space allocated for oper
	sw $v0, oper
	#take the data from oper and store it in $t3
	lw $s2, oper

	beq $s2, '+', Add

	# jal End

	#loop until the user sends "n"
# End:
# 	#ending section

# 	#set a point in the memory for the string
# 	la $a0, terminate
# 	#carry out the operation labled by $v0
# 	syscall

# 	#set the syscall to print out a string
# 	li $v0, 4
# 	#carry out the operation labled by $v0
# 	syscall

# 	#return
# 	jr $ra