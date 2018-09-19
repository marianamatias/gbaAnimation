	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"HW01.c"
	.text
	.align	2
	.global	waitForVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	waitForVBlank, %function
waitForVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L8
	ldr	r3, [r3]
.L2:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L2
.L3:
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L3
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	waitForVBlank, .-waitForVBlank
	.align	2
	.global	setPixel
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3, #4]
	lsl	r1, r1, #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LANCHOR0
	.size	setPixel, .-setPixel
	.align	2
	.global	drawRectangle
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRectangle, %function
drawRectangle:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	cmp	r3, #0
	ldrh	ip, [sp, #12]
	ble	.L13
	mov	r4, #0
	ldr	lr, .L21
	rsb	r0, r0, r0, lsl #4
	ldr	lr, [lr, #4]
	add	r0, r1, r0, lsl #4
	add	lr, lr, r0, lsl #1
	lsl	r5, r2, #1
.L15:
	cmp	r2, #0
	movgt	r1, lr
	addgt	r0, lr, r5
	ble	.L18
.L16:
	strh	ip, [r1], #2	@ movhi
	cmp	r1, r0
	bne	.L16
.L18:
	add	r4, r4, #1
	cmp	r3, r4
	add	lr, lr, #480
	bne	.L15
.L13:
	pop	{r4, r5, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	.LANCHOR0
	.size	drawRectangle, .-drawRectangle
	.align	2
	.global	drawBorder
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBorder, %function
drawBorder:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mvn	lr, #32768
	ldr	r3, .L41
	ldr	ip, [r3, #4]
	add	r2, ip, #25856
	add	r3, ip, #26112
	add	r1, r2, #200
	add	r0, r3, #118
.L24:
	strh	lr, [r1, #2]!	@ movhi
	cmp	r0, r1
	bne	.L24
	mvn	lr, #32768
	add	r1, ip, #26368
	add	r0, ip, #26624
	add	r1, r1, #168
	add	r0, r0, #86
.L25:
	strh	lr, [r1, #2]!	@ movhi
	cmp	r0, r1
	bne	.L25
	mvn	r0, #32768
	add	r1, ip, #48384
	add	r2, r2, #202
	add	lr, r1, #234
.L26:
	strh	r0, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	add	r2, r2, #480
	cmp	lr, r2
	bne	.L26
	mvn	lr, #32768
	add	r0, ip, #48128
	add	r2, r0, #8
	add	r0, r0, #182
.L27:
	strh	lr, [r2, #2]!	@ movhi
	cmp	r0, r2
	bne	.L27
	mvn	r0, #32768
	add	lr, ip, #48640
	add	r2, r1, #232
	add	r1, lr, #150
.L28:
	strh	r0, [r2, #2]!	@ movhi
	cmp	r1, r2
	bne	.L28
	mvn	r2, #32768
	add	r3, r3, #116
	add	r1, lr, #148
.L29:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r3, r3, #480
	cmp	r3, r1
	bne	.L29
	mvn	r1, #32768
	add	r0, ip, #32768
	add	ip, ip, #40448
	add	r0, r0, #178
	add	ip, ip, #178
.L30:
	mov	r3, r0
	add	r2, r0, #12
.L31:
	strh	r1, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L31
	add	r0, r0, #480
	cmp	ip, r0
	bne	.L30
	ldr	lr, [sp], #4
	bx	lr
.L42:
	.align	2
.L41:
	.word	.LANCHOR0
	.size	drawBorder, .-drawBorder
	.align	2
	.global	drain1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drain1, %function
drain1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #150
	mov	r7, #14208
	mov	r4, #0
	ldr	r8, .L63
	ldr	ip, [r8, #4]
	ldr	r9, .L63+4
	add	lr, ip, #28928
	add	r0, ip, #45568
	ldr	r5, .L63+8
	add	lr, lr, #20
	add	r0, r0, #180
.L54:
	mov	r1, lr
.L44:
	mov	r3, r1
	add	r2, r1, r6
.L45:
	strh	r5, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L45
	add	r1, r1, #480
	cmp	r1, r0
	bne	.L44
	add	ip, ip, #32768
	add	ip, ip, #20
.L46:
	mov	r3, lr
	add	r2, lr, r6
.L47:
	strh	r7, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L47
	add	lr, lr, #480
	cmp	ip, lr
	bne	.L46
	ldr	r0, [r8, #8]
	mov	lr, pc
	bx	r9
	ldr	r3, [r8]
.L49:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L49
.L50:
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L50
	ldr	ip, [r8, #4]
	add	lr, ip, #28928
	add	lr, lr, #20
	mov	r1, lr
	add	r0, ip, #45568
	add	r0, r0, #180
.L51:
	mov	r3, r1
	add	r2, r1, #150
.L52:
	strh	r4, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L52
	add	r1, r1, #480
	cmp	r0, r1
	bne	.L51
	sub	r6, r6, #2
	cmp	r6, #74
	bne	.L54
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	.LANCHOR0
	.word	delay
	.word	12064
	.size	drain1, .-drain1
	.align	2
	.global	drain2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drain2, %function
drain2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #74
	mov	r4, #0
	ldr	r8, .L85
	ldr	ip, [r8, #4]
	ldr	r9, .L85+4
	add	lr, ip, #28928
	add	r0, ip, #45568
	ldr	r5, .L85+8
	ldr	r7, .L85+12
	add	lr, lr, #20
	add	r0, r0, #180
.L76:
	mov	r1, lr
.L66:
	mov	r3, r1
	add	r2, r1, r6
.L67:
	strh	r5, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L67
	add	r1, r1, #480
	cmp	r1, r0
	bne	.L66
	add	ip, ip, #32768
	add	ip, ip, #20
.L68:
	mov	r3, lr
	add	r2, lr, r6
.L69:
	strh	r7, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L69
	add	lr, lr, #480
	cmp	ip, lr
	bne	.L68
	ldr	r0, [r8, #8]
	mov	lr, pc
	bx	r9
	ldr	r3, [r8]
.L71:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L71
.L72:
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L72
	ldr	ip, [r8, #4]
	add	lr, ip, #28928
	add	lr, lr, #20
	mov	r1, lr
	add	r0, ip, #45568
	add	r0, r0, #180
.L73:
	mov	r3, r1
	add	r2, r1, #150
.L74:
	strh	r4, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L74
	add	r1, r1, #480
	cmp	r0, r1
	bne	.L73
	sub	r6, r6, #2
	cmp	r6, #38
	bne	.L76
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	.LANCHOR0
	.word	delay
	.word	671
	.word	4927
	.size	drain2, .-drain2
	.align	2
	.global	drain3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drain3, %function
drain3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #38
	mov	r5, #29
	mov	r4, #0
	ldr	r8, .L109
	ldr	ip, [r8, #4]
	ldr	r9, .L109+4
	add	lr, ip, #28928
	add	r0, ip, #45568
	ldr	r7, .L109+8
	add	lr, lr, #20
	add	r0, r0, #180
.L98:
	mov	r1, lr
.L88:
	mov	r3, r1
	add	r2, r1, r6
.L89:
	strh	r5, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L89
	add	r1, r1, #480
	cmp	r1, r0
	bne	.L88
	add	ip, ip, #32768
	add	ip, ip, #20
.L90:
	mov	r3, lr
	add	r2, lr, r6
.L91:
	strh	r7, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L91
	add	lr, lr, #480
	cmp	lr, ip
	bne	.L90
	ldr	r0, [r8, #8]
	mov	lr, pc
	bx	r9
	ldr	r3, [r8]
.L93:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L93
.L94:
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L94
	ldr	ip, [r8, #4]
	add	fp, ip, #28928
	add	lr, fp, #20
	mov	r1, lr
	add	r10, ip, #45568
	add	r0, r10, #180
.L95:
	mov	r3, r1
	add	r2, r1, #150
.L96:
	strh	r4, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L96
	add	r1, r1, #480
	cmp	r1, r0
	bne	.L95
	sub	r6, r6, #2
	cmp	r6, #2
	bne	.L98
	mov	r2, #29
	add	r3, fp, #22
	add	r10, r10, #182
.L99:
	strh	r2, [r3]	@ movhi
	add	r3, r3, #480
	cmp	r3, r10
	bne	.L99
	ldr	r3, .L109+8
	add	ip, ip, #28672
	add	r2, ip, #276
	strh	r3, [r2, #2]	@ movhi
	add	r0, ip, #756
	add	r1, ip, #1232
	add	r2, ip, #1712
	strh	r3, [r0, #2]	@ movhi
	strh	r3, [r1, #6]	@ movhi
	add	r0, ip, #2192
	strh	r3, [r2, #6]	@ movhi
	add	r1, ip, #2672
	add	r2, ip, #3152
	add	ip, ip, #3632
	strh	r3, [r0, #6]	@ movhi
	strh	r3, [r1, #6]	@ movhi
	mov	r0, #150
	strh	r3, [r2, #6]	@ movhi
	strh	r3, [ip, #6]	@ movhi
	mov	lr, pc
	bx	r9
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L110:
	.align	2
.L109:
	.word	.LANCHOR0
	.word	delay
	.word	10589
	.size	drain3, .-drain3
	.align	2
	.global	charge1
	.syntax unified
	.arm
	.fpu softvfp
	.type	charge1, %function
charge1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #2
	mov	r5, #29
	mov	r4, #0
	ldr	r8, .L131
	ldr	ip, [r8, #4]
	ldr	r9, .L131+4
	add	lr, ip, #28928
	add	r0, ip, #45568
	ldr	r7, .L131+8
	add	lr, lr, #20
	add	r0, r0, #180
.L112:
	mov	r1, lr
.L114:
	mov	r3, r1
	add	r2, r1, r6
.L113:
	strh	r5, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L113
	add	r1, r1, #480
	cmp	r1, r0
	bne	.L114
	add	ip, ip, #32768
	add	ip, ip, #20
.L115:
	mov	r3, lr
	add	r2, lr, r6
.L116:
	strh	r7, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L116
	add	lr, lr, #480
	cmp	ip, lr
	bne	.L115
	ldr	r0, [r8, #8]
	mov	lr, pc
	bx	r9
	ldr	r3, [r8]
.L118:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L118
.L119:
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L119
	ldr	ip, [r8, #4]
	add	lr, ip, #28928
	add	lr, lr, #20
	mov	r1, lr
	add	r0, ip, #45568
	add	r0, r0, #180
.L120:
	mov	r3, r1
	add	r2, r1, #150
.L121:
	strh	r4, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L121
	add	r1, r1, #480
	cmp	r0, r1
	bne	.L120
	add	r6, r6, #2
	cmp	r6, #36
	bne	.L112
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	.LANCHOR0
	.word	delay
	.word	10589
	.size	charge1, .-charge1
	.align	2
	.global	charge2
	.syntax unified
	.arm
	.fpu softvfp
	.type	charge2, %function
charge2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, #0
	mov	r4, r7
	ldr	r8, .L153
	ldr	ip, [r8, #4]
	ldr	r9, .L153+4
	add	lr, ip, #28928
	add	r0, ip, #45568
	ldr	r5, .L153+8
	ldr	r6, .L153+12
	add	lr, lr, #20
	add	r0, r0, #180
.L144:
	mov	r1, lr
	add	r10, r7, #40
.L134:
	mov	r3, r1
	add	r2, r1, r10
.L135:
	strh	r5, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L135
	add	r1, r1, #480
	cmp	r1, r0
	bne	.L134
	add	ip, ip, #32768
	add	ip, ip, #20
.L136:
	mov	r3, lr
	add	r2, lr, r10
.L137:
	strh	r6, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L137
	add	lr, lr, #480
	cmp	ip, lr
	bne	.L136
	ldr	r0, [r8, #8]
	mov	lr, pc
	bx	r9
	ldr	r3, [r8]
.L139:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L139
.L140:
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L140
	ldr	ip, [r8, #4]
	add	lr, ip, #28928
	add	lr, lr, #20
	mov	r1, lr
	add	r0, ip, #45568
	add	r0, r0, #180
.L141:
	mov	r3, r1
	add	r2, r1, #150
.L142:
	strh	r4, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L142
	add	r1, r1, #480
	cmp	r0, r1
	bne	.L141
	add	r7, r7, #2
	cmp	r7, #36
	bne	.L144
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L154:
	.align	2
.L153:
	.word	.LANCHOR0
	.word	delay
	.word	671
	.word	4927
	.size	charge2, .-charge2
	.align	2
	.global	charge3
	.syntax unified
	.arm
	.fpu softvfp
	.type	charge3, %function
charge3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, #0
	mov	r6, #14208
	mov	r4, r7
	ldr	r9, .L183
	ldr	r0, [r9, #4]
	ldr	r8, .L183+4
	add	lr, r0, #28928
	add	ip, r0, #45568
	ldr	r5, .L183+8
	add	lr, lr, #20
	add	ip, ip, #180
.L166:
	mov	r1, lr
	add	r10, r7, #76
.L156:
	mov	r3, r1
	add	r2, r1, r10
.L157:
	strh	r5, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L157
	add	r1, r1, #480
	cmp	r1, ip
	bne	.L156
	add	r0, r0, #32768
	add	r0, r0, #20
.L158:
	mov	r3, lr
	add	r2, lr, r10
.L159:
	strh	r6, [r3, #2]!	@ movhi
	cmp	r2, r3
	bne	.L159
	add	lr, lr, #480
	cmp	r0, lr
	bne	.L158
	ldr	r0, [r9, #8]
	mov	lr, pc
	bx	r8
	ldr	r3, [r9]
.L161:
	ldrh	r2, [r3]
	cmp	r2, #159
	bhi	.L161
.L162:
	ldrh	r2, [r3]
	cmp	r2, #159
	bls	.L162
	ldr	r0, [r9, #4]
	add	lr, r0, #28928
	add	lr, lr, #20
	mov	r10, lr
	mov	r1, lr
	add	ip, r0, #45568
	add	ip, ip, #180
.L163:
	mov	r3, r1
	add	r2, r1, #150
.L164:
	strh	r4, [r3, #2]!	@ movhi
	cmp	r3, r2
	bne	.L164
	add	r1, r1, #480
	cmp	ip, r1
	bne	.L163
	add	r7, r7, #2
	cmp	r7, #76
	bne	.L166
	ldr	r2, .L183+8
.L167:
	mov	r3, lr
	add	ip, lr, #150
.L168:
	strh	r2, [r3, #2]!	@ movhi
	cmp	ip, r3
	bne	.L168
	add	lr, lr, #480
	cmp	lr, r1
	bne	.L167
	mov	r2, #14208
	add	r0, r0, #32768
	add	r0, r0, #20
.L169:
	mov	r3, r10
	add	r1, r10, #150
.L170:
	strh	r2, [r3, #2]!	@ movhi
	cmp	r1, r3
	bne	.L170
	add	r10, r10, #480
	cmp	r0, r10
	bne	.L169
	mov	r0, #150
	mov	lr, pc
	bx	r8
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L184:
	.align	2
.L183:
	.word	.LANCHOR0
	.word	delay
	.word	12064
	.size	charge3, .-charge3
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L188
	push	{r7, lr}
	ldr	r3, .L188+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r9, .L188+8
	ldr	r8, .L188+12
	ldr	r7, .L188+16
	ldr	r6, .L188+20
	ldr	r5, .L188+24
	ldr	r4, .L188+28
.L186:
	mov	lr, pc
	bx	r9
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r4
	b	.L186
.L189:
	.align	2
.L188:
	.word	1027
	.word	drawBorder
	.word	drain1
	.word	drain2
	.word	drain3
	.word	charge1
	.word	charge2
	.word	charge3
	.size	main, .-main
	.global	scanlineCounter
	.global	chargespeed
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	scanlineCounter, %object
	.size	scanlineCounter, 4
scanlineCounter:
	.word	67108870
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	chargespeed, %object
	.size	chargespeed, 4
chargespeed:
	.word	20
	.ident	"GCC: (devkitARM release 47) 7.1.0"
