	
    .text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x6, 0x80000000	# x6 = 0x80000000
	srli x5, x6, 3		# x5 = x6 >> 3

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
