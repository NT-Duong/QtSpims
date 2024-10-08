## pread.asm -- prompt for and read an integer
##
## Programmer: Ben Duong
##
## on entry:
## $ra -- return address
##
## on exit:
## $v0 -- the integer

    .globl pread
    .text

pread:
        la $a0,prompt   ## print string
        li $v0,4        ## service 4
        syscall
		
        li $v0,5        ## read int into $v0
        syscall         ## service 5
        jr $ra          ## return
        nop             ## branch delay slot

    .data

prompt:
    .asciiz "Enter an integer: "