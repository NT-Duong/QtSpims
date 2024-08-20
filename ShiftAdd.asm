## CS 254 Program 1 Spring 2022
##
## Compute a + b + c + d
##
## Programmer: Ben Duong
## Date: 2/13/2022
## Register used:
## $7 = x
## $8 = temp register
## $10 = result
## sll multiplication(# shifted=# multiply by): 1=2, 2=4, 3=8, 4=16, 5=32

.text
.globl main

main: 
ori   $7,$0,10         ## put integer x at Register 7
sll   $8,$7,1          ## shift left logical register 7 by 1 and put into register 8
addu  $10,$7,$8        ## add register 7 and 8 and put into register 10
sll   $8,$7,2          ## shift left logical register 7 by 2 and put into register 8
addu  $10,$10,$8       ## add register 10 and 8 together and put back into register 10
sll   $8,$7,4          ## shift left logical register 7 by 4 and put into register 8
addu  $10,$10,$8       ## add register 10 and 8 together to get final number at register 10

## END OF FILE