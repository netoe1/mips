.data
n1: .word 10
n2: .word 20
result: .word

.text

lw $t0,n1
lw $t1,n2
add $t2,$t1,$t0

lw $t2,$s0

