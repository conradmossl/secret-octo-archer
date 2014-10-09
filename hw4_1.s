	#the following information will be data
	.data
#the following variables will have the corresponding number of bytes
#bytes set aside for use
char: .space 1
string: .space 20
integer: .space 1
	#the following will be be actual code
	.text

#the following will be the main program
main:

	###CHARACTER###
	
	#set the syscall to read in a string
	li $v0, 8
	#set a point in the memory for the character
	la $a0, char
	#set a limit for the number of bytes to read in
	li $a1, 1
	#carry out the operation labled by $v0
	syscall

	#set the syscall to print out a string
	li $v0, 4
	#carry out the operation labled by $v0
	syscall

	###STRING###

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
	#set a point in the memory for the integer
	la $a0, integer
	#set a limit for the number of bytes to read in
	li $a1, 1
	#carry out the operation labled by $v0
	syscall

	#set the syscall to print out a string
	li $v0, 1
	#carry out the operation labled by $v0
	syscall

	#return
	jr $ra