#the following information will be data
	.data
#the following variables will have the corresponding number of bytes
#set aside for use
integer: .space 1

#the following variables will by set to the following data
heading: .asciiz "Welcome to SPIM Calculator 1.0!"
	#the following will be be actual code
	.text

#the following will be the main program
main:
	
	#set the syscall to print out a string
	li $v0, 4
	#carry out the operation labled by $v0
	syscall

	
