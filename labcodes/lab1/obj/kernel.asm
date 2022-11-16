
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	f3 0f 1e fb          	endbr32 
  100004:	55                   	push   %ebp
  100005:	89 e5                	mov    %esp,%ebp
  100007:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  10000a:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  10000f:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 fa 10 00 	movl   $0x10fa16,(%esp)
  100027:	e8 9b 2d 00 00       	call   102dc7 <memset>

    cons_init();                // init the console
  10002c:	e8 f5 15 00 00       	call   101626 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 00 36 10 00 	movl   $0x103600,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 1c 36 10 00 	movl   $0x10361c,(%esp)
  100046:	e8 39 02 00 00       	call   100284 <cprintf>

    print_kerninfo();
  10004b:	e8 f7 08 00 00       	call   100947 <print_kerninfo>

    grade_backtrace();
  100050:	e8 95 00 00 00       	call   1000ea <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 1c 2a 00 00       	call   102a76 <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 1c 17 00 00       	call   10177b <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 c1 18 00 00       	call   101925 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 42 0d 00 00       	call   100dab <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 59 18 00 00       	call   1018c7 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	f3 0f 1e fb          	endbr32 
  100074:	55                   	push   %ebp
  100075:	89 e5                	mov    %esp,%ebp
  100077:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100081:	00 
  100082:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100089:	00 
  10008a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100091:	e8 ff 0c 00 00       	call   100d95 <mon_backtrace>
}
  100096:	90                   	nop
  100097:	c9                   	leave  
  100098:	c3                   	ret    

00100099 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100099:	f3 0f 1e fb          	endbr32 
  10009d:	55                   	push   %ebp
  10009e:	89 e5                	mov    %esp,%ebp
  1000a0:	53                   	push   %ebx
  1000a1:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a4:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000aa:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1000b0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b4:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000bc:	89 04 24             	mov    %eax,(%esp)
  1000bf:	e8 ac ff ff ff       	call   100070 <grade_backtrace2>
}
  1000c4:	90                   	nop
  1000c5:	83 c4 14             	add    $0x14,%esp
  1000c8:	5b                   	pop    %ebx
  1000c9:	5d                   	pop    %ebp
  1000ca:	c3                   	ret    

001000cb <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000cb:	f3 0f 1e fb          	endbr32 
  1000cf:	55                   	push   %ebp
  1000d0:	89 e5                	mov    %esp,%ebp
  1000d2:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1000df:	89 04 24             	mov    %eax,(%esp)
  1000e2:	e8 b2 ff ff ff       	call   100099 <grade_backtrace1>
}
  1000e7:	90                   	nop
  1000e8:	c9                   	leave  
  1000e9:	c3                   	ret    

001000ea <grade_backtrace>:

void
grade_backtrace(void) {
  1000ea:	f3 0f 1e fb          	endbr32 
  1000ee:	55                   	push   %ebp
  1000ef:	89 e5                	mov    %esp,%ebp
  1000f1:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000f4:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000f9:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  100100:	ff 
  100101:	89 44 24 04          	mov    %eax,0x4(%esp)
  100105:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10010c:	e8 ba ff ff ff       	call   1000cb <grade_backtrace0>
}
  100111:	90                   	nop
  100112:	c9                   	leave  
  100113:	c3                   	ret    

00100114 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100114:	f3 0f 1e fb          	endbr32 
  100118:	55                   	push   %ebp
  100119:	89 e5                	mov    %esp,%ebp
  10011b:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10011e:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100121:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100124:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100127:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10012a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10012e:	83 e0 03             	and    $0x3,%eax
  100131:	89 c2                	mov    %eax,%edx
  100133:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100138:	89 54 24 08          	mov    %edx,0x8(%esp)
  10013c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100140:	c7 04 24 21 36 10 00 	movl   $0x103621,(%esp)
  100147:	e8 38 01 00 00       	call   100284 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10014c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100150:	89 c2                	mov    %eax,%edx
  100152:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100157:	89 54 24 08          	mov    %edx,0x8(%esp)
  10015b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10015f:	c7 04 24 2f 36 10 00 	movl   $0x10362f,(%esp)
  100166:	e8 19 01 00 00       	call   100284 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10016b:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10016f:	89 c2                	mov    %eax,%edx
  100171:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100176:	89 54 24 08          	mov    %edx,0x8(%esp)
  10017a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10017e:	c7 04 24 3d 36 10 00 	movl   $0x10363d,(%esp)
  100185:	e8 fa 00 00 00       	call   100284 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10018a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10018e:	89 c2                	mov    %eax,%edx
  100190:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100195:	89 54 24 08          	mov    %edx,0x8(%esp)
  100199:	89 44 24 04          	mov    %eax,0x4(%esp)
  10019d:	c7 04 24 4b 36 10 00 	movl   $0x10364b,(%esp)
  1001a4:	e8 db 00 00 00       	call   100284 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  1001a9:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001ad:	89 c2                	mov    %eax,%edx
  1001af:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001b4:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001b8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001bc:	c7 04 24 59 36 10 00 	movl   $0x103659,(%esp)
  1001c3:	e8 bc 00 00 00       	call   100284 <cprintf>
    round ++;
  1001c8:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001cd:	40                   	inc    %eax
  1001ce:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001d3:	90                   	nop
  1001d4:	c9                   	leave  
  1001d5:	c3                   	ret    

001001d6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001d6:	f3 0f 1e fb          	endbr32 
  1001da:	55                   	push   %ebp
  1001db:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001dd:	90                   	nop
  1001de:	5d                   	pop    %ebp
  1001df:	c3                   	ret    

001001e0 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001e0:	f3 0f 1e fb          	endbr32 
  1001e4:	55                   	push   %ebp
  1001e5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001e7:	90                   	nop
  1001e8:	5d                   	pop    %ebp
  1001e9:	c3                   	ret    

001001ea <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ea:	f3 0f 1e fb          	endbr32 
  1001ee:	55                   	push   %ebp
  1001ef:	89 e5                	mov    %esp,%ebp
  1001f1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001f4:	e8 1b ff ff ff       	call   100114 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001f9:	c7 04 24 68 36 10 00 	movl   $0x103668,(%esp)
  100200:	e8 7f 00 00 00       	call   100284 <cprintf>
    lab1_switch_to_user();
  100205:	e8 cc ff ff ff       	call   1001d6 <lab1_switch_to_user>
    lab1_print_cur_status();
  10020a:	e8 05 ff ff ff       	call   100114 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  10020f:	c7 04 24 88 36 10 00 	movl   $0x103688,(%esp)
  100216:	e8 69 00 00 00       	call   100284 <cprintf>
    lab1_switch_to_kernel();
  10021b:	e8 c0 ff ff ff       	call   1001e0 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100220:	e8 ef fe ff ff       	call   100114 <lab1_print_cur_status>
}
  100225:	90                   	nop
  100226:	c9                   	leave  
  100227:	c3                   	ret    

00100228 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100228:	f3 0f 1e fb          	endbr32 
  10022c:	55                   	push   %ebp
  10022d:	89 e5                	mov    %esp,%ebp
  10022f:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100232:	8b 45 08             	mov    0x8(%ebp),%eax
  100235:	89 04 24             	mov    %eax,(%esp)
  100238:	e8 1a 14 00 00       	call   101657 <cons_putc>
    (*cnt) ++;
  10023d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100240:	8b 00                	mov    (%eax),%eax
  100242:	8d 50 01             	lea    0x1(%eax),%edx
  100245:	8b 45 0c             	mov    0xc(%ebp),%eax
  100248:	89 10                	mov    %edx,(%eax)
}
  10024a:	90                   	nop
  10024b:	c9                   	leave  
  10024c:	c3                   	ret    

0010024d <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  10024d:	f3 0f 1e fb          	endbr32 
  100251:	55                   	push   %ebp
  100252:	89 e5                	mov    %esp,%ebp
  100254:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100257:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  10025e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100261:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100265:	8b 45 08             	mov    0x8(%ebp),%eax
  100268:	89 44 24 08          	mov    %eax,0x8(%esp)
  10026c:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10026f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100273:	c7 04 24 28 02 10 00 	movl   $0x100228,(%esp)
  10027a:	e8 b4 2e 00 00       	call   103133 <vprintfmt>
    return cnt;
  10027f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100282:	c9                   	leave  
  100283:	c3                   	ret    

00100284 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100284:	f3 0f 1e fb          	endbr32 
  100288:	55                   	push   %ebp
  100289:	89 e5                	mov    %esp,%ebp
  10028b:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10028e:	8d 45 0c             	lea    0xc(%ebp),%eax
  100291:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100294:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100297:	89 44 24 04          	mov    %eax,0x4(%esp)
  10029b:	8b 45 08             	mov    0x8(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 a7 ff ff ff       	call   10024d <vcprintf>
  1002a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1002a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002ac:	c9                   	leave  
  1002ad:	c3                   	ret    

001002ae <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  1002ae:	f3 0f 1e fb          	endbr32 
  1002b2:	55                   	push   %ebp
  1002b3:	89 e5                	mov    %esp,%ebp
  1002b5:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002bb:	89 04 24             	mov    %eax,(%esp)
  1002be:	e8 94 13 00 00       	call   101657 <cons_putc>
}
  1002c3:	90                   	nop
  1002c4:	c9                   	leave  
  1002c5:	c3                   	ret    

001002c6 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002c6:	f3 0f 1e fb          	endbr32 
  1002ca:	55                   	push   %ebp
  1002cb:	89 e5                	mov    %esp,%ebp
  1002cd:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002d0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002d7:	eb 13                	jmp    1002ec <cputs+0x26>
        cputch(c, &cnt);
  1002d9:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002dd:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002e0:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002e4:	89 04 24             	mov    %eax,(%esp)
  1002e7:	e8 3c ff ff ff       	call   100228 <cputch>
    while ((c = *str ++) != '\0') {
  1002ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ef:	8d 50 01             	lea    0x1(%eax),%edx
  1002f2:	89 55 08             	mov    %edx,0x8(%ebp)
  1002f5:	0f b6 00             	movzbl (%eax),%eax
  1002f8:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002fb:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002ff:	75 d8                	jne    1002d9 <cputs+0x13>
    }
    cputch('\n', &cnt);
  100301:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100304:	89 44 24 04          	mov    %eax,0x4(%esp)
  100308:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  10030f:	e8 14 ff ff ff       	call   100228 <cputch>
    return cnt;
  100314:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100317:	c9                   	leave  
  100318:	c3                   	ret    

00100319 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  100319:	f3 0f 1e fb          	endbr32 
  10031d:	55                   	push   %ebp
  10031e:	89 e5                	mov    %esp,%ebp
  100320:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  100323:	90                   	nop
  100324:	e8 5c 13 00 00       	call   101685 <cons_getc>
  100329:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10032c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100330:	74 f2                	je     100324 <getchar+0xb>
        /* do nothing */;
    return c;
  100332:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100335:	c9                   	leave  
  100336:	c3                   	ret    

00100337 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100337:	f3 0f 1e fb          	endbr32 
  10033b:	55                   	push   %ebp
  10033c:	89 e5                	mov    %esp,%ebp
  10033e:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100341:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100345:	74 13                	je     10035a <readline+0x23>
        cprintf("%s", prompt);
  100347:	8b 45 08             	mov    0x8(%ebp),%eax
  10034a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10034e:	c7 04 24 a7 36 10 00 	movl   $0x1036a7,(%esp)
  100355:	e8 2a ff ff ff       	call   100284 <cprintf>
    }
    int i = 0, c;
  10035a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100361:	e8 b3 ff ff ff       	call   100319 <getchar>
  100366:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100369:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10036d:	79 07                	jns    100376 <readline+0x3f>
            return NULL;
  10036f:	b8 00 00 00 00       	mov    $0x0,%eax
  100374:	eb 78                	jmp    1003ee <readline+0xb7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100376:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10037a:	7e 28                	jle    1003a4 <readline+0x6d>
  10037c:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100383:	7f 1f                	jg     1003a4 <readline+0x6d>
            cputchar(c);
  100385:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100388:	89 04 24             	mov    %eax,(%esp)
  10038b:	e8 1e ff ff ff       	call   1002ae <cputchar>
            buf[i ++] = c;
  100390:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100393:	8d 50 01             	lea    0x1(%eax),%edx
  100396:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100399:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10039c:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  1003a2:	eb 45                	jmp    1003e9 <readline+0xb2>
        }
        else if (c == '\b' && i > 0) {
  1003a4:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  1003a8:	75 16                	jne    1003c0 <readline+0x89>
  1003aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ae:	7e 10                	jle    1003c0 <readline+0x89>
            cputchar(c);
  1003b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003b3:	89 04 24             	mov    %eax,(%esp)
  1003b6:	e8 f3 fe ff ff       	call   1002ae <cputchar>
            i --;
  1003bb:	ff 4d f4             	decl   -0xc(%ebp)
  1003be:	eb 29                	jmp    1003e9 <readline+0xb2>
        }
        else if (c == '\n' || c == '\r') {
  1003c0:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1003c4:	74 06                	je     1003cc <readline+0x95>
  1003c6:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1003ca:	75 95                	jne    100361 <readline+0x2a>
            cputchar(c);
  1003cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003cf:	89 04 24             	mov    %eax,(%esp)
  1003d2:	e8 d7 fe ff ff       	call   1002ae <cputchar>
            buf[i] = '\0';
  1003d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003da:	05 40 fa 10 00       	add    $0x10fa40,%eax
  1003df:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003e2:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1003e7:	eb 05                	jmp    1003ee <readline+0xb7>
        c = getchar();
  1003e9:	e9 73 ff ff ff       	jmp    100361 <readline+0x2a>
        }
    }
}
  1003ee:	c9                   	leave  
  1003ef:	c3                   	ret    

001003f0 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003f0:	f3 0f 1e fb          	endbr32 
  1003f4:	55                   	push   %ebp
  1003f5:	89 e5                	mov    %esp,%ebp
  1003f7:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003fa:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  1003ff:	85 c0                	test   %eax,%eax
  100401:	75 5b                	jne    10045e <__panic+0x6e>
        goto panic_dead;
    }
    is_panic = 1;
  100403:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  10040a:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  10040d:	8d 45 14             	lea    0x14(%ebp),%eax
  100410:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100413:	8b 45 0c             	mov    0xc(%ebp),%eax
  100416:	89 44 24 08          	mov    %eax,0x8(%esp)
  10041a:	8b 45 08             	mov    0x8(%ebp),%eax
  10041d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100421:	c7 04 24 aa 36 10 00 	movl   $0x1036aa,(%esp)
  100428:	e8 57 fe ff ff       	call   100284 <cprintf>
    vcprintf(fmt, ap);
  10042d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100430:	89 44 24 04          	mov    %eax,0x4(%esp)
  100434:	8b 45 10             	mov    0x10(%ebp),%eax
  100437:	89 04 24             	mov    %eax,(%esp)
  10043a:	e8 0e fe ff ff       	call   10024d <vcprintf>
    cprintf("\n");
  10043f:	c7 04 24 c6 36 10 00 	movl   $0x1036c6,(%esp)
  100446:	e8 39 fe ff ff       	call   100284 <cprintf>
    
    cprintf("stack trackback:\n");
  10044b:	c7 04 24 c8 36 10 00 	movl   $0x1036c8,(%esp)
  100452:	e8 2d fe ff ff       	call   100284 <cprintf>
    print_stackframe();
  100457:	e8 3d 06 00 00       	call   100a99 <print_stackframe>
  10045c:	eb 01                	jmp    10045f <__panic+0x6f>
        goto panic_dead;
  10045e:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  10045f:	e8 6f 14 00 00       	call   1018d3 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100464:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10046b:	e8 4c 08 00 00       	call   100cbc <kmonitor>
  100470:	eb f2                	jmp    100464 <__panic+0x74>

00100472 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100472:	f3 0f 1e fb          	endbr32 
  100476:	55                   	push   %ebp
  100477:	89 e5                	mov    %esp,%ebp
  100479:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  10047c:	8d 45 14             	lea    0x14(%ebp),%eax
  10047f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100482:	8b 45 0c             	mov    0xc(%ebp),%eax
  100485:	89 44 24 08          	mov    %eax,0x8(%esp)
  100489:	8b 45 08             	mov    0x8(%ebp),%eax
  10048c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100490:	c7 04 24 da 36 10 00 	movl   $0x1036da,(%esp)
  100497:	e8 e8 fd ff ff       	call   100284 <cprintf>
    vcprintf(fmt, ap);
  10049c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10049f:	89 44 24 04          	mov    %eax,0x4(%esp)
  1004a3:	8b 45 10             	mov    0x10(%ebp),%eax
  1004a6:	89 04 24             	mov    %eax,(%esp)
  1004a9:	e8 9f fd ff ff       	call   10024d <vcprintf>
    cprintf("\n");
  1004ae:	c7 04 24 c6 36 10 00 	movl   $0x1036c6,(%esp)
  1004b5:	e8 ca fd ff ff       	call   100284 <cprintf>
    va_end(ap);
}
  1004ba:	90                   	nop
  1004bb:	c9                   	leave  
  1004bc:	c3                   	ret    

001004bd <is_kernel_panic>:

bool
is_kernel_panic(void) {
  1004bd:	f3 0f 1e fb          	endbr32 
  1004c1:	55                   	push   %ebp
  1004c2:	89 e5                	mov    %esp,%ebp
    return is_panic;
  1004c4:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  1004c9:	5d                   	pop    %ebp
  1004ca:	c3                   	ret    

001004cb <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1004cb:	f3 0f 1e fb          	endbr32 
  1004cf:	55                   	push   %ebp
  1004d0:	89 e5                	mov    %esp,%ebp
  1004d2:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1004d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d8:	8b 00                	mov    (%eax),%eax
  1004da:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1004dd:	8b 45 10             	mov    0x10(%ebp),%eax
  1004e0:	8b 00                	mov    (%eax),%eax
  1004e2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004ec:	e9 ca 00 00 00       	jmp    1005bb <stab_binsearch+0xf0>
        int true_m = (l + r) / 2, m = true_m;
  1004f1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004f7:	01 d0                	add    %edx,%eax
  1004f9:	89 c2                	mov    %eax,%edx
  1004fb:	c1 ea 1f             	shr    $0x1f,%edx
  1004fe:	01 d0                	add    %edx,%eax
  100500:	d1 f8                	sar    %eax
  100502:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100505:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100508:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10050b:	eb 03                	jmp    100510 <stab_binsearch+0x45>
            m --;
  10050d:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  100510:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100513:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100516:	7c 1f                	jl     100537 <stab_binsearch+0x6c>
  100518:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10051b:	89 d0                	mov    %edx,%eax
  10051d:	01 c0                	add    %eax,%eax
  10051f:	01 d0                	add    %edx,%eax
  100521:	c1 e0 02             	shl    $0x2,%eax
  100524:	89 c2                	mov    %eax,%edx
  100526:	8b 45 08             	mov    0x8(%ebp),%eax
  100529:	01 d0                	add    %edx,%eax
  10052b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10052f:	0f b6 c0             	movzbl %al,%eax
  100532:	39 45 14             	cmp    %eax,0x14(%ebp)
  100535:	75 d6                	jne    10050d <stab_binsearch+0x42>
        }
        if (m < l) {    // no match in [l, m]
  100537:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10053a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10053d:	7d 09                	jge    100548 <stab_binsearch+0x7d>
            l = true_m + 1;
  10053f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100542:	40                   	inc    %eax
  100543:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100546:	eb 73                	jmp    1005bb <stab_binsearch+0xf0>
        }

        // actual binary search
        any_matches = 1;
  100548:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10054f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100552:	89 d0                	mov    %edx,%eax
  100554:	01 c0                	add    %eax,%eax
  100556:	01 d0                	add    %edx,%eax
  100558:	c1 e0 02             	shl    $0x2,%eax
  10055b:	89 c2                	mov    %eax,%edx
  10055d:	8b 45 08             	mov    0x8(%ebp),%eax
  100560:	01 d0                	add    %edx,%eax
  100562:	8b 40 08             	mov    0x8(%eax),%eax
  100565:	39 45 18             	cmp    %eax,0x18(%ebp)
  100568:	76 11                	jbe    10057b <stab_binsearch+0xb0>
            *region_left = m;
  10056a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10056d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100570:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100572:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100575:	40                   	inc    %eax
  100576:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100579:	eb 40                	jmp    1005bb <stab_binsearch+0xf0>
        } else if (stabs[m].n_value > addr) {
  10057b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10057e:	89 d0                	mov    %edx,%eax
  100580:	01 c0                	add    %eax,%eax
  100582:	01 d0                	add    %edx,%eax
  100584:	c1 e0 02             	shl    $0x2,%eax
  100587:	89 c2                	mov    %eax,%edx
  100589:	8b 45 08             	mov    0x8(%ebp),%eax
  10058c:	01 d0                	add    %edx,%eax
  10058e:	8b 40 08             	mov    0x8(%eax),%eax
  100591:	39 45 18             	cmp    %eax,0x18(%ebp)
  100594:	73 14                	jae    1005aa <stab_binsearch+0xdf>
            *region_right = m - 1;
  100596:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100599:	8d 50 ff             	lea    -0x1(%eax),%edx
  10059c:	8b 45 10             	mov    0x10(%ebp),%eax
  10059f:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  1005a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005a4:	48                   	dec    %eax
  1005a5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1005a8:	eb 11                	jmp    1005bb <stab_binsearch+0xf0>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1005aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ad:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1005b0:	89 10                	mov    %edx,(%eax)
            l = m;
  1005b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1005b8:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1005bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1005be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1005c1:	0f 8e 2a ff ff ff    	jle    1004f1 <stab_binsearch+0x26>
        }
    }

    if (!any_matches) {
  1005c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1005cb:	75 0f                	jne    1005dc <stab_binsearch+0x111>
        *region_right = *region_left - 1;
  1005cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d0:	8b 00                	mov    (%eax),%eax
  1005d2:	8d 50 ff             	lea    -0x1(%eax),%edx
  1005d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1005d8:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1005da:	eb 3e                	jmp    10061a <stab_binsearch+0x14f>
        l = *region_right;
  1005dc:	8b 45 10             	mov    0x10(%ebp),%eax
  1005df:	8b 00                	mov    (%eax),%eax
  1005e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005e4:	eb 03                	jmp    1005e9 <stab_binsearch+0x11e>
  1005e6:	ff 4d fc             	decl   -0x4(%ebp)
  1005e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ec:	8b 00                	mov    (%eax),%eax
  1005ee:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1005f1:	7e 1f                	jle    100612 <stab_binsearch+0x147>
  1005f3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005f6:	89 d0                	mov    %edx,%eax
  1005f8:	01 c0                	add    %eax,%eax
  1005fa:	01 d0                	add    %edx,%eax
  1005fc:	c1 e0 02             	shl    $0x2,%eax
  1005ff:	89 c2                	mov    %eax,%edx
  100601:	8b 45 08             	mov    0x8(%ebp),%eax
  100604:	01 d0                	add    %edx,%eax
  100606:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10060a:	0f b6 c0             	movzbl %al,%eax
  10060d:	39 45 14             	cmp    %eax,0x14(%ebp)
  100610:	75 d4                	jne    1005e6 <stab_binsearch+0x11b>
        *region_left = l;
  100612:	8b 45 0c             	mov    0xc(%ebp),%eax
  100615:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100618:	89 10                	mov    %edx,(%eax)
}
  10061a:	90                   	nop
  10061b:	c9                   	leave  
  10061c:	c3                   	ret    

0010061d <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10061d:	f3 0f 1e fb          	endbr32 
  100621:	55                   	push   %ebp
  100622:	89 e5                	mov    %esp,%ebp
  100624:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100627:	8b 45 0c             	mov    0xc(%ebp),%eax
  10062a:	c7 00 f8 36 10 00    	movl   $0x1036f8,(%eax)
    info->eip_line = 0;
  100630:	8b 45 0c             	mov    0xc(%ebp),%eax
  100633:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  10063a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10063d:	c7 40 08 f8 36 10 00 	movl   $0x1036f8,0x8(%eax)
    info->eip_fn_namelen = 9;
  100644:	8b 45 0c             	mov    0xc(%ebp),%eax
  100647:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10064e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100651:	8b 55 08             	mov    0x8(%ebp),%edx
  100654:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100657:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065a:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100661:	c7 45 f4 4c 3f 10 00 	movl   $0x103f4c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100668:	c7 45 f0 98 cb 10 00 	movl   $0x10cb98,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10066f:	c7 45 ec 99 cb 10 00 	movl   $0x10cb99,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100676:	c7 45 e8 78 ec 10 00 	movl   $0x10ec78,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10067d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100680:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100683:	76 0b                	jbe    100690 <debuginfo_eip+0x73>
  100685:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100688:	48                   	dec    %eax
  100689:	0f b6 00             	movzbl (%eax),%eax
  10068c:	84 c0                	test   %al,%al
  10068e:	74 0a                	je     10069a <debuginfo_eip+0x7d>
        return -1;
  100690:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100695:	e9 ab 02 00 00       	jmp    100945 <debuginfo_eip+0x328>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  10069a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1006a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006a4:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1006a7:	c1 f8 02             	sar    $0x2,%eax
  1006aa:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1006b0:	48                   	dec    %eax
  1006b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1006b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1006b7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006bb:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1006c2:	00 
  1006c3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1006c6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006ca:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1006cd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d4:	89 04 24             	mov    %eax,(%esp)
  1006d7:	e8 ef fd ff ff       	call   1004cb <stab_binsearch>
    if (lfile == 0)
  1006dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006df:	85 c0                	test   %eax,%eax
  1006e1:	75 0a                	jne    1006ed <debuginfo_eip+0xd0>
        return -1;
  1006e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006e8:	e9 58 02 00 00       	jmp    100945 <debuginfo_eip+0x328>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006f0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006f6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1006fc:	89 44 24 10          	mov    %eax,0x10(%esp)
  100700:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  100707:	00 
  100708:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10070b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10070f:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100712:	89 44 24 04          	mov    %eax,0x4(%esp)
  100716:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100719:	89 04 24             	mov    %eax,(%esp)
  10071c:	e8 aa fd ff ff       	call   1004cb <stab_binsearch>

    if (lfun <= rfun) {
  100721:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100724:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100727:	39 c2                	cmp    %eax,%edx
  100729:	7f 78                	jg     1007a3 <debuginfo_eip+0x186>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10072b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10072e:	89 c2                	mov    %eax,%edx
  100730:	89 d0                	mov    %edx,%eax
  100732:	01 c0                	add    %eax,%eax
  100734:	01 d0                	add    %edx,%eax
  100736:	c1 e0 02             	shl    $0x2,%eax
  100739:	89 c2                	mov    %eax,%edx
  10073b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10073e:	01 d0                	add    %edx,%eax
  100740:	8b 10                	mov    (%eax),%edx
  100742:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100745:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100748:	39 c2                	cmp    %eax,%edx
  10074a:	73 22                	jae    10076e <debuginfo_eip+0x151>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10074c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10074f:	89 c2                	mov    %eax,%edx
  100751:	89 d0                	mov    %edx,%eax
  100753:	01 c0                	add    %eax,%eax
  100755:	01 d0                	add    %edx,%eax
  100757:	c1 e0 02             	shl    $0x2,%eax
  10075a:	89 c2                	mov    %eax,%edx
  10075c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10075f:	01 d0                	add    %edx,%eax
  100761:	8b 10                	mov    (%eax),%edx
  100763:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100766:	01 c2                	add    %eax,%edx
  100768:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076b:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10076e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100771:	89 c2                	mov    %eax,%edx
  100773:	89 d0                	mov    %edx,%eax
  100775:	01 c0                	add    %eax,%eax
  100777:	01 d0                	add    %edx,%eax
  100779:	c1 e0 02             	shl    $0x2,%eax
  10077c:	89 c2                	mov    %eax,%edx
  10077e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100781:	01 d0                	add    %edx,%eax
  100783:	8b 50 08             	mov    0x8(%eax),%edx
  100786:	8b 45 0c             	mov    0xc(%ebp),%eax
  100789:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10078c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10078f:	8b 40 10             	mov    0x10(%eax),%eax
  100792:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100795:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100798:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10079b:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10079e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1007a1:	eb 15                	jmp    1007b8 <debuginfo_eip+0x19b>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  1007a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a6:	8b 55 08             	mov    0x8(%ebp),%edx
  1007a9:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1007ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007af:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1007b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1007b5:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1007b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007bb:	8b 40 08             	mov    0x8(%eax),%eax
  1007be:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1007c5:	00 
  1007c6:	89 04 24             	mov    %eax,(%esp)
  1007c9:	e8 6d 24 00 00       	call   102c3b <strfind>
  1007ce:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007d1:	8b 52 08             	mov    0x8(%edx),%edx
  1007d4:	29 d0                	sub    %edx,%eax
  1007d6:	89 c2                	mov    %eax,%edx
  1007d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007db:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007de:	8b 45 08             	mov    0x8(%ebp),%eax
  1007e1:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007e5:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007ec:	00 
  1007ed:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007f0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007f4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007f7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007fe:	89 04 24             	mov    %eax,(%esp)
  100801:	e8 c5 fc ff ff       	call   1004cb <stab_binsearch>
    if (lline <= rline) {
  100806:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100809:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10080c:	39 c2                	cmp    %eax,%edx
  10080e:	7f 23                	jg     100833 <debuginfo_eip+0x216>
        info->eip_line = stabs[rline].n_desc;
  100810:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100813:	89 c2                	mov    %eax,%edx
  100815:	89 d0                	mov    %edx,%eax
  100817:	01 c0                	add    %eax,%eax
  100819:	01 d0                	add    %edx,%eax
  10081b:	c1 e0 02             	shl    $0x2,%eax
  10081e:	89 c2                	mov    %eax,%edx
  100820:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100823:	01 d0                	add    %edx,%eax
  100825:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100829:	89 c2                	mov    %eax,%edx
  10082b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10082e:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100831:	eb 11                	jmp    100844 <debuginfo_eip+0x227>
        return -1;
  100833:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100838:	e9 08 01 00 00       	jmp    100945 <debuginfo_eip+0x328>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  10083d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100840:	48                   	dec    %eax
  100841:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100844:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100847:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10084a:	39 c2                	cmp    %eax,%edx
  10084c:	7c 56                	jl     1008a4 <debuginfo_eip+0x287>
           && stabs[lline].n_type != N_SOL
  10084e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100851:	89 c2                	mov    %eax,%edx
  100853:	89 d0                	mov    %edx,%eax
  100855:	01 c0                	add    %eax,%eax
  100857:	01 d0                	add    %edx,%eax
  100859:	c1 e0 02             	shl    $0x2,%eax
  10085c:	89 c2                	mov    %eax,%edx
  10085e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100861:	01 d0                	add    %edx,%eax
  100863:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100867:	3c 84                	cmp    $0x84,%al
  100869:	74 39                	je     1008a4 <debuginfo_eip+0x287>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10086b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10086e:	89 c2                	mov    %eax,%edx
  100870:	89 d0                	mov    %edx,%eax
  100872:	01 c0                	add    %eax,%eax
  100874:	01 d0                	add    %edx,%eax
  100876:	c1 e0 02             	shl    $0x2,%eax
  100879:	89 c2                	mov    %eax,%edx
  10087b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10087e:	01 d0                	add    %edx,%eax
  100880:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100884:	3c 64                	cmp    $0x64,%al
  100886:	75 b5                	jne    10083d <debuginfo_eip+0x220>
  100888:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10088b:	89 c2                	mov    %eax,%edx
  10088d:	89 d0                	mov    %edx,%eax
  10088f:	01 c0                	add    %eax,%eax
  100891:	01 d0                	add    %edx,%eax
  100893:	c1 e0 02             	shl    $0x2,%eax
  100896:	89 c2                	mov    %eax,%edx
  100898:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10089b:	01 d0                	add    %edx,%eax
  10089d:	8b 40 08             	mov    0x8(%eax),%eax
  1008a0:	85 c0                	test   %eax,%eax
  1008a2:	74 99                	je     10083d <debuginfo_eip+0x220>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  1008a4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1008aa:	39 c2                	cmp    %eax,%edx
  1008ac:	7c 42                	jl     1008f0 <debuginfo_eip+0x2d3>
  1008ae:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008b1:	89 c2                	mov    %eax,%edx
  1008b3:	89 d0                	mov    %edx,%eax
  1008b5:	01 c0                	add    %eax,%eax
  1008b7:	01 d0                	add    %edx,%eax
  1008b9:	c1 e0 02             	shl    $0x2,%eax
  1008bc:	89 c2                	mov    %eax,%edx
  1008be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008c1:	01 d0                	add    %edx,%eax
  1008c3:	8b 10                	mov    (%eax),%edx
  1008c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1008c8:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1008cb:	39 c2                	cmp    %eax,%edx
  1008cd:	73 21                	jae    1008f0 <debuginfo_eip+0x2d3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1008cf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008d2:	89 c2                	mov    %eax,%edx
  1008d4:	89 d0                	mov    %edx,%eax
  1008d6:	01 c0                	add    %eax,%eax
  1008d8:	01 d0                	add    %edx,%eax
  1008da:	c1 e0 02             	shl    $0x2,%eax
  1008dd:	89 c2                	mov    %eax,%edx
  1008df:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008e2:	01 d0                	add    %edx,%eax
  1008e4:	8b 10                	mov    (%eax),%edx
  1008e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008e9:	01 c2                	add    %eax,%edx
  1008eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ee:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008f0:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008f6:	39 c2                	cmp    %eax,%edx
  1008f8:	7d 46                	jge    100940 <debuginfo_eip+0x323>
        for (lline = lfun + 1;
  1008fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008fd:	40                   	inc    %eax
  1008fe:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100901:	eb 16                	jmp    100919 <debuginfo_eip+0x2fc>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100903:	8b 45 0c             	mov    0xc(%ebp),%eax
  100906:	8b 40 14             	mov    0x14(%eax),%eax
  100909:	8d 50 01             	lea    0x1(%eax),%edx
  10090c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10090f:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100912:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100915:	40                   	inc    %eax
  100916:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100919:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10091c:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  10091f:	39 c2                	cmp    %eax,%edx
  100921:	7d 1d                	jge    100940 <debuginfo_eip+0x323>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100923:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100926:	89 c2                	mov    %eax,%edx
  100928:	89 d0                	mov    %edx,%eax
  10092a:	01 c0                	add    %eax,%eax
  10092c:	01 d0                	add    %edx,%eax
  10092e:	c1 e0 02             	shl    $0x2,%eax
  100931:	89 c2                	mov    %eax,%edx
  100933:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100936:	01 d0                	add    %edx,%eax
  100938:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10093c:	3c a0                	cmp    $0xa0,%al
  10093e:	74 c3                	je     100903 <debuginfo_eip+0x2e6>
        }
    }
    return 0;
  100940:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100945:	c9                   	leave  
  100946:	c3                   	ret    

00100947 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100947:	f3 0f 1e fb          	endbr32 
  10094b:	55                   	push   %ebp
  10094c:	89 e5                	mov    %esp,%ebp
  10094e:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100951:	c7 04 24 02 37 10 00 	movl   $0x103702,(%esp)
  100958:	e8 27 f9 ff ff       	call   100284 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10095d:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100964:	00 
  100965:	c7 04 24 1b 37 10 00 	movl   $0x10371b,(%esp)
  10096c:	e8 13 f9 ff ff       	call   100284 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100971:	c7 44 24 04 eb 35 10 	movl   $0x1035eb,0x4(%esp)
  100978:	00 
  100979:	c7 04 24 33 37 10 00 	movl   $0x103733,(%esp)
  100980:	e8 ff f8 ff ff       	call   100284 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100985:	c7 44 24 04 16 fa 10 	movl   $0x10fa16,0x4(%esp)
  10098c:	00 
  10098d:	c7 04 24 4b 37 10 00 	movl   $0x10374b,(%esp)
  100994:	e8 eb f8 ff ff       	call   100284 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100999:	c7 44 24 04 20 0d 11 	movl   $0x110d20,0x4(%esp)
  1009a0:	00 
  1009a1:	c7 04 24 63 37 10 00 	movl   $0x103763,(%esp)
  1009a8:	e8 d7 f8 ff ff       	call   100284 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1009ad:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  1009b2:	2d 00 00 10 00       	sub    $0x100000,%eax
  1009b7:	05 ff 03 00 00       	add    $0x3ff,%eax
  1009bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1009c2:	85 c0                	test   %eax,%eax
  1009c4:	0f 48 c2             	cmovs  %edx,%eax
  1009c7:	c1 f8 0a             	sar    $0xa,%eax
  1009ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009ce:	c7 04 24 7c 37 10 00 	movl   $0x10377c,(%esp)
  1009d5:	e8 aa f8 ff ff       	call   100284 <cprintf>
}
  1009da:	90                   	nop
  1009db:	c9                   	leave  
  1009dc:	c3                   	ret    

001009dd <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009dd:	f3 0f 1e fb          	endbr32 
  1009e1:	55                   	push   %ebp
  1009e2:	89 e5                	mov    %esp,%ebp
  1009e4:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009ea:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009ed:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1009f4:	89 04 24             	mov    %eax,(%esp)
  1009f7:	e8 21 fc ff ff       	call   10061d <debuginfo_eip>
  1009fc:	85 c0                	test   %eax,%eax
  1009fe:	74 15                	je     100a15 <print_debuginfo+0x38>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100a00:	8b 45 08             	mov    0x8(%ebp),%eax
  100a03:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a07:	c7 04 24 a6 37 10 00 	movl   $0x1037a6,(%esp)
  100a0e:	e8 71 f8 ff ff       	call   100284 <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100a13:	eb 6c                	jmp    100a81 <print_debuginfo+0xa4>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a15:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100a1c:	eb 1b                	jmp    100a39 <print_debuginfo+0x5c>
            fnname[j] = info.eip_fn_name[j];
  100a1e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a24:	01 d0                	add    %edx,%eax
  100a26:	0f b6 10             	movzbl (%eax),%edx
  100a29:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a32:	01 c8                	add    %ecx,%eax
  100a34:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a36:	ff 45 f4             	incl   -0xc(%ebp)
  100a39:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a3c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100a3f:	7c dd                	jl     100a1e <print_debuginfo+0x41>
        fnname[j] = '\0';
  100a41:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a47:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a4a:	01 d0                	add    %edx,%eax
  100a4c:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100a4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a52:	8b 55 08             	mov    0x8(%ebp),%edx
  100a55:	89 d1                	mov    %edx,%ecx
  100a57:	29 c1                	sub    %eax,%ecx
  100a59:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a5c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a5f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a63:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a69:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a6d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a71:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a75:	c7 04 24 c2 37 10 00 	movl   $0x1037c2,(%esp)
  100a7c:	e8 03 f8 ff ff       	call   100284 <cprintf>
}
  100a81:	90                   	nop
  100a82:	c9                   	leave  
  100a83:	c3                   	ret    

00100a84 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a84:	f3 0f 1e fb          	endbr32 
  100a88:	55                   	push   %ebp
  100a89:	89 e5                	mov    %esp,%ebp
  100a8b:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a8e:	8b 45 04             	mov    0x4(%ebp),%eax
  100a91:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a94:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a97:	c9                   	leave  
  100a98:	c3                   	ret    

00100a99 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a99:	f3 0f 1e fb          	endbr32 
  100a9d:	55                   	push   %ebp
  100a9e:	89 e5                	mov    %esp,%ebp
  100aa0:	53                   	push   %ebx
  100aa1:	83 ec 34             	sub    $0x34,%esp
      *    (3.4) call print_debuginfo(eip-1) to print the C calling function name and line number, etc.
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    uint32_t *ebp = 0;
  100aa4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    uint32_t eip = 0;
  100aab:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100ab2:	89 e8                	mov    %ebp,%eax
  100ab4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    return ebp;
  100ab7:	8b 45 ec             	mov    -0x14(%ebp),%eax

    ebp = (uint32_t *)read_ebp();
  100aba:	89 45 f4             	mov    %eax,-0xc(%ebp)
    eip = read_eip();
  100abd:	e8 c2 ff ff ff       	call   100a84 <read_eip>
  100ac2:	89 45 f0             	mov    %eax,-0x10(%ebp)

    while (ebp)
  100ac5:	eb 73                	jmp    100b3a <print_stackframe+0xa1>
    {
        cprintf("ebp:0x%08x eip:0x%08x args:", (uint32_t)ebp, eip);
  100ac7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aca:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100acd:	89 54 24 08          	mov    %edx,0x8(%esp)
  100ad1:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ad5:	c7 04 24 d4 37 10 00 	movl   $0x1037d4,(%esp)
  100adc:	e8 a3 f7 ff ff       	call   100284 <cprintf>
        cprintf("0x%08x 0x%08x 0x%08x 0x%08x\n", ebp[2], ebp[3], ebp[4], ebp[5]);
  100ae1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ae4:	83 c0 14             	add    $0x14,%eax
  100ae7:	8b 18                	mov    (%eax),%ebx
  100ae9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aec:	83 c0 10             	add    $0x10,%eax
  100aef:	8b 08                	mov    (%eax),%ecx
  100af1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100af4:	83 c0 0c             	add    $0xc,%eax
  100af7:	8b 10                	mov    (%eax),%edx
  100af9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100afc:	83 c0 08             	add    $0x8,%eax
  100aff:	8b 00                	mov    (%eax),%eax
  100b01:	89 5c 24 10          	mov    %ebx,0x10(%esp)
  100b05:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100b09:	89 54 24 08          	mov    %edx,0x8(%esp)
  100b0d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b11:	c7 04 24 f0 37 10 00 	movl   $0x1037f0,(%esp)
  100b18:	e8 67 f7 ff ff       	call   100284 <cprintf>

        print_debuginfo(eip - 1);
  100b1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b20:	48                   	dec    %eax
  100b21:	89 04 24             	mov    %eax,(%esp)
  100b24:	e8 b4 fe ff ff       	call   1009dd <print_debuginfo>

        eip = ebp[1];
  100b29:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b2c:	8b 40 04             	mov    0x4(%eax),%eax
  100b2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = (uint32_t *) *ebp;
  100b32:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b35:	8b 00                	mov    (%eax),%eax
  100b37:	89 45 f4             	mov    %eax,-0xc(%ebp)
    while (ebp)
  100b3a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b3e:	75 87                	jne    100ac7 <print_stackframe+0x2e>
    }
}
  100b40:	90                   	nop
  100b41:	90                   	nop
  100b42:	83 c4 34             	add    $0x34,%esp
  100b45:	5b                   	pop    %ebx
  100b46:	5d                   	pop    %ebp
  100b47:	c3                   	ret    

00100b48 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b48:	f3 0f 1e fb          	endbr32 
  100b4c:	55                   	push   %ebp
  100b4d:	89 e5                	mov    %esp,%ebp
  100b4f:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b52:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b59:	eb 0c                	jmp    100b67 <parse+0x1f>
            *buf ++ = '\0';
  100b5b:	8b 45 08             	mov    0x8(%ebp),%eax
  100b5e:	8d 50 01             	lea    0x1(%eax),%edx
  100b61:	89 55 08             	mov    %edx,0x8(%ebp)
  100b64:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b67:	8b 45 08             	mov    0x8(%ebp),%eax
  100b6a:	0f b6 00             	movzbl (%eax),%eax
  100b6d:	84 c0                	test   %al,%al
  100b6f:	74 1d                	je     100b8e <parse+0x46>
  100b71:	8b 45 08             	mov    0x8(%ebp),%eax
  100b74:	0f b6 00             	movzbl (%eax),%eax
  100b77:	0f be c0             	movsbl %al,%eax
  100b7a:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b7e:	c7 04 24 90 38 10 00 	movl   $0x103890,(%esp)
  100b85:	e8 7b 20 00 00       	call   102c05 <strchr>
  100b8a:	85 c0                	test   %eax,%eax
  100b8c:	75 cd                	jne    100b5b <parse+0x13>
        }
        if (*buf == '\0') {
  100b8e:	8b 45 08             	mov    0x8(%ebp),%eax
  100b91:	0f b6 00             	movzbl (%eax),%eax
  100b94:	84 c0                	test   %al,%al
  100b96:	74 65                	je     100bfd <parse+0xb5>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b98:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b9c:	75 14                	jne    100bb2 <parse+0x6a>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b9e:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100ba5:	00 
  100ba6:	c7 04 24 95 38 10 00 	movl   $0x103895,(%esp)
  100bad:	e8 d2 f6 ff ff       	call   100284 <cprintf>
        }
        argv[argc ++] = buf;
  100bb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bb5:	8d 50 01             	lea    0x1(%eax),%edx
  100bb8:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100bbb:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100bc2:	8b 45 0c             	mov    0xc(%ebp),%eax
  100bc5:	01 c2                	add    %eax,%edx
  100bc7:	8b 45 08             	mov    0x8(%ebp),%eax
  100bca:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bcc:	eb 03                	jmp    100bd1 <parse+0x89>
            buf ++;
  100bce:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bd1:	8b 45 08             	mov    0x8(%ebp),%eax
  100bd4:	0f b6 00             	movzbl (%eax),%eax
  100bd7:	84 c0                	test   %al,%al
  100bd9:	74 8c                	je     100b67 <parse+0x1f>
  100bdb:	8b 45 08             	mov    0x8(%ebp),%eax
  100bde:	0f b6 00             	movzbl (%eax),%eax
  100be1:	0f be c0             	movsbl %al,%eax
  100be4:	89 44 24 04          	mov    %eax,0x4(%esp)
  100be8:	c7 04 24 90 38 10 00 	movl   $0x103890,(%esp)
  100bef:	e8 11 20 00 00       	call   102c05 <strchr>
  100bf4:	85 c0                	test   %eax,%eax
  100bf6:	74 d6                	je     100bce <parse+0x86>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100bf8:	e9 6a ff ff ff       	jmp    100b67 <parse+0x1f>
            break;
  100bfd:	90                   	nop
        }
    }
    return argc;
  100bfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100c01:	c9                   	leave  
  100c02:	c3                   	ret    

00100c03 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100c03:	f3 0f 1e fb          	endbr32 
  100c07:	55                   	push   %ebp
  100c08:	89 e5                	mov    %esp,%ebp
  100c0a:	53                   	push   %ebx
  100c0b:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100c0e:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c11:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c15:	8b 45 08             	mov    0x8(%ebp),%eax
  100c18:	89 04 24             	mov    %eax,(%esp)
  100c1b:	e8 28 ff ff ff       	call   100b48 <parse>
  100c20:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100c23:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c27:	75 0a                	jne    100c33 <runcmd+0x30>
        return 0;
  100c29:	b8 00 00 00 00       	mov    $0x0,%eax
  100c2e:	e9 83 00 00 00       	jmp    100cb6 <runcmd+0xb3>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c33:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c3a:	eb 5a                	jmp    100c96 <runcmd+0x93>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c3c:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c3f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c42:	89 d0                	mov    %edx,%eax
  100c44:	01 c0                	add    %eax,%eax
  100c46:	01 d0                	add    %edx,%eax
  100c48:	c1 e0 02             	shl    $0x2,%eax
  100c4b:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c50:	8b 00                	mov    (%eax),%eax
  100c52:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c56:	89 04 24             	mov    %eax,(%esp)
  100c59:	e8 03 1f 00 00       	call   102b61 <strcmp>
  100c5e:	85 c0                	test   %eax,%eax
  100c60:	75 31                	jne    100c93 <runcmd+0x90>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c62:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c65:	89 d0                	mov    %edx,%eax
  100c67:	01 c0                	add    %eax,%eax
  100c69:	01 d0                	add    %edx,%eax
  100c6b:	c1 e0 02             	shl    $0x2,%eax
  100c6e:	05 08 f0 10 00       	add    $0x10f008,%eax
  100c73:	8b 10                	mov    (%eax),%edx
  100c75:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c78:	83 c0 04             	add    $0x4,%eax
  100c7b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c7e:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100c81:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100c84:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c88:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c8c:	89 1c 24             	mov    %ebx,(%esp)
  100c8f:	ff d2                	call   *%edx
  100c91:	eb 23                	jmp    100cb6 <runcmd+0xb3>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c93:	ff 45 f4             	incl   -0xc(%ebp)
  100c96:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c99:	83 f8 02             	cmp    $0x2,%eax
  100c9c:	76 9e                	jbe    100c3c <runcmd+0x39>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c9e:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100ca1:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ca5:	c7 04 24 b3 38 10 00 	movl   $0x1038b3,(%esp)
  100cac:	e8 d3 f5 ff ff       	call   100284 <cprintf>
    return 0;
  100cb1:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cb6:	83 c4 64             	add    $0x64,%esp
  100cb9:	5b                   	pop    %ebx
  100cba:	5d                   	pop    %ebp
  100cbb:	c3                   	ret    

00100cbc <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100cbc:	f3 0f 1e fb          	endbr32 
  100cc0:	55                   	push   %ebp
  100cc1:	89 e5                	mov    %esp,%ebp
  100cc3:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100cc6:	c7 04 24 cc 38 10 00 	movl   $0x1038cc,(%esp)
  100ccd:	e8 b2 f5 ff ff       	call   100284 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100cd2:	c7 04 24 f4 38 10 00 	movl   $0x1038f4,(%esp)
  100cd9:	e8 a6 f5 ff ff       	call   100284 <cprintf>

    if (tf != NULL) {
  100cde:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100ce2:	74 0b                	je     100cef <kmonitor+0x33>
        print_trapframe(tf);
  100ce4:	8b 45 08             	mov    0x8(%ebp),%eax
  100ce7:	89 04 24             	mov    %eax,(%esp)
  100cea:	e8 fb 0d 00 00       	call   101aea <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100cef:	c7 04 24 19 39 10 00 	movl   $0x103919,(%esp)
  100cf6:	e8 3c f6 ff ff       	call   100337 <readline>
  100cfb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cfe:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d02:	74 eb                	je     100cef <kmonitor+0x33>
            if (runcmd(buf, tf) < 0) {
  100d04:	8b 45 08             	mov    0x8(%ebp),%eax
  100d07:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d0e:	89 04 24             	mov    %eax,(%esp)
  100d11:	e8 ed fe ff ff       	call   100c03 <runcmd>
  100d16:	85 c0                	test   %eax,%eax
  100d18:	78 02                	js     100d1c <kmonitor+0x60>
        if ((buf = readline("K> ")) != NULL) {
  100d1a:	eb d3                	jmp    100cef <kmonitor+0x33>
                break;
  100d1c:	90                   	nop
            }
        }
    }
}
  100d1d:	90                   	nop
  100d1e:	c9                   	leave  
  100d1f:	c3                   	ret    

00100d20 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100d20:	f3 0f 1e fb          	endbr32 
  100d24:	55                   	push   %ebp
  100d25:	89 e5                	mov    %esp,%ebp
  100d27:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d2a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100d31:	eb 3d                	jmp    100d70 <mon_help+0x50>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100d33:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d36:	89 d0                	mov    %edx,%eax
  100d38:	01 c0                	add    %eax,%eax
  100d3a:	01 d0                	add    %edx,%eax
  100d3c:	c1 e0 02             	shl    $0x2,%eax
  100d3f:	05 04 f0 10 00       	add    $0x10f004,%eax
  100d44:	8b 08                	mov    (%eax),%ecx
  100d46:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d49:	89 d0                	mov    %edx,%eax
  100d4b:	01 c0                	add    %eax,%eax
  100d4d:	01 d0                	add    %edx,%eax
  100d4f:	c1 e0 02             	shl    $0x2,%eax
  100d52:	05 00 f0 10 00       	add    $0x10f000,%eax
  100d57:	8b 00                	mov    (%eax),%eax
  100d59:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d61:	c7 04 24 1d 39 10 00 	movl   $0x10391d,(%esp)
  100d68:	e8 17 f5 ff ff       	call   100284 <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d6d:	ff 45 f4             	incl   -0xc(%ebp)
  100d70:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d73:	83 f8 02             	cmp    $0x2,%eax
  100d76:	76 bb                	jbe    100d33 <mon_help+0x13>
    }
    return 0;
  100d78:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d7d:	c9                   	leave  
  100d7e:	c3                   	ret    

00100d7f <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d7f:	f3 0f 1e fb          	endbr32 
  100d83:	55                   	push   %ebp
  100d84:	89 e5                	mov    %esp,%ebp
  100d86:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d89:	e8 b9 fb ff ff       	call   100947 <print_kerninfo>
    return 0;
  100d8e:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d93:	c9                   	leave  
  100d94:	c3                   	ret    

00100d95 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d95:	f3 0f 1e fb          	endbr32 
  100d99:	55                   	push   %ebp
  100d9a:	89 e5                	mov    %esp,%ebp
  100d9c:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d9f:	e8 f5 fc ff ff       	call   100a99 <print_stackframe>
    return 0;
  100da4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100da9:	c9                   	leave  
  100daa:	c3                   	ret    

00100dab <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100dab:	f3 0f 1e fb          	endbr32 
  100daf:	55                   	push   %ebp
  100db0:	89 e5                	mov    %esp,%ebp
  100db2:	83 ec 28             	sub    $0x28,%esp
  100db5:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100dbb:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dbf:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100dc3:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100dc7:	ee                   	out    %al,(%dx)
}
  100dc8:	90                   	nop
  100dc9:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100dcf:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100dd3:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100dd7:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100ddb:	ee                   	out    %al,(%dx)
}
  100ddc:	90                   	nop
  100ddd:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100de3:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100de7:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100deb:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100def:	ee                   	out    %al,(%dx)
}
  100df0:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100df1:	c7 05 08 09 11 00 00 	movl   $0x0,0x110908
  100df8:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100dfb:	c7 04 24 26 39 10 00 	movl   $0x103926,(%esp)
  100e02:	e8 7d f4 ff ff       	call   100284 <cprintf>
    pic_enable(IRQ_TIMER);
  100e07:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100e0e:	e8 31 09 00 00       	call   101744 <pic_enable>
}
  100e13:	90                   	nop
  100e14:	c9                   	leave  
  100e15:	c3                   	ret    

00100e16 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100e16:	f3 0f 1e fb          	endbr32 
  100e1a:	55                   	push   %ebp
  100e1b:	89 e5                	mov    %esp,%ebp
  100e1d:	83 ec 10             	sub    $0x10,%esp
  100e20:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e26:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e2a:	89 c2                	mov    %eax,%edx
  100e2c:	ec                   	in     (%dx),%al
  100e2d:	88 45 f1             	mov    %al,-0xf(%ebp)
  100e30:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100e36:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100e3a:	89 c2                	mov    %eax,%edx
  100e3c:	ec                   	in     (%dx),%al
  100e3d:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e40:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e46:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e4a:	89 c2                	mov    %eax,%edx
  100e4c:	ec                   	in     (%dx),%al
  100e4d:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e50:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e56:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e5a:	89 c2                	mov    %eax,%edx
  100e5c:	ec                   	in     (%dx),%al
  100e5d:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e60:	90                   	nop
  100e61:	c9                   	leave  
  100e62:	c3                   	ret    

00100e63 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e63:	f3 0f 1e fb          	endbr32 
  100e67:	55                   	push   %ebp
  100e68:	89 e5                	mov    %esp,%ebp
  100e6a:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e6d:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e74:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e77:	0f b7 00             	movzwl (%eax),%eax
  100e7a:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e7e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e81:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e86:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e89:	0f b7 00             	movzwl (%eax),%eax
  100e8c:	0f b7 c0             	movzwl %ax,%eax
  100e8f:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100e94:	74 12                	je     100ea8 <cga_init+0x45>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e96:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e9d:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100ea4:	b4 03 
  100ea6:	eb 13                	jmp    100ebb <cga_init+0x58>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100ea8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100eab:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100eaf:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100eb2:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100eb9:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100ebb:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ec2:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100ec6:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eca:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ece:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100ed2:	ee                   	out    %al,(%dx)
}
  100ed3:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100ed4:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100edb:	40                   	inc    %eax
  100edc:	0f b7 c0             	movzwl %ax,%eax
  100edf:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ee3:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100ee7:	89 c2                	mov    %eax,%edx
  100ee9:	ec                   	in     (%dx),%al
  100eea:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100eed:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ef1:	0f b6 c0             	movzbl %al,%eax
  100ef4:	c1 e0 08             	shl    $0x8,%eax
  100ef7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100efa:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f01:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100f05:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f09:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f0d:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f11:	ee                   	out    %al,(%dx)
}
  100f12:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100f13:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f1a:	40                   	inc    %eax
  100f1b:	0f b7 c0             	movzwl %ax,%eax
  100f1e:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f22:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f26:	89 c2                	mov    %eax,%edx
  100f28:	ec                   	in     (%dx),%al
  100f29:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100f2c:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f30:	0f b6 c0             	movzbl %al,%eax
  100f33:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100f36:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f39:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100f3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f41:	0f b7 c0             	movzwl %ax,%eax
  100f44:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100f4a:	90                   	nop
  100f4b:	c9                   	leave  
  100f4c:	c3                   	ret    

00100f4d <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f4d:	f3 0f 1e fb          	endbr32 
  100f51:	55                   	push   %ebp
  100f52:	89 e5                	mov    %esp,%ebp
  100f54:	83 ec 48             	sub    $0x48,%esp
  100f57:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f5d:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f61:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f65:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f69:	ee                   	out    %al,(%dx)
}
  100f6a:	90                   	nop
  100f6b:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f71:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f75:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f79:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f7d:	ee                   	out    %al,(%dx)
}
  100f7e:	90                   	nop
  100f7f:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f85:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f89:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f8d:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f91:	ee                   	out    %al,(%dx)
}
  100f92:	90                   	nop
  100f93:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f99:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f9d:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100fa1:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100fa5:	ee                   	out    %al,(%dx)
}
  100fa6:	90                   	nop
  100fa7:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100fad:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fb1:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100fb5:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100fb9:	ee                   	out    %al,(%dx)
}
  100fba:	90                   	nop
  100fbb:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100fc1:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fc5:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100fc9:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100fcd:	ee                   	out    %al,(%dx)
}
  100fce:	90                   	nop
  100fcf:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100fd5:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fd9:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100fdd:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100fe1:	ee                   	out    %al,(%dx)
}
  100fe2:	90                   	nop
  100fe3:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fe9:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100fed:	89 c2                	mov    %eax,%edx
  100fef:	ec                   	in     (%dx),%al
  100ff0:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100ff3:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100ff7:	3c ff                	cmp    $0xff,%al
  100ff9:	0f 95 c0             	setne  %al
  100ffc:	0f b6 c0             	movzbl %al,%eax
  100fff:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  101004:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10100a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10100e:	89 c2                	mov    %eax,%edx
  101010:	ec                   	in     (%dx),%al
  101011:	88 45 f1             	mov    %al,-0xf(%ebp)
  101014:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10101a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10101e:	89 c2                	mov    %eax,%edx
  101020:	ec                   	in     (%dx),%al
  101021:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  101024:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101029:	85 c0                	test   %eax,%eax
  10102b:	74 0c                	je     101039 <serial_init+0xec>
        pic_enable(IRQ_COM1);
  10102d:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  101034:	e8 0b 07 00 00       	call   101744 <pic_enable>
    }
}
  101039:	90                   	nop
  10103a:	c9                   	leave  
  10103b:	c3                   	ret    

0010103c <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  10103c:	f3 0f 1e fb          	endbr32 
  101040:	55                   	push   %ebp
  101041:	89 e5                	mov    %esp,%ebp
  101043:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101046:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10104d:	eb 08                	jmp    101057 <lpt_putc_sub+0x1b>
        delay();
  10104f:	e8 c2 fd ff ff       	call   100e16 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101054:	ff 45 fc             	incl   -0x4(%ebp)
  101057:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  10105d:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101061:	89 c2                	mov    %eax,%edx
  101063:	ec                   	in     (%dx),%al
  101064:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101067:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10106b:	84 c0                	test   %al,%al
  10106d:	78 09                	js     101078 <lpt_putc_sub+0x3c>
  10106f:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101076:	7e d7                	jle    10104f <lpt_putc_sub+0x13>
    }
    outb(LPTPORT + 0, c);
  101078:	8b 45 08             	mov    0x8(%ebp),%eax
  10107b:	0f b6 c0             	movzbl %al,%eax
  10107e:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  101084:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101087:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10108b:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10108f:	ee                   	out    %al,(%dx)
}
  101090:	90                   	nop
  101091:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  101097:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10109b:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10109f:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1010a3:	ee                   	out    %al,(%dx)
}
  1010a4:	90                   	nop
  1010a5:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  1010ab:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010af:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1010b3:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1010b7:	ee                   	out    %al,(%dx)
}
  1010b8:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  1010b9:	90                   	nop
  1010ba:	c9                   	leave  
  1010bb:	c3                   	ret    

001010bc <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  1010bc:	f3 0f 1e fb          	endbr32 
  1010c0:	55                   	push   %ebp
  1010c1:	89 e5                	mov    %esp,%ebp
  1010c3:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1010c6:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1010ca:	74 0d                	je     1010d9 <lpt_putc+0x1d>
        lpt_putc_sub(c);
  1010cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1010cf:	89 04 24             	mov    %eax,(%esp)
  1010d2:	e8 65 ff ff ff       	call   10103c <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  1010d7:	eb 24                	jmp    1010fd <lpt_putc+0x41>
        lpt_putc_sub('\b');
  1010d9:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010e0:	e8 57 ff ff ff       	call   10103c <lpt_putc_sub>
        lpt_putc_sub(' ');
  1010e5:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1010ec:	e8 4b ff ff ff       	call   10103c <lpt_putc_sub>
        lpt_putc_sub('\b');
  1010f1:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010f8:	e8 3f ff ff ff       	call   10103c <lpt_putc_sub>
}
  1010fd:	90                   	nop
  1010fe:	c9                   	leave  
  1010ff:	c3                   	ret    

00101100 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101100:	f3 0f 1e fb          	endbr32 
  101104:	55                   	push   %ebp
  101105:	89 e5                	mov    %esp,%ebp
  101107:	53                   	push   %ebx
  101108:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10110b:	8b 45 08             	mov    0x8(%ebp),%eax
  10110e:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101113:	85 c0                	test   %eax,%eax
  101115:	75 07                	jne    10111e <cga_putc+0x1e>
        c |= 0x0700;
  101117:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  10111e:	8b 45 08             	mov    0x8(%ebp),%eax
  101121:	0f b6 c0             	movzbl %al,%eax
  101124:	83 f8 0d             	cmp    $0xd,%eax
  101127:	74 72                	je     10119b <cga_putc+0x9b>
  101129:	83 f8 0d             	cmp    $0xd,%eax
  10112c:	0f 8f a3 00 00 00    	jg     1011d5 <cga_putc+0xd5>
  101132:	83 f8 08             	cmp    $0x8,%eax
  101135:	74 0a                	je     101141 <cga_putc+0x41>
  101137:	83 f8 0a             	cmp    $0xa,%eax
  10113a:	74 4c                	je     101188 <cga_putc+0x88>
  10113c:	e9 94 00 00 00       	jmp    1011d5 <cga_putc+0xd5>
    case '\b':
        if (crt_pos > 0) {
  101141:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101148:	85 c0                	test   %eax,%eax
  10114a:	0f 84 af 00 00 00    	je     1011ff <cga_putc+0xff>
            crt_pos --;
  101150:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101157:	48                   	dec    %eax
  101158:	0f b7 c0             	movzwl %ax,%eax
  10115b:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101161:	8b 45 08             	mov    0x8(%ebp),%eax
  101164:	98                   	cwtl   
  101165:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10116a:	98                   	cwtl   
  10116b:	83 c8 20             	or     $0x20,%eax
  10116e:	98                   	cwtl   
  10116f:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  101175:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  10117c:	01 c9                	add    %ecx,%ecx
  10117e:	01 ca                	add    %ecx,%edx
  101180:	0f b7 c0             	movzwl %ax,%eax
  101183:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101186:	eb 77                	jmp    1011ff <cga_putc+0xff>
    case '\n':
        crt_pos += CRT_COLS;
  101188:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10118f:	83 c0 50             	add    $0x50,%eax
  101192:	0f b7 c0             	movzwl %ax,%eax
  101195:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  10119b:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  1011a2:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  1011a9:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  1011ae:	89 c8                	mov    %ecx,%eax
  1011b0:	f7 e2                	mul    %edx
  1011b2:	c1 ea 06             	shr    $0x6,%edx
  1011b5:	89 d0                	mov    %edx,%eax
  1011b7:	c1 e0 02             	shl    $0x2,%eax
  1011ba:	01 d0                	add    %edx,%eax
  1011bc:	c1 e0 04             	shl    $0x4,%eax
  1011bf:	29 c1                	sub    %eax,%ecx
  1011c1:	89 c8                	mov    %ecx,%eax
  1011c3:	0f b7 c0             	movzwl %ax,%eax
  1011c6:	29 c3                	sub    %eax,%ebx
  1011c8:	89 d8                	mov    %ebx,%eax
  1011ca:	0f b7 c0             	movzwl %ax,%eax
  1011cd:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  1011d3:	eb 2b                	jmp    101200 <cga_putc+0x100>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1011d5:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  1011db:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011e2:	8d 50 01             	lea    0x1(%eax),%edx
  1011e5:	0f b7 d2             	movzwl %dx,%edx
  1011e8:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  1011ef:	01 c0                	add    %eax,%eax
  1011f1:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  1011f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1011f7:	0f b7 c0             	movzwl %ax,%eax
  1011fa:	66 89 02             	mov    %ax,(%edx)
        break;
  1011fd:	eb 01                	jmp    101200 <cga_putc+0x100>
        break;
  1011ff:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101200:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101207:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  10120c:	76 5d                	jbe    10126b <cga_putc+0x16b>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10120e:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101213:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101219:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  10121e:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101225:	00 
  101226:	89 54 24 04          	mov    %edx,0x4(%esp)
  10122a:	89 04 24             	mov    %eax,(%esp)
  10122d:	e8 d8 1b 00 00       	call   102e0a <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101232:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101239:	eb 14                	jmp    10124f <cga_putc+0x14f>
            crt_buf[i] = 0x0700 | ' ';
  10123b:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101240:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101243:	01 d2                	add    %edx,%edx
  101245:	01 d0                	add    %edx,%eax
  101247:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10124c:	ff 45 f4             	incl   -0xc(%ebp)
  10124f:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101256:	7e e3                	jle    10123b <cga_putc+0x13b>
        }
        crt_pos -= CRT_COLS;
  101258:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10125f:	83 e8 50             	sub    $0x50,%eax
  101262:	0f b7 c0             	movzwl %ax,%eax
  101265:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  10126b:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  101272:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101276:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10127a:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10127e:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101282:	ee                   	out    %al,(%dx)
}
  101283:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  101284:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10128b:	c1 e8 08             	shr    $0x8,%eax
  10128e:	0f b7 c0             	movzwl %ax,%eax
  101291:	0f b6 c0             	movzbl %al,%eax
  101294:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  10129b:	42                   	inc    %edx
  10129c:	0f b7 d2             	movzwl %dx,%edx
  10129f:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1012a3:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012a6:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1012aa:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1012ae:	ee                   	out    %al,(%dx)
}
  1012af:	90                   	nop
    outb(addr_6845, 15);
  1012b0:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  1012b7:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1012bb:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012bf:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1012c3:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1012c7:	ee                   	out    %al,(%dx)
}
  1012c8:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  1012c9:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1012d0:	0f b6 c0             	movzbl %al,%eax
  1012d3:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012da:	42                   	inc    %edx
  1012db:	0f b7 d2             	movzwl %dx,%edx
  1012de:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  1012e2:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012e5:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1012e9:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1012ed:	ee                   	out    %al,(%dx)
}
  1012ee:	90                   	nop
}
  1012ef:	90                   	nop
  1012f0:	83 c4 34             	add    $0x34,%esp
  1012f3:	5b                   	pop    %ebx
  1012f4:	5d                   	pop    %ebp
  1012f5:	c3                   	ret    

001012f6 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  1012f6:	f3 0f 1e fb          	endbr32 
  1012fa:	55                   	push   %ebp
  1012fb:	89 e5                	mov    %esp,%ebp
  1012fd:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101300:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101307:	eb 08                	jmp    101311 <serial_putc_sub+0x1b>
        delay();
  101309:	e8 08 fb ff ff       	call   100e16 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10130e:	ff 45 fc             	incl   -0x4(%ebp)
  101311:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101317:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10131b:	89 c2                	mov    %eax,%edx
  10131d:	ec                   	in     (%dx),%al
  10131e:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101321:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101325:	0f b6 c0             	movzbl %al,%eax
  101328:	83 e0 20             	and    $0x20,%eax
  10132b:	85 c0                	test   %eax,%eax
  10132d:	75 09                	jne    101338 <serial_putc_sub+0x42>
  10132f:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101336:	7e d1                	jle    101309 <serial_putc_sub+0x13>
    }
    outb(COM1 + COM_TX, c);
  101338:	8b 45 08             	mov    0x8(%ebp),%eax
  10133b:	0f b6 c0             	movzbl %al,%eax
  10133e:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101344:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101347:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10134b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10134f:	ee                   	out    %al,(%dx)
}
  101350:	90                   	nop
}
  101351:	90                   	nop
  101352:	c9                   	leave  
  101353:	c3                   	ret    

00101354 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101354:	f3 0f 1e fb          	endbr32 
  101358:	55                   	push   %ebp
  101359:	89 e5                	mov    %esp,%ebp
  10135b:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10135e:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101362:	74 0d                	je     101371 <serial_putc+0x1d>
        serial_putc_sub(c);
  101364:	8b 45 08             	mov    0x8(%ebp),%eax
  101367:	89 04 24             	mov    %eax,(%esp)
  10136a:	e8 87 ff ff ff       	call   1012f6 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  10136f:	eb 24                	jmp    101395 <serial_putc+0x41>
        serial_putc_sub('\b');
  101371:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101378:	e8 79 ff ff ff       	call   1012f6 <serial_putc_sub>
        serial_putc_sub(' ');
  10137d:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101384:	e8 6d ff ff ff       	call   1012f6 <serial_putc_sub>
        serial_putc_sub('\b');
  101389:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101390:	e8 61 ff ff ff       	call   1012f6 <serial_putc_sub>
}
  101395:	90                   	nop
  101396:	c9                   	leave  
  101397:	c3                   	ret    

00101398 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101398:	f3 0f 1e fb          	endbr32 
  10139c:	55                   	push   %ebp
  10139d:	89 e5                	mov    %esp,%ebp
  10139f:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1013a2:	eb 33                	jmp    1013d7 <cons_intr+0x3f>
        if (c != 0) {
  1013a4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1013a8:	74 2d                	je     1013d7 <cons_intr+0x3f>
            cons.buf[cons.wpos ++] = c;
  1013aa:	a1 84 00 11 00       	mov    0x110084,%eax
  1013af:	8d 50 01             	lea    0x1(%eax),%edx
  1013b2:	89 15 84 00 11 00    	mov    %edx,0x110084
  1013b8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1013bb:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1013c1:	a1 84 00 11 00       	mov    0x110084,%eax
  1013c6:	3d 00 02 00 00       	cmp    $0x200,%eax
  1013cb:	75 0a                	jne    1013d7 <cons_intr+0x3f>
                cons.wpos = 0;
  1013cd:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  1013d4:	00 00 00 
    while ((c = (*proc)()) != -1) {
  1013d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1013da:	ff d0                	call   *%eax
  1013dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1013df:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1013e3:	75 bf                	jne    1013a4 <cons_intr+0xc>
            }
        }
    }
}
  1013e5:	90                   	nop
  1013e6:	90                   	nop
  1013e7:	c9                   	leave  
  1013e8:	c3                   	ret    

001013e9 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  1013e9:	f3 0f 1e fb          	endbr32 
  1013ed:	55                   	push   %ebp
  1013ee:	89 e5                	mov    %esp,%ebp
  1013f0:	83 ec 10             	sub    $0x10,%esp
  1013f3:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013f9:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1013fd:	89 c2                	mov    %eax,%edx
  1013ff:	ec                   	in     (%dx),%al
  101400:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101403:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101407:	0f b6 c0             	movzbl %al,%eax
  10140a:	83 e0 01             	and    $0x1,%eax
  10140d:	85 c0                	test   %eax,%eax
  10140f:	75 07                	jne    101418 <serial_proc_data+0x2f>
        return -1;
  101411:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101416:	eb 2a                	jmp    101442 <serial_proc_data+0x59>
  101418:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10141e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101422:	89 c2                	mov    %eax,%edx
  101424:	ec                   	in     (%dx),%al
  101425:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101428:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10142c:	0f b6 c0             	movzbl %al,%eax
  10142f:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101432:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101436:	75 07                	jne    10143f <serial_proc_data+0x56>
        c = '\b';
  101438:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  10143f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101442:	c9                   	leave  
  101443:	c3                   	ret    

00101444 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101444:	f3 0f 1e fb          	endbr32 
  101448:	55                   	push   %ebp
  101449:	89 e5                	mov    %esp,%ebp
  10144b:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  10144e:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101453:	85 c0                	test   %eax,%eax
  101455:	74 0c                	je     101463 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  101457:	c7 04 24 e9 13 10 00 	movl   $0x1013e9,(%esp)
  10145e:	e8 35 ff ff ff       	call   101398 <cons_intr>
    }
}
  101463:	90                   	nop
  101464:	c9                   	leave  
  101465:	c3                   	ret    

00101466 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101466:	f3 0f 1e fb          	endbr32 
  10146a:	55                   	push   %ebp
  10146b:	89 e5                	mov    %esp,%ebp
  10146d:	83 ec 38             	sub    $0x38,%esp
  101470:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101476:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101479:	89 c2                	mov    %eax,%edx
  10147b:	ec                   	in     (%dx),%al
  10147c:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  10147f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  101483:	0f b6 c0             	movzbl %al,%eax
  101486:	83 e0 01             	and    $0x1,%eax
  101489:	85 c0                	test   %eax,%eax
  10148b:	75 0a                	jne    101497 <kbd_proc_data+0x31>
        return -1;
  10148d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101492:	e9 56 01 00 00       	jmp    1015ed <kbd_proc_data+0x187>
  101497:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10149d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1014a0:	89 c2                	mov    %eax,%edx
  1014a2:	ec                   	in     (%dx),%al
  1014a3:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1014a6:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1014aa:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1014ad:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1014b1:	75 17                	jne    1014ca <kbd_proc_data+0x64>
        // E0 escape character
        shift |= E0ESC;
  1014b3:	a1 88 00 11 00       	mov    0x110088,%eax
  1014b8:	83 c8 40             	or     $0x40,%eax
  1014bb:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  1014c0:	b8 00 00 00 00       	mov    $0x0,%eax
  1014c5:	e9 23 01 00 00       	jmp    1015ed <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  1014ca:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ce:	84 c0                	test   %al,%al
  1014d0:	79 45                	jns    101517 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1014d2:	a1 88 00 11 00       	mov    0x110088,%eax
  1014d7:	83 e0 40             	and    $0x40,%eax
  1014da:	85 c0                	test   %eax,%eax
  1014dc:	75 08                	jne    1014e6 <kbd_proc_data+0x80>
  1014de:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014e2:	24 7f                	and    $0x7f,%al
  1014e4:	eb 04                	jmp    1014ea <kbd_proc_data+0x84>
  1014e6:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014ea:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  1014ed:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014f1:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  1014f8:	0c 40                	or     $0x40,%al
  1014fa:	0f b6 c0             	movzbl %al,%eax
  1014fd:	f7 d0                	not    %eax
  1014ff:	89 c2                	mov    %eax,%edx
  101501:	a1 88 00 11 00       	mov    0x110088,%eax
  101506:	21 d0                	and    %edx,%eax
  101508:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  10150d:	b8 00 00 00 00       	mov    $0x0,%eax
  101512:	e9 d6 00 00 00       	jmp    1015ed <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101517:	a1 88 00 11 00       	mov    0x110088,%eax
  10151c:	83 e0 40             	and    $0x40,%eax
  10151f:	85 c0                	test   %eax,%eax
  101521:	74 11                	je     101534 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101523:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101527:	a1 88 00 11 00       	mov    0x110088,%eax
  10152c:	83 e0 bf             	and    $0xffffffbf,%eax
  10152f:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  101534:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101538:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  10153f:	0f b6 d0             	movzbl %al,%edx
  101542:	a1 88 00 11 00       	mov    0x110088,%eax
  101547:	09 d0                	or     %edx,%eax
  101549:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  10154e:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101552:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  101559:	0f b6 d0             	movzbl %al,%edx
  10155c:	a1 88 00 11 00       	mov    0x110088,%eax
  101561:	31 d0                	xor    %edx,%eax
  101563:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  101568:	a1 88 00 11 00       	mov    0x110088,%eax
  10156d:	83 e0 03             	and    $0x3,%eax
  101570:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  101577:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10157b:	01 d0                	add    %edx,%eax
  10157d:	0f b6 00             	movzbl (%eax),%eax
  101580:	0f b6 c0             	movzbl %al,%eax
  101583:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  101586:	a1 88 00 11 00       	mov    0x110088,%eax
  10158b:	83 e0 08             	and    $0x8,%eax
  10158e:	85 c0                	test   %eax,%eax
  101590:	74 22                	je     1015b4 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  101592:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  101596:	7e 0c                	jle    1015a4 <kbd_proc_data+0x13e>
  101598:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  10159c:	7f 06                	jg     1015a4 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  10159e:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1015a2:	eb 10                	jmp    1015b4 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1015a4:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1015a8:	7e 0a                	jle    1015b4 <kbd_proc_data+0x14e>
  1015aa:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1015ae:	7f 04                	jg     1015b4 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1015b0:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1015b4:	a1 88 00 11 00       	mov    0x110088,%eax
  1015b9:	f7 d0                	not    %eax
  1015bb:	83 e0 06             	and    $0x6,%eax
  1015be:	85 c0                	test   %eax,%eax
  1015c0:	75 28                	jne    1015ea <kbd_proc_data+0x184>
  1015c2:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1015c9:	75 1f                	jne    1015ea <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  1015cb:	c7 04 24 41 39 10 00 	movl   $0x103941,(%esp)
  1015d2:	e8 ad ec ff ff       	call   100284 <cprintf>
  1015d7:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1015dd:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1015e1:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1015e5:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1015e8:	ee                   	out    %al,(%dx)
}
  1015e9:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  1015ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1015ed:	c9                   	leave  
  1015ee:	c3                   	ret    

001015ef <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  1015ef:	f3 0f 1e fb          	endbr32 
  1015f3:	55                   	push   %ebp
  1015f4:	89 e5                	mov    %esp,%ebp
  1015f6:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  1015f9:	c7 04 24 66 14 10 00 	movl   $0x101466,(%esp)
  101600:	e8 93 fd ff ff       	call   101398 <cons_intr>
}
  101605:	90                   	nop
  101606:	c9                   	leave  
  101607:	c3                   	ret    

00101608 <kbd_init>:

static void
kbd_init(void) {
  101608:	f3 0f 1e fb          	endbr32 
  10160c:	55                   	push   %ebp
  10160d:	89 e5                	mov    %esp,%ebp
  10160f:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101612:	e8 d8 ff ff ff       	call   1015ef <kbd_intr>
    pic_enable(IRQ_KBD);
  101617:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10161e:	e8 21 01 00 00       	call   101744 <pic_enable>
}
  101623:	90                   	nop
  101624:	c9                   	leave  
  101625:	c3                   	ret    

00101626 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101626:	f3 0f 1e fb          	endbr32 
  10162a:	55                   	push   %ebp
  10162b:	89 e5                	mov    %esp,%ebp
  10162d:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101630:	e8 2e f8 ff ff       	call   100e63 <cga_init>
    serial_init();
  101635:	e8 13 f9 ff ff       	call   100f4d <serial_init>
    kbd_init();
  10163a:	e8 c9 ff ff ff       	call   101608 <kbd_init>
    if (!serial_exists) {
  10163f:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101644:	85 c0                	test   %eax,%eax
  101646:	75 0c                	jne    101654 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  101648:	c7 04 24 4d 39 10 00 	movl   $0x10394d,(%esp)
  10164f:	e8 30 ec ff ff       	call   100284 <cprintf>
    }
}
  101654:	90                   	nop
  101655:	c9                   	leave  
  101656:	c3                   	ret    

00101657 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101657:	f3 0f 1e fb          	endbr32 
  10165b:	55                   	push   %ebp
  10165c:	89 e5                	mov    %esp,%ebp
  10165e:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101661:	8b 45 08             	mov    0x8(%ebp),%eax
  101664:	89 04 24             	mov    %eax,(%esp)
  101667:	e8 50 fa ff ff       	call   1010bc <lpt_putc>
    cga_putc(c);
  10166c:	8b 45 08             	mov    0x8(%ebp),%eax
  10166f:	89 04 24             	mov    %eax,(%esp)
  101672:	e8 89 fa ff ff       	call   101100 <cga_putc>
    serial_putc(c);
  101677:	8b 45 08             	mov    0x8(%ebp),%eax
  10167a:	89 04 24             	mov    %eax,(%esp)
  10167d:	e8 d2 fc ff ff       	call   101354 <serial_putc>
}
  101682:	90                   	nop
  101683:	c9                   	leave  
  101684:	c3                   	ret    

00101685 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  101685:	f3 0f 1e fb          	endbr32 
  101689:	55                   	push   %ebp
  10168a:	89 e5                	mov    %esp,%ebp
  10168c:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  10168f:	e8 b0 fd ff ff       	call   101444 <serial_intr>
    kbd_intr();
  101694:	e8 56 ff ff ff       	call   1015ef <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  101699:	8b 15 80 00 11 00    	mov    0x110080,%edx
  10169f:	a1 84 00 11 00       	mov    0x110084,%eax
  1016a4:	39 c2                	cmp    %eax,%edx
  1016a6:	74 36                	je     1016de <cons_getc+0x59>
        c = cons.buf[cons.rpos ++];
  1016a8:	a1 80 00 11 00       	mov    0x110080,%eax
  1016ad:	8d 50 01             	lea    0x1(%eax),%edx
  1016b0:	89 15 80 00 11 00    	mov    %edx,0x110080
  1016b6:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  1016bd:	0f b6 c0             	movzbl %al,%eax
  1016c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1016c3:	a1 80 00 11 00       	mov    0x110080,%eax
  1016c8:	3d 00 02 00 00       	cmp    $0x200,%eax
  1016cd:	75 0a                	jne    1016d9 <cons_getc+0x54>
            cons.rpos = 0;
  1016cf:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  1016d6:	00 00 00 
        }
        return c;
  1016d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1016dc:	eb 05                	jmp    1016e3 <cons_getc+0x5e>
    }
    return 0;
  1016de:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1016e3:	c9                   	leave  
  1016e4:	c3                   	ret    

001016e5 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  1016e5:	f3 0f 1e fb          	endbr32 
  1016e9:	55                   	push   %ebp
  1016ea:	89 e5                	mov    %esp,%ebp
  1016ec:	83 ec 14             	sub    $0x14,%esp
  1016ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1016f2:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  1016f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1016f9:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  1016ff:	a1 8c 00 11 00       	mov    0x11008c,%eax
  101704:	85 c0                	test   %eax,%eax
  101706:	74 39                	je     101741 <pic_setmask+0x5c>
        outb(IO_PIC1 + 1, mask);
  101708:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10170b:	0f b6 c0             	movzbl %al,%eax
  10170e:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101714:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101717:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10171b:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10171f:	ee                   	out    %al,(%dx)
}
  101720:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  101721:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101725:	c1 e8 08             	shr    $0x8,%eax
  101728:	0f b7 c0             	movzwl %ax,%eax
  10172b:	0f b6 c0             	movzbl %al,%eax
  10172e:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101734:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101737:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10173b:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10173f:	ee                   	out    %al,(%dx)
}
  101740:	90                   	nop
    }
}
  101741:	90                   	nop
  101742:	c9                   	leave  
  101743:	c3                   	ret    

00101744 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101744:	f3 0f 1e fb          	endbr32 
  101748:	55                   	push   %ebp
  101749:	89 e5                	mov    %esp,%ebp
  10174b:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10174e:	8b 45 08             	mov    0x8(%ebp),%eax
  101751:	ba 01 00 00 00       	mov    $0x1,%edx
  101756:	88 c1                	mov    %al,%cl
  101758:	d3 e2                	shl    %cl,%edx
  10175a:	89 d0                	mov    %edx,%eax
  10175c:	98                   	cwtl   
  10175d:	f7 d0                	not    %eax
  10175f:	0f bf d0             	movswl %ax,%edx
  101762:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101769:	98                   	cwtl   
  10176a:	21 d0                	and    %edx,%eax
  10176c:	98                   	cwtl   
  10176d:	0f b7 c0             	movzwl %ax,%eax
  101770:	89 04 24             	mov    %eax,(%esp)
  101773:	e8 6d ff ff ff       	call   1016e5 <pic_setmask>
}
  101778:	90                   	nop
  101779:	c9                   	leave  
  10177a:	c3                   	ret    

0010177b <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10177b:	f3 0f 1e fb          	endbr32 
  10177f:	55                   	push   %ebp
  101780:	89 e5                	mov    %esp,%ebp
  101782:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  101785:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  10178c:	00 00 00 
  10178f:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  101795:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101799:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  10179d:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017a1:	ee                   	out    %al,(%dx)
}
  1017a2:	90                   	nop
  1017a3:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1017a9:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017ad:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017b1:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017b5:	ee                   	out    %al,(%dx)
}
  1017b6:	90                   	nop
  1017b7:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1017bd:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017c1:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1017c5:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017c9:	ee                   	out    %al,(%dx)
}
  1017ca:	90                   	nop
  1017cb:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  1017d1:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017d5:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1017d9:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1017dd:	ee                   	out    %al,(%dx)
}
  1017de:	90                   	nop
  1017df:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  1017e5:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017e9:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  1017ed:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  1017f1:	ee                   	out    %al,(%dx)
}
  1017f2:	90                   	nop
  1017f3:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  1017f9:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017fd:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101801:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101805:	ee                   	out    %al,(%dx)
}
  101806:	90                   	nop
  101807:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  10180d:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101811:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101815:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101819:	ee                   	out    %al,(%dx)
}
  10181a:	90                   	nop
  10181b:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101821:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101825:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101829:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10182d:	ee                   	out    %al,(%dx)
}
  10182e:	90                   	nop
  10182f:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101835:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101839:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10183d:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101841:	ee                   	out    %al,(%dx)
}
  101842:	90                   	nop
  101843:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  101849:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10184d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101851:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101855:	ee                   	out    %al,(%dx)
}
  101856:	90                   	nop
  101857:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  10185d:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101861:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101865:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101869:	ee                   	out    %al,(%dx)
}
  10186a:	90                   	nop
  10186b:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101871:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101875:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101879:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10187d:	ee                   	out    %al,(%dx)
}
  10187e:	90                   	nop
  10187f:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  101885:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101889:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10188d:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101891:	ee                   	out    %al,(%dx)
}
  101892:	90                   	nop
  101893:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  101899:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10189d:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1018a1:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1018a5:	ee                   	out    %al,(%dx)
}
  1018a6:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1018a7:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018ae:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1018b3:	74 0f                	je     1018c4 <pic_init+0x149>
        pic_setmask(irq_mask);
  1018b5:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018bc:	89 04 24             	mov    %eax,(%esp)
  1018bf:	e8 21 fe ff ff       	call   1016e5 <pic_setmask>
    }
}
  1018c4:	90                   	nop
  1018c5:	c9                   	leave  
  1018c6:	c3                   	ret    

001018c7 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1018c7:	f3 0f 1e fb          	endbr32 
  1018cb:	55                   	push   %ebp
  1018cc:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1018ce:	fb                   	sti    
}
  1018cf:	90                   	nop
    sti();
}
  1018d0:	90                   	nop
  1018d1:	5d                   	pop    %ebp
  1018d2:	c3                   	ret    

001018d3 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1018d3:	f3 0f 1e fb          	endbr32 
  1018d7:	55                   	push   %ebp
  1018d8:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  1018da:	fa                   	cli    
}
  1018db:	90                   	nop
    cli();
}
  1018dc:	90                   	nop
  1018dd:	5d                   	pop    %ebp
  1018de:	c3                   	ret    

001018df <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1018df:	f3 0f 1e fb          	endbr32 
  1018e3:	55                   	push   %ebp
  1018e4:	89 e5                	mov    %esp,%ebp
  1018e6:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1018e9:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  1018f0:	00 
  1018f1:	c7 04 24 80 39 10 00 	movl   $0x103980,(%esp)
  1018f8:	e8 87 e9 ff ff       	call   100284 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  1018fd:	c7 04 24 8a 39 10 00 	movl   $0x10398a,(%esp)
  101904:	e8 7b e9 ff ff       	call   100284 <cprintf>
    panic("EOT: kernel seems ok.");
  101909:	c7 44 24 08 98 39 10 	movl   $0x103998,0x8(%esp)
  101910:	00 
  101911:	c7 44 24 04 12 00 00 	movl   $0x12,0x4(%esp)
  101918:	00 
  101919:	c7 04 24 ae 39 10 00 	movl   $0x1039ae,(%esp)
  101920:	e8 cb ea ff ff       	call   1003f0 <__panic>

00101925 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101925:	f3 0f 1e fb          	endbr32 
  101929:	55                   	push   %ebp
  10192a:	89 e5                	mov    %esp,%ebp
  10192c:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
    extern uintptr_t __vectors[];
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  10192f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101936:	e9 c4 00 00 00       	jmp    1019ff <idt_init+0xda>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  10193b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10193e:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  101945:	0f b7 d0             	movzwl %ax,%edx
  101948:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10194b:	66 89 14 c5 a0 00 11 	mov    %dx,0x1100a0(,%eax,8)
  101952:	00 
  101953:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101956:	66 c7 04 c5 a2 00 11 	movw   $0x8,0x1100a2(,%eax,8)
  10195d:	00 08 00 
  101960:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101963:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  10196a:	00 
  10196b:	80 e2 e0             	and    $0xe0,%dl
  10196e:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  101975:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101978:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  10197f:	00 
  101980:	80 e2 1f             	and    $0x1f,%dl
  101983:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  10198a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10198d:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  101994:	00 
  101995:	80 e2 f0             	and    $0xf0,%dl
  101998:	80 ca 0e             	or     $0xe,%dl
  10199b:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019a5:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019ac:	00 
  1019ad:	80 e2 ef             	and    $0xef,%dl
  1019b0:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019ba:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019c1:	00 
  1019c2:	80 e2 9f             	and    $0x9f,%dl
  1019c5:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019cf:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019d6:	00 
  1019d7:	80 ca 80             	or     $0x80,%dl
  1019da:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019e4:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  1019eb:	c1 e8 10             	shr    $0x10,%eax
  1019ee:	0f b7 d0             	movzwl %ax,%edx
  1019f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019f4:	66 89 14 c5 a6 00 11 	mov    %dx,0x1100a6(,%eax,8)
  1019fb:	00 
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i ++) {
  1019fc:	ff 45 fc             	incl   -0x4(%ebp)
  1019ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101a02:	3d ff 00 00 00       	cmp    $0xff,%eax
  101a07:	0f 86 2e ff ff ff    	jbe    10193b <idt_init+0x16>
    }
	// set for switch from user to kernel
    SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  101a0d:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  101a12:	0f b7 c0             	movzwl %ax,%eax
  101a15:	66 a3 68 04 11 00    	mov    %ax,0x110468
  101a1b:	66 c7 05 6a 04 11 00 	movw   $0x8,0x11046a
  101a22:	08 00 
  101a24:	0f b6 05 6c 04 11 00 	movzbl 0x11046c,%eax
  101a2b:	24 e0                	and    $0xe0,%al
  101a2d:	a2 6c 04 11 00       	mov    %al,0x11046c
  101a32:	0f b6 05 6c 04 11 00 	movzbl 0x11046c,%eax
  101a39:	24 1f                	and    $0x1f,%al
  101a3b:	a2 6c 04 11 00       	mov    %al,0x11046c
  101a40:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a47:	24 f0                	and    $0xf0,%al
  101a49:	0c 0e                	or     $0xe,%al
  101a4b:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a50:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a57:	24 ef                	and    $0xef,%al
  101a59:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a5e:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a65:	0c 60                	or     $0x60,%al
  101a67:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a6c:	0f b6 05 6d 04 11 00 	movzbl 0x11046d,%eax
  101a73:	0c 80                	or     $0x80,%al
  101a75:	a2 6d 04 11 00       	mov    %al,0x11046d
  101a7a:	a1 c4 f7 10 00       	mov    0x10f7c4,%eax
  101a7f:	c1 e8 10             	shr    $0x10,%eax
  101a82:	0f b7 c0             	movzwl %ax,%eax
  101a85:	66 a3 6e 04 11 00    	mov    %ax,0x11046e
  101a8b:	c7 45 f8 60 f5 10 00 	movl   $0x10f560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  101a92:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101a95:	0f 01 18             	lidtl  (%eax)
}
  101a98:	90                   	nop
	// load the IDT
    lidt(&idt_pd);
}
  101a99:	90                   	nop
  101a9a:	c9                   	leave  
  101a9b:	c3                   	ret    

00101a9c <trapname>:

static const char *
trapname(int trapno) {
  101a9c:	f3 0f 1e fb          	endbr32 
  101aa0:	55                   	push   %ebp
  101aa1:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101aa3:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa6:	83 f8 13             	cmp    $0x13,%eax
  101aa9:	77 0c                	ja     101ab7 <trapname+0x1b>
        return excnames[trapno];
  101aab:	8b 45 08             	mov    0x8(%ebp),%eax
  101aae:	8b 04 85 00 3d 10 00 	mov    0x103d00(,%eax,4),%eax
  101ab5:	eb 18                	jmp    101acf <trapname+0x33>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101ab7:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101abb:	7e 0d                	jle    101aca <trapname+0x2e>
  101abd:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101ac1:	7f 07                	jg     101aca <trapname+0x2e>
        return "Hardware Interrupt";
  101ac3:	b8 bf 39 10 00       	mov    $0x1039bf,%eax
  101ac8:	eb 05                	jmp    101acf <trapname+0x33>
    }
    return "(unknown trap)";
  101aca:	b8 d2 39 10 00       	mov    $0x1039d2,%eax
}
  101acf:	5d                   	pop    %ebp
  101ad0:	c3                   	ret    

00101ad1 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101ad1:	f3 0f 1e fb          	endbr32 
  101ad5:	55                   	push   %ebp
  101ad6:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101ad8:	8b 45 08             	mov    0x8(%ebp),%eax
  101adb:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101adf:	83 f8 08             	cmp    $0x8,%eax
  101ae2:	0f 94 c0             	sete   %al
  101ae5:	0f b6 c0             	movzbl %al,%eax
}
  101ae8:	5d                   	pop    %ebp
  101ae9:	c3                   	ret    

00101aea <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101aea:	f3 0f 1e fb          	endbr32 
  101aee:	55                   	push   %ebp
  101aef:	89 e5                	mov    %esp,%ebp
  101af1:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101af4:	8b 45 08             	mov    0x8(%ebp),%eax
  101af7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101afb:	c7 04 24 13 3a 10 00 	movl   $0x103a13,(%esp)
  101b02:	e8 7d e7 ff ff       	call   100284 <cprintf>
    print_regs(&tf->tf_regs);
  101b07:	8b 45 08             	mov    0x8(%ebp),%eax
  101b0a:	89 04 24             	mov    %eax,(%esp)
  101b0d:	e8 8d 01 00 00       	call   101c9f <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101b12:	8b 45 08             	mov    0x8(%ebp),%eax
  101b15:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101b19:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b1d:	c7 04 24 24 3a 10 00 	movl   $0x103a24,(%esp)
  101b24:	e8 5b e7 ff ff       	call   100284 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101b29:	8b 45 08             	mov    0x8(%ebp),%eax
  101b2c:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101b30:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b34:	c7 04 24 37 3a 10 00 	movl   $0x103a37,(%esp)
  101b3b:	e8 44 e7 ff ff       	call   100284 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101b40:	8b 45 08             	mov    0x8(%ebp),%eax
  101b43:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101b47:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b4b:	c7 04 24 4a 3a 10 00 	movl   $0x103a4a,(%esp)
  101b52:	e8 2d e7 ff ff       	call   100284 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101b57:	8b 45 08             	mov    0x8(%ebp),%eax
  101b5a:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101b5e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b62:	c7 04 24 5d 3a 10 00 	movl   $0x103a5d,(%esp)
  101b69:	e8 16 e7 ff ff       	call   100284 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101b6e:	8b 45 08             	mov    0x8(%ebp),%eax
  101b71:	8b 40 30             	mov    0x30(%eax),%eax
  101b74:	89 04 24             	mov    %eax,(%esp)
  101b77:	e8 20 ff ff ff       	call   101a9c <trapname>
  101b7c:	8b 55 08             	mov    0x8(%ebp),%edx
  101b7f:	8b 52 30             	mov    0x30(%edx),%edx
  101b82:	89 44 24 08          	mov    %eax,0x8(%esp)
  101b86:	89 54 24 04          	mov    %edx,0x4(%esp)
  101b8a:	c7 04 24 70 3a 10 00 	movl   $0x103a70,(%esp)
  101b91:	e8 ee e6 ff ff       	call   100284 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101b96:	8b 45 08             	mov    0x8(%ebp),%eax
  101b99:	8b 40 34             	mov    0x34(%eax),%eax
  101b9c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ba0:	c7 04 24 82 3a 10 00 	movl   $0x103a82,(%esp)
  101ba7:	e8 d8 e6 ff ff       	call   100284 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101bac:	8b 45 08             	mov    0x8(%ebp),%eax
  101baf:	8b 40 38             	mov    0x38(%eax),%eax
  101bb2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb6:	c7 04 24 91 3a 10 00 	movl   $0x103a91,(%esp)
  101bbd:	e8 c2 e6 ff ff       	call   100284 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101bc2:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc5:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101bc9:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bcd:	c7 04 24 a0 3a 10 00 	movl   $0x103aa0,(%esp)
  101bd4:	e8 ab e6 ff ff       	call   100284 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101bd9:	8b 45 08             	mov    0x8(%ebp),%eax
  101bdc:	8b 40 40             	mov    0x40(%eax),%eax
  101bdf:	89 44 24 04          	mov    %eax,0x4(%esp)
  101be3:	c7 04 24 b3 3a 10 00 	movl   $0x103ab3,(%esp)
  101bea:	e8 95 e6 ff ff       	call   100284 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101bef:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101bf6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101bfd:	eb 3d                	jmp    101c3c <print_trapframe+0x152>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101bff:	8b 45 08             	mov    0x8(%ebp),%eax
  101c02:	8b 50 40             	mov    0x40(%eax),%edx
  101c05:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101c08:	21 d0                	and    %edx,%eax
  101c0a:	85 c0                	test   %eax,%eax
  101c0c:	74 28                	je     101c36 <print_trapframe+0x14c>
  101c0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c11:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101c18:	85 c0                	test   %eax,%eax
  101c1a:	74 1a                	je     101c36 <print_trapframe+0x14c>
            cprintf("%s,", IA32flags[i]);
  101c1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c1f:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101c26:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c2a:	c7 04 24 c2 3a 10 00 	movl   $0x103ac2,(%esp)
  101c31:	e8 4e e6 ff ff       	call   100284 <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101c36:	ff 45 f4             	incl   -0xc(%ebp)
  101c39:	d1 65 f0             	shll   -0x10(%ebp)
  101c3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c3f:	83 f8 17             	cmp    $0x17,%eax
  101c42:	76 bb                	jbe    101bff <print_trapframe+0x115>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101c44:	8b 45 08             	mov    0x8(%ebp),%eax
  101c47:	8b 40 40             	mov    0x40(%eax),%eax
  101c4a:	c1 e8 0c             	shr    $0xc,%eax
  101c4d:	83 e0 03             	and    $0x3,%eax
  101c50:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c54:	c7 04 24 c6 3a 10 00 	movl   $0x103ac6,(%esp)
  101c5b:	e8 24 e6 ff ff       	call   100284 <cprintf>

    if (!trap_in_kernel(tf)) {
  101c60:	8b 45 08             	mov    0x8(%ebp),%eax
  101c63:	89 04 24             	mov    %eax,(%esp)
  101c66:	e8 66 fe ff ff       	call   101ad1 <trap_in_kernel>
  101c6b:	85 c0                	test   %eax,%eax
  101c6d:	75 2d                	jne    101c9c <print_trapframe+0x1b2>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101c6f:	8b 45 08             	mov    0x8(%ebp),%eax
  101c72:	8b 40 44             	mov    0x44(%eax),%eax
  101c75:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c79:	c7 04 24 cf 3a 10 00 	movl   $0x103acf,(%esp)
  101c80:	e8 ff e5 ff ff       	call   100284 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101c85:	8b 45 08             	mov    0x8(%ebp),%eax
  101c88:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101c8c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c90:	c7 04 24 de 3a 10 00 	movl   $0x103ade,(%esp)
  101c97:	e8 e8 e5 ff ff       	call   100284 <cprintf>
    }
}
  101c9c:	90                   	nop
  101c9d:	c9                   	leave  
  101c9e:	c3                   	ret    

00101c9f <print_regs>:

void
print_regs(struct pushregs *regs) {
  101c9f:	f3 0f 1e fb          	endbr32 
  101ca3:	55                   	push   %ebp
  101ca4:	89 e5                	mov    %esp,%ebp
  101ca6:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101ca9:	8b 45 08             	mov    0x8(%ebp),%eax
  101cac:	8b 00                	mov    (%eax),%eax
  101cae:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cb2:	c7 04 24 f1 3a 10 00 	movl   $0x103af1,(%esp)
  101cb9:	e8 c6 e5 ff ff       	call   100284 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101cbe:	8b 45 08             	mov    0x8(%ebp),%eax
  101cc1:	8b 40 04             	mov    0x4(%eax),%eax
  101cc4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cc8:	c7 04 24 00 3b 10 00 	movl   $0x103b00,(%esp)
  101ccf:	e8 b0 e5 ff ff       	call   100284 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101cd4:	8b 45 08             	mov    0x8(%ebp),%eax
  101cd7:	8b 40 08             	mov    0x8(%eax),%eax
  101cda:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cde:	c7 04 24 0f 3b 10 00 	movl   $0x103b0f,(%esp)
  101ce5:	e8 9a e5 ff ff       	call   100284 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101cea:	8b 45 08             	mov    0x8(%ebp),%eax
  101ced:	8b 40 0c             	mov    0xc(%eax),%eax
  101cf0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cf4:	c7 04 24 1e 3b 10 00 	movl   $0x103b1e,(%esp)
  101cfb:	e8 84 e5 ff ff       	call   100284 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101d00:	8b 45 08             	mov    0x8(%ebp),%eax
  101d03:	8b 40 10             	mov    0x10(%eax),%eax
  101d06:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d0a:	c7 04 24 2d 3b 10 00 	movl   $0x103b2d,(%esp)
  101d11:	e8 6e e5 ff ff       	call   100284 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101d16:	8b 45 08             	mov    0x8(%ebp),%eax
  101d19:	8b 40 14             	mov    0x14(%eax),%eax
  101d1c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d20:	c7 04 24 3c 3b 10 00 	movl   $0x103b3c,(%esp)
  101d27:	e8 58 e5 ff ff       	call   100284 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101d2c:	8b 45 08             	mov    0x8(%ebp),%eax
  101d2f:	8b 40 18             	mov    0x18(%eax),%eax
  101d32:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d36:	c7 04 24 4b 3b 10 00 	movl   $0x103b4b,(%esp)
  101d3d:	e8 42 e5 ff ff       	call   100284 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101d42:	8b 45 08             	mov    0x8(%ebp),%eax
  101d45:	8b 40 1c             	mov    0x1c(%eax),%eax
  101d48:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d4c:	c7 04 24 5a 3b 10 00 	movl   $0x103b5a,(%esp)
  101d53:	e8 2c e5 ff ff       	call   100284 <cprintf>
}
  101d58:	90                   	nop
  101d59:	c9                   	leave  
  101d5a:	c3                   	ret    

00101d5b <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101d5b:	f3 0f 1e fb          	endbr32 
  101d5f:	55                   	push   %ebp
  101d60:	89 e5                	mov    %esp,%ebp
  101d62:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101d65:	8b 45 08             	mov    0x8(%ebp),%eax
  101d68:	8b 40 30             	mov    0x30(%eax),%eax
  101d6b:	83 f8 79             	cmp    $0x79,%eax
  101d6e:	0f 87 e6 00 00 00    	ja     101e5a <trap_dispatch+0xff>
  101d74:	83 f8 78             	cmp    $0x78,%eax
  101d77:	0f 83 c1 00 00 00    	jae    101e3e <trap_dispatch+0xe3>
  101d7d:	83 f8 2f             	cmp    $0x2f,%eax
  101d80:	0f 87 d4 00 00 00    	ja     101e5a <trap_dispatch+0xff>
  101d86:	83 f8 2e             	cmp    $0x2e,%eax
  101d89:	0f 83 00 01 00 00    	jae    101e8f <trap_dispatch+0x134>
  101d8f:	83 f8 24             	cmp    $0x24,%eax
  101d92:	74 5e                	je     101df2 <trap_dispatch+0x97>
  101d94:	83 f8 24             	cmp    $0x24,%eax
  101d97:	0f 87 bd 00 00 00    	ja     101e5a <trap_dispatch+0xff>
  101d9d:	83 f8 20             	cmp    $0x20,%eax
  101da0:	74 0a                	je     101dac <trap_dispatch+0x51>
  101da2:	83 f8 21             	cmp    $0x21,%eax
  101da5:	74 71                	je     101e18 <trap_dispatch+0xbd>
  101da7:	e9 ae 00 00 00       	jmp    101e5a <trap_dispatch+0xff>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks ++;
  101dac:	a1 08 09 11 00       	mov    0x110908,%eax
  101db1:	40                   	inc    %eax
  101db2:	a3 08 09 11 00       	mov    %eax,0x110908
        if (ticks % TICK_NUM == 0) {
  101db7:	8b 0d 08 09 11 00    	mov    0x110908,%ecx
  101dbd:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101dc2:	89 c8                	mov    %ecx,%eax
  101dc4:	f7 e2                	mul    %edx
  101dc6:	c1 ea 05             	shr    $0x5,%edx
  101dc9:	89 d0                	mov    %edx,%eax
  101dcb:	c1 e0 02             	shl    $0x2,%eax
  101dce:	01 d0                	add    %edx,%eax
  101dd0:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101dd7:	01 d0                	add    %edx,%eax
  101dd9:	c1 e0 02             	shl    $0x2,%eax
  101ddc:	29 c1                	sub    %eax,%ecx
  101dde:	89 ca                	mov    %ecx,%edx
  101de0:	85 d2                	test   %edx,%edx
  101de2:	0f 85 aa 00 00 00    	jne    101e92 <trap_dispatch+0x137>
            print_ticks();
  101de8:	e8 f2 fa ff ff       	call   1018df <print_ticks>
        }
        break;
  101ded:	e9 a0 00 00 00       	jmp    101e92 <trap_dispatch+0x137>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101df2:	e8 8e f8 ff ff       	call   101685 <cons_getc>
  101df7:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101dfa:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101dfe:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e02:	89 54 24 08          	mov    %edx,0x8(%esp)
  101e06:	89 44 24 04          	mov    %eax,0x4(%esp)
  101e0a:	c7 04 24 69 3b 10 00 	movl   $0x103b69,(%esp)
  101e11:	e8 6e e4 ff ff       	call   100284 <cprintf>
        break;
  101e16:	eb 7b                	jmp    101e93 <trap_dispatch+0x138>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101e18:	e8 68 f8 ff ff       	call   101685 <cons_getc>
  101e1d:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101e20:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101e24:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e28:	89 54 24 08          	mov    %edx,0x8(%esp)
  101e2c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101e30:	c7 04 24 7b 3b 10 00 	movl   $0x103b7b,(%esp)
  101e37:	e8 48 e4 ff ff       	call   100284 <cprintf>
        break;
  101e3c:	eb 55                	jmp    101e93 <trap_dispatch+0x138>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101e3e:	c7 44 24 08 8a 3b 10 	movl   $0x103b8a,0x8(%esp)
  101e45:	00 
  101e46:	c7 44 24 04 af 00 00 	movl   $0xaf,0x4(%esp)
  101e4d:	00 
  101e4e:	c7 04 24 ae 39 10 00 	movl   $0x1039ae,(%esp)
  101e55:	e8 96 e5 ff ff       	call   1003f0 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e5a:	8b 45 08             	mov    0x8(%ebp),%eax
  101e5d:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e61:	83 e0 03             	and    $0x3,%eax
  101e64:	85 c0                	test   %eax,%eax
  101e66:	75 2b                	jne    101e93 <trap_dispatch+0x138>
            print_trapframe(tf);
  101e68:	8b 45 08             	mov    0x8(%ebp),%eax
  101e6b:	89 04 24             	mov    %eax,(%esp)
  101e6e:	e8 77 fc ff ff       	call   101aea <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101e73:	c7 44 24 08 9a 3b 10 	movl   $0x103b9a,0x8(%esp)
  101e7a:	00 
  101e7b:	c7 44 24 04 b9 00 00 	movl   $0xb9,0x4(%esp)
  101e82:	00 
  101e83:	c7 04 24 ae 39 10 00 	movl   $0x1039ae,(%esp)
  101e8a:	e8 61 e5 ff ff       	call   1003f0 <__panic>
        break;
  101e8f:	90                   	nop
  101e90:	eb 01                	jmp    101e93 <trap_dispatch+0x138>
        break;
  101e92:	90                   	nop
        }
    }
}
  101e93:	90                   	nop
  101e94:	c9                   	leave  
  101e95:	c3                   	ret    

00101e96 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101e96:	f3 0f 1e fb          	endbr32 
  101e9a:	55                   	push   %ebp
  101e9b:	89 e5                	mov    %esp,%ebp
  101e9d:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101ea0:	8b 45 08             	mov    0x8(%ebp),%eax
  101ea3:	89 04 24             	mov    %eax,(%esp)
  101ea6:	e8 b0 fe ff ff       	call   101d5b <trap_dispatch>
}
  101eab:	90                   	nop
  101eac:	c9                   	leave  
  101ead:	c3                   	ret    

00101eae <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101eae:	6a 00                	push   $0x0
  pushl $0
  101eb0:	6a 00                	push   $0x0
  jmp __alltraps
  101eb2:	e9 69 0a 00 00       	jmp    102920 <__alltraps>

00101eb7 <vector1>:
.globl vector1
vector1:
  pushl $0
  101eb7:	6a 00                	push   $0x0
  pushl $1
  101eb9:	6a 01                	push   $0x1
  jmp __alltraps
  101ebb:	e9 60 0a 00 00       	jmp    102920 <__alltraps>

00101ec0 <vector2>:
.globl vector2
vector2:
  pushl $0
  101ec0:	6a 00                	push   $0x0
  pushl $2
  101ec2:	6a 02                	push   $0x2
  jmp __alltraps
  101ec4:	e9 57 0a 00 00       	jmp    102920 <__alltraps>

00101ec9 <vector3>:
.globl vector3
vector3:
  pushl $0
  101ec9:	6a 00                	push   $0x0
  pushl $3
  101ecb:	6a 03                	push   $0x3
  jmp __alltraps
  101ecd:	e9 4e 0a 00 00       	jmp    102920 <__alltraps>

00101ed2 <vector4>:
.globl vector4
vector4:
  pushl $0
  101ed2:	6a 00                	push   $0x0
  pushl $4
  101ed4:	6a 04                	push   $0x4
  jmp __alltraps
  101ed6:	e9 45 0a 00 00       	jmp    102920 <__alltraps>

00101edb <vector5>:
.globl vector5
vector5:
  pushl $0
  101edb:	6a 00                	push   $0x0
  pushl $5
  101edd:	6a 05                	push   $0x5
  jmp __alltraps
  101edf:	e9 3c 0a 00 00       	jmp    102920 <__alltraps>

00101ee4 <vector6>:
.globl vector6
vector6:
  pushl $0
  101ee4:	6a 00                	push   $0x0
  pushl $6
  101ee6:	6a 06                	push   $0x6
  jmp __alltraps
  101ee8:	e9 33 0a 00 00       	jmp    102920 <__alltraps>

00101eed <vector7>:
.globl vector7
vector7:
  pushl $0
  101eed:	6a 00                	push   $0x0
  pushl $7
  101eef:	6a 07                	push   $0x7
  jmp __alltraps
  101ef1:	e9 2a 0a 00 00       	jmp    102920 <__alltraps>

00101ef6 <vector8>:
.globl vector8
vector8:
  pushl $8
  101ef6:	6a 08                	push   $0x8
  jmp __alltraps
  101ef8:	e9 23 0a 00 00       	jmp    102920 <__alltraps>

00101efd <vector9>:
.globl vector9
vector9:
  pushl $0
  101efd:	6a 00                	push   $0x0
  pushl $9
  101eff:	6a 09                	push   $0x9
  jmp __alltraps
  101f01:	e9 1a 0a 00 00       	jmp    102920 <__alltraps>

00101f06 <vector10>:
.globl vector10
vector10:
  pushl $10
  101f06:	6a 0a                	push   $0xa
  jmp __alltraps
  101f08:	e9 13 0a 00 00       	jmp    102920 <__alltraps>

00101f0d <vector11>:
.globl vector11
vector11:
  pushl $11
  101f0d:	6a 0b                	push   $0xb
  jmp __alltraps
  101f0f:	e9 0c 0a 00 00       	jmp    102920 <__alltraps>

00101f14 <vector12>:
.globl vector12
vector12:
  pushl $12
  101f14:	6a 0c                	push   $0xc
  jmp __alltraps
  101f16:	e9 05 0a 00 00       	jmp    102920 <__alltraps>

00101f1b <vector13>:
.globl vector13
vector13:
  pushl $13
  101f1b:	6a 0d                	push   $0xd
  jmp __alltraps
  101f1d:	e9 fe 09 00 00       	jmp    102920 <__alltraps>

00101f22 <vector14>:
.globl vector14
vector14:
  pushl $14
  101f22:	6a 0e                	push   $0xe
  jmp __alltraps
  101f24:	e9 f7 09 00 00       	jmp    102920 <__alltraps>

00101f29 <vector15>:
.globl vector15
vector15:
  pushl $0
  101f29:	6a 00                	push   $0x0
  pushl $15
  101f2b:	6a 0f                	push   $0xf
  jmp __alltraps
  101f2d:	e9 ee 09 00 00       	jmp    102920 <__alltraps>

00101f32 <vector16>:
.globl vector16
vector16:
  pushl $0
  101f32:	6a 00                	push   $0x0
  pushl $16
  101f34:	6a 10                	push   $0x10
  jmp __alltraps
  101f36:	e9 e5 09 00 00       	jmp    102920 <__alltraps>

00101f3b <vector17>:
.globl vector17
vector17:
  pushl $17
  101f3b:	6a 11                	push   $0x11
  jmp __alltraps
  101f3d:	e9 de 09 00 00       	jmp    102920 <__alltraps>

00101f42 <vector18>:
.globl vector18
vector18:
  pushl $0
  101f42:	6a 00                	push   $0x0
  pushl $18
  101f44:	6a 12                	push   $0x12
  jmp __alltraps
  101f46:	e9 d5 09 00 00       	jmp    102920 <__alltraps>

00101f4b <vector19>:
.globl vector19
vector19:
  pushl $0
  101f4b:	6a 00                	push   $0x0
  pushl $19
  101f4d:	6a 13                	push   $0x13
  jmp __alltraps
  101f4f:	e9 cc 09 00 00       	jmp    102920 <__alltraps>

00101f54 <vector20>:
.globl vector20
vector20:
  pushl $0
  101f54:	6a 00                	push   $0x0
  pushl $20
  101f56:	6a 14                	push   $0x14
  jmp __alltraps
  101f58:	e9 c3 09 00 00       	jmp    102920 <__alltraps>

00101f5d <vector21>:
.globl vector21
vector21:
  pushl $0
  101f5d:	6a 00                	push   $0x0
  pushl $21
  101f5f:	6a 15                	push   $0x15
  jmp __alltraps
  101f61:	e9 ba 09 00 00       	jmp    102920 <__alltraps>

00101f66 <vector22>:
.globl vector22
vector22:
  pushl $0
  101f66:	6a 00                	push   $0x0
  pushl $22
  101f68:	6a 16                	push   $0x16
  jmp __alltraps
  101f6a:	e9 b1 09 00 00       	jmp    102920 <__alltraps>

00101f6f <vector23>:
.globl vector23
vector23:
  pushl $0
  101f6f:	6a 00                	push   $0x0
  pushl $23
  101f71:	6a 17                	push   $0x17
  jmp __alltraps
  101f73:	e9 a8 09 00 00       	jmp    102920 <__alltraps>

00101f78 <vector24>:
.globl vector24
vector24:
  pushl $0
  101f78:	6a 00                	push   $0x0
  pushl $24
  101f7a:	6a 18                	push   $0x18
  jmp __alltraps
  101f7c:	e9 9f 09 00 00       	jmp    102920 <__alltraps>

00101f81 <vector25>:
.globl vector25
vector25:
  pushl $0
  101f81:	6a 00                	push   $0x0
  pushl $25
  101f83:	6a 19                	push   $0x19
  jmp __alltraps
  101f85:	e9 96 09 00 00       	jmp    102920 <__alltraps>

00101f8a <vector26>:
.globl vector26
vector26:
  pushl $0
  101f8a:	6a 00                	push   $0x0
  pushl $26
  101f8c:	6a 1a                	push   $0x1a
  jmp __alltraps
  101f8e:	e9 8d 09 00 00       	jmp    102920 <__alltraps>

00101f93 <vector27>:
.globl vector27
vector27:
  pushl $0
  101f93:	6a 00                	push   $0x0
  pushl $27
  101f95:	6a 1b                	push   $0x1b
  jmp __alltraps
  101f97:	e9 84 09 00 00       	jmp    102920 <__alltraps>

00101f9c <vector28>:
.globl vector28
vector28:
  pushl $0
  101f9c:	6a 00                	push   $0x0
  pushl $28
  101f9e:	6a 1c                	push   $0x1c
  jmp __alltraps
  101fa0:	e9 7b 09 00 00       	jmp    102920 <__alltraps>

00101fa5 <vector29>:
.globl vector29
vector29:
  pushl $0
  101fa5:	6a 00                	push   $0x0
  pushl $29
  101fa7:	6a 1d                	push   $0x1d
  jmp __alltraps
  101fa9:	e9 72 09 00 00       	jmp    102920 <__alltraps>

00101fae <vector30>:
.globl vector30
vector30:
  pushl $0
  101fae:	6a 00                	push   $0x0
  pushl $30
  101fb0:	6a 1e                	push   $0x1e
  jmp __alltraps
  101fb2:	e9 69 09 00 00       	jmp    102920 <__alltraps>

00101fb7 <vector31>:
.globl vector31
vector31:
  pushl $0
  101fb7:	6a 00                	push   $0x0
  pushl $31
  101fb9:	6a 1f                	push   $0x1f
  jmp __alltraps
  101fbb:	e9 60 09 00 00       	jmp    102920 <__alltraps>

00101fc0 <vector32>:
.globl vector32
vector32:
  pushl $0
  101fc0:	6a 00                	push   $0x0
  pushl $32
  101fc2:	6a 20                	push   $0x20
  jmp __alltraps
  101fc4:	e9 57 09 00 00       	jmp    102920 <__alltraps>

00101fc9 <vector33>:
.globl vector33
vector33:
  pushl $0
  101fc9:	6a 00                	push   $0x0
  pushl $33
  101fcb:	6a 21                	push   $0x21
  jmp __alltraps
  101fcd:	e9 4e 09 00 00       	jmp    102920 <__alltraps>

00101fd2 <vector34>:
.globl vector34
vector34:
  pushl $0
  101fd2:	6a 00                	push   $0x0
  pushl $34
  101fd4:	6a 22                	push   $0x22
  jmp __alltraps
  101fd6:	e9 45 09 00 00       	jmp    102920 <__alltraps>

00101fdb <vector35>:
.globl vector35
vector35:
  pushl $0
  101fdb:	6a 00                	push   $0x0
  pushl $35
  101fdd:	6a 23                	push   $0x23
  jmp __alltraps
  101fdf:	e9 3c 09 00 00       	jmp    102920 <__alltraps>

00101fe4 <vector36>:
.globl vector36
vector36:
  pushl $0
  101fe4:	6a 00                	push   $0x0
  pushl $36
  101fe6:	6a 24                	push   $0x24
  jmp __alltraps
  101fe8:	e9 33 09 00 00       	jmp    102920 <__alltraps>

00101fed <vector37>:
.globl vector37
vector37:
  pushl $0
  101fed:	6a 00                	push   $0x0
  pushl $37
  101fef:	6a 25                	push   $0x25
  jmp __alltraps
  101ff1:	e9 2a 09 00 00       	jmp    102920 <__alltraps>

00101ff6 <vector38>:
.globl vector38
vector38:
  pushl $0
  101ff6:	6a 00                	push   $0x0
  pushl $38
  101ff8:	6a 26                	push   $0x26
  jmp __alltraps
  101ffa:	e9 21 09 00 00       	jmp    102920 <__alltraps>

00101fff <vector39>:
.globl vector39
vector39:
  pushl $0
  101fff:	6a 00                	push   $0x0
  pushl $39
  102001:	6a 27                	push   $0x27
  jmp __alltraps
  102003:	e9 18 09 00 00       	jmp    102920 <__alltraps>

00102008 <vector40>:
.globl vector40
vector40:
  pushl $0
  102008:	6a 00                	push   $0x0
  pushl $40
  10200a:	6a 28                	push   $0x28
  jmp __alltraps
  10200c:	e9 0f 09 00 00       	jmp    102920 <__alltraps>

00102011 <vector41>:
.globl vector41
vector41:
  pushl $0
  102011:	6a 00                	push   $0x0
  pushl $41
  102013:	6a 29                	push   $0x29
  jmp __alltraps
  102015:	e9 06 09 00 00       	jmp    102920 <__alltraps>

0010201a <vector42>:
.globl vector42
vector42:
  pushl $0
  10201a:	6a 00                	push   $0x0
  pushl $42
  10201c:	6a 2a                	push   $0x2a
  jmp __alltraps
  10201e:	e9 fd 08 00 00       	jmp    102920 <__alltraps>

00102023 <vector43>:
.globl vector43
vector43:
  pushl $0
  102023:	6a 00                	push   $0x0
  pushl $43
  102025:	6a 2b                	push   $0x2b
  jmp __alltraps
  102027:	e9 f4 08 00 00       	jmp    102920 <__alltraps>

0010202c <vector44>:
.globl vector44
vector44:
  pushl $0
  10202c:	6a 00                	push   $0x0
  pushl $44
  10202e:	6a 2c                	push   $0x2c
  jmp __alltraps
  102030:	e9 eb 08 00 00       	jmp    102920 <__alltraps>

00102035 <vector45>:
.globl vector45
vector45:
  pushl $0
  102035:	6a 00                	push   $0x0
  pushl $45
  102037:	6a 2d                	push   $0x2d
  jmp __alltraps
  102039:	e9 e2 08 00 00       	jmp    102920 <__alltraps>

0010203e <vector46>:
.globl vector46
vector46:
  pushl $0
  10203e:	6a 00                	push   $0x0
  pushl $46
  102040:	6a 2e                	push   $0x2e
  jmp __alltraps
  102042:	e9 d9 08 00 00       	jmp    102920 <__alltraps>

00102047 <vector47>:
.globl vector47
vector47:
  pushl $0
  102047:	6a 00                	push   $0x0
  pushl $47
  102049:	6a 2f                	push   $0x2f
  jmp __alltraps
  10204b:	e9 d0 08 00 00       	jmp    102920 <__alltraps>

00102050 <vector48>:
.globl vector48
vector48:
  pushl $0
  102050:	6a 00                	push   $0x0
  pushl $48
  102052:	6a 30                	push   $0x30
  jmp __alltraps
  102054:	e9 c7 08 00 00       	jmp    102920 <__alltraps>

00102059 <vector49>:
.globl vector49
vector49:
  pushl $0
  102059:	6a 00                	push   $0x0
  pushl $49
  10205b:	6a 31                	push   $0x31
  jmp __alltraps
  10205d:	e9 be 08 00 00       	jmp    102920 <__alltraps>

00102062 <vector50>:
.globl vector50
vector50:
  pushl $0
  102062:	6a 00                	push   $0x0
  pushl $50
  102064:	6a 32                	push   $0x32
  jmp __alltraps
  102066:	e9 b5 08 00 00       	jmp    102920 <__alltraps>

0010206b <vector51>:
.globl vector51
vector51:
  pushl $0
  10206b:	6a 00                	push   $0x0
  pushl $51
  10206d:	6a 33                	push   $0x33
  jmp __alltraps
  10206f:	e9 ac 08 00 00       	jmp    102920 <__alltraps>

00102074 <vector52>:
.globl vector52
vector52:
  pushl $0
  102074:	6a 00                	push   $0x0
  pushl $52
  102076:	6a 34                	push   $0x34
  jmp __alltraps
  102078:	e9 a3 08 00 00       	jmp    102920 <__alltraps>

0010207d <vector53>:
.globl vector53
vector53:
  pushl $0
  10207d:	6a 00                	push   $0x0
  pushl $53
  10207f:	6a 35                	push   $0x35
  jmp __alltraps
  102081:	e9 9a 08 00 00       	jmp    102920 <__alltraps>

00102086 <vector54>:
.globl vector54
vector54:
  pushl $0
  102086:	6a 00                	push   $0x0
  pushl $54
  102088:	6a 36                	push   $0x36
  jmp __alltraps
  10208a:	e9 91 08 00 00       	jmp    102920 <__alltraps>

0010208f <vector55>:
.globl vector55
vector55:
  pushl $0
  10208f:	6a 00                	push   $0x0
  pushl $55
  102091:	6a 37                	push   $0x37
  jmp __alltraps
  102093:	e9 88 08 00 00       	jmp    102920 <__alltraps>

00102098 <vector56>:
.globl vector56
vector56:
  pushl $0
  102098:	6a 00                	push   $0x0
  pushl $56
  10209a:	6a 38                	push   $0x38
  jmp __alltraps
  10209c:	e9 7f 08 00 00       	jmp    102920 <__alltraps>

001020a1 <vector57>:
.globl vector57
vector57:
  pushl $0
  1020a1:	6a 00                	push   $0x0
  pushl $57
  1020a3:	6a 39                	push   $0x39
  jmp __alltraps
  1020a5:	e9 76 08 00 00       	jmp    102920 <__alltraps>

001020aa <vector58>:
.globl vector58
vector58:
  pushl $0
  1020aa:	6a 00                	push   $0x0
  pushl $58
  1020ac:	6a 3a                	push   $0x3a
  jmp __alltraps
  1020ae:	e9 6d 08 00 00       	jmp    102920 <__alltraps>

001020b3 <vector59>:
.globl vector59
vector59:
  pushl $0
  1020b3:	6a 00                	push   $0x0
  pushl $59
  1020b5:	6a 3b                	push   $0x3b
  jmp __alltraps
  1020b7:	e9 64 08 00 00       	jmp    102920 <__alltraps>

001020bc <vector60>:
.globl vector60
vector60:
  pushl $0
  1020bc:	6a 00                	push   $0x0
  pushl $60
  1020be:	6a 3c                	push   $0x3c
  jmp __alltraps
  1020c0:	e9 5b 08 00 00       	jmp    102920 <__alltraps>

001020c5 <vector61>:
.globl vector61
vector61:
  pushl $0
  1020c5:	6a 00                	push   $0x0
  pushl $61
  1020c7:	6a 3d                	push   $0x3d
  jmp __alltraps
  1020c9:	e9 52 08 00 00       	jmp    102920 <__alltraps>

001020ce <vector62>:
.globl vector62
vector62:
  pushl $0
  1020ce:	6a 00                	push   $0x0
  pushl $62
  1020d0:	6a 3e                	push   $0x3e
  jmp __alltraps
  1020d2:	e9 49 08 00 00       	jmp    102920 <__alltraps>

001020d7 <vector63>:
.globl vector63
vector63:
  pushl $0
  1020d7:	6a 00                	push   $0x0
  pushl $63
  1020d9:	6a 3f                	push   $0x3f
  jmp __alltraps
  1020db:	e9 40 08 00 00       	jmp    102920 <__alltraps>

001020e0 <vector64>:
.globl vector64
vector64:
  pushl $0
  1020e0:	6a 00                	push   $0x0
  pushl $64
  1020e2:	6a 40                	push   $0x40
  jmp __alltraps
  1020e4:	e9 37 08 00 00       	jmp    102920 <__alltraps>

001020e9 <vector65>:
.globl vector65
vector65:
  pushl $0
  1020e9:	6a 00                	push   $0x0
  pushl $65
  1020eb:	6a 41                	push   $0x41
  jmp __alltraps
  1020ed:	e9 2e 08 00 00       	jmp    102920 <__alltraps>

001020f2 <vector66>:
.globl vector66
vector66:
  pushl $0
  1020f2:	6a 00                	push   $0x0
  pushl $66
  1020f4:	6a 42                	push   $0x42
  jmp __alltraps
  1020f6:	e9 25 08 00 00       	jmp    102920 <__alltraps>

001020fb <vector67>:
.globl vector67
vector67:
  pushl $0
  1020fb:	6a 00                	push   $0x0
  pushl $67
  1020fd:	6a 43                	push   $0x43
  jmp __alltraps
  1020ff:	e9 1c 08 00 00       	jmp    102920 <__alltraps>

00102104 <vector68>:
.globl vector68
vector68:
  pushl $0
  102104:	6a 00                	push   $0x0
  pushl $68
  102106:	6a 44                	push   $0x44
  jmp __alltraps
  102108:	e9 13 08 00 00       	jmp    102920 <__alltraps>

0010210d <vector69>:
.globl vector69
vector69:
  pushl $0
  10210d:	6a 00                	push   $0x0
  pushl $69
  10210f:	6a 45                	push   $0x45
  jmp __alltraps
  102111:	e9 0a 08 00 00       	jmp    102920 <__alltraps>

00102116 <vector70>:
.globl vector70
vector70:
  pushl $0
  102116:	6a 00                	push   $0x0
  pushl $70
  102118:	6a 46                	push   $0x46
  jmp __alltraps
  10211a:	e9 01 08 00 00       	jmp    102920 <__alltraps>

0010211f <vector71>:
.globl vector71
vector71:
  pushl $0
  10211f:	6a 00                	push   $0x0
  pushl $71
  102121:	6a 47                	push   $0x47
  jmp __alltraps
  102123:	e9 f8 07 00 00       	jmp    102920 <__alltraps>

00102128 <vector72>:
.globl vector72
vector72:
  pushl $0
  102128:	6a 00                	push   $0x0
  pushl $72
  10212a:	6a 48                	push   $0x48
  jmp __alltraps
  10212c:	e9 ef 07 00 00       	jmp    102920 <__alltraps>

00102131 <vector73>:
.globl vector73
vector73:
  pushl $0
  102131:	6a 00                	push   $0x0
  pushl $73
  102133:	6a 49                	push   $0x49
  jmp __alltraps
  102135:	e9 e6 07 00 00       	jmp    102920 <__alltraps>

0010213a <vector74>:
.globl vector74
vector74:
  pushl $0
  10213a:	6a 00                	push   $0x0
  pushl $74
  10213c:	6a 4a                	push   $0x4a
  jmp __alltraps
  10213e:	e9 dd 07 00 00       	jmp    102920 <__alltraps>

00102143 <vector75>:
.globl vector75
vector75:
  pushl $0
  102143:	6a 00                	push   $0x0
  pushl $75
  102145:	6a 4b                	push   $0x4b
  jmp __alltraps
  102147:	e9 d4 07 00 00       	jmp    102920 <__alltraps>

0010214c <vector76>:
.globl vector76
vector76:
  pushl $0
  10214c:	6a 00                	push   $0x0
  pushl $76
  10214e:	6a 4c                	push   $0x4c
  jmp __alltraps
  102150:	e9 cb 07 00 00       	jmp    102920 <__alltraps>

00102155 <vector77>:
.globl vector77
vector77:
  pushl $0
  102155:	6a 00                	push   $0x0
  pushl $77
  102157:	6a 4d                	push   $0x4d
  jmp __alltraps
  102159:	e9 c2 07 00 00       	jmp    102920 <__alltraps>

0010215e <vector78>:
.globl vector78
vector78:
  pushl $0
  10215e:	6a 00                	push   $0x0
  pushl $78
  102160:	6a 4e                	push   $0x4e
  jmp __alltraps
  102162:	e9 b9 07 00 00       	jmp    102920 <__alltraps>

00102167 <vector79>:
.globl vector79
vector79:
  pushl $0
  102167:	6a 00                	push   $0x0
  pushl $79
  102169:	6a 4f                	push   $0x4f
  jmp __alltraps
  10216b:	e9 b0 07 00 00       	jmp    102920 <__alltraps>

00102170 <vector80>:
.globl vector80
vector80:
  pushl $0
  102170:	6a 00                	push   $0x0
  pushl $80
  102172:	6a 50                	push   $0x50
  jmp __alltraps
  102174:	e9 a7 07 00 00       	jmp    102920 <__alltraps>

00102179 <vector81>:
.globl vector81
vector81:
  pushl $0
  102179:	6a 00                	push   $0x0
  pushl $81
  10217b:	6a 51                	push   $0x51
  jmp __alltraps
  10217d:	e9 9e 07 00 00       	jmp    102920 <__alltraps>

00102182 <vector82>:
.globl vector82
vector82:
  pushl $0
  102182:	6a 00                	push   $0x0
  pushl $82
  102184:	6a 52                	push   $0x52
  jmp __alltraps
  102186:	e9 95 07 00 00       	jmp    102920 <__alltraps>

0010218b <vector83>:
.globl vector83
vector83:
  pushl $0
  10218b:	6a 00                	push   $0x0
  pushl $83
  10218d:	6a 53                	push   $0x53
  jmp __alltraps
  10218f:	e9 8c 07 00 00       	jmp    102920 <__alltraps>

00102194 <vector84>:
.globl vector84
vector84:
  pushl $0
  102194:	6a 00                	push   $0x0
  pushl $84
  102196:	6a 54                	push   $0x54
  jmp __alltraps
  102198:	e9 83 07 00 00       	jmp    102920 <__alltraps>

0010219d <vector85>:
.globl vector85
vector85:
  pushl $0
  10219d:	6a 00                	push   $0x0
  pushl $85
  10219f:	6a 55                	push   $0x55
  jmp __alltraps
  1021a1:	e9 7a 07 00 00       	jmp    102920 <__alltraps>

001021a6 <vector86>:
.globl vector86
vector86:
  pushl $0
  1021a6:	6a 00                	push   $0x0
  pushl $86
  1021a8:	6a 56                	push   $0x56
  jmp __alltraps
  1021aa:	e9 71 07 00 00       	jmp    102920 <__alltraps>

001021af <vector87>:
.globl vector87
vector87:
  pushl $0
  1021af:	6a 00                	push   $0x0
  pushl $87
  1021b1:	6a 57                	push   $0x57
  jmp __alltraps
  1021b3:	e9 68 07 00 00       	jmp    102920 <__alltraps>

001021b8 <vector88>:
.globl vector88
vector88:
  pushl $0
  1021b8:	6a 00                	push   $0x0
  pushl $88
  1021ba:	6a 58                	push   $0x58
  jmp __alltraps
  1021bc:	e9 5f 07 00 00       	jmp    102920 <__alltraps>

001021c1 <vector89>:
.globl vector89
vector89:
  pushl $0
  1021c1:	6a 00                	push   $0x0
  pushl $89
  1021c3:	6a 59                	push   $0x59
  jmp __alltraps
  1021c5:	e9 56 07 00 00       	jmp    102920 <__alltraps>

001021ca <vector90>:
.globl vector90
vector90:
  pushl $0
  1021ca:	6a 00                	push   $0x0
  pushl $90
  1021cc:	6a 5a                	push   $0x5a
  jmp __alltraps
  1021ce:	e9 4d 07 00 00       	jmp    102920 <__alltraps>

001021d3 <vector91>:
.globl vector91
vector91:
  pushl $0
  1021d3:	6a 00                	push   $0x0
  pushl $91
  1021d5:	6a 5b                	push   $0x5b
  jmp __alltraps
  1021d7:	e9 44 07 00 00       	jmp    102920 <__alltraps>

001021dc <vector92>:
.globl vector92
vector92:
  pushl $0
  1021dc:	6a 00                	push   $0x0
  pushl $92
  1021de:	6a 5c                	push   $0x5c
  jmp __alltraps
  1021e0:	e9 3b 07 00 00       	jmp    102920 <__alltraps>

001021e5 <vector93>:
.globl vector93
vector93:
  pushl $0
  1021e5:	6a 00                	push   $0x0
  pushl $93
  1021e7:	6a 5d                	push   $0x5d
  jmp __alltraps
  1021e9:	e9 32 07 00 00       	jmp    102920 <__alltraps>

001021ee <vector94>:
.globl vector94
vector94:
  pushl $0
  1021ee:	6a 00                	push   $0x0
  pushl $94
  1021f0:	6a 5e                	push   $0x5e
  jmp __alltraps
  1021f2:	e9 29 07 00 00       	jmp    102920 <__alltraps>

001021f7 <vector95>:
.globl vector95
vector95:
  pushl $0
  1021f7:	6a 00                	push   $0x0
  pushl $95
  1021f9:	6a 5f                	push   $0x5f
  jmp __alltraps
  1021fb:	e9 20 07 00 00       	jmp    102920 <__alltraps>

00102200 <vector96>:
.globl vector96
vector96:
  pushl $0
  102200:	6a 00                	push   $0x0
  pushl $96
  102202:	6a 60                	push   $0x60
  jmp __alltraps
  102204:	e9 17 07 00 00       	jmp    102920 <__alltraps>

00102209 <vector97>:
.globl vector97
vector97:
  pushl $0
  102209:	6a 00                	push   $0x0
  pushl $97
  10220b:	6a 61                	push   $0x61
  jmp __alltraps
  10220d:	e9 0e 07 00 00       	jmp    102920 <__alltraps>

00102212 <vector98>:
.globl vector98
vector98:
  pushl $0
  102212:	6a 00                	push   $0x0
  pushl $98
  102214:	6a 62                	push   $0x62
  jmp __alltraps
  102216:	e9 05 07 00 00       	jmp    102920 <__alltraps>

0010221b <vector99>:
.globl vector99
vector99:
  pushl $0
  10221b:	6a 00                	push   $0x0
  pushl $99
  10221d:	6a 63                	push   $0x63
  jmp __alltraps
  10221f:	e9 fc 06 00 00       	jmp    102920 <__alltraps>

00102224 <vector100>:
.globl vector100
vector100:
  pushl $0
  102224:	6a 00                	push   $0x0
  pushl $100
  102226:	6a 64                	push   $0x64
  jmp __alltraps
  102228:	e9 f3 06 00 00       	jmp    102920 <__alltraps>

0010222d <vector101>:
.globl vector101
vector101:
  pushl $0
  10222d:	6a 00                	push   $0x0
  pushl $101
  10222f:	6a 65                	push   $0x65
  jmp __alltraps
  102231:	e9 ea 06 00 00       	jmp    102920 <__alltraps>

00102236 <vector102>:
.globl vector102
vector102:
  pushl $0
  102236:	6a 00                	push   $0x0
  pushl $102
  102238:	6a 66                	push   $0x66
  jmp __alltraps
  10223a:	e9 e1 06 00 00       	jmp    102920 <__alltraps>

0010223f <vector103>:
.globl vector103
vector103:
  pushl $0
  10223f:	6a 00                	push   $0x0
  pushl $103
  102241:	6a 67                	push   $0x67
  jmp __alltraps
  102243:	e9 d8 06 00 00       	jmp    102920 <__alltraps>

00102248 <vector104>:
.globl vector104
vector104:
  pushl $0
  102248:	6a 00                	push   $0x0
  pushl $104
  10224a:	6a 68                	push   $0x68
  jmp __alltraps
  10224c:	e9 cf 06 00 00       	jmp    102920 <__alltraps>

00102251 <vector105>:
.globl vector105
vector105:
  pushl $0
  102251:	6a 00                	push   $0x0
  pushl $105
  102253:	6a 69                	push   $0x69
  jmp __alltraps
  102255:	e9 c6 06 00 00       	jmp    102920 <__alltraps>

0010225a <vector106>:
.globl vector106
vector106:
  pushl $0
  10225a:	6a 00                	push   $0x0
  pushl $106
  10225c:	6a 6a                	push   $0x6a
  jmp __alltraps
  10225e:	e9 bd 06 00 00       	jmp    102920 <__alltraps>

00102263 <vector107>:
.globl vector107
vector107:
  pushl $0
  102263:	6a 00                	push   $0x0
  pushl $107
  102265:	6a 6b                	push   $0x6b
  jmp __alltraps
  102267:	e9 b4 06 00 00       	jmp    102920 <__alltraps>

0010226c <vector108>:
.globl vector108
vector108:
  pushl $0
  10226c:	6a 00                	push   $0x0
  pushl $108
  10226e:	6a 6c                	push   $0x6c
  jmp __alltraps
  102270:	e9 ab 06 00 00       	jmp    102920 <__alltraps>

00102275 <vector109>:
.globl vector109
vector109:
  pushl $0
  102275:	6a 00                	push   $0x0
  pushl $109
  102277:	6a 6d                	push   $0x6d
  jmp __alltraps
  102279:	e9 a2 06 00 00       	jmp    102920 <__alltraps>

0010227e <vector110>:
.globl vector110
vector110:
  pushl $0
  10227e:	6a 00                	push   $0x0
  pushl $110
  102280:	6a 6e                	push   $0x6e
  jmp __alltraps
  102282:	e9 99 06 00 00       	jmp    102920 <__alltraps>

00102287 <vector111>:
.globl vector111
vector111:
  pushl $0
  102287:	6a 00                	push   $0x0
  pushl $111
  102289:	6a 6f                	push   $0x6f
  jmp __alltraps
  10228b:	e9 90 06 00 00       	jmp    102920 <__alltraps>

00102290 <vector112>:
.globl vector112
vector112:
  pushl $0
  102290:	6a 00                	push   $0x0
  pushl $112
  102292:	6a 70                	push   $0x70
  jmp __alltraps
  102294:	e9 87 06 00 00       	jmp    102920 <__alltraps>

00102299 <vector113>:
.globl vector113
vector113:
  pushl $0
  102299:	6a 00                	push   $0x0
  pushl $113
  10229b:	6a 71                	push   $0x71
  jmp __alltraps
  10229d:	e9 7e 06 00 00       	jmp    102920 <__alltraps>

001022a2 <vector114>:
.globl vector114
vector114:
  pushl $0
  1022a2:	6a 00                	push   $0x0
  pushl $114
  1022a4:	6a 72                	push   $0x72
  jmp __alltraps
  1022a6:	e9 75 06 00 00       	jmp    102920 <__alltraps>

001022ab <vector115>:
.globl vector115
vector115:
  pushl $0
  1022ab:	6a 00                	push   $0x0
  pushl $115
  1022ad:	6a 73                	push   $0x73
  jmp __alltraps
  1022af:	e9 6c 06 00 00       	jmp    102920 <__alltraps>

001022b4 <vector116>:
.globl vector116
vector116:
  pushl $0
  1022b4:	6a 00                	push   $0x0
  pushl $116
  1022b6:	6a 74                	push   $0x74
  jmp __alltraps
  1022b8:	e9 63 06 00 00       	jmp    102920 <__alltraps>

001022bd <vector117>:
.globl vector117
vector117:
  pushl $0
  1022bd:	6a 00                	push   $0x0
  pushl $117
  1022bf:	6a 75                	push   $0x75
  jmp __alltraps
  1022c1:	e9 5a 06 00 00       	jmp    102920 <__alltraps>

001022c6 <vector118>:
.globl vector118
vector118:
  pushl $0
  1022c6:	6a 00                	push   $0x0
  pushl $118
  1022c8:	6a 76                	push   $0x76
  jmp __alltraps
  1022ca:	e9 51 06 00 00       	jmp    102920 <__alltraps>

001022cf <vector119>:
.globl vector119
vector119:
  pushl $0
  1022cf:	6a 00                	push   $0x0
  pushl $119
  1022d1:	6a 77                	push   $0x77
  jmp __alltraps
  1022d3:	e9 48 06 00 00       	jmp    102920 <__alltraps>

001022d8 <vector120>:
.globl vector120
vector120:
  pushl $0
  1022d8:	6a 00                	push   $0x0
  pushl $120
  1022da:	6a 78                	push   $0x78
  jmp __alltraps
  1022dc:	e9 3f 06 00 00       	jmp    102920 <__alltraps>

001022e1 <vector121>:
.globl vector121
vector121:
  pushl $0
  1022e1:	6a 00                	push   $0x0
  pushl $121
  1022e3:	6a 79                	push   $0x79
  jmp __alltraps
  1022e5:	e9 36 06 00 00       	jmp    102920 <__alltraps>

001022ea <vector122>:
.globl vector122
vector122:
  pushl $0
  1022ea:	6a 00                	push   $0x0
  pushl $122
  1022ec:	6a 7a                	push   $0x7a
  jmp __alltraps
  1022ee:	e9 2d 06 00 00       	jmp    102920 <__alltraps>

001022f3 <vector123>:
.globl vector123
vector123:
  pushl $0
  1022f3:	6a 00                	push   $0x0
  pushl $123
  1022f5:	6a 7b                	push   $0x7b
  jmp __alltraps
  1022f7:	e9 24 06 00 00       	jmp    102920 <__alltraps>

001022fc <vector124>:
.globl vector124
vector124:
  pushl $0
  1022fc:	6a 00                	push   $0x0
  pushl $124
  1022fe:	6a 7c                	push   $0x7c
  jmp __alltraps
  102300:	e9 1b 06 00 00       	jmp    102920 <__alltraps>

00102305 <vector125>:
.globl vector125
vector125:
  pushl $0
  102305:	6a 00                	push   $0x0
  pushl $125
  102307:	6a 7d                	push   $0x7d
  jmp __alltraps
  102309:	e9 12 06 00 00       	jmp    102920 <__alltraps>

0010230e <vector126>:
.globl vector126
vector126:
  pushl $0
  10230e:	6a 00                	push   $0x0
  pushl $126
  102310:	6a 7e                	push   $0x7e
  jmp __alltraps
  102312:	e9 09 06 00 00       	jmp    102920 <__alltraps>

00102317 <vector127>:
.globl vector127
vector127:
  pushl $0
  102317:	6a 00                	push   $0x0
  pushl $127
  102319:	6a 7f                	push   $0x7f
  jmp __alltraps
  10231b:	e9 00 06 00 00       	jmp    102920 <__alltraps>

00102320 <vector128>:
.globl vector128
vector128:
  pushl $0
  102320:	6a 00                	push   $0x0
  pushl $128
  102322:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102327:	e9 f4 05 00 00       	jmp    102920 <__alltraps>

0010232c <vector129>:
.globl vector129
vector129:
  pushl $0
  10232c:	6a 00                	push   $0x0
  pushl $129
  10232e:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102333:	e9 e8 05 00 00       	jmp    102920 <__alltraps>

00102338 <vector130>:
.globl vector130
vector130:
  pushl $0
  102338:	6a 00                	push   $0x0
  pushl $130
  10233a:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10233f:	e9 dc 05 00 00       	jmp    102920 <__alltraps>

00102344 <vector131>:
.globl vector131
vector131:
  pushl $0
  102344:	6a 00                	push   $0x0
  pushl $131
  102346:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10234b:	e9 d0 05 00 00       	jmp    102920 <__alltraps>

00102350 <vector132>:
.globl vector132
vector132:
  pushl $0
  102350:	6a 00                	push   $0x0
  pushl $132
  102352:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102357:	e9 c4 05 00 00       	jmp    102920 <__alltraps>

0010235c <vector133>:
.globl vector133
vector133:
  pushl $0
  10235c:	6a 00                	push   $0x0
  pushl $133
  10235e:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102363:	e9 b8 05 00 00       	jmp    102920 <__alltraps>

00102368 <vector134>:
.globl vector134
vector134:
  pushl $0
  102368:	6a 00                	push   $0x0
  pushl $134
  10236a:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  10236f:	e9 ac 05 00 00       	jmp    102920 <__alltraps>

00102374 <vector135>:
.globl vector135
vector135:
  pushl $0
  102374:	6a 00                	push   $0x0
  pushl $135
  102376:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10237b:	e9 a0 05 00 00       	jmp    102920 <__alltraps>

00102380 <vector136>:
.globl vector136
vector136:
  pushl $0
  102380:	6a 00                	push   $0x0
  pushl $136
  102382:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102387:	e9 94 05 00 00       	jmp    102920 <__alltraps>

0010238c <vector137>:
.globl vector137
vector137:
  pushl $0
  10238c:	6a 00                	push   $0x0
  pushl $137
  10238e:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102393:	e9 88 05 00 00       	jmp    102920 <__alltraps>

00102398 <vector138>:
.globl vector138
vector138:
  pushl $0
  102398:	6a 00                	push   $0x0
  pushl $138
  10239a:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  10239f:	e9 7c 05 00 00       	jmp    102920 <__alltraps>

001023a4 <vector139>:
.globl vector139
vector139:
  pushl $0
  1023a4:	6a 00                	push   $0x0
  pushl $139
  1023a6:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1023ab:	e9 70 05 00 00       	jmp    102920 <__alltraps>

001023b0 <vector140>:
.globl vector140
vector140:
  pushl $0
  1023b0:	6a 00                	push   $0x0
  pushl $140
  1023b2:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1023b7:	e9 64 05 00 00       	jmp    102920 <__alltraps>

001023bc <vector141>:
.globl vector141
vector141:
  pushl $0
  1023bc:	6a 00                	push   $0x0
  pushl $141
  1023be:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1023c3:	e9 58 05 00 00       	jmp    102920 <__alltraps>

001023c8 <vector142>:
.globl vector142
vector142:
  pushl $0
  1023c8:	6a 00                	push   $0x0
  pushl $142
  1023ca:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1023cf:	e9 4c 05 00 00       	jmp    102920 <__alltraps>

001023d4 <vector143>:
.globl vector143
vector143:
  pushl $0
  1023d4:	6a 00                	push   $0x0
  pushl $143
  1023d6:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1023db:	e9 40 05 00 00       	jmp    102920 <__alltraps>

001023e0 <vector144>:
.globl vector144
vector144:
  pushl $0
  1023e0:	6a 00                	push   $0x0
  pushl $144
  1023e2:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1023e7:	e9 34 05 00 00       	jmp    102920 <__alltraps>

001023ec <vector145>:
.globl vector145
vector145:
  pushl $0
  1023ec:	6a 00                	push   $0x0
  pushl $145
  1023ee:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1023f3:	e9 28 05 00 00       	jmp    102920 <__alltraps>

001023f8 <vector146>:
.globl vector146
vector146:
  pushl $0
  1023f8:	6a 00                	push   $0x0
  pushl $146
  1023fa:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1023ff:	e9 1c 05 00 00       	jmp    102920 <__alltraps>

00102404 <vector147>:
.globl vector147
vector147:
  pushl $0
  102404:	6a 00                	push   $0x0
  pushl $147
  102406:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  10240b:	e9 10 05 00 00       	jmp    102920 <__alltraps>

00102410 <vector148>:
.globl vector148
vector148:
  pushl $0
  102410:	6a 00                	push   $0x0
  pushl $148
  102412:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102417:	e9 04 05 00 00       	jmp    102920 <__alltraps>

0010241c <vector149>:
.globl vector149
vector149:
  pushl $0
  10241c:	6a 00                	push   $0x0
  pushl $149
  10241e:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102423:	e9 f8 04 00 00       	jmp    102920 <__alltraps>

00102428 <vector150>:
.globl vector150
vector150:
  pushl $0
  102428:	6a 00                	push   $0x0
  pushl $150
  10242a:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10242f:	e9 ec 04 00 00       	jmp    102920 <__alltraps>

00102434 <vector151>:
.globl vector151
vector151:
  pushl $0
  102434:	6a 00                	push   $0x0
  pushl $151
  102436:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10243b:	e9 e0 04 00 00       	jmp    102920 <__alltraps>

00102440 <vector152>:
.globl vector152
vector152:
  pushl $0
  102440:	6a 00                	push   $0x0
  pushl $152
  102442:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102447:	e9 d4 04 00 00       	jmp    102920 <__alltraps>

0010244c <vector153>:
.globl vector153
vector153:
  pushl $0
  10244c:	6a 00                	push   $0x0
  pushl $153
  10244e:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102453:	e9 c8 04 00 00       	jmp    102920 <__alltraps>

00102458 <vector154>:
.globl vector154
vector154:
  pushl $0
  102458:	6a 00                	push   $0x0
  pushl $154
  10245a:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  10245f:	e9 bc 04 00 00       	jmp    102920 <__alltraps>

00102464 <vector155>:
.globl vector155
vector155:
  pushl $0
  102464:	6a 00                	push   $0x0
  pushl $155
  102466:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10246b:	e9 b0 04 00 00       	jmp    102920 <__alltraps>

00102470 <vector156>:
.globl vector156
vector156:
  pushl $0
  102470:	6a 00                	push   $0x0
  pushl $156
  102472:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102477:	e9 a4 04 00 00       	jmp    102920 <__alltraps>

0010247c <vector157>:
.globl vector157
vector157:
  pushl $0
  10247c:	6a 00                	push   $0x0
  pushl $157
  10247e:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102483:	e9 98 04 00 00       	jmp    102920 <__alltraps>

00102488 <vector158>:
.globl vector158
vector158:
  pushl $0
  102488:	6a 00                	push   $0x0
  pushl $158
  10248a:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  10248f:	e9 8c 04 00 00       	jmp    102920 <__alltraps>

00102494 <vector159>:
.globl vector159
vector159:
  pushl $0
  102494:	6a 00                	push   $0x0
  pushl $159
  102496:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  10249b:	e9 80 04 00 00       	jmp    102920 <__alltraps>

001024a0 <vector160>:
.globl vector160
vector160:
  pushl $0
  1024a0:	6a 00                	push   $0x0
  pushl $160
  1024a2:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1024a7:	e9 74 04 00 00       	jmp    102920 <__alltraps>

001024ac <vector161>:
.globl vector161
vector161:
  pushl $0
  1024ac:	6a 00                	push   $0x0
  pushl $161
  1024ae:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1024b3:	e9 68 04 00 00       	jmp    102920 <__alltraps>

001024b8 <vector162>:
.globl vector162
vector162:
  pushl $0
  1024b8:	6a 00                	push   $0x0
  pushl $162
  1024ba:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1024bf:	e9 5c 04 00 00       	jmp    102920 <__alltraps>

001024c4 <vector163>:
.globl vector163
vector163:
  pushl $0
  1024c4:	6a 00                	push   $0x0
  pushl $163
  1024c6:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1024cb:	e9 50 04 00 00       	jmp    102920 <__alltraps>

001024d0 <vector164>:
.globl vector164
vector164:
  pushl $0
  1024d0:	6a 00                	push   $0x0
  pushl $164
  1024d2:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1024d7:	e9 44 04 00 00       	jmp    102920 <__alltraps>

001024dc <vector165>:
.globl vector165
vector165:
  pushl $0
  1024dc:	6a 00                	push   $0x0
  pushl $165
  1024de:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1024e3:	e9 38 04 00 00       	jmp    102920 <__alltraps>

001024e8 <vector166>:
.globl vector166
vector166:
  pushl $0
  1024e8:	6a 00                	push   $0x0
  pushl $166
  1024ea:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1024ef:	e9 2c 04 00 00       	jmp    102920 <__alltraps>

001024f4 <vector167>:
.globl vector167
vector167:
  pushl $0
  1024f4:	6a 00                	push   $0x0
  pushl $167
  1024f6:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1024fb:	e9 20 04 00 00       	jmp    102920 <__alltraps>

00102500 <vector168>:
.globl vector168
vector168:
  pushl $0
  102500:	6a 00                	push   $0x0
  pushl $168
  102502:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102507:	e9 14 04 00 00       	jmp    102920 <__alltraps>

0010250c <vector169>:
.globl vector169
vector169:
  pushl $0
  10250c:	6a 00                	push   $0x0
  pushl $169
  10250e:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102513:	e9 08 04 00 00       	jmp    102920 <__alltraps>

00102518 <vector170>:
.globl vector170
vector170:
  pushl $0
  102518:	6a 00                	push   $0x0
  pushl $170
  10251a:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10251f:	e9 fc 03 00 00       	jmp    102920 <__alltraps>

00102524 <vector171>:
.globl vector171
vector171:
  pushl $0
  102524:	6a 00                	push   $0x0
  pushl $171
  102526:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10252b:	e9 f0 03 00 00       	jmp    102920 <__alltraps>

00102530 <vector172>:
.globl vector172
vector172:
  pushl $0
  102530:	6a 00                	push   $0x0
  pushl $172
  102532:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102537:	e9 e4 03 00 00       	jmp    102920 <__alltraps>

0010253c <vector173>:
.globl vector173
vector173:
  pushl $0
  10253c:	6a 00                	push   $0x0
  pushl $173
  10253e:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102543:	e9 d8 03 00 00       	jmp    102920 <__alltraps>

00102548 <vector174>:
.globl vector174
vector174:
  pushl $0
  102548:	6a 00                	push   $0x0
  pushl $174
  10254a:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10254f:	e9 cc 03 00 00       	jmp    102920 <__alltraps>

00102554 <vector175>:
.globl vector175
vector175:
  pushl $0
  102554:	6a 00                	push   $0x0
  pushl $175
  102556:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  10255b:	e9 c0 03 00 00       	jmp    102920 <__alltraps>

00102560 <vector176>:
.globl vector176
vector176:
  pushl $0
  102560:	6a 00                	push   $0x0
  pushl $176
  102562:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102567:	e9 b4 03 00 00       	jmp    102920 <__alltraps>

0010256c <vector177>:
.globl vector177
vector177:
  pushl $0
  10256c:	6a 00                	push   $0x0
  pushl $177
  10256e:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102573:	e9 a8 03 00 00       	jmp    102920 <__alltraps>

00102578 <vector178>:
.globl vector178
vector178:
  pushl $0
  102578:	6a 00                	push   $0x0
  pushl $178
  10257a:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  10257f:	e9 9c 03 00 00       	jmp    102920 <__alltraps>

00102584 <vector179>:
.globl vector179
vector179:
  pushl $0
  102584:	6a 00                	push   $0x0
  pushl $179
  102586:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  10258b:	e9 90 03 00 00       	jmp    102920 <__alltraps>

00102590 <vector180>:
.globl vector180
vector180:
  pushl $0
  102590:	6a 00                	push   $0x0
  pushl $180
  102592:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102597:	e9 84 03 00 00       	jmp    102920 <__alltraps>

0010259c <vector181>:
.globl vector181
vector181:
  pushl $0
  10259c:	6a 00                	push   $0x0
  pushl $181
  10259e:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1025a3:	e9 78 03 00 00       	jmp    102920 <__alltraps>

001025a8 <vector182>:
.globl vector182
vector182:
  pushl $0
  1025a8:	6a 00                	push   $0x0
  pushl $182
  1025aa:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1025af:	e9 6c 03 00 00       	jmp    102920 <__alltraps>

001025b4 <vector183>:
.globl vector183
vector183:
  pushl $0
  1025b4:	6a 00                	push   $0x0
  pushl $183
  1025b6:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1025bb:	e9 60 03 00 00       	jmp    102920 <__alltraps>

001025c0 <vector184>:
.globl vector184
vector184:
  pushl $0
  1025c0:	6a 00                	push   $0x0
  pushl $184
  1025c2:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1025c7:	e9 54 03 00 00       	jmp    102920 <__alltraps>

001025cc <vector185>:
.globl vector185
vector185:
  pushl $0
  1025cc:	6a 00                	push   $0x0
  pushl $185
  1025ce:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1025d3:	e9 48 03 00 00       	jmp    102920 <__alltraps>

001025d8 <vector186>:
.globl vector186
vector186:
  pushl $0
  1025d8:	6a 00                	push   $0x0
  pushl $186
  1025da:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1025df:	e9 3c 03 00 00       	jmp    102920 <__alltraps>

001025e4 <vector187>:
.globl vector187
vector187:
  pushl $0
  1025e4:	6a 00                	push   $0x0
  pushl $187
  1025e6:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1025eb:	e9 30 03 00 00       	jmp    102920 <__alltraps>

001025f0 <vector188>:
.globl vector188
vector188:
  pushl $0
  1025f0:	6a 00                	push   $0x0
  pushl $188
  1025f2:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1025f7:	e9 24 03 00 00       	jmp    102920 <__alltraps>

001025fc <vector189>:
.globl vector189
vector189:
  pushl $0
  1025fc:	6a 00                	push   $0x0
  pushl $189
  1025fe:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102603:	e9 18 03 00 00       	jmp    102920 <__alltraps>

00102608 <vector190>:
.globl vector190
vector190:
  pushl $0
  102608:	6a 00                	push   $0x0
  pushl $190
  10260a:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  10260f:	e9 0c 03 00 00       	jmp    102920 <__alltraps>

00102614 <vector191>:
.globl vector191
vector191:
  pushl $0
  102614:	6a 00                	push   $0x0
  pushl $191
  102616:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10261b:	e9 00 03 00 00       	jmp    102920 <__alltraps>

00102620 <vector192>:
.globl vector192
vector192:
  pushl $0
  102620:	6a 00                	push   $0x0
  pushl $192
  102622:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102627:	e9 f4 02 00 00       	jmp    102920 <__alltraps>

0010262c <vector193>:
.globl vector193
vector193:
  pushl $0
  10262c:	6a 00                	push   $0x0
  pushl $193
  10262e:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102633:	e9 e8 02 00 00       	jmp    102920 <__alltraps>

00102638 <vector194>:
.globl vector194
vector194:
  pushl $0
  102638:	6a 00                	push   $0x0
  pushl $194
  10263a:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10263f:	e9 dc 02 00 00       	jmp    102920 <__alltraps>

00102644 <vector195>:
.globl vector195
vector195:
  pushl $0
  102644:	6a 00                	push   $0x0
  pushl $195
  102646:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10264b:	e9 d0 02 00 00       	jmp    102920 <__alltraps>

00102650 <vector196>:
.globl vector196
vector196:
  pushl $0
  102650:	6a 00                	push   $0x0
  pushl $196
  102652:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102657:	e9 c4 02 00 00       	jmp    102920 <__alltraps>

0010265c <vector197>:
.globl vector197
vector197:
  pushl $0
  10265c:	6a 00                	push   $0x0
  pushl $197
  10265e:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102663:	e9 b8 02 00 00       	jmp    102920 <__alltraps>

00102668 <vector198>:
.globl vector198
vector198:
  pushl $0
  102668:	6a 00                	push   $0x0
  pushl $198
  10266a:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  10266f:	e9 ac 02 00 00       	jmp    102920 <__alltraps>

00102674 <vector199>:
.globl vector199
vector199:
  pushl $0
  102674:	6a 00                	push   $0x0
  pushl $199
  102676:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  10267b:	e9 a0 02 00 00       	jmp    102920 <__alltraps>

00102680 <vector200>:
.globl vector200
vector200:
  pushl $0
  102680:	6a 00                	push   $0x0
  pushl $200
  102682:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102687:	e9 94 02 00 00       	jmp    102920 <__alltraps>

0010268c <vector201>:
.globl vector201
vector201:
  pushl $0
  10268c:	6a 00                	push   $0x0
  pushl $201
  10268e:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102693:	e9 88 02 00 00       	jmp    102920 <__alltraps>

00102698 <vector202>:
.globl vector202
vector202:
  pushl $0
  102698:	6a 00                	push   $0x0
  pushl $202
  10269a:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  10269f:	e9 7c 02 00 00       	jmp    102920 <__alltraps>

001026a4 <vector203>:
.globl vector203
vector203:
  pushl $0
  1026a4:	6a 00                	push   $0x0
  pushl $203
  1026a6:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1026ab:	e9 70 02 00 00       	jmp    102920 <__alltraps>

001026b0 <vector204>:
.globl vector204
vector204:
  pushl $0
  1026b0:	6a 00                	push   $0x0
  pushl $204
  1026b2:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1026b7:	e9 64 02 00 00       	jmp    102920 <__alltraps>

001026bc <vector205>:
.globl vector205
vector205:
  pushl $0
  1026bc:	6a 00                	push   $0x0
  pushl $205
  1026be:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1026c3:	e9 58 02 00 00       	jmp    102920 <__alltraps>

001026c8 <vector206>:
.globl vector206
vector206:
  pushl $0
  1026c8:	6a 00                	push   $0x0
  pushl $206
  1026ca:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1026cf:	e9 4c 02 00 00       	jmp    102920 <__alltraps>

001026d4 <vector207>:
.globl vector207
vector207:
  pushl $0
  1026d4:	6a 00                	push   $0x0
  pushl $207
  1026d6:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1026db:	e9 40 02 00 00       	jmp    102920 <__alltraps>

001026e0 <vector208>:
.globl vector208
vector208:
  pushl $0
  1026e0:	6a 00                	push   $0x0
  pushl $208
  1026e2:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1026e7:	e9 34 02 00 00       	jmp    102920 <__alltraps>

001026ec <vector209>:
.globl vector209
vector209:
  pushl $0
  1026ec:	6a 00                	push   $0x0
  pushl $209
  1026ee:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1026f3:	e9 28 02 00 00       	jmp    102920 <__alltraps>

001026f8 <vector210>:
.globl vector210
vector210:
  pushl $0
  1026f8:	6a 00                	push   $0x0
  pushl $210
  1026fa:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1026ff:	e9 1c 02 00 00       	jmp    102920 <__alltraps>

00102704 <vector211>:
.globl vector211
vector211:
  pushl $0
  102704:	6a 00                	push   $0x0
  pushl $211
  102706:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  10270b:	e9 10 02 00 00       	jmp    102920 <__alltraps>

00102710 <vector212>:
.globl vector212
vector212:
  pushl $0
  102710:	6a 00                	push   $0x0
  pushl $212
  102712:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102717:	e9 04 02 00 00       	jmp    102920 <__alltraps>

0010271c <vector213>:
.globl vector213
vector213:
  pushl $0
  10271c:	6a 00                	push   $0x0
  pushl $213
  10271e:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102723:	e9 f8 01 00 00       	jmp    102920 <__alltraps>

00102728 <vector214>:
.globl vector214
vector214:
  pushl $0
  102728:	6a 00                	push   $0x0
  pushl $214
  10272a:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10272f:	e9 ec 01 00 00       	jmp    102920 <__alltraps>

00102734 <vector215>:
.globl vector215
vector215:
  pushl $0
  102734:	6a 00                	push   $0x0
  pushl $215
  102736:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  10273b:	e9 e0 01 00 00       	jmp    102920 <__alltraps>

00102740 <vector216>:
.globl vector216
vector216:
  pushl $0
  102740:	6a 00                	push   $0x0
  pushl $216
  102742:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102747:	e9 d4 01 00 00       	jmp    102920 <__alltraps>

0010274c <vector217>:
.globl vector217
vector217:
  pushl $0
  10274c:	6a 00                	push   $0x0
  pushl $217
  10274e:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102753:	e9 c8 01 00 00       	jmp    102920 <__alltraps>

00102758 <vector218>:
.globl vector218
vector218:
  pushl $0
  102758:	6a 00                	push   $0x0
  pushl $218
  10275a:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  10275f:	e9 bc 01 00 00       	jmp    102920 <__alltraps>

00102764 <vector219>:
.globl vector219
vector219:
  pushl $0
  102764:	6a 00                	push   $0x0
  pushl $219
  102766:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  10276b:	e9 b0 01 00 00       	jmp    102920 <__alltraps>

00102770 <vector220>:
.globl vector220
vector220:
  pushl $0
  102770:	6a 00                	push   $0x0
  pushl $220
  102772:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102777:	e9 a4 01 00 00       	jmp    102920 <__alltraps>

0010277c <vector221>:
.globl vector221
vector221:
  pushl $0
  10277c:	6a 00                	push   $0x0
  pushl $221
  10277e:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102783:	e9 98 01 00 00       	jmp    102920 <__alltraps>

00102788 <vector222>:
.globl vector222
vector222:
  pushl $0
  102788:	6a 00                	push   $0x0
  pushl $222
  10278a:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  10278f:	e9 8c 01 00 00       	jmp    102920 <__alltraps>

00102794 <vector223>:
.globl vector223
vector223:
  pushl $0
  102794:	6a 00                	push   $0x0
  pushl $223
  102796:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  10279b:	e9 80 01 00 00       	jmp    102920 <__alltraps>

001027a0 <vector224>:
.globl vector224
vector224:
  pushl $0
  1027a0:	6a 00                	push   $0x0
  pushl $224
  1027a2:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1027a7:	e9 74 01 00 00       	jmp    102920 <__alltraps>

001027ac <vector225>:
.globl vector225
vector225:
  pushl $0
  1027ac:	6a 00                	push   $0x0
  pushl $225
  1027ae:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1027b3:	e9 68 01 00 00       	jmp    102920 <__alltraps>

001027b8 <vector226>:
.globl vector226
vector226:
  pushl $0
  1027b8:	6a 00                	push   $0x0
  pushl $226
  1027ba:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1027bf:	e9 5c 01 00 00       	jmp    102920 <__alltraps>

001027c4 <vector227>:
.globl vector227
vector227:
  pushl $0
  1027c4:	6a 00                	push   $0x0
  pushl $227
  1027c6:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1027cb:	e9 50 01 00 00       	jmp    102920 <__alltraps>

001027d0 <vector228>:
.globl vector228
vector228:
  pushl $0
  1027d0:	6a 00                	push   $0x0
  pushl $228
  1027d2:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1027d7:	e9 44 01 00 00       	jmp    102920 <__alltraps>

001027dc <vector229>:
.globl vector229
vector229:
  pushl $0
  1027dc:	6a 00                	push   $0x0
  pushl $229
  1027de:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1027e3:	e9 38 01 00 00       	jmp    102920 <__alltraps>

001027e8 <vector230>:
.globl vector230
vector230:
  pushl $0
  1027e8:	6a 00                	push   $0x0
  pushl $230
  1027ea:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1027ef:	e9 2c 01 00 00       	jmp    102920 <__alltraps>

001027f4 <vector231>:
.globl vector231
vector231:
  pushl $0
  1027f4:	6a 00                	push   $0x0
  pushl $231
  1027f6:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1027fb:	e9 20 01 00 00       	jmp    102920 <__alltraps>

00102800 <vector232>:
.globl vector232
vector232:
  pushl $0
  102800:	6a 00                	push   $0x0
  pushl $232
  102802:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102807:	e9 14 01 00 00       	jmp    102920 <__alltraps>

0010280c <vector233>:
.globl vector233
vector233:
  pushl $0
  10280c:	6a 00                	push   $0x0
  pushl $233
  10280e:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102813:	e9 08 01 00 00       	jmp    102920 <__alltraps>

00102818 <vector234>:
.globl vector234
vector234:
  pushl $0
  102818:	6a 00                	push   $0x0
  pushl $234
  10281a:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10281f:	e9 fc 00 00 00       	jmp    102920 <__alltraps>

00102824 <vector235>:
.globl vector235
vector235:
  pushl $0
  102824:	6a 00                	push   $0x0
  pushl $235
  102826:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  10282b:	e9 f0 00 00 00       	jmp    102920 <__alltraps>

00102830 <vector236>:
.globl vector236
vector236:
  pushl $0
  102830:	6a 00                	push   $0x0
  pushl $236
  102832:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102837:	e9 e4 00 00 00       	jmp    102920 <__alltraps>

0010283c <vector237>:
.globl vector237
vector237:
  pushl $0
  10283c:	6a 00                	push   $0x0
  pushl $237
  10283e:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102843:	e9 d8 00 00 00       	jmp    102920 <__alltraps>

00102848 <vector238>:
.globl vector238
vector238:
  pushl $0
  102848:	6a 00                	push   $0x0
  pushl $238
  10284a:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  10284f:	e9 cc 00 00 00       	jmp    102920 <__alltraps>

00102854 <vector239>:
.globl vector239
vector239:
  pushl $0
  102854:	6a 00                	push   $0x0
  pushl $239
  102856:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  10285b:	e9 c0 00 00 00       	jmp    102920 <__alltraps>

00102860 <vector240>:
.globl vector240
vector240:
  pushl $0
  102860:	6a 00                	push   $0x0
  pushl $240
  102862:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102867:	e9 b4 00 00 00       	jmp    102920 <__alltraps>

0010286c <vector241>:
.globl vector241
vector241:
  pushl $0
  10286c:	6a 00                	push   $0x0
  pushl $241
  10286e:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102873:	e9 a8 00 00 00       	jmp    102920 <__alltraps>

00102878 <vector242>:
.globl vector242
vector242:
  pushl $0
  102878:	6a 00                	push   $0x0
  pushl $242
  10287a:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  10287f:	e9 9c 00 00 00       	jmp    102920 <__alltraps>

00102884 <vector243>:
.globl vector243
vector243:
  pushl $0
  102884:	6a 00                	push   $0x0
  pushl $243
  102886:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  10288b:	e9 90 00 00 00       	jmp    102920 <__alltraps>

00102890 <vector244>:
.globl vector244
vector244:
  pushl $0
  102890:	6a 00                	push   $0x0
  pushl $244
  102892:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102897:	e9 84 00 00 00       	jmp    102920 <__alltraps>

0010289c <vector245>:
.globl vector245
vector245:
  pushl $0
  10289c:	6a 00                	push   $0x0
  pushl $245
  10289e:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1028a3:	e9 78 00 00 00       	jmp    102920 <__alltraps>

001028a8 <vector246>:
.globl vector246
vector246:
  pushl $0
  1028a8:	6a 00                	push   $0x0
  pushl $246
  1028aa:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1028af:	e9 6c 00 00 00       	jmp    102920 <__alltraps>

001028b4 <vector247>:
.globl vector247
vector247:
  pushl $0
  1028b4:	6a 00                	push   $0x0
  pushl $247
  1028b6:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1028bb:	e9 60 00 00 00       	jmp    102920 <__alltraps>

001028c0 <vector248>:
.globl vector248
vector248:
  pushl $0
  1028c0:	6a 00                	push   $0x0
  pushl $248
  1028c2:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1028c7:	e9 54 00 00 00       	jmp    102920 <__alltraps>

001028cc <vector249>:
.globl vector249
vector249:
  pushl $0
  1028cc:	6a 00                	push   $0x0
  pushl $249
  1028ce:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1028d3:	e9 48 00 00 00       	jmp    102920 <__alltraps>

001028d8 <vector250>:
.globl vector250
vector250:
  pushl $0
  1028d8:	6a 00                	push   $0x0
  pushl $250
  1028da:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1028df:	e9 3c 00 00 00       	jmp    102920 <__alltraps>

001028e4 <vector251>:
.globl vector251
vector251:
  pushl $0
  1028e4:	6a 00                	push   $0x0
  pushl $251
  1028e6:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1028eb:	e9 30 00 00 00       	jmp    102920 <__alltraps>

001028f0 <vector252>:
.globl vector252
vector252:
  pushl $0
  1028f0:	6a 00                	push   $0x0
  pushl $252
  1028f2:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1028f7:	e9 24 00 00 00       	jmp    102920 <__alltraps>

001028fc <vector253>:
.globl vector253
vector253:
  pushl $0
  1028fc:	6a 00                	push   $0x0
  pushl $253
  1028fe:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102903:	e9 18 00 00 00       	jmp    102920 <__alltraps>

00102908 <vector254>:
.globl vector254
vector254:
  pushl $0
  102908:	6a 00                	push   $0x0
  pushl $254
  10290a:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  10290f:	e9 0c 00 00 00       	jmp    102920 <__alltraps>

00102914 <vector255>:
.globl vector255
vector255:
  pushl $0
  102914:	6a 00                	push   $0x0
  pushl $255
  102916:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  10291b:	e9 00 00 00 00       	jmp    102920 <__alltraps>

00102920 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102920:	1e                   	push   %ds
    pushl %es
  102921:	06                   	push   %es
    pushl %fs
  102922:	0f a0                	push   %fs
    pushl %gs
  102924:	0f a8                	push   %gs
    pushal
  102926:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102927:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  10292c:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  10292e:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102930:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102931:	e8 60 f5 ff ff       	call   101e96 <trap>

    # pop the pushed stack pointer
    popl %esp
  102936:	5c                   	pop    %esp

00102937 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102937:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102938:	0f a9                	pop    %gs
    popl %fs
  10293a:	0f a1                	pop    %fs
    popl %es
  10293c:	07                   	pop    %es
    popl %ds
  10293d:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  10293e:	83 c4 08             	add    $0x8,%esp
    iret
  102941:	cf                   	iret   

00102942 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102942:	55                   	push   %ebp
  102943:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102945:	8b 45 08             	mov    0x8(%ebp),%eax
  102948:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  10294b:	b8 23 00 00 00       	mov    $0x23,%eax
  102950:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102952:	b8 23 00 00 00       	mov    $0x23,%eax
  102957:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102959:	b8 10 00 00 00       	mov    $0x10,%eax
  10295e:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102960:	b8 10 00 00 00       	mov    $0x10,%eax
  102965:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102967:	b8 10 00 00 00       	mov    $0x10,%eax
  10296c:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  10296e:	ea 75 29 10 00 08 00 	ljmp   $0x8,$0x102975
}
  102975:	90                   	nop
  102976:	5d                   	pop    %ebp
  102977:	c3                   	ret    

00102978 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102978:	f3 0f 1e fb          	endbr32 
  10297c:	55                   	push   %ebp
  10297d:	89 e5                	mov    %esp,%ebp
  10297f:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102982:	b8 20 09 11 00       	mov    $0x110920,%eax
  102987:	05 00 04 00 00       	add    $0x400,%eax
  10298c:	a3 a4 08 11 00       	mov    %eax,0x1108a4
    ts.ts_ss0 = KERNEL_DS;
  102991:	66 c7 05 a8 08 11 00 	movw   $0x10,0x1108a8
  102998:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  10299a:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  1029a1:	68 00 
  1029a3:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  1029a8:	0f b7 c0             	movzwl %ax,%eax
  1029ab:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  1029b1:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  1029b6:	c1 e8 10             	shr    $0x10,%eax
  1029b9:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  1029be:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029c5:	24 f0                	and    $0xf0,%al
  1029c7:	0c 09                	or     $0x9,%al
  1029c9:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029ce:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029d5:	0c 10                	or     $0x10,%al
  1029d7:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029dc:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029e3:	24 9f                	and    $0x9f,%al
  1029e5:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029ea:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029f1:	0c 80                	or     $0x80,%al
  1029f3:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029f8:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1029ff:	24 f0                	and    $0xf0,%al
  102a01:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a06:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a0d:	24 ef                	and    $0xef,%al
  102a0f:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a14:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a1b:	24 df                	and    $0xdf,%al
  102a1d:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a22:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a29:	0c 40                	or     $0x40,%al
  102a2b:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a30:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a37:	24 7f                	and    $0x7f,%al
  102a39:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a3e:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102a43:	c1 e8 18             	shr    $0x18,%eax
  102a46:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  102a4b:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102a52:	24 ef                	and    $0xef,%al
  102a54:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a59:	c7 04 24 10 fa 10 00 	movl   $0x10fa10,(%esp)
  102a60:	e8 dd fe ff ff       	call   102942 <lgdt>
  102a65:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a6b:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a6f:	0f 00 d8             	ltr    %ax
}
  102a72:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102a73:	90                   	nop
  102a74:	c9                   	leave  
  102a75:	c3                   	ret    

00102a76 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102a76:	f3 0f 1e fb          	endbr32 
  102a7a:	55                   	push   %ebp
  102a7b:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102a7d:	e8 f6 fe ff ff       	call   102978 <gdt_init>
}
  102a82:	90                   	nop
  102a83:	5d                   	pop    %ebp
  102a84:	c3                   	ret    

00102a85 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102a85:	f3 0f 1e fb          	endbr32 
  102a89:	55                   	push   %ebp
  102a8a:	89 e5                	mov    %esp,%ebp
  102a8c:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102a8f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102a96:	eb 03                	jmp    102a9b <strlen+0x16>
        cnt ++;
  102a98:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  102a9b:	8b 45 08             	mov    0x8(%ebp),%eax
  102a9e:	8d 50 01             	lea    0x1(%eax),%edx
  102aa1:	89 55 08             	mov    %edx,0x8(%ebp)
  102aa4:	0f b6 00             	movzbl (%eax),%eax
  102aa7:	84 c0                	test   %al,%al
  102aa9:	75 ed                	jne    102a98 <strlen+0x13>
    }
    return cnt;
  102aab:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102aae:	c9                   	leave  
  102aaf:	c3                   	ret    

00102ab0 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102ab0:	f3 0f 1e fb          	endbr32 
  102ab4:	55                   	push   %ebp
  102ab5:	89 e5                	mov    %esp,%ebp
  102ab7:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102aba:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102ac1:	eb 03                	jmp    102ac6 <strnlen+0x16>
        cnt ++;
  102ac3:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102ac6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ac9:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102acc:	73 10                	jae    102ade <strnlen+0x2e>
  102ace:	8b 45 08             	mov    0x8(%ebp),%eax
  102ad1:	8d 50 01             	lea    0x1(%eax),%edx
  102ad4:	89 55 08             	mov    %edx,0x8(%ebp)
  102ad7:	0f b6 00             	movzbl (%eax),%eax
  102ada:	84 c0                	test   %al,%al
  102adc:	75 e5                	jne    102ac3 <strnlen+0x13>
    }
    return cnt;
  102ade:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102ae1:	c9                   	leave  
  102ae2:	c3                   	ret    

00102ae3 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102ae3:	f3 0f 1e fb          	endbr32 
  102ae7:	55                   	push   %ebp
  102ae8:	89 e5                	mov    %esp,%ebp
  102aea:	57                   	push   %edi
  102aeb:	56                   	push   %esi
  102aec:	83 ec 20             	sub    $0x20,%esp
  102aef:	8b 45 08             	mov    0x8(%ebp),%eax
  102af2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102af5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102af8:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102afb:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102afe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b01:	89 d1                	mov    %edx,%ecx
  102b03:	89 c2                	mov    %eax,%edx
  102b05:	89 ce                	mov    %ecx,%esi
  102b07:	89 d7                	mov    %edx,%edi
  102b09:	ac                   	lods   %ds:(%esi),%al
  102b0a:	aa                   	stos   %al,%es:(%edi)
  102b0b:	84 c0                	test   %al,%al
  102b0d:	75 fa                	jne    102b09 <strcpy+0x26>
  102b0f:	89 fa                	mov    %edi,%edx
  102b11:	89 f1                	mov    %esi,%ecx
  102b13:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102b16:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102b19:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102b1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102b1f:	83 c4 20             	add    $0x20,%esp
  102b22:	5e                   	pop    %esi
  102b23:	5f                   	pop    %edi
  102b24:	5d                   	pop    %ebp
  102b25:	c3                   	ret    

00102b26 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102b26:	f3 0f 1e fb          	endbr32 
  102b2a:	55                   	push   %ebp
  102b2b:	89 e5                	mov    %esp,%ebp
  102b2d:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102b30:	8b 45 08             	mov    0x8(%ebp),%eax
  102b33:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102b36:	eb 1e                	jmp    102b56 <strncpy+0x30>
        if ((*p = *src) != '\0') {
  102b38:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b3b:	0f b6 10             	movzbl (%eax),%edx
  102b3e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b41:	88 10                	mov    %dl,(%eax)
  102b43:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b46:	0f b6 00             	movzbl (%eax),%eax
  102b49:	84 c0                	test   %al,%al
  102b4b:	74 03                	je     102b50 <strncpy+0x2a>
            src ++;
  102b4d:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102b50:	ff 45 fc             	incl   -0x4(%ebp)
  102b53:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  102b56:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b5a:	75 dc                	jne    102b38 <strncpy+0x12>
    }
    return dst;
  102b5c:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102b5f:	c9                   	leave  
  102b60:	c3                   	ret    

00102b61 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102b61:	f3 0f 1e fb          	endbr32 
  102b65:	55                   	push   %ebp
  102b66:	89 e5                	mov    %esp,%ebp
  102b68:	57                   	push   %edi
  102b69:	56                   	push   %esi
  102b6a:	83 ec 20             	sub    $0x20,%esp
  102b6d:	8b 45 08             	mov    0x8(%ebp),%eax
  102b70:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b73:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b76:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102b79:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b7f:	89 d1                	mov    %edx,%ecx
  102b81:	89 c2                	mov    %eax,%edx
  102b83:	89 ce                	mov    %ecx,%esi
  102b85:	89 d7                	mov    %edx,%edi
  102b87:	ac                   	lods   %ds:(%esi),%al
  102b88:	ae                   	scas   %es:(%edi),%al
  102b89:	75 08                	jne    102b93 <strcmp+0x32>
  102b8b:	84 c0                	test   %al,%al
  102b8d:	75 f8                	jne    102b87 <strcmp+0x26>
  102b8f:	31 c0                	xor    %eax,%eax
  102b91:	eb 04                	jmp    102b97 <strcmp+0x36>
  102b93:	19 c0                	sbb    %eax,%eax
  102b95:	0c 01                	or     $0x1,%al
  102b97:	89 fa                	mov    %edi,%edx
  102b99:	89 f1                	mov    %esi,%ecx
  102b9b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102b9e:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102ba1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102ba4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102ba7:	83 c4 20             	add    $0x20,%esp
  102baa:	5e                   	pop    %esi
  102bab:	5f                   	pop    %edi
  102bac:	5d                   	pop    %ebp
  102bad:	c3                   	ret    

00102bae <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102bae:	f3 0f 1e fb          	endbr32 
  102bb2:	55                   	push   %ebp
  102bb3:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102bb5:	eb 09                	jmp    102bc0 <strncmp+0x12>
        n --, s1 ++, s2 ++;
  102bb7:	ff 4d 10             	decl   0x10(%ebp)
  102bba:	ff 45 08             	incl   0x8(%ebp)
  102bbd:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102bc0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bc4:	74 1a                	je     102be0 <strncmp+0x32>
  102bc6:	8b 45 08             	mov    0x8(%ebp),%eax
  102bc9:	0f b6 00             	movzbl (%eax),%eax
  102bcc:	84 c0                	test   %al,%al
  102bce:	74 10                	je     102be0 <strncmp+0x32>
  102bd0:	8b 45 08             	mov    0x8(%ebp),%eax
  102bd3:	0f b6 10             	movzbl (%eax),%edx
  102bd6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bd9:	0f b6 00             	movzbl (%eax),%eax
  102bdc:	38 c2                	cmp    %al,%dl
  102bde:	74 d7                	je     102bb7 <strncmp+0x9>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102be0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102be4:	74 18                	je     102bfe <strncmp+0x50>
  102be6:	8b 45 08             	mov    0x8(%ebp),%eax
  102be9:	0f b6 00             	movzbl (%eax),%eax
  102bec:	0f b6 d0             	movzbl %al,%edx
  102bef:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bf2:	0f b6 00             	movzbl (%eax),%eax
  102bf5:	0f b6 c0             	movzbl %al,%eax
  102bf8:	29 c2                	sub    %eax,%edx
  102bfa:	89 d0                	mov    %edx,%eax
  102bfc:	eb 05                	jmp    102c03 <strncmp+0x55>
  102bfe:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c03:	5d                   	pop    %ebp
  102c04:	c3                   	ret    

00102c05 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102c05:	f3 0f 1e fb          	endbr32 
  102c09:	55                   	push   %ebp
  102c0a:	89 e5                	mov    %esp,%ebp
  102c0c:	83 ec 04             	sub    $0x4,%esp
  102c0f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c12:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c15:	eb 13                	jmp    102c2a <strchr+0x25>
        if (*s == c) {
  102c17:	8b 45 08             	mov    0x8(%ebp),%eax
  102c1a:	0f b6 00             	movzbl (%eax),%eax
  102c1d:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102c20:	75 05                	jne    102c27 <strchr+0x22>
            return (char *)s;
  102c22:	8b 45 08             	mov    0x8(%ebp),%eax
  102c25:	eb 12                	jmp    102c39 <strchr+0x34>
        }
        s ++;
  102c27:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102c2a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c2d:	0f b6 00             	movzbl (%eax),%eax
  102c30:	84 c0                	test   %al,%al
  102c32:	75 e3                	jne    102c17 <strchr+0x12>
    }
    return NULL;
  102c34:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c39:	c9                   	leave  
  102c3a:	c3                   	ret    

00102c3b <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102c3b:	f3 0f 1e fb          	endbr32 
  102c3f:	55                   	push   %ebp
  102c40:	89 e5                	mov    %esp,%ebp
  102c42:	83 ec 04             	sub    $0x4,%esp
  102c45:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c48:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c4b:	eb 0e                	jmp    102c5b <strfind+0x20>
        if (*s == c) {
  102c4d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c50:	0f b6 00             	movzbl (%eax),%eax
  102c53:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102c56:	74 0f                	je     102c67 <strfind+0x2c>
            break;
        }
        s ++;
  102c58:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102c5b:	8b 45 08             	mov    0x8(%ebp),%eax
  102c5e:	0f b6 00             	movzbl (%eax),%eax
  102c61:	84 c0                	test   %al,%al
  102c63:	75 e8                	jne    102c4d <strfind+0x12>
  102c65:	eb 01                	jmp    102c68 <strfind+0x2d>
            break;
  102c67:	90                   	nop
    }
    return (char *)s;
  102c68:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102c6b:	c9                   	leave  
  102c6c:	c3                   	ret    

00102c6d <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102c6d:	f3 0f 1e fb          	endbr32 
  102c71:	55                   	push   %ebp
  102c72:	89 e5                	mov    %esp,%ebp
  102c74:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102c77:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102c7e:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102c85:	eb 03                	jmp    102c8a <strtol+0x1d>
        s ++;
  102c87:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102c8a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c8d:	0f b6 00             	movzbl (%eax),%eax
  102c90:	3c 20                	cmp    $0x20,%al
  102c92:	74 f3                	je     102c87 <strtol+0x1a>
  102c94:	8b 45 08             	mov    0x8(%ebp),%eax
  102c97:	0f b6 00             	movzbl (%eax),%eax
  102c9a:	3c 09                	cmp    $0x9,%al
  102c9c:	74 e9                	je     102c87 <strtol+0x1a>
    }

    // plus/minus sign
    if (*s == '+') {
  102c9e:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca1:	0f b6 00             	movzbl (%eax),%eax
  102ca4:	3c 2b                	cmp    $0x2b,%al
  102ca6:	75 05                	jne    102cad <strtol+0x40>
        s ++;
  102ca8:	ff 45 08             	incl   0x8(%ebp)
  102cab:	eb 14                	jmp    102cc1 <strtol+0x54>
    }
    else if (*s == '-') {
  102cad:	8b 45 08             	mov    0x8(%ebp),%eax
  102cb0:	0f b6 00             	movzbl (%eax),%eax
  102cb3:	3c 2d                	cmp    $0x2d,%al
  102cb5:	75 0a                	jne    102cc1 <strtol+0x54>
        s ++, neg = 1;
  102cb7:	ff 45 08             	incl   0x8(%ebp)
  102cba:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102cc1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cc5:	74 06                	je     102ccd <strtol+0x60>
  102cc7:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102ccb:	75 22                	jne    102cef <strtol+0x82>
  102ccd:	8b 45 08             	mov    0x8(%ebp),%eax
  102cd0:	0f b6 00             	movzbl (%eax),%eax
  102cd3:	3c 30                	cmp    $0x30,%al
  102cd5:	75 18                	jne    102cef <strtol+0x82>
  102cd7:	8b 45 08             	mov    0x8(%ebp),%eax
  102cda:	40                   	inc    %eax
  102cdb:	0f b6 00             	movzbl (%eax),%eax
  102cde:	3c 78                	cmp    $0x78,%al
  102ce0:	75 0d                	jne    102cef <strtol+0x82>
        s += 2, base = 16;
  102ce2:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102ce6:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102ced:	eb 29                	jmp    102d18 <strtol+0xab>
    }
    else if (base == 0 && s[0] == '0') {
  102cef:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cf3:	75 16                	jne    102d0b <strtol+0x9e>
  102cf5:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf8:	0f b6 00             	movzbl (%eax),%eax
  102cfb:	3c 30                	cmp    $0x30,%al
  102cfd:	75 0c                	jne    102d0b <strtol+0x9e>
        s ++, base = 8;
  102cff:	ff 45 08             	incl   0x8(%ebp)
  102d02:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102d09:	eb 0d                	jmp    102d18 <strtol+0xab>
    }
    else if (base == 0) {
  102d0b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d0f:	75 07                	jne    102d18 <strtol+0xab>
        base = 10;
  102d11:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102d18:	8b 45 08             	mov    0x8(%ebp),%eax
  102d1b:	0f b6 00             	movzbl (%eax),%eax
  102d1e:	3c 2f                	cmp    $0x2f,%al
  102d20:	7e 1b                	jle    102d3d <strtol+0xd0>
  102d22:	8b 45 08             	mov    0x8(%ebp),%eax
  102d25:	0f b6 00             	movzbl (%eax),%eax
  102d28:	3c 39                	cmp    $0x39,%al
  102d2a:	7f 11                	jg     102d3d <strtol+0xd0>
            dig = *s - '0';
  102d2c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d2f:	0f b6 00             	movzbl (%eax),%eax
  102d32:	0f be c0             	movsbl %al,%eax
  102d35:	83 e8 30             	sub    $0x30,%eax
  102d38:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d3b:	eb 48                	jmp    102d85 <strtol+0x118>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102d3d:	8b 45 08             	mov    0x8(%ebp),%eax
  102d40:	0f b6 00             	movzbl (%eax),%eax
  102d43:	3c 60                	cmp    $0x60,%al
  102d45:	7e 1b                	jle    102d62 <strtol+0xf5>
  102d47:	8b 45 08             	mov    0x8(%ebp),%eax
  102d4a:	0f b6 00             	movzbl (%eax),%eax
  102d4d:	3c 7a                	cmp    $0x7a,%al
  102d4f:	7f 11                	jg     102d62 <strtol+0xf5>
            dig = *s - 'a' + 10;
  102d51:	8b 45 08             	mov    0x8(%ebp),%eax
  102d54:	0f b6 00             	movzbl (%eax),%eax
  102d57:	0f be c0             	movsbl %al,%eax
  102d5a:	83 e8 57             	sub    $0x57,%eax
  102d5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d60:	eb 23                	jmp    102d85 <strtol+0x118>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102d62:	8b 45 08             	mov    0x8(%ebp),%eax
  102d65:	0f b6 00             	movzbl (%eax),%eax
  102d68:	3c 40                	cmp    $0x40,%al
  102d6a:	7e 3b                	jle    102da7 <strtol+0x13a>
  102d6c:	8b 45 08             	mov    0x8(%ebp),%eax
  102d6f:	0f b6 00             	movzbl (%eax),%eax
  102d72:	3c 5a                	cmp    $0x5a,%al
  102d74:	7f 31                	jg     102da7 <strtol+0x13a>
            dig = *s - 'A' + 10;
  102d76:	8b 45 08             	mov    0x8(%ebp),%eax
  102d79:	0f b6 00             	movzbl (%eax),%eax
  102d7c:	0f be c0             	movsbl %al,%eax
  102d7f:	83 e8 37             	sub    $0x37,%eax
  102d82:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102d85:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d88:	3b 45 10             	cmp    0x10(%ebp),%eax
  102d8b:	7d 19                	jge    102da6 <strtol+0x139>
            break;
        }
        s ++, val = (val * base) + dig;
  102d8d:	ff 45 08             	incl   0x8(%ebp)
  102d90:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d93:	0f af 45 10          	imul   0x10(%ebp),%eax
  102d97:	89 c2                	mov    %eax,%edx
  102d99:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d9c:	01 d0                	add    %edx,%eax
  102d9e:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102da1:	e9 72 ff ff ff       	jmp    102d18 <strtol+0xab>
            break;
  102da6:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102da7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102dab:	74 08                	je     102db5 <strtol+0x148>
        *endptr = (char *) s;
  102dad:	8b 45 0c             	mov    0xc(%ebp),%eax
  102db0:	8b 55 08             	mov    0x8(%ebp),%edx
  102db3:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102db5:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102db9:	74 07                	je     102dc2 <strtol+0x155>
  102dbb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102dbe:	f7 d8                	neg    %eax
  102dc0:	eb 03                	jmp    102dc5 <strtol+0x158>
  102dc2:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102dc5:	c9                   	leave  
  102dc6:	c3                   	ret    

00102dc7 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102dc7:	f3 0f 1e fb          	endbr32 
  102dcb:	55                   	push   %ebp
  102dcc:	89 e5                	mov    %esp,%ebp
  102dce:	57                   	push   %edi
  102dcf:	83 ec 24             	sub    $0x24,%esp
  102dd2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dd5:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102dd8:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  102ddc:	8b 45 08             	mov    0x8(%ebp),%eax
  102ddf:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102de2:	88 55 f7             	mov    %dl,-0x9(%ebp)
  102de5:	8b 45 10             	mov    0x10(%ebp),%eax
  102de8:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102deb:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102dee:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102df2:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102df5:	89 d7                	mov    %edx,%edi
  102df7:	f3 aa                	rep stos %al,%es:(%edi)
  102df9:	89 fa                	mov    %edi,%edx
  102dfb:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102dfe:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102e01:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102e04:	83 c4 24             	add    $0x24,%esp
  102e07:	5f                   	pop    %edi
  102e08:	5d                   	pop    %ebp
  102e09:	c3                   	ret    

00102e0a <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102e0a:	f3 0f 1e fb          	endbr32 
  102e0e:	55                   	push   %ebp
  102e0f:	89 e5                	mov    %esp,%ebp
  102e11:	57                   	push   %edi
  102e12:	56                   	push   %esi
  102e13:	53                   	push   %ebx
  102e14:	83 ec 30             	sub    $0x30,%esp
  102e17:	8b 45 08             	mov    0x8(%ebp),%eax
  102e1a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e1d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e20:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102e23:	8b 45 10             	mov    0x10(%ebp),%eax
  102e26:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102e29:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e2c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e2f:	73 42                	jae    102e73 <memmove+0x69>
  102e31:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e34:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102e37:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e3a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e3d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e40:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102e43:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e46:	c1 e8 02             	shr    $0x2,%eax
  102e49:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102e4b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e4e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e51:	89 d7                	mov    %edx,%edi
  102e53:	89 c6                	mov    %eax,%esi
  102e55:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102e57:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102e5a:	83 e1 03             	and    $0x3,%ecx
  102e5d:	74 02                	je     102e61 <memmove+0x57>
  102e5f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e61:	89 f0                	mov    %esi,%eax
  102e63:	89 fa                	mov    %edi,%edx
  102e65:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102e68:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102e6b:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102e6e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  102e71:	eb 36                	jmp    102ea9 <memmove+0x9f>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102e73:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e76:	8d 50 ff             	lea    -0x1(%eax),%edx
  102e79:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e7c:	01 c2                	add    %eax,%edx
  102e7e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e81:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102e84:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e87:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102e8a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e8d:	89 c1                	mov    %eax,%ecx
  102e8f:	89 d8                	mov    %ebx,%eax
  102e91:	89 d6                	mov    %edx,%esi
  102e93:	89 c7                	mov    %eax,%edi
  102e95:	fd                   	std    
  102e96:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e98:	fc                   	cld    
  102e99:	89 f8                	mov    %edi,%eax
  102e9b:	89 f2                	mov    %esi,%edx
  102e9d:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102ea0:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102ea3:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102ea6:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102ea9:	83 c4 30             	add    $0x30,%esp
  102eac:	5b                   	pop    %ebx
  102ead:	5e                   	pop    %esi
  102eae:	5f                   	pop    %edi
  102eaf:	5d                   	pop    %ebp
  102eb0:	c3                   	ret    

00102eb1 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102eb1:	f3 0f 1e fb          	endbr32 
  102eb5:	55                   	push   %ebp
  102eb6:	89 e5                	mov    %esp,%ebp
  102eb8:	57                   	push   %edi
  102eb9:	56                   	push   %esi
  102eba:	83 ec 20             	sub    $0x20,%esp
  102ebd:	8b 45 08             	mov    0x8(%ebp),%eax
  102ec0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ec3:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ec6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ec9:	8b 45 10             	mov    0x10(%ebp),%eax
  102ecc:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ecf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ed2:	c1 e8 02             	shr    $0x2,%eax
  102ed5:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102ed7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102eda:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102edd:	89 d7                	mov    %edx,%edi
  102edf:	89 c6                	mov    %eax,%esi
  102ee1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102ee3:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102ee6:	83 e1 03             	and    $0x3,%ecx
  102ee9:	74 02                	je     102eed <memcpy+0x3c>
  102eeb:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102eed:	89 f0                	mov    %esi,%eax
  102eef:	89 fa                	mov    %edi,%edx
  102ef1:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102ef4:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102ef7:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102efa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102efd:	83 c4 20             	add    $0x20,%esp
  102f00:	5e                   	pop    %esi
  102f01:	5f                   	pop    %edi
  102f02:	5d                   	pop    %ebp
  102f03:	c3                   	ret    

00102f04 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102f04:	f3 0f 1e fb          	endbr32 
  102f08:	55                   	push   %ebp
  102f09:	89 e5                	mov    %esp,%ebp
  102f0b:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102f0e:	8b 45 08             	mov    0x8(%ebp),%eax
  102f11:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102f14:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f17:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102f1a:	eb 2e                	jmp    102f4a <memcmp+0x46>
        if (*s1 != *s2) {
  102f1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f1f:	0f b6 10             	movzbl (%eax),%edx
  102f22:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f25:	0f b6 00             	movzbl (%eax),%eax
  102f28:	38 c2                	cmp    %al,%dl
  102f2a:	74 18                	je     102f44 <memcmp+0x40>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f2c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f2f:	0f b6 00             	movzbl (%eax),%eax
  102f32:	0f b6 d0             	movzbl %al,%edx
  102f35:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f38:	0f b6 00             	movzbl (%eax),%eax
  102f3b:	0f b6 c0             	movzbl %al,%eax
  102f3e:	29 c2                	sub    %eax,%edx
  102f40:	89 d0                	mov    %edx,%eax
  102f42:	eb 18                	jmp    102f5c <memcmp+0x58>
        }
        s1 ++, s2 ++;
  102f44:	ff 45 fc             	incl   -0x4(%ebp)
  102f47:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  102f4a:	8b 45 10             	mov    0x10(%ebp),%eax
  102f4d:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f50:	89 55 10             	mov    %edx,0x10(%ebp)
  102f53:	85 c0                	test   %eax,%eax
  102f55:	75 c5                	jne    102f1c <memcmp+0x18>
    }
    return 0;
  102f57:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f5c:	c9                   	leave  
  102f5d:	c3                   	ret    

00102f5e <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102f5e:	f3 0f 1e fb          	endbr32 
  102f62:	55                   	push   %ebp
  102f63:	89 e5                	mov    %esp,%ebp
  102f65:	83 ec 58             	sub    $0x58,%esp
  102f68:	8b 45 10             	mov    0x10(%ebp),%eax
  102f6b:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102f6e:	8b 45 14             	mov    0x14(%ebp),%eax
  102f71:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102f74:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102f77:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102f7a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f7d:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102f80:	8b 45 18             	mov    0x18(%ebp),%eax
  102f83:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102f86:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f89:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f8c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f8f:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102f92:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f95:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102f98:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102f9c:	74 1c                	je     102fba <printnum+0x5c>
  102f9e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fa1:	ba 00 00 00 00       	mov    $0x0,%edx
  102fa6:	f7 75 e4             	divl   -0x1c(%ebp)
  102fa9:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102fac:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102faf:	ba 00 00 00 00       	mov    $0x0,%edx
  102fb4:	f7 75 e4             	divl   -0x1c(%ebp)
  102fb7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fba:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fbd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102fc0:	f7 75 e4             	divl   -0x1c(%ebp)
  102fc3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102fc6:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102fc9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fcc:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102fcf:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102fd2:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102fd5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102fd8:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102fdb:	8b 45 18             	mov    0x18(%ebp),%eax
  102fde:	ba 00 00 00 00       	mov    $0x0,%edx
  102fe3:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  102fe6:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102fe9:	19 d1                	sbb    %edx,%ecx
  102feb:	72 4c                	jb     103039 <printnum+0xdb>
        printnum(putch, putdat, result, base, width - 1, padc);
  102fed:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102ff0:	8d 50 ff             	lea    -0x1(%eax),%edx
  102ff3:	8b 45 20             	mov    0x20(%ebp),%eax
  102ff6:	89 44 24 18          	mov    %eax,0x18(%esp)
  102ffa:	89 54 24 14          	mov    %edx,0x14(%esp)
  102ffe:	8b 45 18             	mov    0x18(%ebp),%eax
  103001:	89 44 24 10          	mov    %eax,0x10(%esp)
  103005:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103008:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10300b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10300f:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103013:	8b 45 0c             	mov    0xc(%ebp),%eax
  103016:	89 44 24 04          	mov    %eax,0x4(%esp)
  10301a:	8b 45 08             	mov    0x8(%ebp),%eax
  10301d:	89 04 24             	mov    %eax,(%esp)
  103020:	e8 39 ff ff ff       	call   102f5e <printnum>
  103025:	eb 1b                	jmp    103042 <printnum+0xe4>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  103027:	8b 45 0c             	mov    0xc(%ebp),%eax
  10302a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10302e:	8b 45 20             	mov    0x20(%ebp),%eax
  103031:	89 04 24             	mov    %eax,(%esp)
  103034:	8b 45 08             	mov    0x8(%ebp),%eax
  103037:	ff d0                	call   *%eax
        while (-- width > 0)
  103039:	ff 4d 1c             	decl   0x1c(%ebp)
  10303c:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  103040:	7f e5                	jg     103027 <printnum+0xc9>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  103042:	8b 45 d8             	mov    -0x28(%ebp),%eax
  103045:	05 d0 3d 10 00       	add    $0x103dd0,%eax
  10304a:	0f b6 00             	movzbl (%eax),%eax
  10304d:	0f be c0             	movsbl %al,%eax
  103050:	8b 55 0c             	mov    0xc(%ebp),%edx
  103053:	89 54 24 04          	mov    %edx,0x4(%esp)
  103057:	89 04 24             	mov    %eax,(%esp)
  10305a:	8b 45 08             	mov    0x8(%ebp),%eax
  10305d:	ff d0                	call   *%eax
}
  10305f:	90                   	nop
  103060:	c9                   	leave  
  103061:	c3                   	ret    

00103062 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  103062:	f3 0f 1e fb          	endbr32 
  103066:	55                   	push   %ebp
  103067:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103069:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  10306d:	7e 14                	jle    103083 <getuint+0x21>
        return va_arg(*ap, unsigned long long);
  10306f:	8b 45 08             	mov    0x8(%ebp),%eax
  103072:	8b 00                	mov    (%eax),%eax
  103074:	8d 48 08             	lea    0x8(%eax),%ecx
  103077:	8b 55 08             	mov    0x8(%ebp),%edx
  10307a:	89 0a                	mov    %ecx,(%edx)
  10307c:	8b 50 04             	mov    0x4(%eax),%edx
  10307f:	8b 00                	mov    (%eax),%eax
  103081:	eb 30                	jmp    1030b3 <getuint+0x51>
    }
    else if (lflag) {
  103083:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103087:	74 16                	je     10309f <getuint+0x3d>
        return va_arg(*ap, unsigned long);
  103089:	8b 45 08             	mov    0x8(%ebp),%eax
  10308c:	8b 00                	mov    (%eax),%eax
  10308e:	8d 48 04             	lea    0x4(%eax),%ecx
  103091:	8b 55 08             	mov    0x8(%ebp),%edx
  103094:	89 0a                	mov    %ecx,(%edx)
  103096:	8b 00                	mov    (%eax),%eax
  103098:	ba 00 00 00 00       	mov    $0x0,%edx
  10309d:	eb 14                	jmp    1030b3 <getuint+0x51>
    }
    else {
        return va_arg(*ap, unsigned int);
  10309f:	8b 45 08             	mov    0x8(%ebp),%eax
  1030a2:	8b 00                	mov    (%eax),%eax
  1030a4:	8d 48 04             	lea    0x4(%eax),%ecx
  1030a7:	8b 55 08             	mov    0x8(%ebp),%edx
  1030aa:	89 0a                	mov    %ecx,(%edx)
  1030ac:	8b 00                	mov    (%eax),%eax
  1030ae:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  1030b3:	5d                   	pop    %ebp
  1030b4:	c3                   	ret    

001030b5 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  1030b5:	f3 0f 1e fb          	endbr32 
  1030b9:	55                   	push   %ebp
  1030ba:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1030bc:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1030c0:	7e 14                	jle    1030d6 <getint+0x21>
        return va_arg(*ap, long long);
  1030c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c5:	8b 00                	mov    (%eax),%eax
  1030c7:	8d 48 08             	lea    0x8(%eax),%ecx
  1030ca:	8b 55 08             	mov    0x8(%ebp),%edx
  1030cd:	89 0a                	mov    %ecx,(%edx)
  1030cf:	8b 50 04             	mov    0x4(%eax),%edx
  1030d2:	8b 00                	mov    (%eax),%eax
  1030d4:	eb 28                	jmp    1030fe <getint+0x49>
    }
    else if (lflag) {
  1030d6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1030da:	74 12                	je     1030ee <getint+0x39>
        return va_arg(*ap, long);
  1030dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1030df:	8b 00                	mov    (%eax),%eax
  1030e1:	8d 48 04             	lea    0x4(%eax),%ecx
  1030e4:	8b 55 08             	mov    0x8(%ebp),%edx
  1030e7:	89 0a                	mov    %ecx,(%edx)
  1030e9:	8b 00                	mov    (%eax),%eax
  1030eb:	99                   	cltd   
  1030ec:	eb 10                	jmp    1030fe <getint+0x49>
    }
    else {
        return va_arg(*ap, int);
  1030ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f1:	8b 00                	mov    (%eax),%eax
  1030f3:	8d 48 04             	lea    0x4(%eax),%ecx
  1030f6:	8b 55 08             	mov    0x8(%ebp),%edx
  1030f9:	89 0a                	mov    %ecx,(%edx)
  1030fb:	8b 00                	mov    (%eax),%eax
  1030fd:	99                   	cltd   
    }
}
  1030fe:	5d                   	pop    %ebp
  1030ff:	c3                   	ret    

00103100 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  103100:	f3 0f 1e fb          	endbr32 
  103104:	55                   	push   %ebp
  103105:	89 e5                	mov    %esp,%ebp
  103107:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  10310a:	8d 45 14             	lea    0x14(%ebp),%eax
  10310d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  103110:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103113:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103117:	8b 45 10             	mov    0x10(%ebp),%eax
  10311a:	89 44 24 08          	mov    %eax,0x8(%esp)
  10311e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103121:	89 44 24 04          	mov    %eax,0x4(%esp)
  103125:	8b 45 08             	mov    0x8(%ebp),%eax
  103128:	89 04 24             	mov    %eax,(%esp)
  10312b:	e8 03 00 00 00       	call   103133 <vprintfmt>
    va_end(ap);
}
  103130:	90                   	nop
  103131:	c9                   	leave  
  103132:	c3                   	ret    

00103133 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  103133:	f3 0f 1e fb          	endbr32 
  103137:	55                   	push   %ebp
  103138:	89 e5                	mov    %esp,%ebp
  10313a:	56                   	push   %esi
  10313b:	53                   	push   %ebx
  10313c:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  10313f:	eb 17                	jmp    103158 <vprintfmt+0x25>
            if (ch == '\0') {
  103141:	85 db                	test   %ebx,%ebx
  103143:	0f 84 c0 03 00 00    	je     103509 <vprintfmt+0x3d6>
                return;
            }
            putch(ch, putdat);
  103149:	8b 45 0c             	mov    0xc(%ebp),%eax
  10314c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103150:	89 1c 24             	mov    %ebx,(%esp)
  103153:	8b 45 08             	mov    0x8(%ebp),%eax
  103156:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103158:	8b 45 10             	mov    0x10(%ebp),%eax
  10315b:	8d 50 01             	lea    0x1(%eax),%edx
  10315e:	89 55 10             	mov    %edx,0x10(%ebp)
  103161:	0f b6 00             	movzbl (%eax),%eax
  103164:	0f b6 d8             	movzbl %al,%ebx
  103167:	83 fb 25             	cmp    $0x25,%ebx
  10316a:	75 d5                	jne    103141 <vprintfmt+0xe>
        }

        // Process a %-escape sequence
        char padc = ' ';
  10316c:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  103170:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  103177:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10317a:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  10317d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  103184:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103187:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  10318a:	8b 45 10             	mov    0x10(%ebp),%eax
  10318d:	8d 50 01             	lea    0x1(%eax),%edx
  103190:	89 55 10             	mov    %edx,0x10(%ebp)
  103193:	0f b6 00             	movzbl (%eax),%eax
  103196:	0f b6 d8             	movzbl %al,%ebx
  103199:	8d 43 dd             	lea    -0x23(%ebx),%eax
  10319c:	83 f8 55             	cmp    $0x55,%eax
  10319f:	0f 87 38 03 00 00    	ja     1034dd <vprintfmt+0x3aa>
  1031a5:	8b 04 85 f4 3d 10 00 	mov    0x103df4(,%eax,4),%eax
  1031ac:	3e ff e0             	notrack jmp *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  1031af:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  1031b3:	eb d5                	jmp    10318a <vprintfmt+0x57>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  1031b5:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  1031b9:	eb cf                	jmp    10318a <vprintfmt+0x57>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1031bb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  1031c2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1031c5:	89 d0                	mov    %edx,%eax
  1031c7:	c1 e0 02             	shl    $0x2,%eax
  1031ca:	01 d0                	add    %edx,%eax
  1031cc:	01 c0                	add    %eax,%eax
  1031ce:	01 d8                	add    %ebx,%eax
  1031d0:	83 e8 30             	sub    $0x30,%eax
  1031d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  1031d6:	8b 45 10             	mov    0x10(%ebp),%eax
  1031d9:	0f b6 00             	movzbl (%eax),%eax
  1031dc:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  1031df:	83 fb 2f             	cmp    $0x2f,%ebx
  1031e2:	7e 38                	jle    10321c <vprintfmt+0xe9>
  1031e4:	83 fb 39             	cmp    $0x39,%ebx
  1031e7:	7f 33                	jg     10321c <vprintfmt+0xe9>
            for (precision = 0; ; ++ fmt) {
  1031e9:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  1031ec:	eb d4                	jmp    1031c2 <vprintfmt+0x8f>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  1031ee:	8b 45 14             	mov    0x14(%ebp),%eax
  1031f1:	8d 50 04             	lea    0x4(%eax),%edx
  1031f4:	89 55 14             	mov    %edx,0x14(%ebp)
  1031f7:	8b 00                	mov    (%eax),%eax
  1031f9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  1031fc:	eb 1f                	jmp    10321d <vprintfmt+0xea>

        case '.':
            if (width < 0)
  1031fe:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103202:	79 86                	jns    10318a <vprintfmt+0x57>
                width = 0;
  103204:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  10320b:	e9 7a ff ff ff       	jmp    10318a <vprintfmt+0x57>

        case '#':
            altflag = 1;
  103210:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  103217:	e9 6e ff ff ff       	jmp    10318a <vprintfmt+0x57>
            goto process_precision;
  10321c:	90                   	nop

        process_precision:
            if (width < 0)
  10321d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103221:	0f 89 63 ff ff ff    	jns    10318a <vprintfmt+0x57>
                width = precision, precision = -1;
  103227:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10322a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10322d:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  103234:	e9 51 ff ff ff       	jmp    10318a <vprintfmt+0x57>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  103239:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  10323c:	e9 49 ff ff ff       	jmp    10318a <vprintfmt+0x57>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  103241:	8b 45 14             	mov    0x14(%ebp),%eax
  103244:	8d 50 04             	lea    0x4(%eax),%edx
  103247:	89 55 14             	mov    %edx,0x14(%ebp)
  10324a:	8b 00                	mov    (%eax),%eax
  10324c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10324f:	89 54 24 04          	mov    %edx,0x4(%esp)
  103253:	89 04 24             	mov    %eax,(%esp)
  103256:	8b 45 08             	mov    0x8(%ebp),%eax
  103259:	ff d0                	call   *%eax
            break;
  10325b:	e9 a4 02 00 00       	jmp    103504 <vprintfmt+0x3d1>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103260:	8b 45 14             	mov    0x14(%ebp),%eax
  103263:	8d 50 04             	lea    0x4(%eax),%edx
  103266:	89 55 14             	mov    %edx,0x14(%ebp)
  103269:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  10326b:	85 db                	test   %ebx,%ebx
  10326d:	79 02                	jns    103271 <vprintfmt+0x13e>
                err = -err;
  10326f:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103271:	83 fb 06             	cmp    $0x6,%ebx
  103274:	7f 0b                	jg     103281 <vprintfmt+0x14e>
  103276:	8b 34 9d b4 3d 10 00 	mov    0x103db4(,%ebx,4),%esi
  10327d:	85 f6                	test   %esi,%esi
  10327f:	75 23                	jne    1032a4 <vprintfmt+0x171>
                printfmt(putch, putdat, "error %d", err);
  103281:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  103285:	c7 44 24 08 e1 3d 10 	movl   $0x103de1,0x8(%esp)
  10328c:	00 
  10328d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103290:	89 44 24 04          	mov    %eax,0x4(%esp)
  103294:	8b 45 08             	mov    0x8(%ebp),%eax
  103297:	89 04 24             	mov    %eax,(%esp)
  10329a:	e8 61 fe ff ff       	call   103100 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  10329f:	e9 60 02 00 00       	jmp    103504 <vprintfmt+0x3d1>
                printfmt(putch, putdat, "%s", p);
  1032a4:	89 74 24 0c          	mov    %esi,0xc(%esp)
  1032a8:	c7 44 24 08 ea 3d 10 	movl   $0x103dea,0x8(%esp)
  1032af:	00 
  1032b0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032b3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ba:	89 04 24             	mov    %eax,(%esp)
  1032bd:	e8 3e fe ff ff       	call   103100 <printfmt>
            break;
  1032c2:	e9 3d 02 00 00       	jmp    103504 <vprintfmt+0x3d1>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  1032c7:	8b 45 14             	mov    0x14(%ebp),%eax
  1032ca:	8d 50 04             	lea    0x4(%eax),%edx
  1032cd:	89 55 14             	mov    %edx,0x14(%ebp)
  1032d0:	8b 30                	mov    (%eax),%esi
  1032d2:	85 f6                	test   %esi,%esi
  1032d4:	75 05                	jne    1032db <vprintfmt+0x1a8>
                p = "(null)";
  1032d6:	be ed 3d 10 00       	mov    $0x103ded,%esi
            }
            if (width > 0 && padc != '-') {
  1032db:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032df:	7e 76                	jle    103357 <vprintfmt+0x224>
  1032e1:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  1032e5:	74 70                	je     103357 <vprintfmt+0x224>
                for (width -= strnlen(p, precision); width > 0; width --) {
  1032e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1032ea:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032ee:	89 34 24             	mov    %esi,(%esp)
  1032f1:	e8 ba f7 ff ff       	call   102ab0 <strnlen>
  1032f6:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1032f9:	29 c2                	sub    %eax,%edx
  1032fb:	89 d0                	mov    %edx,%eax
  1032fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103300:	eb 16                	jmp    103318 <vprintfmt+0x1e5>
                    putch(padc, putdat);
  103302:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  103306:	8b 55 0c             	mov    0xc(%ebp),%edx
  103309:	89 54 24 04          	mov    %edx,0x4(%esp)
  10330d:	89 04 24             	mov    %eax,(%esp)
  103310:	8b 45 08             	mov    0x8(%ebp),%eax
  103313:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  103315:	ff 4d e8             	decl   -0x18(%ebp)
  103318:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10331c:	7f e4                	jg     103302 <vprintfmt+0x1cf>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10331e:	eb 37                	jmp    103357 <vprintfmt+0x224>
                if (altflag && (ch < ' ' || ch > '~')) {
  103320:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  103324:	74 1f                	je     103345 <vprintfmt+0x212>
  103326:	83 fb 1f             	cmp    $0x1f,%ebx
  103329:	7e 05                	jle    103330 <vprintfmt+0x1fd>
  10332b:	83 fb 7e             	cmp    $0x7e,%ebx
  10332e:	7e 15                	jle    103345 <vprintfmt+0x212>
                    putch('?', putdat);
  103330:	8b 45 0c             	mov    0xc(%ebp),%eax
  103333:	89 44 24 04          	mov    %eax,0x4(%esp)
  103337:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  10333e:	8b 45 08             	mov    0x8(%ebp),%eax
  103341:	ff d0                	call   *%eax
  103343:	eb 0f                	jmp    103354 <vprintfmt+0x221>
                }
                else {
                    putch(ch, putdat);
  103345:	8b 45 0c             	mov    0xc(%ebp),%eax
  103348:	89 44 24 04          	mov    %eax,0x4(%esp)
  10334c:	89 1c 24             	mov    %ebx,(%esp)
  10334f:	8b 45 08             	mov    0x8(%ebp),%eax
  103352:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103354:	ff 4d e8             	decl   -0x18(%ebp)
  103357:	89 f0                	mov    %esi,%eax
  103359:	8d 70 01             	lea    0x1(%eax),%esi
  10335c:	0f b6 00             	movzbl (%eax),%eax
  10335f:	0f be d8             	movsbl %al,%ebx
  103362:	85 db                	test   %ebx,%ebx
  103364:	74 27                	je     10338d <vprintfmt+0x25a>
  103366:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10336a:	78 b4                	js     103320 <vprintfmt+0x1ed>
  10336c:	ff 4d e4             	decl   -0x1c(%ebp)
  10336f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103373:	79 ab                	jns    103320 <vprintfmt+0x1ed>
                }
            }
            for (; width > 0; width --) {
  103375:	eb 16                	jmp    10338d <vprintfmt+0x25a>
                putch(' ', putdat);
  103377:	8b 45 0c             	mov    0xc(%ebp),%eax
  10337a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10337e:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  103385:	8b 45 08             	mov    0x8(%ebp),%eax
  103388:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  10338a:	ff 4d e8             	decl   -0x18(%ebp)
  10338d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103391:	7f e4                	jg     103377 <vprintfmt+0x244>
            }
            break;
  103393:	e9 6c 01 00 00       	jmp    103504 <vprintfmt+0x3d1>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103398:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10339b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10339f:	8d 45 14             	lea    0x14(%ebp),%eax
  1033a2:	89 04 24             	mov    %eax,(%esp)
  1033a5:	e8 0b fd ff ff       	call   1030b5 <getint>
  1033aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033ad:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  1033b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033b6:	85 d2                	test   %edx,%edx
  1033b8:	79 26                	jns    1033e0 <vprintfmt+0x2ad>
                putch('-', putdat);
  1033ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033c1:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  1033c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1033cb:	ff d0                	call   *%eax
                num = -(long long)num;
  1033cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033d0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033d3:	f7 d8                	neg    %eax
  1033d5:	83 d2 00             	adc    $0x0,%edx
  1033d8:	f7 da                	neg    %edx
  1033da:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033dd:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  1033e0:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1033e7:	e9 a8 00 00 00       	jmp    103494 <vprintfmt+0x361>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1033ec:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033ef:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033f3:	8d 45 14             	lea    0x14(%ebp),%eax
  1033f6:	89 04 24             	mov    %eax,(%esp)
  1033f9:	e8 64 fc ff ff       	call   103062 <getuint>
  1033fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103401:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  103404:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  10340b:	e9 84 00 00 00       	jmp    103494 <vprintfmt+0x361>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103410:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103413:	89 44 24 04          	mov    %eax,0x4(%esp)
  103417:	8d 45 14             	lea    0x14(%ebp),%eax
  10341a:	89 04 24             	mov    %eax,(%esp)
  10341d:	e8 40 fc ff ff       	call   103062 <getuint>
  103422:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103425:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103428:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  10342f:	eb 63                	jmp    103494 <vprintfmt+0x361>

        // pointer
        case 'p':
            putch('0', putdat);
  103431:	8b 45 0c             	mov    0xc(%ebp),%eax
  103434:	89 44 24 04          	mov    %eax,0x4(%esp)
  103438:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  10343f:	8b 45 08             	mov    0x8(%ebp),%eax
  103442:	ff d0                	call   *%eax
            putch('x', putdat);
  103444:	8b 45 0c             	mov    0xc(%ebp),%eax
  103447:	89 44 24 04          	mov    %eax,0x4(%esp)
  10344b:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  103452:	8b 45 08             	mov    0x8(%ebp),%eax
  103455:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103457:	8b 45 14             	mov    0x14(%ebp),%eax
  10345a:	8d 50 04             	lea    0x4(%eax),%edx
  10345d:	89 55 14             	mov    %edx,0x14(%ebp)
  103460:	8b 00                	mov    (%eax),%eax
  103462:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103465:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  10346c:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103473:	eb 1f                	jmp    103494 <vprintfmt+0x361>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103475:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103478:	89 44 24 04          	mov    %eax,0x4(%esp)
  10347c:	8d 45 14             	lea    0x14(%ebp),%eax
  10347f:	89 04 24             	mov    %eax,(%esp)
  103482:	e8 db fb ff ff       	call   103062 <getuint>
  103487:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10348a:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  10348d:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103494:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103498:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10349b:	89 54 24 18          	mov    %edx,0x18(%esp)
  10349f:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1034a2:	89 54 24 14          	mov    %edx,0x14(%esp)
  1034a6:	89 44 24 10          	mov    %eax,0x10(%esp)
  1034aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034ad:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1034b0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1034b4:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1034b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034bb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034bf:	8b 45 08             	mov    0x8(%ebp),%eax
  1034c2:	89 04 24             	mov    %eax,(%esp)
  1034c5:	e8 94 fa ff ff       	call   102f5e <printnum>
            break;
  1034ca:	eb 38                	jmp    103504 <vprintfmt+0x3d1>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1034cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034cf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034d3:	89 1c 24             	mov    %ebx,(%esp)
  1034d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1034d9:	ff d0                	call   *%eax
            break;
  1034db:	eb 27                	jmp    103504 <vprintfmt+0x3d1>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1034dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034e0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034e4:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  1034eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1034ee:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  1034f0:	ff 4d 10             	decl   0x10(%ebp)
  1034f3:	eb 03                	jmp    1034f8 <vprintfmt+0x3c5>
  1034f5:	ff 4d 10             	decl   0x10(%ebp)
  1034f8:	8b 45 10             	mov    0x10(%ebp),%eax
  1034fb:	48                   	dec    %eax
  1034fc:	0f b6 00             	movzbl (%eax),%eax
  1034ff:	3c 25                	cmp    $0x25,%al
  103501:	75 f2                	jne    1034f5 <vprintfmt+0x3c2>
                /* do nothing */;
            break;
  103503:	90                   	nop
    while (1) {
  103504:	e9 36 fc ff ff       	jmp    10313f <vprintfmt+0xc>
                return;
  103509:	90                   	nop
        }
    }
}
  10350a:	83 c4 40             	add    $0x40,%esp
  10350d:	5b                   	pop    %ebx
  10350e:	5e                   	pop    %esi
  10350f:	5d                   	pop    %ebp
  103510:	c3                   	ret    

00103511 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103511:	f3 0f 1e fb          	endbr32 
  103515:	55                   	push   %ebp
  103516:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103518:	8b 45 0c             	mov    0xc(%ebp),%eax
  10351b:	8b 40 08             	mov    0x8(%eax),%eax
  10351e:	8d 50 01             	lea    0x1(%eax),%edx
  103521:	8b 45 0c             	mov    0xc(%ebp),%eax
  103524:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103527:	8b 45 0c             	mov    0xc(%ebp),%eax
  10352a:	8b 10                	mov    (%eax),%edx
  10352c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10352f:	8b 40 04             	mov    0x4(%eax),%eax
  103532:	39 c2                	cmp    %eax,%edx
  103534:	73 12                	jae    103548 <sprintputch+0x37>
        *b->buf ++ = ch;
  103536:	8b 45 0c             	mov    0xc(%ebp),%eax
  103539:	8b 00                	mov    (%eax),%eax
  10353b:	8d 48 01             	lea    0x1(%eax),%ecx
  10353e:	8b 55 0c             	mov    0xc(%ebp),%edx
  103541:	89 0a                	mov    %ecx,(%edx)
  103543:	8b 55 08             	mov    0x8(%ebp),%edx
  103546:	88 10                	mov    %dl,(%eax)
    }
}
  103548:	90                   	nop
  103549:	5d                   	pop    %ebp
  10354a:	c3                   	ret    

0010354b <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  10354b:	f3 0f 1e fb          	endbr32 
  10354f:	55                   	push   %ebp
  103550:	89 e5                	mov    %esp,%ebp
  103552:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103555:	8d 45 14             	lea    0x14(%ebp),%eax
  103558:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  10355b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10355e:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103562:	8b 45 10             	mov    0x10(%ebp),%eax
  103565:	89 44 24 08          	mov    %eax,0x8(%esp)
  103569:	8b 45 0c             	mov    0xc(%ebp),%eax
  10356c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103570:	8b 45 08             	mov    0x8(%ebp),%eax
  103573:	89 04 24             	mov    %eax,(%esp)
  103576:	e8 08 00 00 00       	call   103583 <vsnprintf>
  10357b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10357e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103581:	c9                   	leave  
  103582:	c3                   	ret    

00103583 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103583:	f3 0f 1e fb          	endbr32 
  103587:	55                   	push   %ebp
  103588:	89 e5                	mov    %esp,%ebp
  10358a:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  10358d:	8b 45 08             	mov    0x8(%ebp),%eax
  103590:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103593:	8b 45 0c             	mov    0xc(%ebp),%eax
  103596:	8d 50 ff             	lea    -0x1(%eax),%edx
  103599:	8b 45 08             	mov    0x8(%ebp),%eax
  10359c:	01 d0                	add    %edx,%eax
  10359e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035a1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1035a8:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1035ac:	74 0a                	je     1035b8 <vsnprintf+0x35>
  1035ae:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1035b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1035b4:	39 c2                	cmp    %eax,%edx
  1035b6:	76 07                	jbe    1035bf <vsnprintf+0x3c>
        return -E_INVAL;
  1035b8:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1035bd:	eb 2a                	jmp    1035e9 <vsnprintf+0x66>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1035bf:	8b 45 14             	mov    0x14(%ebp),%eax
  1035c2:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1035c6:	8b 45 10             	mov    0x10(%ebp),%eax
  1035c9:	89 44 24 08          	mov    %eax,0x8(%esp)
  1035cd:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1035d0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035d4:	c7 04 24 11 35 10 00 	movl   $0x103511,(%esp)
  1035db:	e8 53 fb ff ff       	call   103133 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  1035e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1035e3:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1035e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1035e9:	c9                   	leave  
  1035ea:	c3                   	ret    
