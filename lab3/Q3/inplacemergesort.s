.data

array: .space 40100
newline: .asciiz "\n"
extra: .asciiz " "
# storing size in $s0

.text
.globl main

# Loop to take inputs
input:
    beq $s0, $t1, stop_input 
    li $v0, 5 
    syscall 
    sw $v0, array($s1) 
    addi $t1, $t1, 1 
    addi $s1, $s1, 4
    slt $t0, $s7, $v0
    li $t2, 1
    beq $t0, $t2, max_elem
    j input 

# Loop which finds max element while taking inputs only :)
max_elem:
    move $s7, $v0
    j input

# Stops taking input
stop_input:
    jr $ra

# Stops printing the output
stop_print:
    jr $ra
     
# Loop which prints the 
print_loop:
        beq $t0, $s0, stop_print
        lw $s6, array($s1) 
        move $a0, $s6
        li $v0, 1 
        syscall 
        li $v0 , 4
        la $a0 , newline
        syscall
        addi $t0, $t0, 1 
        addi $s1, $s1, 4 
        j print_loop 

loop1:
    addi $t0, $s0, -1
    slt $t0, $t0, $s2
    li $t1, 1
    beq $t0, $t1, loop1end
    li $s3, 0 # left
    move $t8, $ra
    jal loop2
    move $ra, $t8
    li $t0, 2
    mult $s2,$t0
    mflo $s2
    j loop1

loop1end:
    jr $ra

loop2:
    move $t9, $ra
    addi $t0, $s0, -1
    slt $t0, $s3, $t0
    li $t1, 1
    bne $t0, $t1, loop2end 
    #left is $s3, mid s4 Right s5
    add $s4, $s3, $s2
    addi $s4, $s4, -1
    add $s5, $s3, $s2
    add $s5, $s5, $s2
    addi $s5, $s5, -1
    addi $t1, $s0, -1
    slt $t0, $t1, $s4
    li $t1, 1
    beq $t0 ,$t1, min1
    addi $t1, $s0, -1
    slt $t0, $t1, $s5
    li $t1, 1
    beq $t0 ,$t1, min2
    move $ra, $t9
    addi $t3, $s4, 1        # j
    move $t4, $s3           # k
    #addi $s5, $s5, 1
    addi $s1, $s5, 1        # end+1
    addi $s6, $s4, 1        # mid +1
    move $v1, $s3
    jal merge
    move $ra, $t9
    add $s3, $s3, $s2
    add $s3, $s3, $s2
    j loop2
    
    
min1:
    addi $t1, $s0, -1
    move $s4, $t1
    slt $t0, $t1, $s5
    li $t1, 1
    beq $t0 ,$t1, min2
    move $ra, $t9
    addi $t3, $s4, 1        # j
    move $t4, $s3           # k
    #addi $s5, $s5, 1
    addi $s1, $s5, 1        # end+1
    addi $s6, $s4, 1        # mid +1
    move $v1, $s3
    jal merge
    move $ra, $t9
    add $s3, $s3, $s2
    add $s3, $s3, $s2
    j loop2
    
min2:
    addi $t0, $s0,-1
    move $s5, $t0
    move $ra, $t9
    addi $t3, $s4, 1        # j
    #addi $s4, $s4, 1
    move $t4, $s3           # k
    #addi $s5, $s5, 1
    addi $s1, $s5, 1        # end+1
    addi $s6, $s4, 1        # mid +1
    move $v1, $s3
    jal merge
    move $ra, $t9
    add $s3, $s3, $s2
    add $s3, $s3, $s2
    j loop2
    
    
loop2end:
    jr $t9

merge:
    ## left  $v1  ,mid  $s4  ,end $s5
    ## mid +1 $t3,  end+1 $s1 ,k $t4

    slt $t0, $v1, $s6
    slt $t5, $t3, $s1
    and $t0, $t0, $t5
    li $t5, 1
    beq $t0, $t5, while1
    slt $t0, $v1, $s6
    beq $t0, $t5, while2
    slt $t5, $t3, $s1
    li $t0, 1
    beq $t0, $t5, while3
    li $t0, 4
    mul $s1, $s3, $t0
    move $t0, $s3
    addi $s5, $s5, 1
    j ints
    
ints:
    beq $t0, $s5, stop1
    lw $s6, array($s1) 
    div $s6, $s7
    mflo $a0
    sw $a0, array($s1)
    addi $t0, $t0, 1 
    addi $s1, $s1, 4 
    j ints 

return_loop:
    jr $ra

stop1:
    addi $s5, $s5, -1
    jr $ra
while1:
    li $a2, 4
    mul $a1, $v1, $a2   
    lw $t6, array($a1)      #arr[i]
    mul $a2, $t3, $a2
    lw $t7, array($a2)      #arr[j]
    div $t6, $s7
    mfhi $t0
    div $t7, $s7
    mfhi $a3
    addi $a3, $a3, 1
    li $t1, 1
    slt $a2, $t0, $a3
    beq $a2, $t1, wh1_loop 
    li $a2, 4
    mul $a2, $t4, $a2
    lw $t7, array($a2)      #arr[k]
    addi $a3, $a3, -1
    mul $t1, $a3, $s7
    add $t7, $t7, $t1
    li $a2, 4
    mul $t1, $t4, $a2
    sw $t7, array($t1)
    addi $t4, $t4, 1
    addi $t3, $t3, 1
    j merge

wh1_loop:
    li $a2, 4
    mul $a2, $t4, $a2
    lw $t7, array($a2)      #arr[k]
    mul $t0, $t0, $s7
    add $t7, $t7, $t0
    li $a2, 4
    mul $t1, $t4, $a2
    sw $t7, array($t1)
    addi $v1, $v1, 1
    addi $t4, $t4, 1
    j merge

while2:
    li $a2, 4
    mul $a1, $v1, $a2   
    lw $t6, array($a1)      #arr[i]
    mul $a2, $t4, $a2
    lw $t7, array($a2)      #arr[k]
    div $t6, $s7
    mfhi $t0
    mul $t0, $t0, $s7
    add $t0, $t0, $t7 
    sw $t0, array($a2)
    addi $v1, $v1, 1
    addi $t4, $t4, 1
    j merge

while3:
    li $a2, 4
    mul $a1, $t3, $a2   
    lw $t6, array($a1)      #arr[j]
    mul $a2, $t4, $a2
    lw $t7, array($a2)      #arr[k]
    div $t6, $s7
    mfhi $t0
    mul $t0, $t0, $s7
    add $t0, $t0, $t7 
    sw $t0, array($a2)
    addi $t3, $t3, 1
    addi $t4, $t4, 1
    j merge


main:
    li $t0, 0           # initialize counter
    li $s0, 0           # size of the array
    li $s1, 0           # initialize array index
    li $s7, 0           # maximum element in the array
    li $v0, 5 
    syscall 
    move $s0, $v0       # size array is saved in $s0

    jal input # Take inputs
    addi $s7, $s7, 1    # Making max elem = max elem + 1
    
    ###### MERGE SORT ######
    li $s2, 1 # curr_size
    li $s3, 0 # left 
    jal loop1
    #########################
    li $t0, 0 
    li $s1, 0
    jal print_loop

    li $v0, 10          # exit the program
    syscall 