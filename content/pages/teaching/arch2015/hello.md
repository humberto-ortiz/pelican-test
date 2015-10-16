Title: What happens when you compile?
slug: teaching/arch2015/hello


Let's look at a simple C program.

```
$ cat hello.c
int main() {
  int a = 1;
  int b = 2;

  int c;

  c = a + b;
  return c;
}
```

Compiling results in an object code file.

```
$ gcc -g -c hello.c
$ objdump -d hello.o

hello.o:     file format elf64-x86-64

Disassembly of section .text:

0000000000000000 <main>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	c7 45 f4 01 00 00 00 	movl   $0x1,0xfffffffffffffff4(%rbp)
   b:	c7 45 f8 02 00 00 00 	movl   $0x2,0xfffffffffffffff8(%rbp)
  12:	8b 45 f8             	mov    0xfffffffffffffff8(%rbp),%eax
  15:	03 45 f4             	add    0xfffffffffffffff4(%rbp),%eax
  18:	89 45 fc             	mov    %eax,0xfffffffffffffffc(%rbp)
  1b:	8b 45 fc             	mov    0xfffffffffffffffc(%rbp),%eax
  1e:	c9                   	leaveq 
  1f:	c3                   	retq
```

We can link this to produce an executable.

```
$ gcc -o hello hello.o
```

and run in the debugger to examine the program in memory.

```
$ gdb hello
GNU gdb (GDB) CentOS (7.0.1-45.el5.centos)
Copyright (C) 2009 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-redhat-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
Reading symbols from /home/admins/hortiz/hello...done.
(gdb) b main
Breakpoint 1 at 0x40044c: file hello.c, line 2.
(gdb) r
Starting program: /home/admins/hortiz/hello 

Breakpoint 1, main () at hello.c:2
2	  int a = 1;
(gdb) list
1	int main() {
2	  int a = 1;
3	  int b = 2;
4	
5	  int c;
6	
7	  c = a + b;
8	  return c;
9	}
(gdb) disassemble
Dump of assembler code for function main:
0x0000000000400448 <main+0>:	push   %rbp
0x0000000000400449 <main+1>:	mov    %rsp,%rbp
0x000000000040044c <main+4>:	movl   $0x1,-0xc(%rbp)
0x0000000000400453 <main+11>:	movl   $0x2,-0x8(%rbp)
0x000000000040045a <main+18>:	mov    -0x8(%rbp),%eax
0x000000000040045d <main+21>:	add    -0xc(%rbp),%eax
0x0000000000400460 <main+24>:	mov    %eax,-0x4(%rbp)
0x0000000000400463 <main+27>:	mov    -0x4(%rbp),%eax
0x0000000000400466 <main+30>:	leaveq 
0x0000000000400467 <main+31>:	retq   
End of assembler dump.
(gdb) x /8x main
0x400448 <main>:	0xe5894855	0x01f445c7	0xc7000000	0x0002f845
0x400458 <main+16>:	0x458b0000	0xf44503f8	0x8bfc4589	0xc3c9fc45
```
