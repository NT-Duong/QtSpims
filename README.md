# QtSpims
Projects using QtSpims

These functions were made for Central Connecticut Computer Architecture class and consists of various functions with comments on what each line does when running it in QtSpim. These functions manipulate and alter values using in memory.

For examples:
Function Code: AddFour.asm
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

QtSpim Initial Registry:
R0  [r0] = 0
R1  [at] = 0
R2  [v0] = 0
R3  [v1] = 0
R4  [a0] = 2
R5  [a1] = 2147481220
R6  [a2] = 2147481232
R7  [a3] = 0
R8  [t0] = 0
R9  [t1] = 0
R10 [t2] = 0
R11 [t3] = 0
R12 [t4] = 0
R13 [t5] = 0
R14 [t6] = 0

QtSpims: After Run Registry
R0  [r0] = 0
R1  [at] = 0
R2  [v0] = 8
R3  [v1] = 0
R4  [a0] = 2
R5  [a1] = 2147481220
R6  [a2] = 2147481232
R7  [a3] = 0
R8  [t0] = 2
R9  [t1] = 4
R10 [t2] = 19
R11 [t3] = 5
R12 [t4] = 8
R13 [t5] = 6
R14 [t6] = 11
