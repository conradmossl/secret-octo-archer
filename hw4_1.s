	#the following information will be data
	.data
#the following variables will have the corresponding number of bytes
#bytes set aside for use
char: .space 1
string: .space 20
integer: .space 1
	#the following will be actual code
	.text

#the following will be the main program
main:

	###CHARACTER###
	
	#set the syscall to read in a character
	li $v0, 12
	#carry out the operation labled by $v0
	syscall

	sw $v0, char
	lw $a0, char

	#set the syscall to print out a char
	li $v0, 11
	#carry out the operation labled by $v0
	syscall

	###  STRING  ###

	#set the syscall to read in a string
	li $v0, 8
	#set a point in the memory for the string
	la $a0, string
	#set a limit for the number of bytes to read in
	li $a1, 20
	#carry out the operation labled by $v0
	syscall

	#set the syscall to print out a string
	li $v0, 4
	#carry out the operation labled by $v0
	syscall

	###INTEGER###

	#set the syscall to read in an integer
	li $v0, 5
	#carry out the operation labled by $v0
	syscall

	add $a0, $zero, $v0

	#set the syscall to print out an integer
	li $v0, 1
	#carry out the operation labled by $v0
	syscall

	#return
	jr $ra
