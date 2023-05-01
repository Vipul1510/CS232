.text

main:
    li a0, 1    # Initializing a0 to 1
    li a1, 2    # Initializing a0 to 2
    li a2, 3    # Initializing a0 to 3
    add a3, a0, a1    # Adding a0 and a1 
# Checking equality and calling label fn
    beq a3, a2, fn
    li s0, 1
fn:
    li s1, 0