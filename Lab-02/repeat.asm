# Title: Task 2 - Repeat Program
# Description: Doubles an integer and asks the user to repeat the process.

.data
    prompt: .asciiz "\nEnter an integer: "
    result: .asciiz "The doubled number is: "
    repeat: .asciiz "\nRepeat [y/n]? "

.text
.globl main
main:
loop:
    # Print prompt
    li $v0, 4
    la $a0, prompt
    syscall

    # Read integer
    li $v0, 5
    syscall
    
    # Double it
    add $t1, $v0, $v0   

    # Print result string
    li $v0, 4
    la $a0, result
    syscall

    # Print the doubled integer
    li $v0, 1
    move $a0, $t1
    syscall

    # Ask to repeat
    li $v0, 4
    la $a0, repeat
    syscall

    # Read character (system call 12)
    li $v0, 12
    syscall
    
    # Check if input is 'y' (ASCII 121)
    beq $v0, 121, loop  # If user typed 'y', jump back to 'loop'

    # Exit program
    li $v0, 10
    syscall