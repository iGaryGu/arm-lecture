	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
		mov r2 ,locked
.L1:
		ldrex r1 ,[r0]
		cmp r1 ,unlocked
		strexeq r3 ,r2 ,[r0]
		cmpeq  r3 ,#0
		bne .L1
        @ END CODE INSERT
	bx lr

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
	@ INSERT CODE BELOW
		mov r1 ,unlocked
        str r1 ,[r0]
        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end
