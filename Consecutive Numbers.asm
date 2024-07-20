.data
arr: .long 1, 8, 11,5, 9           # Array of integers
outp: .asciz "The maximum even value is = %ld at index = %ld\n"  # Format string for printf

.text
.global _main
_main:
    movl $arr, %ebx                # Load array address into %ebx
    movl $-1, %eax                 # Initialize index of max even number to -1
    movl $-2147483648, %ecx        # Initialize max even number to the smallest integer

    movl $0, %edx                  # Loop counter set to 0

loop_start:
    cmpl $5, %edx                  # Check if counter >= array size
    jge done                       # If yes, jump to done

    movl (%ebx, %edx, 4), %esi     # Load current element into %esi
    test $1, %esi                  # Check if element is even
    jnz next                       # If odd, jump to next

    cmpl %ecx, %esi                # Compare current even element with max even number
    jle next                       # If not greater, jump to next

    movl %esi, %ecx                # Update max even number
    movl %edx, %eax                # Update index of max even number

next:
    addl $1, %edx                  # Increment counter
    jmp loop_start                 # Continue loop

done:
    pushl %eax                     # Push index for printf
    pushl %ecx                     # Push max even number for printf
    push $outp                     # Push format string
    call _printf                   # Call printf
    addl $12, %esp                 # Clean up stack (3 arguments * 4 bytes each)

    xorl %eax, %eax                # Return 0
    ret                            # End of main
