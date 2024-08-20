## CS 254 Program 3
##
## Compute (13x - 4xy + 18)/7
## Rewrite ((-4y+13)x+18)/7
##
## Programmer: Ben Duong
## Date: 3/7/2022
## Register used:
## $11 = x
## $12 = -4
## $13 = y
## $14 = 7
## $15 = accumulator
## $16 = answer
## $17 = remainder

.data

x: .word -5
y: .word 7
answer: .word 0
remainder: .word 0

.text
.globl main

main: 
lui    $10,0x1000  ## initiate program at 0x1000
lw     $11,0($10)  ## load word x into a register
addiu  $12,$0,-4   ## load -4 into a register
lw     $13,4($10)  ## load word y into a register
ori    $14,$0,7    ## load 7 into a register
multu  $12,$13     ## mutliply -4 and y
mflo   $15         ## put result into accumulator
addiu  $15,$15,13  ## add 13 to accumulator
multu  $15,$11     ## mutliply result by x
mflo   $15         ## put result into accumulator
addiu  $15,$15,18  ## add 18 to accumulator
divu   $15,$14     ## div result by 7
mflo   $16         ## store answer at register 
mfhi   $17         ## store remainder at register
sw     $16,8($10)  ## store into word answer
sw     $17,12($10) ## store into word remainder

## END OF FILE