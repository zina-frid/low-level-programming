# main.s
.text
main:
.globl main
  la a0, arrayR          # a0 = адресс R[0]
  lw a1, arrayA_length   # a1 = len(A)
  lw a2, arrayB_length   # a2 = len(B)
  la a3, arrayA          # a3 = адресс a[0]
  la a4, arrayB          # a4 = адресс b[0]
  
  addi sp, sp, -16       # выделение памяти в стеке
  sw ra, 12(sp)          # сохранение ra
  
  call merge
  
  lw ra, 12(sp)          # восстановление ra
  addi sp, sp, 16        # освобождение памяти в стеке
    
  li a0, 0               
  ret                    
  
.rodata                  # read-only data; неизменяемые данные
arrayA_length:
 .word 8
arrayA:
 .word 1, 3, 4, 5, 5, 6, 9, 10
arrayB_length:
 .word 4
arrayB:
 .word 2, 3, 5, 7
 
.data                    # data; изменяемые данные
arrayR:
 .word 255