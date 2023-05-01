        section .text
        global matrix_mult

matrix_mult:
        push rdi                       ; pointer to mat1
        push rsi                       ; row count of mat1
        push rdx                       ; column count of mat1
        push rcx                       ; pointer to mat2
        push r8                        ; row count of mat2
        push r9                        ; column count of mat2
        push r10                       ; pointer to mat3
        push r11
        push r12
        push r13

; ; 0-indexing on all matrices
; ; mat1[i][j] = rdi+(rdx*i+j)*8
; ; assume rdx = r8
; ; GOAL - Perform matrix multiplication of mat1, mat2 and save result in mat3

; ; TODO - Fill your code here performing the matrix multiplication in the following order
; ; for j in range(c2) { for k in range(c1) { for i in range(r1) { mat3[i][j] += mat1[i][k]*mat2[k][j] } } }
        ;; let i=r11, j=r12, k=r13, r14=mat1[i][k]
        mov r11, 0
        mov r12, 0
        mov r13, 0
outerLoop:
        cmp r12, r9
        je outerLoopDone
        mov r13, 0
middleLoop:
        cmp r13, r8
        je middleLoopDone
        ;;mov rbx, 0
        mov r11, 0
        mov rax, r9 
        imul rax, r13
        add rax, r12
        shl rax, 3
        mov r14, rax[rcx]
innerLoop:
        cmp r11, rsi
        je innerLoopDone
        mov rax, r8
        imul rax, r11
        add rax, r13
        shl rax, 3
        mov r15, rax[rdi]
        imul r15, r14
        ;; mat1[i][k]*mat2[k][j] store in r15
        ;;add rbx, r15
        mov rax, r9 
        imul rax, r11
        add rax, r12
        shl rax, 3
        mov rbx, rax[r10]
        add rbx, r15
        mov rax[r10], rbx
        add r11, 1
        jmp innerLoop
innerLoopDone:
        add r13, 1
        jmp middleLoop
middleLoopDone:
        add r12, 1
        jmp outerLoop
outerLoopDone:
; ; End of code to be filled

        pop r13
        pop r12
        pop r11
        pop r10
        pop r9
        pop r8
        pop rcx
        pop rdx
        pop rsi
        pop rdi
        ret
