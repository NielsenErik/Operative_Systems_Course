	.file	"main.c"
	.text
	.globl	keypress
	.type	keypress, @function
keypress:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$176, %rsp
	movl	%edi, -164(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-144(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	tcgetattr@PLT
	cmpl	$-1, %eax
	jne	.L2
	movl	$-1, %eax
	jmp	.L8
.L2:
	movq	-144(%rbp), %rax
	movq	-136(%rbp), %rdx
	movq	%rax, -80(%rbp)
	movq	%rdx, -72(%rbp)
	movq	-128(%rbp), %rax
	movq	-120(%rbp), %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movq	-112(%rbp), %rax
	movq	-104(%rbp), %rdx
	movq	%rax, -48(%rbp)
	movq	%rdx, -40(%rbp)
	movq	-96(%rbp), %rax
	movq	%rax, -32(%rbp)
	movl	-88(%rbp), %eax
	movl	%eax, -24(%rbp)
	cmpl	$0, -164(%rbp)
	jne	.L4
	movb	$8, -149(%rbp)
	jmp	.L5
.L4:
	movb	$0, -149(%rbp)
.L5:
	movl	-68(%rbp), %edx
	movzbl	-149(%rbp), %eax
	orl	$2, %eax
	movzbl	%al, %eax
	notl	%eax
	andl	%edx, %eax
	movl	%eax, -68(%rbp)
	movb	$1, -57(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	tcsetattr@PLT
	cmpl	$-1, %eax
	jne	.L6
	movl	$-1, %eax
	jmp	.L8
.L6:
	call	getchar@PLT
	movl	%eax, -148(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdx
	movl	$0, %esi
	movl	$0, %edi
	call	tcsetattr@PLT
	cmpl	$-1, %eax
	jne	.L7
	movl	$-1, %eax
	jmp	.L8
.L7:
	movl	-148(%rbp), %eax
.L8:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	keypress, .-keypress
	.globl	logFile
	.bss
	.align 4
	.type	logFile, @object
	.size	logFile, 4
logFile:
	.zero	4
	.globl	logName
	.align 32
	.type	logName, @object
	.size	logName, 60
logName:
	.zero	60
	.globl	parent
	.align 4
	.type	parent, @object
	.size	parent, 4
parent:
	.zero	4
	.globl	count
	.align 4
	.type	count, @object
	.size	count, 4
count:
	.zero	4
	.globl	countClient
	.align 4
	.type	countClient, @object
	.size	countClient, 4
countClient:
	.zero	4
	.globl	chd
	.align 32
	.type	chd, @object
	.size	chd, 400
chd:
	.zero	400
	.section	.rodata
.LC0:
	.string	"%s\n"
	.text
	.globl	perr
	.type	perr, @function
perr:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	leaq	.LC0(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	perr, .-perr
	.section	.rodata
.LC1:
	.string	"Input error"
.LC2:
	.string	"Wrong mode"
.LC3:
	.string	"Error logFile"
.LC4:
	.string	"LogFile already exists"
.LC5:
	.string	"Error fork"
	.text
	.globl	quit
	.type	quit, @function
quit:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$5, -4(%rbp)
	ja	.L21
	movl	-4(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	leaq	.L14(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltq
	leaq	.L14(%rip), %rdx
	addq	%rdx, %rax
	notrack jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L14:
	.long	.L19-.L14
	.long	.L18-.L14
	.long	.L17-.L14
	.long	.L16-.L14
	.long	.L15-.L14
	.long	.L13-.L14
	.text
.L19:
	movl	$0, %edi
	call	exit@PLT
.L18:
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	perr
	movl	$1, %edi
	call	exit@PLT
.L17:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	perr
	movl	$2, %edi
	call	exit@PLT
.L16:
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	perr
	movl	$3, %edi
	call	exit@PLT
.L15:
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perr
	movl	$4, %edi
	call	exit@PLT
.L13:
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	perr
	movl	$5, %edi
	call	exit@PLT
.L21:
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	quit, .-quit
	.section	.rodata
.LC6:
	.string	"%d\n"
	.text
	.globl	intHandler
	.type	intHandler, @function
intHandler:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	count(%rip), %edx
	leaq	-80(%rbp), %rax
	leaq	.LC6(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	logFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	$0, %edi
	call	exit@PLT
	.cfi_endproc
.LFE9:
	.size	intHandler, .-intHandler
	.globl	forking
	.type	forking, @function
forking:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	call	fork@PLT
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jns	.L25
	movl	$5, %edi
	call	quit
.L25:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	forking, .-forking
	.section	.rodata
.LC7:
	.string	"[server] %d\n"
.LC8:
	.string	"+%d\n"
	.text
	.globl	s1Handler
	.type	s1Handler, @function
s1Handler:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movl	%edi, -116(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movl	$0, %eax
	call	forking
	movl	%eax, -100(%rbp)
	cmpl	$0, -100(%rbp)
	jne	.L28
	movl	count(%rip), %ebx
	call	getpid@PLT
	movslq	%ebx, %rdx
	leaq	0(,%rdx,4), %rcx
	leaq	chd(%rip), %rdx
	movl	%eax, (%rcx,%rdx)
	movl	$1, %esi
	movl	$2, %edi
	call	signal@PLT
.L29:
	jmp	.L29
.L28:
	movl	count(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	leaq	chd(%rip), %rdx
	movl	-100(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movl	count(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	chd(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	count(%rip), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	chd(%rip), %rax
	movl	(%rdx,%rax), %edx
	leaq	-96(%rbp), %rax
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	logFile(%rip), %eax
	leaq	-96(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	count(%rip), %eax
	addl	$1, %eax
	movl	%eax, count(%rip)
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L30
	call	__stack_chk_fail@PLT
.L30:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	s1Handler, .-s1Handler
	.section	.rodata
.LC9:
	.string	"-%d\n"
.LC10:
	.string	"[server] 0"
.LC11:
	.string	"0\n"
	.text
	.globl	s2Handler
	.type	s2Handler, @function
s2Handler:
.LFB12:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	count(%rip), %eax
	testl	%eax, %eax
	jle	.L32
	movl	count(%rip), %eax
	subl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	chd(%rip), %rax
	movl	(%rdx,%rax), %edx
	leaq	-80(%rbp), %rax
	leaq	.LC9(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movl	count(%rip), %eax
	subl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	chd(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	logFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
	movl	count(%rip), %eax
	subl	$1, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	leaq	chd(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	$15, %esi
	movl	%eax, %edi
	call	kill@PLT
	movl	count(%rip), %eax
	subl	$1, %eax
	movl	%eax, count(%rip)
	jmp	.L35
.L32:
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	logFile(%rip), %eax
	movl	$2, %edx
	leaq	.LC11(%rip), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
.L35:
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L34
	call	__stack_chk_fail@PLT
.L34:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	s2Handler, .-s2Handler
	.section	.rodata
.LC12:
	.string	"[server:%d]\n"
	.text
	.globl	serverMode
	.type	serverMode, @function
serverMode:
.LFB13:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %esi
	leaq	logName(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, logFile(%rip)
	movl	logFile(%rip), %eax
	testl	%eax, %eax
	jle	.L37
	movl	$4, %edi
	call	quit
.L37:
	movl	$384, %edx
	movl	$66, %esi
	leaq	logName(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, logFile(%rip)
	movl	logFile(%rip), %eax
	testl	%eax, %eax
	jns	.L38
	movl	$3, %edi
	call	quit
.L38:
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movl	parent(%rip), %eax
	movl	%eax, %esi
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	parent(%rip), %edx
	leaq	-80(%rbp), %rax
	leaq	.LC6(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movl	logFile(%rip), %eax
	leaq	-80(%rbp), %rcx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	write@PLT
.L39:
	jmp	.L39
	.cfi_endproc
.LFE13:
	.size	serverMode, .-serverMode
	.globl	intClient
	.type	intClient, @function
intClient:
.LFB14:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	$0, %edi
	call	quit
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	intClient, .-intClient
	.section	.rodata
.LC13:
	.string	"[client] server:%d\n"
.LC14:
	.string	"No input server\n"
.LC15:
	.string	"[client] %d\n"
	.text
	.globl	clientMode
	.type	clientMode, @function
clientMode:
.LFB15:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
.L45:
	movl	$0, %esi
	leaq	logName(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	open@PLT
	movl	%eax, logFile(%rip)
	movl	logFile(%rip), %eax
	testl	%eax, %eax
	jg	.L58
	jmp	.L45
.L58:
	nop
	movl	$1, %edi
	call	sleep@PLT
	movl	logFile(%rip), %eax
	leaq	-23(%rbp), %rcx
	movl	$15, %edx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	read@PLT
	movl	%eax, -36(%rbp)
	leaq	-23(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -32(%rbp)
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	cmpl	$0, -36(%rbp)
	jle	.L46
	movl	-32(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L54
.L46:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	fwrite@PLT
.L54:
	movl	$0, %edi
	call	keypress
	movb	%al, -41(%rbp)
	cmpb	$43, -41(%rbp)
	jne	.L48
	movl	countClient(%rip), %eax
	cmpl	$10, %eax
	jg	.L48
	movl	-32(%rbp), %eax
	movl	$10, %esi
	movl	%eax, %edi
	call	kill@PLT
	movl	countClient(%rip), %eax
	addl	$1, %eax
	movl	%eax, countClient(%rip)
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movl	countClient(%rip), %eax
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L48:
	cmpb	$45, -41(%rbp)
	jne	.L49
	movl	countClient(%rip), %eax
	testl	%eax, %eax
	jle	.L49
	movl	-32(%rbp), %eax
	movl	$12, %esi
	movl	%eax, %edi
	call	kill@PLT
	movl	countClient(%rip), %eax
	subl	$1, %eax
	movl	%eax, countClient(%rip)
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movl	countClient(%rip), %eax
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L49:
	cmpb	$10, -41(%rbp)
	jne	.L54
	movl	countClient(%rip), %eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, -40(%rbp)
	jmp	.L51
.L52:
	movl	-32(%rbp), %eax
	movl	$12, %esi
	movl	%eax, %edi
	call	kill@PLT
	movl	$1, %edi
	call	sleep@PLT
	movl	countClient(%rip), %eax
	subl	$1, %eax
	movl	%eax, countClient(%rip)
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	movl	countClient(%rip), %eax
	movl	%eax, %esi
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	subl	$1, -40(%rbp)
.L51:
	cmpl	$0, -40(%rbp)
	jg	.L52
	movl	-32(%rbp), %eax
	movl	$2, %esi
	movl	%eax, %edi
	call	kill@PLT
	nop
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L55
	call	__stack_chk_fail@PLT
.L55:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	clientMode, .-clientMode
	.globl	signalHandlerServer
	.type	signalHandlerServer, @function
signalHandlerServer:
.LFB16:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	intHandler(%rip), %rax
	movq	%rax, %rsi
	movl	$2, %edi
	call	signal@PLT
	leaq	s1Handler(%rip), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	signal@PLT
	leaq	s2Handler(%rip), %rax
	movq	%rax, %rsi
	movl	$12, %edi
	call	signal@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	signalHandlerServer, .-signalHandlerServer
	.globl	signalHandlerClient
	.type	signalHandlerClient, @function
signalHandlerClient:
.LFB17:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	intClient(%rip), %rax
	movq	%rax, %rsi
	movl	$2, %edi
	call	signal@PLT
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	signalHandlerClient, .-signalHandlerClient
	.section	.rodata
.LC16:
	.string	"server"
.LC17:
	.string	"client"
	.text
	.globl	main
	.type	main, @function
main:
.LFB18:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	cmpl	$3, -36(%rbp)
	je	.L62
	movl	$1, %edi
	call	quit
.L62:
	movq	-48(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	logName(%rip), %rax
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	stdout(%rip), %rax
	movq	%rax, %rdi
	call	fflush@PLT
	call	getpid@PLT
	movl	%eax, parent(%rip)
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rdx
	leaq	-18(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	-18(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L63
	leaq	-18(%rbp), %rax
	leaq	.LC17(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L64
.L63:
	leaq	-18(%rbp), %rax
	leaq	.LC16(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L65
	movl	$0, %eax
	call	signalHandlerServer
	movl	$0, %eax
	call	serverMode
	jmp	.L70
.L65:
	leaq	-18(%rbp), %rax
	leaq	.LC17(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L70
	movl	$0, %eax
	call	signalHandlerClient
	movl	$0, %eax
	call	clientMode
	jmp	.L70
.L64:
	movl	$2, %edi
	call	quit
	jmp	.L67
.L70:
	nop
.L67:
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L69
	call	__stack_chk_fail@PLT
.L69:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-7ubuntu2) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
