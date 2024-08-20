## CS 254 Program 6
##
## Programmer: Ben Duong
##
## N=y
## if y > 0 
## if y is even add to evenaccum
## else add to oddaccum
## (y-1)
## jump to begining
##
## Programmer: Nhat Trung Duong
## Date: 3/27/2022
## Register used:
## $10 = N
## $11 = counter y
## $12 = 2
## $13 = remainder
## $14 = 1
## $15 = evenaccum
## $16 = oddaccum

.data

x: .word 10
evensum: .word 0
oddsum: .word 0

.text
.globl main

main: 
start:  lui  $10,0x1000      ## set starting point
        lw   $11, 0($10)     ## load N word into counter y
        ori  $12,$0,2        ## load 2 into register
        ori  $14,$0,1        ## load 1 into register
startloop:
        beq  $11,$0,endloop  ## start of loop check if y is 0, if yes jump to endloop
        divu $11,$12         ## divide y by 2 to see if odd or even
        mfhi $13             ## move remainder into register
        beq  $13,$0,evennum  ## if remainder is 0 then y is even jump to evennum
        sll  $0,$0,0
oddnum:
        addu $16,$16,$11     ## if remainder is odd add y to oddaccum
        j    counter         ## jump to counter
        sll  $0,$0,0
evennum:
        addu $15,$15,$11     ## if remainder is even add y to evenaccum
counter:
        subu $11,$11,$14     ## subtract 1 from y
        j    startloop       ## jump to start of loop
        sll  $0,$0,0
endloop:    
        sw   $15,4($10)      ## store evenaccum into evensum
        sw   $16,8($10)      ## store oddaccum into oddsum
        sll  $0,$0,0
        


## END OF FILE