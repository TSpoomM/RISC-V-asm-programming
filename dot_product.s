.data
a: .word 1, 2, 3, 4, 5
b: .word 6, 7, 8, 9, 10
output: .string "The dot product is: "

.text
.globl main
main:
    # Initialize variables
    li t0, 0        # Counter i
    li t1, 0        # Sum of products (sop)

    # Load base addresses of arrays
    la t2, a
    la t3, b

    # Loop over the arrays
loop:
    # Check loop termination condition
    li t5, 5
    bge t0, t5, exit

    # Load a[i]
    lw t4, 0(t2)
    # Load b[i]
    lw t6, 0(t3)

    # Calculate a[i] * b[i]
    mul t4, t4, t6

    # Accumulate sop
    add t1, t1, t4

    # Increment loop counter
    addi t0, t0, 1

    # Increment array pointers
    addi t2, t2, 4
    addi t3, t3, 4

    # Continue loop
    j loop

exit:
    # Print the output string
    li a0, 4        # System call number for printing string
    la a1, output   # Load address of the output string
    ecall

    # Print the dot product
    li a0, 1        # System call number for printing integer
    mv a1, t1       # Move the dot product to a1
    ecall

    # Print a newline
    li a0, 11       # System call number for printing character
    li a1, 10       # ASCII code for newline
    ecall

    # Exit cleanly
    li a0, 10       # System call number for exit
    ecall
