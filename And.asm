## CS 254 Program 1 Spring 2022
##
## Compute a + b + c + d
##
## Programmer:
## Date: 2/13/2022
## Register used:
## $7 = x
## $8 = temp register
## $10 = result
## sll multiplication(# shifted=# multiply by): 1=2, 2=4, 3=8, 4=16, 5=32

.text
.globl main

main: 
ori $7,$0,32
addi $7,48

## END OF FILE