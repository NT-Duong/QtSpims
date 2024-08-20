## CS 254 Program 10
##
## sin(x) = x - x3/3! + x5/5! - x7/7! + x9/9!
##
## term: x^n/n
##
## Floating Point Sin up to 11 terms
##
## Programmer: Ben Duong
## Date: 4/30/2022
## Register used:
## $f0 = x
## $f1 = sum
## $f2 = n
## $f3 = accum
## $f4 = 1.0
## $f5 = math
## $f6 = previousterm
## $f7 = 21.0
## $f8 = 2.0

.data

x:   .asciiz "Enter x: "
sin: .asciiz "Sin(x): "
pagebreak: .asciiz "\n"

.text
.globl main

main: 
start:      li $v0, 4            ## print x prompt
            la $a0, x            ## load address of x
            syscall              ## call system

            li $v0, 6            ## read float input
            syscall
            
            mov.s $f1, $f0       ## move x to sum
            mov.s $f6, $f0       ## move x to previousterm
            li.s $f2, 3.0        ## load 3.0 into n
            li.s $f3, 0.0        ## set accum to 0
            li.s $f4, 1.0        ## load 1.0 into register
            li.s $f5, 0.0        ## set n to 0
			li.s $f7, 21.0       ## load 21.0 into register
			li.s $f8, 2.0        ## load 2.0 into register

termloop:   c.eq.s $f2, $f7      ## check if count equals 21.0
			bc1t end
            jal powermath
            j termloop

end:        li $v0, 4            ## print sin text
            la $a0, sin          ## load address of sin
            syscall              ## call system
            
            mov.s $f12, $f1      ## move sum into argument register
            li $v0, 2            ## print float
            syscall              ## call system

            li $v0, 4            ## print pagebreak
            la $a0, pagebreak    ## load address of pagebreak
            syscall              ## call system
            
            li $v0,10            ## exit program
            syscall              ## call system

## subbranch ##

powermath:  mul.s $f3, $f0, $f6  ## multiply previousterm to x
            mul.s $f3, $f3, $f0  ## multiply accum by x
			neg.s $f3, $f3       ## turn term into negative
            sub.s $f5, $f2, $f4  ## n - 1
            mul.s $f5, $f2, $f5  ## n multiply by n-1
            div.s $f3, $f3, $f5  ## accum divide by (n(n-1))
			mov.s $f6, $f3       ## copy newterm to previousterm
			add.s $f1, $f1, $f3  ## add accum to sum
            add.s $f2, $f2, $f8  ## increment n by 2.0
            jr $ra               ## jump back to original subbranch

## END OF FILE