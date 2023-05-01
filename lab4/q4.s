.text

main:
    li s0, 2    # s0 stores sum of even numbers {2, 4, 6, 8, 10}
    li a2, 4
    li s1, 1    # s1 stores sum of odd numbers {1, 3, 5, 7, 9}
    li a1, 3
    add s0, s0, a2
    li a2, 6
    add s1, s1, a1
    li a1, 5
    add s0, s0, a2
    li a2, 8
    add s1, s1, a1
    li a1, 7
    add s0, s0, a2
    li a2, 10
    add s1, s1, a1
    li a1, 9
    add s0, s0, a2
    add s1, s1, a1
    add s0, s0, s1
  