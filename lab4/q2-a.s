    # READ AFTER WRITE HAZARD
.text
    
main:
    li a0, 9        # Initializing a0 = 9
    li a1, 3        # Initializing a1 = 3
    li a2, 1        # Initializing a2 = 1
    li a3, 1        # Initializing a3 = 1
    sub a2, a0, a1  # subtracting a1 from a0 and storing it into a2
    nop
    nop
    # value in a2 becomes 6(=9-3) after adding 2 nop operations
    add a3, a2, a1  # adding a2 and a1 and storing it into a3 
    # Value in a3 becomes 9(=6+3) 