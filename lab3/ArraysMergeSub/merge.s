# merge.s
.text
merge:
.globl merge
  # � a0 ������ R[k]
  # � a1 len(A)
  # � a2 len(B)
  # � a3 ������ a[i]
  # � a4 ������ b[j]
  li a5, 0               # ������� ��� � = i
  li a6, 0               # ������� ��� B = j
  jal zero, check        # goto check; ����������� ������� �� check
loop:
  lw t0, 0(a3)           # t0 = a3 = a[i]
  lw t1, 0(a4)           # t1 = a4 = b[j]
  bgeu a5, a1, printB    # if(i >= len(A)); ��� �������� ������� A ��������
  bgeu a6, a2, printA    # if(j >= len(B)); ��� �������� ������� B ��������
  bgtu t0, t1, printB    # if(t0 > t1) => (a[i] > b[j]) goto printB    
printA:
  sw t0, 0(a0)           # r[k] = a[j]; ������ a[i] � �������� ������
  addi a5, a5, 1         # i++; ��������� ������� ��� A
  addi a3, a3, 4         # a3 = a3 + 4 = ������ a[i] + 4 =  ������ a[i+1]
  jal zero, increaseR     # goto increaseR; ����������� ������� �� increaseR
printB:
  sw t1, 0(a0)           # r[k] = b[j]; ������ b[j] � �������� ������
  addi a6, a6, 1         # j++; ��������� ������� ��� B
  addi a4, a4, 4         # a4 = a4 + 4 = ������ b[j] + 4 = ������ b[j+1]
increaseR: 
  addi a0, a0, 4         # a0 = a0 + 4 = ������ r[k] + 4 = ������ r[k+1]
check:
  bltu a5, a1, loop      # ���� ���� �������������� �������� � ������� A, �� goto loop
  bltu a6, a2, loop      # ���� ���� �������������� �������� � ������� B, �� goto loop
loop_exit:
  ret

