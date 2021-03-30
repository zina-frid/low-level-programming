# merge.s
.text
merge:
.globl merge
  # in a0 - address R[k]
  # in a1 -  len(A)
  # in a2 - len(B)
  # in a3 - address a[i]
  # in a4 - address b[j]
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
  ret

