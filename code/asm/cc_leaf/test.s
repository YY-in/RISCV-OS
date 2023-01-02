# Calling Convention
# Demo to create a leaf routine
#
# void _start()
# {
#     // calling leaf routine
#     square(3);
# }
#
# int square(int num)
# {
#     return num * num;
# }

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	la sp, stack_end	# prepare stack for calling functions

	li a0, 3            # a0 use for convert a argument
	call square         # call a function,and save the next instruction to the x1 

	# the time return here, a0 should stores the result
stop:
	j stop			# Infinite loop to stop execution

# int square(int num)
square:
	# prologue
	addi sp, sp, -8 # sp means stack point,when we sp = sp - 8,means we allocate a stack in the memory 
    sw s0, 0(sp)    # save the register(s0) to the memory(sp),memory address is IMM + RS2 : 0+s0
	sw s1, 4(sp)    # save s1 

	# `mul a0, a0, a0` should be fine,
	# programing as below just to demo we can contine use the stack
	mv s0, a0       # a0 saved the argument,make s0 = a0
	mul s1, s0, s0  # s1 = s0 * s0
	mv a0, s1       # as the appoint,we use a0 to convert the argument,so a0 = s1
	
    # epilogue
	lw s0, 0(sp)    # register load value from the memory
	lw s1, 4(sp)
	addi sp, sp, 8  # restore the stack frame sp = sp + 8

	ret # read the x1,and jump to the address that x1 saved

	# add nop here just for demo in gdb
    nop:

	# allocate stack space
stack_start:
	.rept 12
	.word 0
	.endr
stack_end:

	.end			# End of file

