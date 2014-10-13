	#the following information will be data
	.data
#the following variables will have the corresponding number of bytes
#set aside for use
integer: .space 1

#the following variables will by set to the following data
answer1: .asciiz "the input N="
answer2: .asciiz "; the sum="
	#the following will be be actual code
	.text

#the following will be the main program
main:
	#set the syscall to read in an integer
	li $v0, 5
	#carry out the operation labled by $v0
	syscall

	#save the loaded variable as a temporary variable
	add $t0, $zero, $v0
	
	#set the syscall to print out a string
	li $v0, 4
	#load the string to be printed
	la $a0, answer1
	#carry out the operation labled by $v0
	syscall

	#set the syscall to print out an integer
	li $v0, 1
	#load the integer to be printed
	add $a0, $zero, $t0
	#carry out the operation labled by $v0
	syscall

	#set a temporary variable as the sum
	add $t1, $zero, $zero
	#set a temporary variable as a counter
	add $t2, $zero, $zero

Loop:
	#end the loop if the loop has gone through
	#the addition process N times
	beq $t0, $t2, End
	#otherwise, increase the counter by 1
	addi $t2, $t2, 1
	#add the counter to the sum
	add $t1, $t2, $t1
	#continue
	j Loop

End:

	#set the syscall to print out a string
	li $v0, 4
	#load the string to be printed
	la $a0, answer2
	#carry out the operation labled by $v0
	syscall

	#set the parameters for printing out the sum
	add $a0, $zero, $t1
	#set the syscall to print out an integer
	li $v0, 1
	#carry out the operation labled by $v0
	syscall
	#return
	jr $ra
