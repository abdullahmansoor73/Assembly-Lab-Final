#include <stdio.h>
//Maximum Number in Array
int main() {
    // Abdullah Mansoor

//initialize Array of 10 Numbers
    int arr[10] = {2, 5, 73, 2, 8, -2, 4, 102, 66, 78};  
    int max = arr[0];  // Assume the first element is the maximum initially

    // Loop through the array to find the maximum value
    for (int i = 1; i < 10; i++) {
        if (arr[i] > max) {
            max = arr[i];  //swap value if larger
        }
    }

    // Print the maximum value
    printf("The maximum value in the array is: %d\n", max);

    return 0; 
}
