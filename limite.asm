.data 
bufInput: .asciiz "\nDigite um valor limite:"
bufOverflow: .asciiz "\nO valor digitado teve um overflow!"
endPointMsg: .asciiz "\nVocê chegou ao final do programa!"
inputBuf: .asciiz "\nDigite um valor dentro do limite:"
limit: .word 0
lastValue: .word 0
times: .word 1
maxTimes: .word 10


.text

lw $s1,maxTimes
lw $s0,times


# Set output and getString
li $v0,4
la $a0, bufInput
syscall

# Get limit
li $v0,5
syscall

sw $v0,limit
move $s2,$v0




getData:
# Load times in reg
beq $s1,$s0,endpoint

li $v0,4
la $a0,inputBuf
syscall
li $v0,5
syscall

sw $v0,lastValue
move $s4,$v0

addi $s0,$zero,1

bge $s4,$s2,outputGreaterThan

outputGreaterThan:
li $v0,4
la $a0,bufOverflow
syscall
j getData


endpoint:
# Print endpoint
li $v0,4
la $a0,endpoint
syscall
#exit
li $v0,10
syscall
