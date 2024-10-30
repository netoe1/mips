.data 
strIdadeP1: .asciiz "\nP1: Digite o ano de nascimento da primeira pessoa:"
strIdadeP2: .asciiz "\nP2: Digite o ano de nascimento da segunda pessoa:"
outputIgual: .asciiz "\nP1 e P2 possuem a mesma idade!"
outputP1P2: .asciiz "\nP1 eh maior que P2!"
outputP2P1: .asciiz "\nP2 eh maior que P1!"
anoP1: .word 0
anoP2: .word 0

.text
li $v0,4 
la $a0,strIdadeP1
syscall
li $v0,5
syscall
sw $v0,anoP1
li $v0,4 
la $a0,strIdadeP2
syscall
li $v0,5
syscall
sw $v0,anoP2
lw $t0,anoP1
lw $t1,anoP2
beq $t0,$v0,idadeIgual
bge $t0,$t1,p1Maior
blt $t0,$t1,p2Maior
idadeIgual:
li $v0,4
la $a0,outputIgual
syscall
j fim
p1Maior:
li $v0,4
la $a0,outputP1P2
syscall
j fim
p2Maior:
li $v0,4
la $a0,outputP2P1
syscall
j fim
fim:
li $v0,10
syscall









	
