	#the following information will be data
	.data
#the following variables will have the corresponding number of bytes
#bytes set aside for use
integer: .space 1
	#the following will be be actual code
	.text

#the following will be the main program
main:	
	#set the syscall to read in an integer
	li $v0, 5
	#set a point in the memory for the integer
	la $a0, integer
	#set a limit for the number of bytes to read in
	li $a1, 1
	#carry out the operation labled by $v0
	syscall

	