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
	push {r3 ,r4 ,r5 ,r6 ,lr}
	
	@r3 = previous
	mov r3 ,#0
	add r3 , r3 ,#4294967295

	@r4 = result
	mov r4 ,#1

	@r5 = itr index
	mov r5 ,#0

	@r6 = sum
	mov r6 ,#0
	
itr:
	cmp r5 ,r0
	bgt finish
	add r6 ,r4 ,r3
	mov r3 ,r4
	mov r4 ,r6
	@ index ++
	add r5 ,r5 ,#1
	b itr
finish:
	mov r0 ,r4
	pop {r3 ,r4 ,r5 ,r6 ,pc}

	.size fib, .-fib
	.end

