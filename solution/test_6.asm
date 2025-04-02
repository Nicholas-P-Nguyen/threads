
_test_6:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  unlock(&lk);
}

int
main(int argc, char* argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx

    int shared = 0;
    thread_create(&cb1, (void*)&shared);
   f:	8d 5d f4             	lea    -0xc(%ebp),%ebx
{
  12:	83 ec 18             	sub    $0x18,%esp
    int shared = 0;
  15:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    thread_create(&cb1, (void*)&shared);
  1c:	53                   	push   %ebx
  1d:	68 60 01 00 00       	push   $0x160
  22:	e8 c9 03 00 00       	call   3f0 <thread_create>
    thread_create(&cb2, (void*)&shared);
  27:	58                   	pop    %eax
  28:	5a                   	pop    %edx
  29:	53                   	push   %ebx
  2a:	68 20 01 00 00       	push   $0x120
  2f:	e8 bc 03 00 00       	call   3f0 <thread_create>

    thread_join();
  34:	e8 27 04 00 00       	call   460 <thread_join>
    thread_join();
  39:	e8 22 04 00 00       	call   460 <thread_join>

    ASSERT(i == 0, "this thread should get the lock, and execute first (%d)", i);
  3e:	8b 0d 68 0d 00 00    	mov    0xd68,%ecx
  44:	83 c4 10             	add    $0x10,%esp
  47:	85 c9                	test   %ecx,%ecx
  49:	75 7b                	jne    c6 <main+0xc6>
    ASSERT(j == 1, "this thread should get the lock, and execute second (%d)", j);
  4b:	83 3d 64 0d 00 00 01 	cmpl   $0x1,0xd64
  52:	75 47                	jne    9b <main+0x9b>

    ASSERT(shared == 2, "both threads should have executed");
  54:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  58:	0f 84 93 00 00 00    	je     f1 <main+0xf1>
  5e:	83 ec 0c             	sub    $0xc,%esp
  61:	6a 2a                	push   $0x2a
  63:	68 08 09 00 00       	push   $0x908
  68:	68 11 09 00 00       	push   $0x911
  6d:	68 1b 09 00 00       	push   $0x91b
  72:	6a 01                	push   $0x1
  74:	e8 67 05 00 00       	call   5e0 <printf>
  79:	83 c4 18             	add    $0x18,%esp
  7c:	68 b0 09 00 00       	push   $0x9b0
    ASSERT(j == 1, "this thread should get the lock, and execute second (%d)", j);
  81:	6a 01                	push   $0x1
  83:	e8 58 05 00 00       	call   5e0 <printf>
  88:	5a                   	pop    %edx
  89:	59                   	pop    %ecx
  8a:	68 25 09 00 00       	push   $0x925
  8f:	6a 01                	push   $0x1
  91:	e8 4a 05 00 00       	call   5e0 <printf>
  96:	e8 d2 03 00 00       	call   46d <exit>
  9b:	83 ec 0c             	sub    $0xc,%esp
  9e:	6a 28                	push   $0x28
  a0:	68 08 09 00 00       	push   $0x908
  a5:	68 11 09 00 00       	push   $0x911
  aa:	68 1b 09 00 00       	push   $0x91b
  af:	6a 01                	push   $0x1
  b1:	e8 2a 05 00 00       	call   5e0 <printf>
  b6:	83 c4 1c             	add    $0x1c,%esp
  b9:	ff 35 64 0d 00 00    	pushl  0xd64
  bf:	68 74 09 00 00       	push   $0x974
  c4:	eb bb                	jmp    81 <main+0x81>
    ASSERT(i == 0, "this thread should get the lock, and execute first (%d)", i);
  c6:	83 ec 0c             	sub    $0xc,%esp
  c9:	6a 27                	push   $0x27
  cb:	68 08 09 00 00       	push   $0x908
  d0:	68 11 09 00 00       	push   $0x911
  d5:	68 1b 09 00 00       	push   $0x91b
  da:	6a 01                	push   $0x1
  dc:	e8 ff 04 00 00       	call   5e0 <printf>
  e1:	83 c4 1c             	add    $0x1c,%esp
  e4:	ff 35 68 0d 00 00    	pushl  0xd68
  ea:	68 3c 09 00 00       	push   $0x93c
  ef:	eb 90                	jmp    81 <main+0x81>
                        printf(1, "\n");


#define SUCCESS_MSG "TEST PASSED"
static void test_passed() {
    PRINTF("%s", SUCCESS_MSG);
  f1:	50                   	push   %eax
  f2:	68 11 09 00 00       	push   $0x911
  f7:	68 27 09 00 00       	push   $0x927
  fc:	6a 01                	push   $0x1
  fe:	e8 dd 04 00 00       	call   5e0 <printf>
 103:	83 c4 0c             	add    $0xc,%esp
 106:	68 2c 09 00 00       	push   $0x92c
 10b:	68 38 09 00 00       	push   $0x938
 110:	e9 6c ff ff ff       	jmp    81 <main+0x81>
 115:	66 90                	xchg   %ax,%ax
 117:	66 90                	xchg   %ax,%ax
 119:	66 90                	xchg   %ax,%ax
 11b:	66 90                	xchg   %ax,%ax
 11d:	66 90                	xchg   %ax,%ax
 11f:	90                   	nop

00000120 <cb2>:
static void cb2(void* arg) {
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	83 ec 10             	sub    $0x10,%esp
 127:	8b 5d 08             	mov    0x8(%ebp),%ebx
  sleep(50);
 12a:	6a 32                	push   $0x32
 12c:	e8 cc 03 00 00       	call   4fd <sleep>
  lock(&lk);
 131:	c7 04 24 6c 0d 00 00 	movl   $0xd6c,(%esp)
 138:	e8 d8 03 00 00       	call   515 <lock>
  j = *shared;
 13d:	8b 03                	mov    (%ebx),%eax
  unlock(&lk);
 13f:	83 c4 10             	add    $0x10,%esp
  j = *shared;
 142:	a3 64 0d 00 00       	mov    %eax,0xd64
  *shared += 1;
 147:	83 c0 01             	add    $0x1,%eax
 14a:	89 03                	mov    %eax,(%ebx)
}
 14c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  unlock(&lk);
 14f:	c7 45 08 6c 0d 00 00 	movl   $0xd6c,0x8(%ebp)
}
 156:	c9                   	leave  
  unlock(&lk);
 157:	e9 c1 03 00 00       	jmp    51d <unlock>
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000160 <cb1>:
static void cb1(void* arg) {
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	53                   	push   %ebx
 164:	83 ec 10             	sub    $0x10,%esp
 167:	8b 5d 08             	mov    0x8(%ebp),%ebx
  lock(&lk);
 16a:	68 6c 0d 00 00       	push   $0xd6c
 16f:	e8 a1 03 00 00       	call   515 <lock>
  sleep(100);
 174:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 17b:	e8 7d 03 00 00       	call   4fd <sleep>
  i = *shared;
 180:	8b 03                	mov    (%ebx),%eax
  unlock(&lk);
 182:	83 c4 10             	add    $0x10,%esp
  i = *shared;
 185:	a3 68 0d 00 00       	mov    %eax,0xd68
  *shared += 1;
 18a:	83 c0 01             	add    $0x1,%eax
 18d:	89 03                	mov    %eax,(%ebx)
}
 18f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  unlock(&lk);
 192:	c7 45 08 6c 0d 00 00 	movl   $0xd6c,0x8(%ebp)
}
 199:	c9                   	leave  
  unlock(&lk);
 19a:	e9 7e 03 00 00       	jmp    51d <unlock>
 19f:	90                   	nop

000001a0 <strcpy>:
#include "x86.h"
#include "spinlock.h"

char*
strcpy(char *s, const char *t)
{
 1a0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1a1:	31 c0                	xor    %eax,%eax
{
 1a3:	89 e5                	mov    %esp,%ebp
 1a5:	53                   	push   %ebx
 1a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1a9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 1b0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 1b4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 1b7:	83 c0 01             	add    $0x1,%eax
 1ba:	84 d2                	test   %dl,%dl
 1bc:	75 f2                	jne    1b0 <strcpy+0x10>
    ;
  return os;
}
 1be:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1c1:	89 c8                	mov    %ecx,%eax
 1c3:	c9                   	leave  
 1c4:	c3                   	ret    
 1c5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	53                   	push   %ebx
 1d4:	8b 55 08             	mov    0x8(%ebp),%edx
 1d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1da:	0f b6 02             	movzbl (%edx),%eax
 1dd:	84 c0                	test   %al,%al
 1df:	75 17                	jne    1f8 <strcmp+0x28>
 1e1:	eb 3a                	jmp    21d <strcmp+0x4d>
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1ec:	83 c2 01             	add    $0x1,%edx
 1ef:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1f2:	84 c0                	test   %al,%al
 1f4:	74 1a                	je     210 <strcmp+0x40>
    p++, q++;
 1f6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 1f8:	0f b6 19             	movzbl (%ecx),%ebx
 1fb:	38 c3                	cmp    %al,%bl
 1fd:	74 e9                	je     1e8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1ff:	29 d8                	sub    %ebx,%eax
}
 201:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 204:	c9                   	leave  
 205:	c3                   	ret    
 206:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 210:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 214:	31 c0                	xor    %eax,%eax
 216:	29 d8                	sub    %ebx,%eax
}
 218:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 21b:	c9                   	leave  
 21c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 21d:	0f b6 19             	movzbl (%ecx),%ebx
 220:	31 c0                	xor    %eax,%eax
 222:	eb db                	jmp    1ff <strcmp+0x2f>
 224:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop

00000230 <strlen>:

uint
strlen(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 236:	80 3a 00             	cmpb   $0x0,(%edx)
 239:	74 15                	je     250 <strlen+0x20>
 23b:	31 c0                	xor    %eax,%eax
 23d:	8d 76 00             	lea    0x0(%esi),%esi
 240:	83 c0 01             	add    $0x1,%eax
 243:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 247:	89 c1                	mov    %eax,%ecx
 249:	75 f5                	jne    240 <strlen+0x10>
    ;
  return n;
}
 24b:	89 c8                	mov    %ecx,%eax
 24d:	5d                   	pop    %ebp
 24e:	c3                   	ret    
 24f:	90                   	nop
  for(n = 0; s[n]; n++)
 250:	31 c9                	xor    %ecx,%ecx
}
 252:	5d                   	pop    %ebp
 253:	89 c8                	mov    %ecx,%eax
 255:	c3                   	ret    
 256:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25d:	8d 76 00             	lea    0x0(%esi),%esi

00000260 <memset>:

void*
memset(void *dst, int c, uint n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 267:	8b 4d 10             	mov    0x10(%ebp),%ecx
 26a:	8b 45 0c             	mov    0xc(%ebp),%eax
 26d:	89 d7                	mov    %edx,%edi
 26f:	fc                   	cld    
 270:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 272:	8b 7d fc             	mov    -0x4(%ebp),%edi
 275:	89 d0                	mov    %edx,%eax
 277:	c9                   	leave  
 278:	c3                   	ret    
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <strchr>:

char*
strchr(const char *s, char c)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 28a:	0f b6 10             	movzbl (%eax),%edx
 28d:	84 d2                	test   %dl,%dl
 28f:	75 12                	jne    2a3 <strchr+0x23>
 291:	eb 1d                	jmp    2b0 <strchr+0x30>
 293:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 297:	90                   	nop
 298:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 29c:	83 c0 01             	add    $0x1,%eax
 29f:	84 d2                	test   %dl,%dl
 2a1:	74 0d                	je     2b0 <strchr+0x30>
    if(*s == c)
 2a3:	38 d1                	cmp    %dl,%cl
 2a5:	75 f1                	jne    298 <strchr+0x18>
      return (char*)s;
  return 0;
}
 2a7:	5d                   	pop    %ebp
 2a8:	c3                   	ret    
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 2b0:	31 c0                	xor    %eax,%eax
}
 2b2:	5d                   	pop    %ebp
 2b3:	c3                   	ret    
 2b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2bf:	90                   	nop

000002c0 <gets>:

char*
gets(char *buf, int max)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2c5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2c8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2c9:	31 db                	xor    %ebx,%ebx
{
 2cb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2ce:	eb 27                	jmp    2f7 <gets+0x37>
    cc = read(0, &c, 1);
 2d0:	83 ec 04             	sub    $0x4,%esp
 2d3:	6a 01                	push   $0x1
 2d5:	57                   	push   %edi
 2d6:	6a 00                	push   $0x0
 2d8:	e8 a8 01 00 00       	call   485 <read>
    if(cc < 1)
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	85 c0                	test   %eax,%eax
 2e2:	7e 1d                	jle    301 <gets+0x41>
      break;
    buf[i++] = c;
 2e4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2e8:	8b 55 08             	mov    0x8(%ebp),%edx
 2eb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2ef:	3c 0a                	cmp    $0xa,%al
 2f1:	74 1d                	je     310 <gets+0x50>
 2f3:	3c 0d                	cmp    $0xd,%al
 2f5:	74 19                	je     310 <gets+0x50>
  for(i=0; i+1 < max; ){
 2f7:	89 de                	mov    %ebx,%esi
 2f9:	83 c3 01             	add    $0x1,%ebx
 2fc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ff:	7c cf                	jl     2d0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 301:	8b 45 08             	mov    0x8(%ebp),%eax
 304:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 308:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30b:	5b                   	pop    %ebx
 30c:	5e                   	pop    %esi
 30d:	5f                   	pop    %edi
 30e:	5d                   	pop    %ebp
 30f:	c3                   	ret    
  buf[i] = '\0';
 310:	8b 45 08             	mov    0x8(%ebp),%eax
 313:	89 de                	mov    %ebx,%esi
 315:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 319:	8d 65 f4             	lea    -0xc(%ebp),%esp
 31c:	5b                   	pop    %ebx
 31d:	5e                   	pop    %esi
 31e:	5f                   	pop    %edi
 31f:	5d                   	pop    %ebp
 320:	c3                   	ret    
 321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 328:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop

00000330 <stat>:

int
stat(const char *n, struct stat *st)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	56                   	push   %esi
 334:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 335:	83 ec 08             	sub    $0x8,%esp
 338:	6a 00                	push   $0x0
 33a:	ff 75 08             	pushl  0x8(%ebp)
 33d:	e8 6b 01 00 00       	call   4ad <open>
  if(fd < 0)
 342:	83 c4 10             	add    $0x10,%esp
 345:	85 c0                	test   %eax,%eax
 347:	78 27                	js     370 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 349:	83 ec 08             	sub    $0x8,%esp
 34c:	ff 75 0c             	pushl  0xc(%ebp)
 34f:	89 c3                	mov    %eax,%ebx
 351:	50                   	push   %eax
 352:	e8 6e 01 00 00       	call   4c5 <fstat>
  close(fd);
 357:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 35a:	89 c6                	mov    %eax,%esi
  close(fd);
 35c:	e8 34 01 00 00       	call   495 <close>
  return r;
 361:	83 c4 10             	add    $0x10,%esp
}
 364:	8d 65 f8             	lea    -0x8(%ebp),%esp
 367:	89 f0                	mov    %esi,%eax
 369:	5b                   	pop    %ebx
 36a:	5e                   	pop    %esi
 36b:	5d                   	pop    %ebp
 36c:	c3                   	ret    
 36d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 370:	be ff ff ff ff       	mov    $0xffffffff,%esi
 375:	eb ed                	jmp    364 <stat+0x34>
 377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37e:	66 90                	xchg   %ax,%ax

00000380 <atoi>:

int
atoi(const char *s)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 387:	0f be 02             	movsbl (%edx),%eax
 38a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 38d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 390:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 395:	77 1e                	ja     3b5 <atoi+0x35>
 397:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 3a0:	83 c2 01             	add    $0x1,%edx
 3a3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 3a6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 3aa:	0f be 02             	movsbl (%edx),%eax
 3ad:	8d 58 d0             	lea    -0x30(%eax),%ebx
 3b0:	80 fb 09             	cmp    $0x9,%bl
 3b3:	76 eb                	jbe    3a0 <atoi+0x20>
  return n;
}
 3b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3b8:	89 c8                	mov    %ecx,%eax
 3ba:	c9                   	leave  
 3bb:	c3                   	ret    
 3bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003c0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	8b 45 10             	mov    0x10(%ebp),%eax
 3c7:	8b 55 08             	mov    0x8(%ebp),%edx
 3ca:	56                   	push   %esi
 3cb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ce:	85 c0                	test   %eax,%eax
 3d0:	7e 13                	jle    3e5 <memmove+0x25>
 3d2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3d4:	89 d7                	mov    %edx,%edi
 3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3e0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3e1:	39 f8                	cmp    %edi,%eax
 3e3:	75 fb                	jne    3e0 <memmove+0x20>
  return vdst;
}
 3e5:	5e                   	pop    %esi
 3e6:	89 d0                	mov    %edx,%eax
 3e8:	5f                   	pop    %edi
 3e9:	5d                   	pop    %ebp
 3ea:	c3                   	ret    
 3eb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ef:	90                   	nop

000003f0 <thread_create>:

int
thread_create(void (*fn)(void *), void *arg)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	53                   	push   %ebx
 3f4:	83 ec 10             	sub    $0x10,%esp
  void *stack = malloc(4096);
 3f7:	68 00 10 00 00       	push   $0x1000
 3fc:	e8 0f 04 00 00       	call   810 <malloc>
  if(stack == 0)
 401:	83 c4 10             	add    $0x10,%esp
 404:	85 c0                	test   %eax,%eax
 406:	74 3b                	je     443 <thread_create+0x53>
 408:	89 c3                	mov    %eax,%ebx
    return -1;
  
  // Check for page alignment.
  if(((uint)stack % 4096) != 0){
 40a:	a9 ff 0f 00 00       	test   $0xfff,%eax
 40f:	75 1f                	jne    430 <thread_create+0x40>
    free(stack);
    return -1;
  }
  
  int tid = clone(stack);
 411:	83 ec 0c             	sub    $0xc,%esp
 414:	50                   	push   %eax
 415:	e8 f3 00 00 00       	call   50d <clone>
  if(tid < 0){
 41a:	83 c4 10             	add    $0x10,%esp
 41d:	85 c0                	test   %eax,%eax
 41f:	78 0f                	js     430 <thread_create+0x40>
    free(stack);
    return -1;
  }
  
  if(tid == 0){
 421:	74 27                	je     44a <thread_create+0x5a>
    exit();
  }
  
  // Parent returns the new thread's id.
  return tid;
}
 423:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 426:	c9                   	leave  
 427:	c3                   	ret    
 428:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 42f:	90                   	nop
    free(stack);
 430:	83 ec 0c             	sub    $0xc,%esp
 433:	53                   	push   %ebx
 434:	e8 47 03 00 00       	call   780 <free>
    return -1;
 439:	83 c4 10             	add    $0x10,%esp
 43c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 441:	eb e0                	jmp    423 <thread_create+0x33>
    return -1;
 443:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 448:	eb d9                	jmp    423 <thread_create+0x33>
    fn(arg);
 44a:	83 ec 0c             	sub    $0xc,%esp
 44d:	ff 75 0c             	pushl  0xc(%ebp)
 450:	ff 55 08             	call   *0x8(%ebp)
    free(stack);
 453:	89 1c 24             	mov    %ebx,(%esp)
 456:	e8 25 03 00 00       	call   780 <free>
    exit();
 45b:	e8 0d 00 00 00       	call   46d <exit>

00000460 <thread_join>:

int
thread_join(void)
{
  return join();
 460:	e9 c0 00 00 00       	jmp    525 <join>

00000465 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 465:	b8 01 00 00 00       	mov    $0x1,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    

0000046d <exit>:
SYSCALL(exit)
 46d:	b8 02 00 00 00       	mov    $0x2,%eax
 472:	cd 40                	int    $0x40
 474:	c3                   	ret    

00000475 <wait>:
SYSCALL(wait)
 475:	b8 03 00 00 00       	mov    $0x3,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    

0000047d <pipe>:
SYSCALL(pipe)
 47d:	b8 04 00 00 00       	mov    $0x4,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    

00000485 <read>:
SYSCALL(read)
 485:	b8 05 00 00 00       	mov    $0x5,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <write>:
SYSCALL(write)
 48d:	b8 10 00 00 00       	mov    $0x10,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <close>:
SYSCALL(close)
 495:	b8 15 00 00 00       	mov    $0x15,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <kill>:
SYSCALL(kill)
 49d:	b8 06 00 00 00       	mov    $0x6,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <exec>:
SYSCALL(exec)
 4a5:	b8 07 00 00 00       	mov    $0x7,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <open>:
SYSCALL(open)
 4ad:	b8 0f 00 00 00       	mov    $0xf,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <mknod>:
SYSCALL(mknod)
 4b5:	b8 11 00 00 00       	mov    $0x11,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <unlink>:
SYSCALL(unlink)
 4bd:	b8 12 00 00 00       	mov    $0x12,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <fstat>:
SYSCALL(fstat)
 4c5:	b8 08 00 00 00       	mov    $0x8,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <link>:
SYSCALL(link)
 4cd:	b8 13 00 00 00       	mov    $0x13,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <mkdir>:
SYSCALL(mkdir)
 4d5:	b8 14 00 00 00       	mov    $0x14,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <chdir>:
SYSCALL(chdir)
 4dd:	b8 09 00 00 00       	mov    $0x9,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <dup>:
SYSCALL(dup)
 4e5:	b8 0a 00 00 00       	mov    $0xa,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <getpid>:
SYSCALL(getpid)
 4ed:	b8 0b 00 00 00       	mov    $0xb,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <sbrk>:
SYSCALL(sbrk)
 4f5:	b8 0c 00 00 00       	mov    $0xc,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <sleep>:
SYSCALL(sleep)
 4fd:	b8 0d 00 00 00       	mov    $0xd,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <uptime>:
SYSCALL(uptime)
 505:	b8 0e 00 00 00       	mov    $0xe,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <clone>:
SYSCALL(clone)
 50d:	b8 16 00 00 00       	mov    $0x16,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <lock>:
SYSCALL(lock)
 515:	b8 17 00 00 00       	mov    $0x17,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <unlock>:
SYSCALL(unlock)
 51d:	b8 18 00 00 00       	mov    $0x18,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <join>:
SYSCALL(join)
 525:	b8 19 00 00 00       	mov    $0x19,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    
 52d:	66 90                	xchg   %ax,%ax
 52f:	90                   	nop

00000530 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	83 ec 3c             	sub    $0x3c,%esp
 539:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 53c:	89 d1                	mov    %edx,%ecx
{
 53e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 541:	85 d2                	test   %edx,%edx
 543:	0f 89 7f 00 00 00    	jns    5c8 <printint+0x98>
 549:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 54d:	74 79                	je     5c8 <printint+0x98>
    neg = 1;
 54f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 556:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 558:	31 db                	xor    %ebx,%ebx
 55a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 55d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 560:	89 c8                	mov    %ecx,%eax
 562:	31 d2                	xor    %edx,%edx
 564:	89 cf                	mov    %ecx,%edi
 566:	f7 75 c4             	divl   -0x3c(%ebp)
 569:	0f b6 92 34 0a 00 00 	movzbl 0xa34(%edx),%edx
 570:	89 45 c0             	mov    %eax,-0x40(%ebp)
 573:	89 d8                	mov    %ebx,%eax
 575:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 578:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 57b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 57e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 581:	76 dd                	jbe    560 <printint+0x30>
  if(neg)
 583:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 586:	85 c9                	test   %ecx,%ecx
 588:	74 0c                	je     596 <printint+0x66>
    buf[i++] = '-';
 58a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 58f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 591:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 596:	8b 7d b8             	mov    -0x48(%ebp),%edi
 599:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 59d:	eb 07                	jmp    5a6 <printint+0x76>
 59f:	90                   	nop
    putc(fd, buf[i]);
 5a0:	0f b6 13             	movzbl (%ebx),%edx
 5a3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 5a6:	83 ec 04             	sub    $0x4,%esp
 5a9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 5ac:	6a 01                	push   $0x1
 5ae:	56                   	push   %esi
 5af:	57                   	push   %edi
 5b0:	e8 d8 fe ff ff       	call   48d <write>
  while(--i >= 0)
 5b5:	83 c4 10             	add    $0x10,%esp
 5b8:	39 de                	cmp    %ebx,%esi
 5ba:	75 e4                	jne    5a0 <printint+0x70>
}
 5bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5bf:	5b                   	pop    %ebx
 5c0:	5e                   	pop    %esi
 5c1:	5f                   	pop    %edi
 5c2:	5d                   	pop    %ebp
 5c3:	c3                   	ret    
 5c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5c8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5cf:	eb 87                	jmp    558 <printint+0x28>
 5d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop

000005e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
 5e5:	53                   	push   %ebx
 5e6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5ec:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5ef:	0f b6 13             	movzbl (%ebx),%edx
 5f2:	84 d2                	test   %dl,%dl
 5f4:	74 6a                	je     660 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5f6:	8d 45 10             	lea    0x10(%ebp),%eax
 5f9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5fc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5ff:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 601:	89 45 d0             	mov    %eax,-0x30(%ebp)
 604:	eb 36                	jmp    63c <printf+0x5c>
 606:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60d:	8d 76 00             	lea    0x0(%esi),%esi
 610:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 613:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 618:	83 f8 25             	cmp    $0x25,%eax
 61b:	74 15                	je     632 <printf+0x52>
  write(fd, &c, 1);
 61d:	83 ec 04             	sub    $0x4,%esp
 620:	88 55 e7             	mov    %dl,-0x19(%ebp)
 623:	6a 01                	push   $0x1
 625:	57                   	push   %edi
 626:	56                   	push   %esi
 627:	e8 61 fe ff ff       	call   48d <write>
 62c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 62f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 632:	0f b6 13             	movzbl (%ebx),%edx
 635:	83 c3 01             	add    $0x1,%ebx
 638:	84 d2                	test   %dl,%dl
 63a:	74 24                	je     660 <printf+0x80>
    c = fmt[i] & 0xff;
 63c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 63f:	85 c9                	test   %ecx,%ecx
 641:	74 cd                	je     610 <printf+0x30>
      }
    } else if(state == '%'){
 643:	83 f9 25             	cmp    $0x25,%ecx
 646:	75 ea                	jne    632 <printf+0x52>
      if(c == 'd'){
 648:	83 f8 25             	cmp    $0x25,%eax
 64b:	0f 84 07 01 00 00    	je     758 <printf+0x178>
 651:	83 e8 63             	sub    $0x63,%eax
 654:	83 f8 15             	cmp    $0x15,%eax
 657:	77 17                	ja     670 <printf+0x90>
 659:	ff 24 85 dc 09 00 00 	jmp    *0x9dc(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 660:	8d 65 f4             	lea    -0xc(%ebp),%esp
 663:	5b                   	pop    %ebx
 664:	5e                   	pop    %esi
 665:	5f                   	pop    %edi
 666:	5d                   	pop    %ebp
 667:	c3                   	ret    
 668:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop
  write(fd, &c, 1);
 670:	83 ec 04             	sub    $0x4,%esp
 673:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 676:	6a 01                	push   $0x1
 678:	57                   	push   %edi
 679:	56                   	push   %esi
 67a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 67e:	e8 0a fe ff ff       	call   48d <write>
        putc(fd, c);
 683:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 687:	83 c4 0c             	add    $0xc,%esp
 68a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 68d:	6a 01                	push   $0x1
 68f:	57                   	push   %edi
 690:	56                   	push   %esi
 691:	e8 f7 fd ff ff       	call   48d <write>
        putc(fd, c);
 696:	83 c4 10             	add    $0x10,%esp
      state = 0;
 699:	31 c9                	xor    %ecx,%ecx
 69b:	eb 95                	jmp    632 <printf+0x52>
 69d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6a0:	83 ec 0c             	sub    $0xc,%esp
 6a3:	b9 10 00 00 00       	mov    $0x10,%ecx
 6a8:	6a 00                	push   $0x0
 6aa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6ad:	8b 10                	mov    (%eax),%edx
 6af:	89 f0                	mov    %esi,%eax
 6b1:	e8 7a fe ff ff       	call   530 <printint>
        ap++;
 6b6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6ba:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6bd:	31 c9                	xor    %ecx,%ecx
 6bf:	e9 6e ff ff ff       	jmp    632 <printf+0x52>
 6c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6cb:	8b 10                	mov    (%eax),%edx
        ap++;
 6cd:	83 c0 04             	add    $0x4,%eax
 6d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6d3:	85 d2                	test   %edx,%edx
 6d5:	0f 84 8d 00 00 00    	je     768 <printf+0x188>
        while(*s != 0){
 6db:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6de:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6e0:	84 c0                	test   %al,%al
 6e2:	0f 84 4a ff ff ff    	je     632 <printf+0x52>
 6e8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6eb:	89 d3                	mov    %edx,%ebx
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6f0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6f3:	83 c3 01             	add    $0x1,%ebx
 6f6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6f9:	6a 01                	push   $0x1
 6fb:	57                   	push   %edi
 6fc:	56                   	push   %esi
 6fd:	e8 8b fd ff ff       	call   48d <write>
        while(*s != 0){
 702:	0f b6 03             	movzbl (%ebx),%eax
 705:	83 c4 10             	add    $0x10,%esp
 708:	84 c0                	test   %al,%al
 70a:	75 e4                	jne    6f0 <printf+0x110>
      state = 0;
 70c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 70f:	31 c9                	xor    %ecx,%ecx
 711:	e9 1c ff ff ff       	jmp    632 <printf+0x52>
 716:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 71d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 720:	83 ec 0c             	sub    $0xc,%esp
 723:	b9 0a 00 00 00       	mov    $0xa,%ecx
 728:	6a 01                	push   $0x1
 72a:	e9 7b ff ff ff       	jmp    6aa <printf+0xca>
 72f:	90                   	nop
        putc(fd, *ap);
 730:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 733:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 736:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 738:	6a 01                	push   $0x1
 73a:	57                   	push   %edi
 73b:	56                   	push   %esi
        putc(fd, *ap);
 73c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 73f:	e8 49 fd ff ff       	call   48d <write>
        ap++;
 744:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 748:	83 c4 10             	add    $0x10,%esp
      state = 0;
 74b:	31 c9                	xor    %ecx,%ecx
 74d:	e9 e0 fe ff ff       	jmp    632 <printf+0x52>
 752:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 758:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 75b:	83 ec 04             	sub    $0x4,%esp
 75e:	e9 2a ff ff ff       	jmp    68d <printf+0xad>
 763:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 767:	90                   	nop
          s = "(null)";
 768:	ba d2 09 00 00       	mov    $0x9d2,%edx
        while(*s != 0){
 76d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 770:	b8 28 00 00 00       	mov    $0x28,%eax
 775:	89 d3                	mov    %edx,%ebx
 777:	e9 74 ff ff ff       	jmp    6f0 <printf+0x110>
 77c:	66 90                	xchg   %ax,%ax
 77e:	66 90                	xchg   %ax,%ax

00000780 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 780:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 781:	a1 70 0d 00 00       	mov    0xd70,%eax
{
 786:	89 e5                	mov    %esp,%ebp
 788:	57                   	push   %edi
 789:	56                   	push   %esi
 78a:	53                   	push   %ebx
 78b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 78e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 791:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 798:	89 c2                	mov    %eax,%edx
 79a:	8b 00                	mov    (%eax),%eax
 79c:	39 ca                	cmp    %ecx,%edx
 79e:	73 30                	jae    7d0 <free+0x50>
 7a0:	39 c1                	cmp    %eax,%ecx
 7a2:	72 04                	jb     7a8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a4:	39 c2                	cmp    %eax,%edx
 7a6:	72 f0                	jb     798 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ae:	39 f8                	cmp    %edi,%eax
 7b0:	74 30                	je     7e2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 7b2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 7b5:	8b 42 04             	mov    0x4(%edx),%eax
 7b8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7bb:	39 f1                	cmp    %esi,%ecx
 7bd:	74 3a                	je     7f9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 7bf:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7c1:	5b                   	pop    %ebx
  freep = p;
 7c2:	89 15 70 0d 00 00    	mov    %edx,0xd70
}
 7c8:	5e                   	pop    %esi
 7c9:	5f                   	pop    %edi
 7ca:	5d                   	pop    %ebp
 7cb:	c3                   	ret    
 7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7d0:	39 c2                	cmp    %eax,%edx
 7d2:	72 c4                	jb     798 <free+0x18>
 7d4:	39 c1                	cmp    %eax,%ecx
 7d6:	73 c0                	jae    798 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7de:	39 f8                	cmp    %edi,%eax
 7e0:	75 d0                	jne    7b2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7e2:	03 70 04             	add    0x4(%eax),%esi
 7e5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e8:	8b 02                	mov    (%edx),%eax
 7ea:	8b 00                	mov    (%eax),%eax
 7ec:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ef:	8b 42 04             	mov    0x4(%edx),%eax
 7f2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7f5:	39 f1                	cmp    %esi,%ecx
 7f7:	75 c6                	jne    7bf <free+0x3f>
    p->s.size += bp->s.size;
 7f9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7fc:	89 15 70 0d 00 00    	mov    %edx,0xd70
    p->s.size += bp->s.size;
 802:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 805:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 808:	89 0a                	mov    %ecx,(%edx)
}
 80a:	5b                   	pop    %ebx
 80b:	5e                   	pop    %esi
 80c:	5f                   	pop    %edi
 80d:	5d                   	pop    %ebp
 80e:	c3                   	ret    
 80f:	90                   	nop

00000810 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	57                   	push   %edi
 814:	56                   	push   %esi
 815:	53                   	push   %ebx
 816:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 819:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 81c:	8b 3d 70 0d 00 00    	mov    0xd70,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 822:	8d 70 07             	lea    0x7(%eax),%esi
 825:	c1 ee 03             	shr    $0x3,%esi
 828:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 82b:	85 ff                	test   %edi,%edi
 82d:	0f 84 9d 00 00 00    	je     8d0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 833:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 835:	8b 4a 04             	mov    0x4(%edx),%ecx
 838:	39 f1                	cmp    %esi,%ecx
 83a:	73 6a                	jae    8a6 <malloc+0x96>
 83c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 841:	39 de                	cmp    %ebx,%esi
 843:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 846:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 84d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 850:	eb 17                	jmp    869 <malloc+0x59>
 852:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 858:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 85a:	8b 48 04             	mov    0x4(%eax),%ecx
 85d:	39 f1                	cmp    %esi,%ecx
 85f:	73 4f                	jae    8b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 861:	8b 3d 70 0d 00 00    	mov    0xd70,%edi
 867:	89 c2                	mov    %eax,%edx
 869:	39 d7                	cmp    %edx,%edi
 86b:	75 eb                	jne    858 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 86d:	83 ec 0c             	sub    $0xc,%esp
 870:	ff 75 e4             	pushl  -0x1c(%ebp)
 873:	e8 7d fc ff ff       	call   4f5 <sbrk>
  if(p == (char*)-1)
 878:	83 c4 10             	add    $0x10,%esp
 87b:	83 f8 ff             	cmp    $0xffffffff,%eax
 87e:	74 1c                	je     89c <malloc+0x8c>
  hp->s.size = nu;
 880:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 883:	83 ec 0c             	sub    $0xc,%esp
 886:	83 c0 08             	add    $0x8,%eax
 889:	50                   	push   %eax
 88a:	e8 f1 fe ff ff       	call   780 <free>
  return freep;
 88f:	8b 15 70 0d 00 00    	mov    0xd70,%edx
      if((p = morecore(nunits)) == 0)
 895:	83 c4 10             	add    $0x10,%esp
 898:	85 d2                	test   %edx,%edx
 89a:	75 bc                	jne    858 <malloc+0x48>
        return 0;
  }
}
 89c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 89f:	31 c0                	xor    %eax,%eax
}
 8a1:	5b                   	pop    %ebx
 8a2:	5e                   	pop    %esi
 8a3:	5f                   	pop    %edi
 8a4:	5d                   	pop    %ebp
 8a5:	c3                   	ret    
    if(p->s.size >= nunits){
 8a6:	89 d0                	mov    %edx,%eax
 8a8:	89 fa                	mov    %edi,%edx
 8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 8b0:	39 ce                	cmp    %ecx,%esi
 8b2:	74 4c                	je     900 <malloc+0xf0>
        p->s.size -= nunits;
 8b4:	29 f1                	sub    %esi,%ecx
 8b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 8b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 8bc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 8bf:	89 15 70 0d 00 00    	mov    %edx,0xd70
}
 8c5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8c8:	83 c0 08             	add    $0x8,%eax
}
 8cb:	5b                   	pop    %ebx
 8cc:	5e                   	pop    %esi
 8cd:	5f                   	pop    %edi
 8ce:	5d                   	pop    %ebp
 8cf:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8d0:	c7 05 70 0d 00 00 74 	movl   $0xd74,0xd70
 8d7:	0d 00 00 
    base.s.size = 0;
 8da:	bf 74 0d 00 00       	mov    $0xd74,%edi
    base.s.ptr = freep = prevp = &base;
 8df:	c7 05 74 0d 00 00 74 	movl   $0xd74,0xd74
 8e6:	0d 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8eb:	c7 05 78 0d 00 00 00 	movl   $0x0,0xd78
 8f2:	00 00 00 
    if(p->s.size >= nunits){
 8f5:	e9 42 ff ff ff       	jmp    83c <malloc+0x2c>
 8fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 900:	8b 08                	mov    (%eax),%ecx
 902:	89 0a                	mov    %ecx,(%edx)
 904:	eb b9                	jmp    8bf <malloc+0xaf>
