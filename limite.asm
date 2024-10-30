.data 
bufInput: .asciiz "\nDigite um valor limite:"
bufOverflow: .asciiz "\nO valor digitado teve um overflow!"
endPointMsg: .asciiz "\nVocê chegou ao final do programa,pois declarou 10 amostras, muito obrigado!"
inputBuf: .asciiz "\nDigite um valor dentro do limite:"
limit: .word 0
lastValue: .word 0
times: .word 0
maxTimes: .word 10
infoMsg: .asciiz "\nBem vindo a este programa, defina um limite e declare 10 amostras!"


.text
lw $s1,maxTimes
lw $s0,times
li $v0,4
la $a0,infoMsg
syscall
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
bge $s0,$s1,endpoint
li $v0,4
la $a0,inputBuf
syscall
li $v0,5
syscall
sw $v0,lastValue
move $s4,$v0
addi $s0,$s0,1
bgt $s4,$s2,outputGreaterThan # if statement origin
j getData
outputGreaterThan: # if statement label when input > limit
li $v0,4
la $a0,bufOverflow
syscall
j getData
endpoint: # endpoint program, if maxLimit equals to limit
# Print endpoint
li $v0,4
la $a0,endPointMsg
syscall
#exit
li $v0,10
syscall
