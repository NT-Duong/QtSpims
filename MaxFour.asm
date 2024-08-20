## CS 254 Program 11
##
## Find the largest of four integers.
##
## Programmer: Ben Duong
##
## Register Used Table:
## $s0 = integer 1
## $s1 = integer 2
## $s2 = integer 3
## $s3 = integer 4
## $s4 = maxint

.data

largest:   .asciiz "The largest integer is: "
pagebreak: .asciiz "\n"

.text
.globl main

main: 
            jal pread            ## load pread subroutine
            move $s0, $v0        ## move to integer 1

            jal pread            ## load pread subroutine
            move $s1, $v0        ## move to integer 2

            jal pread            ## load pread subroutine
            move $s2, $v0        ## move to integer 3

            jal pread            ## load pread subroutine
            move $s3, $v0        ## move to integer 4

            move $s4, $s0        ## set max integer to 1st number

greater1:   blt $s0,$s1, max1    ## check if int 1 is less then int 2 branch to max1 if yes
            j greater2           ## jump to greater2

max1:       move $s4, $s1        ## copy int 2 into maxint

greater2:   blt $s4, $s2, max2   ## check if max is less then int 3 branch to max2 if yes
            j greater3           ## jump to greater3

max2:       move $s4, $s2        ## copy int 3 into maxint

greater3:   blt $s4, $s3, max3   ## check if max is less then int 4 branch to max3 if yes
            j end                ## jump to end

max3:       move $s4, $s3        ## copy int 4 into maxint

end:        li $v0, 4            ## print largest text
            la $a0, largest      ## load address of largest
            syscall              ## call system
            
            move $a0, $s4        ## move maxint into argument register
            li $v0, 1            ## print integer
            syscall              ## call system

            li $v0, 4            ## print pagebreak
            la $a0, pagebreak    ## load address of pagebreak
            syscall              ## call system
            
            li $v0,10            ## exit program
            syscall              ## call system


## END OF FILE