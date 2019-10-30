.data
msg1: .asciiz "How many grades would you like to enter? "
msg2: .asciiz "\nEnter your grade: "
msg3: .asciiz "\nNumber of grades: "
msgA: .asciiz "\n\A's: "
msgB: .asciiz "\n\B's: "
msgC: .asciiz "\n\C's: "
msgD: .asciiz "\n\D's: "
msgF: .asciiz "\n\F's: "

count:  .word       0
count_a:  .word       0
count_b:  .word       0
count_c:  .word       0
count_d:  .word       0
count_f:  .word       0
element:  .word       0
one:  .word       1
numbergrades:  .space      200
lettergrades:  .space      800
newline: .asciiz "\n"

.text
	li $v0,4
	la $a0,msg1
	syscall

	li $v0,5
	syscall

	sw $v0,count
	
	lw $t0,numbergrades
	lw $s0,lettergrades
	lw $t1,count
	lw $t2,count_a
	lw $t3,count_b
	lw $t6,count_d
	lw $t7,count_d
	lw $s7,count_f

print_prompt:
	la $a0,msg2     
	li $v0,4       
	syscall  
	jal fill_array
	ble $v0, 0, Print_grades

fill_array:
	li $v0,5          
	syscall
	addi $t0,$t0,4
	sub $t1,$t1,1
	ble $v0, 0, Print_grades
	sw $v0, numbergrades($t0) 
	move $sp,$ra
	add $sp, $sp, 4
	jal checkA
	move $ra,$sp
	sub $sp, $sp, 4


     
checkA:              
    ble $v0, 90, checkB
    add $t2,$t2,1
    beqz $t1, Print_grades


checkB:
    bge $v0, 89, print_prompt      
    ble $v0, 80, checkC
    add $t3,$t3,1
    bnez $t1,print_prompt
    beqz $t1, Print_grades

checkC:    
    ble $v0, 70, checkD 
    add $t6,$t6,1
    bnez $t1,print_prompt
    beqz $t1, Print_grades

checkD:    
    ble $v0, 60, checkF 
    add $t7,$t7,1 
    bnez $t1,print_prompt
    beqz $t1, Print_grades

checkF:    
    add $s7,$s7,1    
    bnez $t1,print_prompt
    beqz $t1, Print_grades
    
Print_grades:
	la $a0,msg3    
	li $v0,4       
	syscall   

	la $a0,msgA 
	li $v0,4       
	syscall
	
	li $v0,1
	move $a0, $t2
	syscall
	
	la $a0,msgB
	li $v0,4       
	syscall
	
	li $v0,1
	move $a0, $t3
	syscall
	
	la $a0,msgC
	li $v0,4       
	syscall
	
	li $v0,1
	move $a0, $t6
	syscall
	
	la $a0,msgD
	li $v0,4       
	syscall
	
	li $v0,1
	move $a0, $t7
	syscall
	
	la $a0,msgF
	li $v0,4       
	syscall
	
	li $v0,1
	move $a0, $s7
	syscall
	  
    

Exit:
	li $v0,10
	syscall
