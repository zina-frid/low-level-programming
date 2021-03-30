# main.s
.text
main:
.globl main
  la a0, arrayR          # a0 = ������ R[0]
  lw a1, arrayA_length   # a1 = len(A)
  lw a2, arrayB_length   # a2 = len(B)
  la a3, arrayA          # a3 = ������ a[0]
  la a4, arrayB          # a4 = ������ b[0]
  
  addi sp, sp, -16       # ��������� ������ � �����
  sw ra, 12(sp)          # ���������� ra
  
  call merge
  
  lw ra, 12(sp)          # �������������� ra
  addi sp, sp, 16        # ������������ ������ � �����
    
  li a0, 0               
  ret                    
  
.rodata                  # read-only data; ������������ ������
arrayA_length:
 .word 8
arrayA:
 .word 1, 3, 4, 5, 5, 6, 9, 10
arrayB_length:
 .word 4
arrayB:
 .word 2, 3, 5, 7
 
.data                    # data; ���������� ������
arrayR:
 .word 255