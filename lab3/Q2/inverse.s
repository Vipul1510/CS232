.data

.text

compute_inverse:
    addi $sp, $sp, -12          # storing $ra, 'a' and 'm' values in the stack             
    sw $ra, 0($sp)                         
    sw $s1, 4($sp)                         
    sw $s2, 8($sp)                                                

    beq $s2, 0, inverse_Done
    div $s2, $s1       
    mfhi $s3
    move $s2, $s1
    move $s1, $s3
    
    jal compute_inverse

    lw $ra, 0($sp)              # loading $ra, 'a' and 'm' values from the stack
    lw $s1, 4($sp)
    lw $s2, 8($sp)
    addi $sp, $sp, 12
     
    div $s2, $s1       
    mflo $t0
    mult $t0, $a1      
    mflo $t1
    move $t3, $a2
    move $a2,$a1
    sub $a1, $t3, $t1

    jr $ra


inverse_Done:
    li $a1, 0   # store 'x' at $a1 
    li $a2, 1   # store 'y' at $a2
    jr $ra


main:  
    li $v0, 5           # Taking 'a' input
    syscall
    move $s1,$v0        # store 'a' at $s1
    
    li $v0, 5           # Taking 'm' input
    syscall
    move $s2,$v0        # store 'm' at $s2

    jal compute_inverse

    add $a1, $a1, $s2   # performing (x+m)%m to avoid -ve numbers
    div $a1, $s2       
    mfhi $a1

    li $v0 , 1          # printing value of x
    move $a0 , $a1
    syscall

    li $v0 , 10
    syscall
