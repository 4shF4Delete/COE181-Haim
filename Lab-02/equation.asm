# Title: Task 4 - Arithmetic Equation
# Description: Computes s = (a + b) - (c + 101)

.data
    promptA: .asciiz "Enter integer a: "
    promptB: .asciiz "Enter integer b: "
    promptC: .asciiz "Enter integer c: "
    result:  .asciiz "The result (s) is: "

.text
.globl main
main:
    # Read a
    li $v0, 4
    la $a0, promptA
    syscall
    li $v0, 5
    syscall
    move $t0, $v0       # $t0 = a

    # Read b
    li $v0, 4
    la $a0, promptB
    syscall
    li $v0, 5
    syscall
    move $t1, $v0       # $t1 = b

    # Read c
    li $v0, 4
    la $a0, promptC
    syscall
    li $v0, 5
    syscall
    move $t2, $v0       # $t2 = c

    # Calculations
    add $t3, $t0, $t1   # $t3 = a + b
    addi $t4, $t2, 101  # $t4 = c + 101
    sub $s0, $t3, $t4   # $s0 = (a + b) - (c + 101)

    # Print result text
    li $v0, 4
    la $a0, result
    syscall

    # Print computed value 's'
    li $v0, 1
    move $a0, $s0
    syscall

    # Exit
    li $v0, 10
    syscall