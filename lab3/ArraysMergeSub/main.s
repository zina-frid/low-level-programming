# main.s
.text
main:
.globl main
  la a0, arrayR          # a0 = address R[0]
  lw a1, arrayA_length   # a1 = len(A)
  lw a2, arrayB_length   # a2 = len(B)
  la a3, arrayA          # a3 = address a[0]
  la a4, arrayB          # a4 = address b[0]
  
  addi sp, sp, -16       # allocating memory on the stack
  sw ra, 12(sp)          # saving ra
  
  call merge
  
  lw ra, 12(sp)          # recovery ra
  addi sp, sp, 16        # freeing memory on the stack
    
  li a0, 0               
  ret                    
  
.rodata                  # read-only data; immutable data
arrayA_length:
 .word 8
arrayA:
 .word 1, 3, 4, 5, 5, 6, 9, 10
arrayB_length:
 .word 4
arrayB:
 .word 2, 3, 5, 7
 
.data                    # data; mutable data
arrayR:
 .word 255