#include <stdio.h>

// Maximum Number in Array
int main() {
    // Abdullah Mansoor

    // Initialize Array of 10 Numbers
    int arr[10] = {2, 5, 73, 2, 8, -2, 4, 102, 66, 78};  
    int max = arr[0];  // Assume the first element is the maximum initially
    int i = 1;

    // Loop through the array to find the maximum value
loop_start:
    if (i < 10) {
        if (arr[i] > max) {
            max = arr[i];  // Update value if larger
        }
        i++;
        goto loop_start;
    }

    // Print the maximum value
    printf("The maximum value in the array is: %d\n", max);

    return 0; 
}
