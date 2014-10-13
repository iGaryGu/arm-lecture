	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func
	
	.global fib
	.type fib ,function

@non - recursive

fib:
	@r0 = x (input)
	push {r4 ,r5 ,r6 ,r7,lr}
	
	@r7 = previous
	mov r7 ,#0
	add r7 , r7 ,#4294967295

	@r4 = result
	mov r4 ,#1

	@r5 = itr index
	mov r5 ,#0

	@r6 = sum
	mov r6 ,#0
	
itr:
	cmp r5 ,r0
	itt gt
	movgt r0 ,r4
	popgt {r4, r5, r6, r7, pc}
	add r6 ,r4 ,r7
	mov r7 ,r4
	mov r4 ,r6
	@ index ++
	add r5 ,r5 ,#1
	b itr

	.size fib, .-fib
	.end

