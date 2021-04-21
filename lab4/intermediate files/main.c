#include <stddef.h>
#include <stdio.h>
#include <malloc.h>

#include "merge.h"

const unsigned arrayA[] = {1, 3, 4, 5, 5, 6, 9, 10};
const unsigned arrayB[] = {2, 3, 5, 7};
const size_t lengthA = sizeof arrayA / sizeof arrayA[0];
const size_t lengthB = sizeof arrayB / sizeof arrayB[0];

int main() {
    for (int i = 0; i < lengthA; i++) {
        printf("%d ", arrayA[i]);
    }
    printf("\n");

    for (int i = 0; i < lengthB; i++) {
        printf("%d ", arrayB[i]);
    }
    printf("\n");

    unsigned *arrayR = merge(arrayA, lengthA, arrayB, lengthB);

    for (int i = 0; i < lengthA + lengthB; i++) {
        printf("%d ", arrayR[i]);
    }

    free(arrayR);
    return 0;
}
