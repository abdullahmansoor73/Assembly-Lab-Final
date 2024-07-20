.data
arr: .long 1, 5, 5, 102, 12       # Array of 5 elements
arr_size: .long 5                # Size of the array
msg: .asciz "Consecutive identical numbers: %ld and %ld at indices: %ld and %ld\n"  # Output format string

.text
.global _main
.extern _printf

_main:
    pushl %ebp
    movl %esp, %ebp

    movl $arr, %ebx              # Load address of array into %ebx
    movl $0, %ecx                # Initialize index to 0
    movl arr_size, %edx          # Load size of array into %edx

search_consecutive:
    cmpl %edx, %ecx              # Compare index with array size
    jge end_program              # If index >= size, go to end_program

    movl (%ebx, %ecx, 4), %esi   # Load current element into %esi
    movl 4(%ebx, %ecx, 4), %edi  # Load next element into %edi

    cmpl %esi, %edi              # Compare current element with next element
    je output_consecutive        # If they are equal, jump to output_consecutive

    incl %ecx                    # Increment index
    jmp search_consecutive       # Repeat loop

output_consecutive:
    pushl %ecx                   # Push current index onto stack
    pushl %ecx                   # Push current index onto stack again
    addl $1, (%esp)              # Increment the top of the stack (index of next element)
    pushl %edi                   # Push next element onto stack
    pushl %esi                   # Push current element onto stack
    pushl $msg                   # Push format string onto stack
    call _printf                 # Call printf
    addl $20, %esp               # Clean up stack

    incl %ecx                    # Increment index
    jmp search_consecutive       # Continue searching for consecutive elements

end_program:
    movl %ebp, %esp
    popl %ebp
    xorl %eax, %eax              # Zero out %eax (set return value to 0)
    ret                          # Return from _main
