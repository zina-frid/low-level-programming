.text
 start:
.globl start
  la a0, arrayR          # a0 = адресс R[0]
  lw a1, arrayA_length   # a1 = len(A)
  lw a2, arrayB_length   # a2 = len(B)
  la a3, arrayA          # a3 = адресс a[0]
  la a4, arrayB          # a4 = адресс b[0]
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
finish:
  li a0, 10              # завершение работы программы
  ecall
 
.rodata                  # read-only data; неизмен€емые данные
arrayA_length:
 .word 8
arrayA:
 .word 1, 3, 4, 5, 5, 6, 9, 10
arrayB_length:
 .word 4
arrayB:
 .word 2, 3, 5, 7
 
.data                    # data; измен€емые данные
arrayR:
 .word 255