.data
msg1: .asciiz "Enter your desired array size: "
msg2: .asciiz "\nEnter an element: "
msg3: .asciiz "\n\n\What number would you like to search for? "
msg4: .asciiz "\n\n\Element found at index position "
msg5: .asciiz "\n\n\Element not found."

count:  .word       0
element:  .word       0
one:  .word       1
array:  .space      100
	newline: .asciiz "\n"

.text
	li $v0,4
	la $a0,msg1
	syscall

	li $v0,5
	syscall

	sw $v0,count
	
	lw $t0,array
	lw $t1,count
	lw $t2,count
	lw $t3,count
	lw $t6,count
	lw $t7, one
	sub $t2, $t2, 1


fill_array:
	la $a0,msg2     
	li $v0,4       
	syscall           

	li $v0,5          
	syscall

	sw $v0, array($t0) 
	beqz $t2, Print_E
	addi $t0,$t0,4
	sub $t1,$t1,1
	sub $t2,$t2,1      

	bnez $t0,fill_array  
        
Print_E:
	la      $t4, array
	mul $t7, $t3,4
	add $t4, $t4,$t7
	
loop1:
	beqz $t3 search
	sub $t4, $t4, 4
	lw      $t5, 0($t4)
	li      $v0, 1      
	move    $a0, $t5
	syscall
	li      $a0, 32
	li      $v0, 11  
	syscall
	sub $t3,$t3,1
	j      loop1
	
search:
	la $a0,msg3   
	li $v0,4       
	syscall
	
	li $v0,5          
	syscall

	move $t1, $v0
	
	la      $t4, array
	
loop2:
	beqz $t6 NotFound
	lw      $t5, 0($t4)
	add $t4, $t4, 4

	beq $t5, $t1, Found
	sub $t6,$t6,1
	j	loop2

NotFound:
	la $a0,msg5
	li $v0,4       
	syscall
	j	Exit
	
Found:
	la $a0,msg4 
	li $v0,4       
	syscall
	
	li $v0,1
	sub $t6,$t6,1
	move $a0, $t6
	syscall

Exit:
	li $v0,10
	syscall
