.data
msg1:
	.asciiz	 "Enter your name: "
msg2:
	.asciiz	"Welcome to Assembly Language, "
name:
	.space	20	

	.text
main:

	li $v0, 4
	la $a0, msg1
	syscall


	li $v0, 8
	la $a0, name
	li $a1, 40
	syscall


	li $v0, 4
	la $a0, msg2
	syscall


	li $v0, 4
	la $a0, name
	syscall

	li $v0, 10
	syscall
	
