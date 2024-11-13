.data
a: .word 10
b: .word 10
destino: .word 0


.text
lw $t0, a
lw $t1, b
add $t2,$t1,$t0
sw $t2,destino


