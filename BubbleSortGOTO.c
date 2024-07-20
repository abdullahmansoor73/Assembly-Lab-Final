#include <stdio.h>

// Function to perform Bubble Sort using goto statements
void BubbleSort(int A[], int size) {
    int temp;
    int i = 0, j = 0;

start_outer_loop:
    if (i >= size - 1) goto end_outer_loop;

    j = size - 1;

start_inner_loop:
    if (j <= i) goto end_inner_loop;

    if (A[j] < A[j - 1]) {
        // Swap A[j] and A[j - 1]
        temp = A[j];
        A[j] = A[j - 1];
        A[j - 1] = temp;
    }

    j--;
    goto start_inner_loop;

end_inner_loop:
    i++;
    goto start_outer_loop;

end_outer_loop:
    return;
}

int main() {
    // Define an array of integers
    int Array[] = {4, -7, 21, 5, 16, 9, 8, 32, 6};
    int size = sizeof(Array) / sizeof(Array[0]);  // Calculate the number of elements

    // Print the unsorted array
    printf("Unsorted:\n");
    for (int i = 0; i < size; i++) {
        printf("%d ", Array[i]);
    }
    printf("\n");

    // Call BubbleSort function
    BubbleSort(Array, size);

    // Print the sorted array
    printf("Sorted:\n");
    for (int i = 0; i < size; i++) {
        printf("%d ", Array[i]);
    }
    printf("\n");

    return 0;  // End of the program
}
