# Title: Task 1 - Double an Integer
# Description: Prompts for an integer, doubles it, and prints the result.

.data
    prompt: .asciiz "Enter an integer: "
    result: .asciiz "The doubled number is: "

.text
.globl main
main:
    # Print prompt
    li $v0, 4           # system call for print_str
    la $a0, prompt      # load address of prompt
    syscall

    # Read integer
    li $v0, 5           # system call for read_int
    syscall
    move $t0, $v0       # save the entered integer in $t0

    # Double the integer using add
    add $t1, $t0, $t0   # $t1 = $t0 + $t0

    # Print result string
    li $v0, 4           # system call for print_str
    la $a0, result      # load address of result string
    syscall

    # Print the doubled integer
    li $v0, 1           # system call for print_int
    move $a0, $t1       # move doubled value to $a0 for printing
    syscall

    # Exit program
    li $v0, 10
    syscall