## CS 254 Program 9
##
## F = C*9/5+32
##
## Enter Celsius and outputs Fahrenheit
##
## Programmer: Ben Duong
## Date: 4/20/2022
## Register used:
## $f1 = accum
## $f2 = 9.0
## $f3 = 5.0
## $f4 = 32.0

.data

celsius:   .asciiz "Enter Celsius: "
fahrenheight: .asciiz "Fahrenheit: "
pagebreak: .asciiz "\n"

.text
.globl main

main: 
start:      li $v0, 4            ## print celsius prompt
            la $a0, celsius      ## load address of celsius
            syscall              ## call system

            li $v0, 6            ## read float input
            syscall
            
            mov.s $f1, $f0       ## move argument to accum
            
            li.s $f2, 9.0        ## load 9.0 into register
            mul.s $f1, $f1, $f2  ## mutipy accum by 9.0
            li.s $f3, 5.0        ## load 5.0 into register
            div.s $f1, $f1, $f3  ## divide accum by 5.0
            li.s $f4, 32.0       ## load 32.0 into register
            add.s $f1, $f1, $f4  ## add 32.0 to accum
            
            li $v0, 4            ## print fahrenheight text
            la $a0, fahrenheight ## load address of fahrenheight
            syscall              ## call system
            
            mov.s $f12, $f1      ## move accum into argument register
            li $v0, 2            ## print float
            syscall              ## call system
			
            li $v0, 4            ## print pagebreak
            la $a0, pagebreak    ## load address of pagebreak
            syscall              ## call system
            
            li $v0,10            ## exit program
            syscall              ## call system

## END OF FILE