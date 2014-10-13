#the following information will be data
	.data

#the following variables will have the corresponding number of bytes
#set aside for use

#the following variables will by set to the following data
heading: .asciiz "Welcome to SPIM Calculator 1.0!"
first: .asciiz "Enter the first number"
second: .asciiz "Enter the first number"
operation: .asciiz "Enter the operation (+,-,*,/), the press enter key: ="
calculation: .asciiz "Another Calculation"
terminate: .asciiz "Calculator Terminated"

	#the following will be be actual code
	.text

#function for multiplication
#a0 X a1 = 

Multiply: 
	# a counter to keep track of how many times we've iterated
	# through the loop
	add $s0, $zero, $zero
	# a variable to store the result of the operation
	add $s1, $zero, $zero	
	ja Loop
Return:
	# store result on stack
	# adjust stack pointer accordingly

Loop:
	add $s0, $s0, $a0
	addi $s0, 1
	beq $s0, $s1, Return
	ja Loop

#function for division



#the following will be the main program
main:
	
	#title section
		#will happen regardless of first equation
	
	#set a point in the memory for the string
	la $a0, heading
	#carry out the operation labled by $v0
	syscall

	#set the syscall to print out a string
	li $v0, 4
	#carry out the operation labled by $v0
	syscall

	#set the syscall to read in an integer
	li $v0, 5
	#carry out the operation labled by $v0
	syscall

	#store the second input integer into $t0
	add $t0, $zero, $v0

	#set the syscall to read in an integer
	li $v0, 5
	#carry out the operation labled by $v0
	syscall

	#store the first input integer into $t1
	add $t1, $zero, $v0

	#set the syscall to read in a character
	li $v0, 12
	#carry out the operation labled by $v0
	syscall

	#take the data from $v0 and store it in the space allocated for oper
	sw $v0, oper
	#take the data from oper and store it in $t3
	lw $t2, oper

	lui 

	#loop until the user sends "n"
Loop:


End:
	#ending section

	#set a point in the memory for the string
	la $a0, terminate
	#carry out the operation labled by $v0
	syscall

	#set the syscall to print out a string
	li $v0, 4
	#carry out the operation labled by $v0
	syscall

	#return
	jr $ra