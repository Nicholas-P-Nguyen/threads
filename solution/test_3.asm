
_test_3:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
int stack[4096] __attribute__ ((aligned (4096)));
int x = 0;

int
main(int argc, char* argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 10             	sub    $0x10,%esp

    int tid = clone(stack);
  11:	68 00 20 00 00       	push   $0x2000
  16:	e8 32 04 00 00       	call   44d <clone>

    if (tid < 0) {
  1b:	83 c4 10             	add    $0x10,%esp
  1e:	85 c0                	test   %eax,%eax
  20:	78 5a                	js     7c <main+0x7c>
      exit();
    } else if (tid == 0) {
  22:	74 4e                	je     72 <main+0x72>
      // child
      x = 0xdeadbeef;
      exit();
    } else {
      join();
  24:	e8 3c 04 00 00       	call   465 <join>
      ASSERT(x == 0xdeadbeef, "expected join to wait until child thread assigns `x` ");
  29:	81 3d 00 10 00 00 ef 	cmpl   $0xdeadbeef,0x1000
  30:	be ad de 
  33:	74 4c                	je     81 <main+0x81>
  35:	83 ec 0c             	sub    $0xc,%esp
  38:	6a 17                	push   $0x17
  3a:	68 48 08 00 00       	push   $0x848
  3f:	68 51 08 00 00       	push   $0x851
  44:	68 5b 08 00 00       	push   $0x85b
  49:	6a 01                	push   $0x1
  4b:	e8 d0 04 00 00       	call   520 <printf>
  50:	83 c4 18             	add    $0x18,%esp
  53:	68 7c 08 00 00       	push   $0x87c
  58:	6a 01                	push   $0x1
  5a:	e8 c1 04 00 00       	call   520 <printf>
  5f:	58                   	pop    %eax
  60:	5a                   	pop    %edx
  61:	68 65 08 00 00       	push   $0x865
  66:	6a 01                	push   $0x1
  68:	e8 b3 04 00 00       	call   520 <printf>
  6d:	e8 3b 03 00 00       	call   3ad <exit>
      x = 0xdeadbeef;
  72:	c7 05 00 10 00 00 ef 	movl   $0xdeadbeef,0x1000
  79:	be ad de 
      exit();
  7c:	e8 2c 03 00 00       	call   3ad <exit>
                        printf(1, "\n");


#define SUCCESS_MSG "TEST PASSED"
static void test_passed() {
    PRINTF("%s", SUCCESS_MSG);
  81:	50                   	push   %eax
  82:	68 51 08 00 00       	push   $0x851
  87:	68 67 08 00 00       	push   $0x867
  8c:	6a 01                	push   $0x1
  8e:	e8 8d 04 00 00       	call   520 <printf>
  93:	83 c4 0c             	add    $0xc,%esp
  96:	68 6c 08 00 00       	push   $0x86c
  9b:	68 78 08 00 00       	push   $0x878
  a0:	6a 01                	push   $0x1
  a2:	e8 79 04 00 00       	call   520 <printf>
  a7:	5a                   	pop    %edx
  a8:	59                   	pop    %ecx
  a9:	68 65 08 00 00       	push   $0x865
  ae:	6a 01                	push   $0x1
  b0:	e8 6b 04 00 00       	call   520 <printf>
      test_passed();
    }

    wait();
  b5:	e8 fb 02 00 00       	call   3b5 <wait>
    exit();
  ba:	e8 ee 02 00 00       	call   3ad <exit>
  bf:	90                   	nop

000000c0 <strcpy>:
#include "x86.h"
#include "spinlock.h"

char*
strcpy(char *s, const char *t)
{
  c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c1:	31 c0                	xor    %eax,%eax
{
  c3:	89 e5                	mov    %esp,%ebp
  c5:	53                   	push   %ebx
  c6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  d0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  d4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  d7:	83 c0 01             	add    $0x1,%eax
  da:	84 d2                	test   %dl,%dl
  dc:	75 f2                	jne    d0 <strcpy+0x10>
    ;
  return os;
}
  de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  e1:	89 c8                	mov    %ecx,%eax
  e3:	c9                   	leave  
  e4:	c3                   	ret    
  e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	53                   	push   %ebx
  f4:	8b 55 08             	mov    0x8(%ebp),%edx
  f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  fa:	0f b6 02             	movzbl (%edx),%eax
  fd:	84 c0                	test   %al,%al
  ff:	75 17                	jne    118 <strcmp+0x28>
 101:	eb 3a                	jmp    13d <strcmp+0x4d>
 103:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 107:	90                   	nop
 108:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 10c:	83 c2 01             	add    $0x1,%edx
 10f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 112:	84 c0                	test   %al,%al
 114:	74 1a                	je     130 <strcmp+0x40>
    p++, q++;
 116:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 118:	0f b6 19             	movzbl (%ecx),%ebx
 11b:	38 c3                	cmp    %al,%bl
 11d:	74 e9                	je     108 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 11f:	29 d8                	sub    %ebx,%eax
}
 121:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 124:	c9                   	leave  
 125:	c3                   	ret    
 126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 130:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 134:	31 c0                	xor    %eax,%eax
 136:	29 d8                	sub    %ebx,%eax
}
 138:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13b:	c9                   	leave  
 13c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 13d:	0f b6 19             	movzbl (%ecx),%ebx
 140:	31 c0                	xor    %eax,%eax
 142:	eb db                	jmp    11f <strcmp+0x2f>
 144:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 14f:	90                   	nop

00000150 <strlen>:

uint
strlen(const char *s)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 156:	80 3a 00             	cmpb   $0x0,(%edx)
 159:	74 15                	je     170 <strlen+0x20>
 15b:	31 c0                	xor    %eax,%eax
 15d:	8d 76 00             	lea    0x0(%esi),%esi
 160:	83 c0 01             	add    $0x1,%eax
 163:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 167:	89 c1                	mov    %eax,%ecx
 169:	75 f5                	jne    160 <strlen+0x10>
    ;
  return n;
}
 16b:	89 c8                	mov    %ecx,%eax
 16d:	5d                   	pop    %ebp
 16e:	c3                   	ret    
 16f:	90                   	nop
  for(n = 0; s[n]; n++)
 170:	31 c9                	xor    %ecx,%ecx
}
 172:	5d                   	pop    %ebp
 173:	89 c8                	mov    %ecx,%eax
 175:	c3                   	ret    
 176:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17d:	8d 76 00             	lea    0x0(%esi),%esi

00000180 <memset>:

void*
memset(void *dst, int c, uint n)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 187:	8b 4d 10             	mov    0x10(%ebp),%ecx
 18a:	8b 45 0c             	mov    0xc(%ebp),%eax
 18d:	89 d7                	mov    %edx,%edi
 18f:	fc                   	cld    
 190:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 192:	8b 7d fc             	mov    -0x4(%ebp),%edi
 195:	89 d0                	mov    %edx,%eax
 197:	c9                   	leave  
 198:	c3                   	ret    
 199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001a0 <strchr>:

char*
strchr(const char *s, char c)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
 1a6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	84 d2                	test   %dl,%dl
 1af:	75 12                	jne    1c3 <strchr+0x23>
 1b1:	eb 1d                	jmp    1d0 <strchr+0x30>
 1b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b7:	90                   	nop
 1b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1bc:	83 c0 01             	add    $0x1,%eax
 1bf:	84 d2                	test   %dl,%dl
 1c1:	74 0d                	je     1d0 <strchr+0x30>
    if(*s == c)
 1c3:	38 d1                	cmp    %dl,%cl
 1c5:	75 f1                	jne    1b8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1c7:	5d                   	pop    %ebp
 1c8:	c3                   	ret    
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1d0:	31 c0                	xor    %eax,%eax
}
 1d2:	5d                   	pop    %ebp
 1d3:	c3                   	ret    
 1d4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1df:	90                   	nop

000001e0 <gets>:

char*
gets(char *buf, int max)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1e5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 1e8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 1e9:	31 db                	xor    %ebx,%ebx
{
 1eb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 1ee:	eb 27                	jmp    217 <gets+0x37>
    cc = read(0, &c, 1);
 1f0:	83 ec 04             	sub    $0x4,%esp
 1f3:	6a 01                	push   $0x1
 1f5:	57                   	push   %edi
 1f6:	6a 00                	push   $0x0
 1f8:	e8 c8 01 00 00       	call   3c5 <read>
    if(cc < 1)
 1fd:	83 c4 10             	add    $0x10,%esp
 200:	85 c0                	test   %eax,%eax
 202:	7e 1d                	jle    221 <gets+0x41>
      break;
    buf[i++] = c;
 204:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 208:	8b 55 08             	mov    0x8(%ebp),%edx
 20b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 20f:	3c 0a                	cmp    $0xa,%al
 211:	74 1d                	je     230 <gets+0x50>
 213:	3c 0d                	cmp    $0xd,%al
 215:	74 19                	je     230 <gets+0x50>
  for(i=0; i+1 < max; ){
 217:	89 de                	mov    %ebx,%esi
 219:	83 c3 01             	add    $0x1,%ebx
 21c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 21f:	7c cf                	jl     1f0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 221:	8b 45 08             	mov    0x8(%ebp),%eax
 224:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 228:	8d 65 f4             	lea    -0xc(%ebp),%esp
 22b:	5b                   	pop    %ebx
 22c:	5e                   	pop    %esi
 22d:	5f                   	pop    %edi
 22e:	5d                   	pop    %ebp
 22f:	c3                   	ret    
  buf[i] = '\0';
 230:	8b 45 08             	mov    0x8(%ebp),%eax
 233:	89 de                	mov    %ebx,%esi
 235:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 239:	8d 65 f4             	lea    -0xc(%ebp),%esp
 23c:	5b                   	pop    %ebx
 23d:	5e                   	pop    %esi
 23e:	5f                   	pop    %edi
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    
 241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 248:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24f:	90                   	nop

00000250 <stat>:

int
stat(const char *n, struct stat *st)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	56                   	push   %esi
 254:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 255:	83 ec 08             	sub    $0x8,%esp
 258:	6a 00                	push   $0x0
 25a:	ff 75 08             	pushl  0x8(%ebp)
 25d:	e8 8b 01 00 00       	call   3ed <open>
  if(fd < 0)
 262:	83 c4 10             	add    $0x10,%esp
 265:	85 c0                	test   %eax,%eax
 267:	78 27                	js     290 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 269:	83 ec 08             	sub    $0x8,%esp
 26c:	ff 75 0c             	pushl  0xc(%ebp)
 26f:	89 c3                	mov    %eax,%ebx
 271:	50                   	push   %eax
 272:	e8 8e 01 00 00       	call   405 <fstat>
  close(fd);
 277:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 27a:	89 c6                	mov    %eax,%esi
  close(fd);
 27c:	e8 54 01 00 00       	call   3d5 <close>
  return r;
 281:	83 c4 10             	add    $0x10,%esp
}
 284:	8d 65 f8             	lea    -0x8(%ebp),%esp
 287:	89 f0                	mov    %esi,%eax
 289:	5b                   	pop    %ebx
 28a:	5e                   	pop    %esi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 290:	be ff ff ff ff       	mov    $0xffffffff,%esi
 295:	eb ed                	jmp    284 <stat+0x34>
 297:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29e:	66 90                	xchg   %ax,%ax

000002a0 <atoi>:

int
atoi(const char *s)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	53                   	push   %ebx
 2a4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2a7:	0f be 02             	movsbl (%edx),%eax
 2aa:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2ad:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2b0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2b5:	77 1e                	ja     2d5 <atoi+0x35>
 2b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2be:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2c0:	83 c2 01             	add    $0x1,%edx
 2c3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2c6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ca:	0f be 02             	movsbl (%edx),%eax
 2cd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2d0:	80 fb 09             	cmp    $0x9,%bl
 2d3:	76 eb                	jbe    2c0 <atoi+0x20>
  return n;
}
 2d5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2d8:	89 c8                	mov    %ecx,%eax
 2da:	c9                   	leave  
 2db:	c3                   	ret    
 2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	8b 45 10             	mov    0x10(%ebp),%eax
 2e7:	8b 55 08             	mov    0x8(%ebp),%edx
 2ea:	56                   	push   %esi
 2eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ee:	85 c0                	test   %eax,%eax
 2f0:	7e 13                	jle    305 <memmove+0x25>
 2f2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2f4:	89 d7                	mov    %edx,%edi
 2f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 300:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 301:	39 f8                	cmp    %edi,%eax
 303:	75 fb                	jne    300 <memmove+0x20>
  return vdst;
}
 305:	5e                   	pop    %esi
 306:	89 d0                	mov    %edx,%eax
 308:	5f                   	pop    %edi
 309:	5d                   	pop    %ebp
 30a:	c3                   	ret    
 30b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop

00000310 <thread_create>:

int
thread_create(void (*fn)(void *), void *arg)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	53                   	push   %ebx
 314:	83 ec 10             	sub    $0x10,%esp
  void *mem = malloc(4096 * 2);
 317:	68 00 20 00 00       	push   $0x2000
 31c:	e8 2f 04 00 00       	call   750 <malloc>
  if(mem == 0)
 321:	83 c4 10             	add    $0x10,%esp
 324:	85 c0                	test   %eax,%eax
 326:	74 32                	je     35a <thread_create+0x4a>
 328:	89 c3                	mov    %eax,%ebx
    return -1;
  
  char *p = (char *)mem;
  while ((uint)p % 4096 != 0) {
 32a:	a9 ff 0f 00 00       	test   $0xfff,%eax
 32f:	74 12                	je     343 <thread_create+0x33>
 331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    p++;
 338:	83 c3 01             	add    $0x1,%ebx
  while ((uint)p % 4096 != 0) {
 33b:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
 341:	75 f5                	jne    338 <thread_create+0x28>
    printf(1, "LOLOLOL %p\n", fn);
    free(stack);
    return -1;
  }
  
  int tid = clone(stack);
 343:	83 ec 0c             	sub    $0xc,%esp
 346:	53                   	push   %ebx
 347:	e8 01 01 00 00       	call   44d <clone>
  if(tid < 0){
 34c:	83 c4 10             	add    $0x10,%esp
 34f:	85 c0                	test   %eax,%eax
 351:	78 0e                	js     361 <thread_create+0x51>
    free(stack);
    return -1;
  }
  

  if(tid == 0){
 353:	74 1f                	je     374 <thread_create+0x64>
    exit();
  }
  
  // Parent returns the new thread's id.
  return tid;
}
 355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 358:	c9                   	leave  
 359:	c3                   	ret    
    return -1;
 35a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 35f:	eb f4                	jmp    355 <thread_create+0x45>
    free(stack);
 361:	83 ec 0c             	sub    $0xc,%esp
 364:	53                   	push   %ebx
 365:	e8 56 03 00 00       	call   6c0 <free>
    return -1;
 36a:	83 c4 10             	add    $0x10,%esp
 36d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 372:	eb e1                	jmp    355 <thread_create+0x45>
    printf(1, "Entering thread function at %p\n", fn);
 374:	50                   	push   %eax
 375:	ff 75 08             	pushl  0x8(%ebp)
 378:	68 b4 08 00 00       	push   $0x8b4
 37d:	6a 01                	push   $0x1
 37f:	e8 9c 01 00 00       	call   520 <printf>
    fn(arg);
 384:	5a                   	pop    %edx
 385:	ff 75 0c             	pushl  0xc(%ebp)
 388:	ff 55 08             	call   *0x8(%ebp)
    free(stack);
 38b:	89 1c 24             	mov    %ebx,(%esp)
 38e:	e8 2d 03 00 00       	call   6c0 <free>
    exit();
 393:	e8 15 00 00 00       	call   3ad <exit>
 398:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 39f:	90                   	nop

000003a0 <thread_join>:

int
thread_join(void)
{
  return join();
 3a0:	e9 c0 00 00 00       	jmp    465 <join>

000003a5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3a5:	b8 01 00 00 00       	mov    $0x1,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <exit>:
SYSCALL(exit)
 3ad:	b8 02 00 00 00       	mov    $0x2,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <wait>:
SYSCALL(wait)
 3b5:	b8 03 00 00 00       	mov    $0x3,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <pipe>:
SYSCALL(pipe)
 3bd:	b8 04 00 00 00       	mov    $0x4,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <read>:
SYSCALL(read)
 3c5:	b8 05 00 00 00       	mov    $0x5,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <write>:
SYSCALL(write)
 3cd:	b8 10 00 00 00       	mov    $0x10,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <close>:
SYSCALL(close)
 3d5:	b8 15 00 00 00       	mov    $0x15,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <kill>:
SYSCALL(kill)
 3dd:	b8 06 00 00 00       	mov    $0x6,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <exec>:
SYSCALL(exec)
 3e5:	b8 07 00 00 00       	mov    $0x7,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <open>:
SYSCALL(open)
 3ed:	b8 0f 00 00 00       	mov    $0xf,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <mknod>:
SYSCALL(mknod)
 3f5:	b8 11 00 00 00       	mov    $0x11,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <unlink>:
SYSCALL(unlink)
 3fd:	b8 12 00 00 00       	mov    $0x12,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <fstat>:
SYSCALL(fstat)
 405:	b8 08 00 00 00       	mov    $0x8,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <link>:
SYSCALL(link)
 40d:	b8 13 00 00 00       	mov    $0x13,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <mkdir>:
SYSCALL(mkdir)
 415:	b8 14 00 00 00       	mov    $0x14,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <chdir>:
SYSCALL(chdir)
 41d:	b8 09 00 00 00       	mov    $0x9,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <dup>:
SYSCALL(dup)
 425:	b8 0a 00 00 00       	mov    $0xa,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <getpid>:
SYSCALL(getpid)
 42d:	b8 0b 00 00 00       	mov    $0xb,%eax
 432:	cd 40                	int    $0x40
 434:	c3                   	ret    

00000435 <sbrk>:
SYSCALL(sbrk)
 435:	b8 0c 00 00 00       	mov    $0xc,%eax
 43a:	cd 40                	int    $0x40
 43c:	c3                   	ret    

0000043d <sleep>:
SYSCALL(sleep)
 43d:	b8 0d 00 00 00       	mov    $0xd,%eax
 442:	cd 40                	int    $0x40
 444:	c3                   	ret    

00000445 <uptime>:
SYSCALL(uptime)
 445:	b8 0e 00 00 00       	mov    $0xe,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <clone>:
SYSCALL(clone)
 44d:	b8 16 00 00 00       	mov    $0x16,%eax
 452:	cd 40                	int    $0x40
 454:	c3                   	ret    

00000455 <lock>:
SYSCALL(lock)
 455:	b8 17 00 00 00       	mov    $0x17,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <unlock>:
SYSCALL(unlock)
 45d:	b8 18 00 00 00       	mov    $0x18,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <join>:
SYSCALL(join)
 465:	b8 19 00 00 00       	mov    $0x19,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    
 46d:	66 90                	xchg   %ax,%ax
 46f:	90                   	nop

00000470 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	57                   	push   %edi
 474:	56                   	push   %esi
 475:	53                   	push   %ebx
 476:	83 ec 3c             	sub    $0x3c,%esp
 479:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 47c:	89 d1                	mov    %edx,%ecx
{
 47e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 481:	85 d2                	test   %edx,%edx
 483:	0f 89 7f 00 00 00    	jns    508 <printint+0x98>
 489:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 48d:	74 79                	je     508 <printint+0x98>
    neg = 1;
 48f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 496:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 498:	31 db                	xor    %ebx,%ebx
 49a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 49d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4a0:	89 c8                	mov    %ecx,%eax
 4a2:	31 d2                	xor    %edx,%edx
 4a4:	89 cf                	mov    %ecx,%edi
 4a6:	f7 75 c4             	divl   -0x3c(%ebp)
 4a9:	0f b6 92 34 09 00 00 	movzbl 0x934(%edx),%edx
 4b0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4b3:	89 d8                	mov    %ebx,%eax
 4b5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4b8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4bb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4be:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4c1:	76 dd                	jbe    4a0 <printint+0x30>
  if(neg)
 4c3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4c6:	85 c9                	test   %ecx,%ecx
 4c8:	74 0c                	je     4d6 <printint+0x66>
    buf[i++] = '-';
 4ca:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4cf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4d1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4d6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4d9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4dd:	eb 07                	jmp    4e6 <printint+0x76>
 4df:	90                   	nop
    putc(fd, buf[i]);
 4e0:	0f b6 13             	movzbl (%ebx),%edx
 4e3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4e6:	83 ec 04             	sub    $0x4,%esp
 4e9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4ec:	6a 01                	push   $0x1
 4ee:	56                   	push   %esi
 4ef:	57                   	push   %edi
 4f0:	e8 d8 fe ff ff       	call   3cd <write>
  while(--i >= 0)
 4f5:	83 c4 10             	add    $0x10,%esp
 4f8:	39 de                	cmp    %ebx,%esi
 4fa:	75 e4                	jne    4e0 <printint+0x70>
}
 4fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ff:	5b                   	pop    %ebx
 500:	5e                   	pop    %esi
 501:	5f                   	pop    %edi
 502:	5d                   	pop    %ebp
 503:	c3                   	ret    
 504:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 508:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 50f:	eb 87                	jmp    498 <printint+0x28>
 511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 518:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51f:	90                   	nop

00000520 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	57                   	push   %edi
 524:	56                   	push   %esi
 525:	53                   	push   %ebx
 526:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 529:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 52c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 52f:	0f b6 13             	movzbl (%ebx),%edx
 532:	84 d2                	test   %dl,%dl
 534:	74 6a                	je     5a0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 536:	8d 45 10             	lea    0x10(%ebp),%eax
 539:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 53c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 53f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 541:	89 45 d0             	mov    %eax,-0x30(%ebp)
 544:	eb 36                	jmp    57c <printf+0x5c>
 546:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 54d:	8d 76 00             	lea    0x0(%esi),%esi
 550:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 553:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 558:	83 f8 25             	cmp    $0x25,%eax
 55b:	74 15                	je     572 <printf+0x52>
  write(fd, &c, 1);
 55d:	83 ec 04             	sub    $0x4,%esp
 560:	88 55 e7             	mov    %dl,-0x19(%ebp)
 563:	6a 01                	push   $0x1
 565:	57                   	push   %edi
 566:	56                   	push   %esi
 567:	e8 61 fe ff ff       	call   3cd <write>
 56c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 56f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 572:	0f b6 13             	movzbl (%ebx),%edx
 575:	83 c3 01             	add    $0x1,%ebx
 578:	84 d2                	test   %dl,%dl
 57a:	74 24                	je     5a0 <printf+0x80>
    c = fmt[i] & 0xff;
 57c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 57f:	85 c9                	test   %ecx,%ecx
 581:	74 cd                	je     550 <printf+0x30>
      }
    } else if(state == '%'){
 583:	83 f9 25             	cmp    $0x25,%ecx
 586:	75 ea                	jne    572 <printf+0x52>
      if(c == 'd'){
 588:	83 f8 25             	cmp    $0x25,%eax
 58b:	0f 84 07 01 00 00    	je     698 <printf+0x178>
 591:	83 e8 63             	sub    $0x63,%eax
 594:	83 f8 15             	cmp    $0x15,%eax
 597:	77 17                	ja     5b0 <printf+0x90>
 599:	ff 24 85 dc 08 00 00 	jmp    *0x8dc(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5a3:	5b                   	pop    %ebx
 5a4:	5e                   	pop    %esi
 5a5:	5f                   	pop    %edi
 5a6:	5d                   	pop    %ebp
 5a7:	c3                   	ret    
 5a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop
  write(fd, &c, 1);
 5b0:	83 ec 04             	sub    $0x4,%esp
 5b3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 5b6:	6a 01                	push   $0x1
 5b8:	57                   	push   %edi
 5b9:	56                   	push   %esi
 5ba:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5be:	e8 0a fe ff ff       	call   3cd <write>
        putc(fd, c);
 5c3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 5c7:	83 c4 0c             	add    $0xc,%esp
 5ca:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5cd:	6a 01                	push   $0x1
 5cf:	57                   	push   %edi
 5d0:	56                   	push   %esi
 5d1:	e8 f7 fd ff ff       	call   3cd <write>
        putc(fd, c);
 5d6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5d9:	31 c9                	xor    %ecx,%ecx
 5db:	eb 95                	jmp    572 <printf+0x52>
 5dd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5e0:	83 ec 0c             	sub    $0xc,%esp
 5e3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5e8:	6a 00                	push   $0x0
 5ea:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5ed:	8b 10                	mov    (%eax),%edx
 5ef:	89 f0                	mov    %esi,%eax
 5f1:	e8 7a fe ff ff       	call   470 <printint>
        ap++;
 5f6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5fa:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5fd:	31 c9                	xor    %ecx,%ecx
 5ff:	e9 6e ff ff ff       	jmp    572 <printf+0x52>
 604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 608:	8b 45 d0             	mov    -0x30(%ebp),%eax
 60b:	8b 10                	mov    (%eax),%edx
        ap++;
 60d:	83 c0 04             	add    $0x4,%eax
 610:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 613:	85 d2                	test   %edx,%edx
 615:	0f 84 8d 00 00 00    	je     6a8 <printf+0x188>
        while(*s != 0){
 61b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 61e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 620:	84 c0                	test   %al,%al
 622:	0f 84 4a ff ff ff    	je     572 <printf+0x52>
 628:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 62b:	89 d3                	mov    %edx,%ebx
 62d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 630:	83 ec 04             	sub    $0x4,%esp
          s++;
 633:	83 c3 01             	add    $0x1,%ebx
 636:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 639:	6a 01                	push   $0x1
 63b:	57                   	push   %edi
 63c:	56                   	push   %esi
 63d:	e8 8b fd ff ff       	call   3cd <write>
        while(*s != 0){
 642:	0f b6 03             	movzbl (%ebx),%eax
 645:	83 c4 10             	add    $0x10,%esp
 648:	84 c0                	test   %al,%al
 64a:	75 e4                	jne    630 <printf+0x110>
      state = 0;
 64c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 64f:	31 c9                	xor    %ecx,%ecx
 651:	e9 1c ff ff ff       	jmp    572 <printf+0x52>
 656:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 65d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 660:	83 ec 0c             	sub    $0xc,%esp
 663:	b9 0a 00 00 00       	mov    $0xa,%ecx
 668:	6a 01                	push   $0x1
 66a:	e9 7b ff ff ff       	jmp    5ea <printf+0xca>
 66f:	90                   	nop
        putc(fd, *ap);
 670:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 673:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 676:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 678:	6a 01                	push   $0x1
 67a:	57                   	push   %edi
 67b:	56                   	push   %esi
        putc(fd, *ap);
 67c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 67f:	e8 49 fd ff ff       	call   3cd <write>
        ap++;
 684:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 688:	83 c4 10             	add    $0x10,%esp
      state = 0;
 68b:	31 c9                	xor    %ecx,%ecx
 68d:	e9 e0 fe ff ff       	jmp    572 <printf+0x52>
 692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 698:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 69b:	83 ec 04             	sub    $0x4,%esp
 69e:	e9 2a ff ff ff       	jmp    5cd <printf+0xad>
 6a3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6a7:	90                   	nop
          s = "(null)";
 6a8:	ba d4 08 00 00       	mov    $0x8d4,%edx
        while(*s != 0){
 6ad:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6b0:	b8 28 00 00 00       	mov    $0x28,%eax
 6b5:	89 d3                	mov    %edx,%ebx
 6b7:	e9 74 ff ff ff       	jmp    630 <printf+0x110>
 6bc:	66 90                	xchg   %ax,%ax
 6be:	66 90                	xchg   %ax,%ax

000006c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c1:	a1 00 60 00 00       	mov    0x6000,%eax
{
 6c6:	89 e5                	mov    %esp,%ebp
 6c8:	57                   	push   %edi
 6c9:	56                   	push   %esi
 6ca:	53                   	push   %ebx
 6cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6d8:	89 c2                	mov    %eax,%edx
 6da:	8b 00                	mov    (%eax),%eax
 6dc:	39 ca                	cmp    %ecx,%edx
 6de:	73 30                	jae    710 <free+0x50>
 6e0:	39 c1                	cmp    %eax,%ecx
 6e2:	72 04                	jb     6e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e4:	39 c2                	cmp    %eax,%edx
 6e6:	72 f0                	jb     6d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ee:	39 f8                	cmp    %edi,%eax
 6f0:	74 30                	je     722 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6f5:	8b 42 04             	mov    0x4(%edx),%eax
 6f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6fb:	39 f1                	cmp    %esi,%ecx
 6fd:	74 3a                	je     739 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 701:	5b                   	pop    %ebx
  freep = p;
 702:	89 15 00 60 00 00    	mov    %edx,0x6000
}
 708:	5e                   	pop    %esi
 709:	5f                   	pop    %edi
 70a:	5d                   	pop    %ebp
 70b:	c3                   	ret    
 70c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 710:	39 c2                	cmp    %eax,%edx
 712:	72 c4                	jb     6d8 <free+0x18>
 714:	39 c1                	cmp    %eax,%ecx
 716:	73 c0                	jae    6d8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 718:	8b 73 fc             	mov    -0x4(%ebx),%esi
 71b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 71e:	39 f8                	cmp    %edi,%eax
 720:	75 d0                	jne    6f2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 722:	03 70 04             	add    0x4(%eax),%esi
 725:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 728:	8b 02                	mov    (%edx),%eax
 72a:	8b 00                	mov    (%eax),%eax
 72c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 72f:	8b 42 04             	mov    0x4(%edx),%eax
 732:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 735:	39 f1                	cmp    %esi,%ecx
 737:	75 c6                	jne    6ff <free+0x3f>
    p->s.size += bp->s.size;
 739:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 73c:	89 15 00 60 00 00    	mov    %edx,0x6000
    p->s.size += bp->s.size;
 742:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 745:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 748:	89 0a                	mov    %ecx,(%edx)
}
 74a:	5b                   	pop    %ebx
 74b:	5e                   	pop    %esi
 74c:	5f                   	pop    %edi
 74d:	5d                   	pop    %ebp
 74e:	c3                   	ret    
 74f:	90                   	nop

00000750 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	57                   	push   %edi
 754:	56                   	push   %esi
 755:	53                   	push   %ebx
 756:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 759:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 75c:	8b 3d 00 60 00 00    	mov    0x6000,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 762:	8d 70 07             	lea    0x7(%eax),%esi
 765:	c1 ee 03             	shr    $0x3,%esi
 768:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 76b:	85 ff                	test   %edi,%edi
 76d:	0f 84 9d 00 00 00    	je     810 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 773:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 775:	8b 4a 04             	mov    0x4(%edx),%ecx
 778:	39 f1                	cmp    %esi,%ecx
 77a:	73 6a                	jae    7e6 <malloc+0x96>
 77c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 781:	39 de                	cmp    %ebx,%esi
 783:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 786:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 78d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 790:	eb 17                	jmp    7a9 <malloc+0x59>
 792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 798:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 79a:	8b 48 04             	mov    0x4(%eax),%ecx
 79d:	39 f1                	cmp    %esi,%ecx
 79f:	73 4f                	jae    7f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7a1:	8b 3d 00 60 00 00    	mov    0x6000,%edi
 7a7:	89 c2                	mov    %eax,%edx
 7a9:	39 d7                	cmp    %edx,%edi
 7ab:	75 eb                	jne    798 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7ad:	83 ec 0c             	sub    $0xc,%esp
 7b0:	ff 75 e4             	pushl  -0x1c(%ebp)
 7b3:	e8 7d fc ff ff       	call   435 <sbrk>
  if(p == (char*)-1)
 7b8:	83 c4 10             	add    $0x10,%esp
 7bb:	83 f8 ff             	cmp    $0xffffffff,%eax
 7be:	74 1c                	je     7dc <malloc+0x8c>
  hp->s.size = nu;
 7c0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7c3:	83 ec 0c             	sub    $0xc,%esp
 7c6:	83 c0 08             	add    $0x8,%eax
 7c9:	50                   	push   %eax
 7ca:	e8 f1 fe ff ff       	call   6c0 <free>
  return freep;
 7cf:	8b 15 00 60 00 00    	mov    0x6000,%edx
      if((p = morecore(nunits)) == 0)
 7d5:	83 c4 10             	add    $0x10,%esp
 7d8:	85 d2                	test   %edx,%edx
 7da:	75 bc                	jne    798 <malloc+0x48>
        return 0;
  }
}
 7dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7df:	31 c0                	xor    %eax,%eax
}
 7e1:	5b                   	pop    %ebx
 7e2:	5e                   	pop    %esi
 7e3:	5f                   	pop    %edi
 7e4:	5d                   	pop    %ebp
 7e5:	c3                   	ret    
    if(p->s.size >= nunits){
 7e6:	89 d0                	mov    %edx,%eax
 7e8:	89 fa                	mov    %edi,%edx
 7ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7f0:	39 ce                	cmp    %ecx,%esi
 7f2:	74 4c                	je     840 <malloc+0xf0>
        p->s.size -= nunits;
 7f4:	29 f1                	sub    %esi,%ecx
 7f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7fc:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 7ff:	89 15 00 60 00 00    	mov    %edx,0x6000
}
 805:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 808:	83 c0 08             	add    $0x8,%eax
}
 80b:	5b                   	pop    %ebx
 80c:	5e                   	pop    %esi
 80d:	5f                   	pop    %edi
 80e:	5d                   	pop    %ebp
 80f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 810:	c7 05 00 60 00 00 04 	movl   $0x6004,0x6000
 817:	60 00 00 
    base.s.size = 0;
 81a:	bf 04 60 00 00       	mov    $0x6004,%edi
    base.s.ptr = freep = prevp = &base;
 81f:	c7 05 04 60 00 00 04 	movl   $0x6004,0x6004
 826:	60 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 829:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 82b:	c7 05 08 60 00 00 00 	movl   $0x0,0x6008
 832:	00 00 00 
    if(p->s.size >= nunits){
 835:	e9 42 ff ff ff       	jmp    77c <malloc+0x2c>
 83a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 840:	8b 08                	mov    (%eax),%ecx
 842:	89 0a                	mov    %ecx,(%edx)
 844:	eb b9                	jmp    7ff <malloc+0xaf>
