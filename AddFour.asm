## CS 254 Program 1 Spring 2022
##
## Compute a + b + c + d
##
## Programmer: Ben Duong
## Date: 2/13/2022

.text
.globl main

main: 
ori  $8,$0,2      ## put integer 2 at Register 8
ori  $9,$0,4      ## put integer 4 at Register 9
ori  $11,$0,5     ## put integer 5 at Register 11
ori  $12,$0,8     ## put integer 8 at Register 12
addu $13,$8,$9    ## add register 8 and 9, put at register 13
addu $14,$13,$11  ## add register 13 and 11, put at register 14
addu $10,$14,$12  ## add register 14 and 12, put final answer at register 10. final value should be 25(decimal) or 13(hex)
