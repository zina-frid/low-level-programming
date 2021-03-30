.text
 start:
.globl start
  la a0, arrayR          # a0 = address R[0]
  lw a1, arrayA_length   # a1 = len(A)
  lw a2, arrayB_length   # a2 = len(B)
  la a3, arrayA          # a3 = address a[0]
  la a4, arrayB          # a4 = address b[0]
  li a5, 0               # counter for À = i
  li a6, 0               # counter for B = j
  jal zero, check        # goto check; jump to check
loop:
  lw t0, 0(a3)           # t0 = a3 = a[i]
  lw t1, 0(a4)           # t1 = a4 = b[j]
  bgeu a5, a1, printB    # if(i >= len(A)); all arrayA elements passed
  bgeu a6, a2, printA    # if(j >= len(B)); all arrayB elements passed
  bgtu t0, t1, printB    # if(t0 > t1) => (a[i] > b[j]) goto printB    
printA:
  sw t0, 0(a0)           # r[k] = a[i]; writing a[i] to the resulting arrayR
  addi a5, a5, 1         # i++; increase counter for A
  addi a3, a3, 4         # a3 = a3 + 4 = address a[i] + 4 = address a[i+1]
  jal zero, increaseR     # goto increaseR; jump to increaseR
printB:
  sw t1, 0(a0)           # r[k] = b[j]; writing b[j] to the resulting arrayR
  addi a6, a6, 1         # j++; increase counter for B
  addi a4, a4, 4         # a4 = a4 + 4 = address b[j] + 4 = address b[j+1]
increaseR: 
  addi a0, a0, 4         # a0 = a0 + 4 = address r[k] + 4 = address r[k+1]
check:
  bltu a5, a1, loop      # if there are unprocessed elements in arrayA then goto loop
  bltu a6, a2, loop      # if there are unprocessed elements in arrayB then goto loop
loop_exit:
finish:
  li a0, 10              # shutting down the program
  ecall
 
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