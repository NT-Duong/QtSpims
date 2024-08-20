## CS 254 Program 3
##
## Compute 5x^4 - 2x^3 + 12x^2 - 3x + 10 using Horner's Method
##
## Programmer: Ben Duong
## Date: 2/27/2022
## Register used:
## $16 = x
## $17 = 2
## $18 = 12
## $19 = 3
## $20 = 10
## $23 = accumulator(starts at 5)

.text
.globl main

main: 
addiu $16,$0,-4         ## put integer x at register 16
ori   $17,$0,2          ## put 2 into register 17
ori   $18,$0,12         ## put 12 into register 18
ori   $19,$0,3          ## put 3 into register 19
ori   $20,$0,10         ## put 10 into register 20
ori   $23,$0,5          ## put 5 into accumulator
mult  $23,$16           ## multiply accumulator by x
mflo  $23               ## put result back into accumulator
subu  $23,$23,$17       ## subtract accumulator by 2 and put back into accumulator
mult  $23,$16           ## multiply accumulator by x
mflo  $23               ## put result back into accumulator
addu  $23,$23,$18       ## add 12 to accumulator and put back into accumulator
mult  $23,$16           ## multiply accumulator by x
mflo  $23               ## put result back into accumulator
subu  $23,$23,$19       ## subtract 3 from accumulator and put back into accumulator
mult  $23,$16           ## multiply accumulator by x
mflo  $23               ## put result back into accumulator
addu  $23,$23,$20       ## add 10 into accumulator for final result

## END OF FILE