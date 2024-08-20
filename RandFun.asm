## CS 254 Program 7
##
## randi+1 = (randi * a + b) % 100
##
## Enter seed and how many random ints are desired.
##
## Programmer: Ben Duong
## Date: 4/3/2022
## Register used:
## $s0 = Seed
## $s1 = Number of random integer desired
## $s2 = 21
## $s3 = 53
## $s4 = 100
## $t0 = counter
## $t1 = accumulator

.data

seed:      .asciiz "Initial value: "
intnum:    .asciiz "Enter how many: "
pagebreak: .asciiz "\n"
done:      .asciiz "Done\n"

.text
.globl main

main: 
start:      
            ## show seed message
            li $v0, 4             ## print seed text
            la $a0, seed          ## load address of seed
            syscall
            
            ## get seed user input
            li $v0, 5             ## read user input as int
            syscall

            ## store result
            move $s0, $v0         ## move value to stored address
            
            ## show intnum message
            li $v0, 4             ## print intnum message
            la $a0, intnum        ## load address of intnum
            syscall
            
            ## get intnum user input
            li $v0, 5             ## read user input as int
            syscall
            
            ## store results
            move $s1, $v0         ## move value to stored address
            
            ## store other int numbers
            ori $s2, $0, 21       ## load 21 to address
            ori $s3, $0, 53       ## load 53 to address
            ori $s4, $0, 100      ## load 100 to address
            ori $t0, $0, 0        ## set counter to 0
			
            ## random number loop
			
startloop:  beq $t0, $s1, endloop ## check if counter matches intnum if yes jump to endloop
            ori $t1, $0, 0        ## set accumulator to 0
            addu $t1, $t0, $s0    ## add counter and seed to accumulator
            mult $t1, $s2         ## multiply accumulator by 21
            mflo $t1              ## move result to register
            addu $t1, $t1, $s3    ## add 53 to accumulator
            div $t1, $s4          ## divide accumulator by 100
            mfhi $a0              ## move result to $a0 register

            li $v0, 1             ## print results         
            syscall

            li $v0, 4             ## print pagebreak
            la $a0, pagebreak     ## load pagebreak address
            syscall

            addiu $t0, 1          ## increment counter by 1
            j startloop           ## jumpt to start of loop
            nop

endloop:    li $v0, 4             ## print done message
            la $a0, done          ## load address of done message
            syscall

## END OF FILE