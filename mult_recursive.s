.text
main:
    # Pass arguments
    li a0, 110
    li a1, 50
    
    # Call mult
    jal ra, mult
    
    # Print result
    mv a1, a0
    li a0, 1
    ecall
    
    # Print newline
    li a0, 11
    li a1, 10
    ecall
    
    # Exit
    li a0, 10
    ecall
    
mult:
    # Base case
    li t0, 1
    beq a1, t0, exit_base_case

    # Recursive case
    addi sp, sp, -4
    sw ra, 0(sp)
    
    # Save a0 on stack
    addi sp, sp, -4
    sw a0, 0(sp)
    
    # Call mult(a, b-1)
    addi a1, a1, -1
    jal ra, mult
    
    # Restore a0
    lw t1, 0(sp)
    addi sp, sp, 4
    
    # Calculate a + mult(a, b-1)
    add a0, a0, t1
    
    # Restore return address
    lw ra, 0(sp)
    addi sp, sp, 4
    
    # Return
    jr ra
    
exit_base_case:
    jr ra
