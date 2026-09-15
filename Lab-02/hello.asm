# Title: Task 3 - Hello Name
# Description: Takes string input from user and prints a greeting.

.data
    prompt: .asciiz "Enter your name: "
    hello:  .asciiz "Hello "
    name:   .space 50           # Reserve 50 bytes of memory for the name

.text
.globl main
main:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read string (system call 8)
    li $v0, 8
    la $a0, name        # Load address of the space reserved
    li $a1, 50          # Max length of string
    syscall

    # Print "Hello "
    li $v0, 4
    la $a0, hello
    syscall

    # Print the user's name
    li $v0, 4
    la $a0, name
    syscall

    # Exit program
    li $v0, 10
    syscall