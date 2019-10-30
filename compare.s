.data
msg1: .asciiz "Enter the first number: "
msg2: .asciiz "\nEnter the second number: "
msg3: .asciiz "The larger number is "
msg4: .asciiz "\n Both inputs are equal."

.text
li $v0,4
la $a0,msg1
syscall

li $v0,5
syscall
move $t0,$v0


li $v0,4
la $a0,msg2
syscall

li $v0,5
syscall
move $t1,$v0

beq $t0, $t1, equal


bne $t0, $t1, test

test:
slt $t2, $t0, $t1

beq $t2, $zero, print_t0

print_t1:
li $v0, 4 #print a string "mes3"
la $a0, msg3
syscall
li $v0, 1 #print the larger int number
move $a0, $t1
syscall
j Exit

print_t0:
li $v0, 4 #print a string "mes3"
la $a0, msg3
syscall
li $v0, 1 #print the larger int number
move $a0, $t0
syscall
j Exit


equal:
li $v0, 4 #print a string "mes3"
la $a0, msg4
syscall
j Exit

Exit:

li $v0,10
syscall