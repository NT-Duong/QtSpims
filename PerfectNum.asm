## CS 254 Program 8
##
## Programmer: Ben Duong
##
## N/2 = if N is even continue check elseif odd exit.
## check if sum of divisor is same as N
##
## Determine if user-entered number is a perfect number.
##
## Programmer: Nhat Trung Duong
## Date: 4/17/2022
## Register used:
## $s0 = Number to Check
## $s1 = Max Divider
## $s2 = 2
## $t0 = counter
## $t1 = accumulator
## $t2 = divider
## $t3 = remainder

.data

checknum:   .asciiz "Enter number: "
notperfect: .asciiz " is not perfect"
numperfect: .asciiz " is perfect!"
pagebreak:  .asciiz "\n"
done:       .asciiz "Done\n"

.text
.globl main

main: 
start:      
             ## show checknum message
             li $v0, 4             ## print checknum text
             la $a0, checknum      ## load address of checknum
             syscall               ## call system
            
             ## get number user input
             li $v0, 5             ## read user input as int
             syscall               ## call system

             ## store result
             move $s0, $v0         ## move value to stored address
            
             ## store other int numbers
             ori $s2, $0, 2        ## load 2 to address
             ori $t0, $0, 1        ## set counter to 1
             ori $t1, $0, 0        ## set accumulator to 0
             div $s0, $s2          ## divide number by 2
             mfhi $t3              ## move remainder to register
             mflo $s1              ## move max divider to register
             bne $t3,$0,noperfect  ## check if remainder is not equal to 0

             ## start of loop
startloop:   bgt $t0, $s1, endloop ## check if counter is greater than max divider if yes jump to endloop
             div $s0, $t0          ## divide number by counter
             mfhi $t3              ## move remainder to register
             mflo $t2              ## move divider to register
             beqz $t3, addsum      ## check if divider is 0, branch to addsum if it is

             ## remainder not equal 0 branch
             j addcounter          ## if not 0 jump to addcounter

             ## remainder equal 0 branch
addsum:      addu $t1, $t1, $t0    ## if remainder is 0 add counter to accumulator

             ## increment counter
addcounter:  addiu $t0, $t0, 1     ## add 1 to counter
             j startloop           ## jump to startloop

             ## end loop and check if perfect number
endloop:     beq $t1, $s0, isperfect
             j noperfect

             ## number is not perfect
noperfect:   move $a0, $s0         ## move number to check to $a0
             li $v0, 1             ## print int
             syscall               ## call system

             li $v0, 4             ## print notperfect message
             la $a0, notperfect    ## load address of notperfect message
             syscall               ## call system

             li $v0, 4             ## print pragebreak
             la $a0, pagebreak     ## load address of pagebreak
             syscall               ## call system
             j end

             ## number is perfect
isperfect:   move $a0, $s0         ## move number to check to $a0
             li $v0, 1             ## print int
             syscall               ## call system

             li $v0, 4             ## print isperfect message
             la $a0, numperfect    ## load address of isperfect
             syscall               ## call system

             li $v0, 4             ## print pragebreak
             la $a0, pagebreak     ## load address of pagebreak
             syscall               ## call system
             j end                 ## jump to end

end:         ## end program
             li $v0, 10            ## end program
             syscall               ## call system

## END OF FILE