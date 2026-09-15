# Title: Task 5 - Check Equality
# Description: Compares two integers and prints whether they are equal.

.data
    prompt1: .asciiz "Enter first integer: "
    prompt2: .asciiz "Enter second integer: "
    eq_msg:  .asciiz "equal\n"
    neq_msg: .asciiz "not equal\n"

.text
.globl main
main:
    # Read first integer
    li $v0, 4
    la $a0, prompt1
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    # Read second integer
    li $v0, 4
    la $a0, prompt2
    syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Compare
    beq $t0, $t1, is_equal   # Branch to 'is_equal' if $t0 == $t1

    # Print "not equal"
    li $v0, 4
    la $a0, neq_msg
    syscall
    j end                    # Jump to end to avoid printing "equal"

is_equal:
    # Print "equal"
    li $v0, 4
    la $a0, eq_msg
    syscall

end:
    # Exit
    li $v0, 10
    syscall