.data
arr: .long -1, 22, 102, 4, 9      # Define an array of integers
outp: .asciz "the maximum value is = %ld\n"  # Define the format string for printf

.text
.global _main
_main:
    movl $arr, %ebx         # Load the address of arr into register %ebx
    movl (%ebx), %ecx       # Initialize %ecx with the first element of arr (arr[0])

    movl $1, %edx           # Initialize loop counter (%edx) to 1
    movl $0, %eax           # Initialize index counter (%eax) to 0

loop_start:
    cmpl $5, %edx           # Compare loop counter (%edx) with 5 (length of arr)
    jge end_loop            # Jump to end_loop if %edx >= 5

    movl (%ebx,%edx,4), %esi    # Load arr[%edx] (current element) into %esi
    cmpl %esi, %ecx         # Compare current element with current max (%ecx)
    jge skip_update         # Jump to skip_update if current element <= max

    movl %esi, %ecx         # Update max (%ecx) to current element

skip_update:
    add $1, %edx            # Increment loop counter (%edx)
    jmp loop_start          # Jump to loop_start to continue looping

end_loop:
    pushl %ecx              # Push max (%ecx) onto the stack (argument for printf)
    push $outp              # Push format string address onto the stack
    call _printf            # Call printf function
    addl $8, %esp           # Clean up stack after function call (remove arguments)

    xorl %eax, %eax         # Set return value to 0 (indicating successful execution)
    ret                     # Return from main
