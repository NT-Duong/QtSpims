## CS 254 Program 5
##
## Compute (8x2-3x+12) / (3x2+2x-16)
## Rewrite ((8*x)-3)*x+12 / ((3*x)+2)*x-16
##
## Programmer: Ben Duong
## Date: 3/13/2022
## Register used:
## $11 = x
## $12 = accumulator1
## $13 = 14
## $14 = accumulator2
## $15 = 3
## $16 = 12
## $17 = quotient
## $18 = remainder
## $19 = 1

.data

x: .word 2
error: .word 0
ratio: .word 0
remain: .word 0

.text
.globl main

main: 
       lui    $10,0x1000   ## initiate program at 0x1000
       lw     $11,0($10)   ## load word x into a register
       ori    $12,$0,3     ## load 3 into a accumulator1
       mult   $11,$12	   ## muliply x and accumulator1
	   mflo   $12          ## move result into accumulator1
	   addiu  $12,$12,2    ## add 2 to accumulator1
	   mult   $11,$12      ## muliply x and accumulator1
	   mflo   $12          ## move result into accumulator1
	   ori    $13,$0,16    ## load 14 into a register
	   subu   $12,$12,$13  ## subtract accumulator1 by $14
	   beq    $12,$0,err   ## check if 0 go to err if true
       j      cont         ## jump to cont
	   ori    $19,$0,1     ## load 1 into register
	   
err:   sw     $19,4($10)   ## store 1 into error
       sll    $0,$0,0
	   sll    $0,$0,0
	   j      end          ## jump to end
	   
cont:  sw     $0,4($10)    ## store 0 into error
       ori    $14,$0,8     ## store 8 into accumulator2
       mult   $14,$11      ## muliply x by 8
	   mflo   $14          ## move result into accumulator2
	   ori    $15,$0,3     ## load 3 into register
	   subu   $14,$14,$15  ## subtract accumulator2 by 3
	   mult   $14,$11      ## mutliply accumulator2 by x
	   mflo   $14          ## move result into accumulator2
	   addiu  $14,$14,12   ## add 12 to accumulator2
                           
						   ## division starts
						   
	   divu   $14,$12      ## divide accumulator2 by accumulator1
	   mflo   $17          ## move quotient into register
	   mfhi   $18          ## move remainder into register
	   sw     $17,8($10)   ## store quotient into ratio word
	   sll    $0,$0,0
	   sw     $18,12($10)  ## store remainder into remain word
	   sll    $0,$0,0
       
end:   sll    $0,$0,0      ## common end point

## END OF FILE