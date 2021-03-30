# merge.s
.text
merge:
.globl merge
  # в a0 адресс R[k]
  # в a1 len(A)
  # в a2 len(B)
  # в a3 адресс a[i]
  # в a4 адресс b[j]
  li a5, 0               # счетчик дл€ ј = i
  li a6, 0               # счетчик дл€ B = j
  jal zero, check        # goto check; безусловный переход на check
loop:
  lw t0, 0(a3)           # t0 = a3 = a[i]
  lw t1, 0(a4)           # t1 = a4 = b[j]
  bgeu a5, a1, printB    # if(i >= len(A)); все элементы массива A пройдены
  bgeu a6, a2, printA    # if(j >= len(B)); все элементы массива B пройдены
  bgtu t0, t1, printB    # if(t0 > t1) => (a[i] > b[j]) goto printB    
printA:
  sw t0, 0(a0)           # r[k] = a[j]; запись a[i] в итоговый массив
  addi a5, a5, 1         # i++; увеличили счетчик дл€ A
  addi a3, a3, 4         # a3 = a3 + 4 = адресс a[i] + 4 =  адресс a[i+1]
  jal zero, increaseR     # goto increaseR; безусловный переход на increaseR
printB:
  sw t1, 0(a0)           # r[k] = b[j]; запись b[j] в итоговый массив
  addi a6, a6, 1         # j++; увеличили счетчик дл€ B
  addi a4, a4, 4         # a4 = a4 + 4 = адресс b[j] + 4 = адресс b[j+1]
increaseR: 
  addi a0, a0, 4         # a0 = a0 + 4 = адресс r[k] + 4 = адресс r[k+1]
check:
  bltu a5, a1, loop      # если есть необработанные элементы в массиве A, то goto loop
  bltu a6, a2, loop      # если есть необработанные элементы в массиве B, то goto loop
loop_exit:
  ret

