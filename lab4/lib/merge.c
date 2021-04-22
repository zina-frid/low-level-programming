#include <malloc.h>
#include <stddef.h>

unsigned* merge(const unsigned arrayA[], const size_t lengthA, const unsigned arrayB[], const size_t lengthB) {
    const size_t length = lengthA + lengthB;

    unsigned* result = (unsigned *) malloc(sizeof arrayA[0] * length);

    int i = 0, j = 0;
    for (int k = 0; k < length; k++) {
        if (j >= lengthB || (i < lengthA && arrayA[i] < arrayB[j])) {
            result[k] = arrayA[i];
            i++;
        } else {
            result[k] = arrayB[j];
            j++;
        }
    }

    return result;
}

