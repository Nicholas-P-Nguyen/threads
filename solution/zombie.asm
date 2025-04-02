
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 ff 02 00 00       	call   315 <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 89 03 00 00       	call   3ad <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 f1 02 00 00       	call   31d <exit>
  2c:	66 90                	xchg   %ax,%ax
  2e:	66 90                	xchg   %ax,%ax

00000030 <strcpy>:
#include "x86.h"
#include "spinlock.h"

char*
strcpy(char *s, const char *t)
{
  30:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  31:	31 c0                	xor    %eax,%eax
{
  33:	89 e5                	mov    %esp,%ebp
  35:	53                   	push   %ebx
  36:	8b 4d 08             	mov    0x8(%ebp),%ecx
  39:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  40:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  44:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  47:	83 c0 01             	add    $0x1,%eax
  4a:	84 d2                	test   %dl,%dl
  4c:	75 f2                	jne    40 <strcpy+0x10>
    ;
  return os;
}
  4e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  51:	89 c8                	mov    %ecx,%eax
  53:	c9                   	leave  
  54:	c3                   	ret    
  55:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	53                   	push   %ebx
  64:	8b 55 08             	mov    0x8(%ebp),%edx
  67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  6a:	0f b6 02             	movzbl (%edx),%eax
  6d:	84 c0                	test   %al,%al
  6f:	75 17                	jne    88 <strcmp+0x28>
  71:	eb 3a                	jmp    ad <strcmp+0x4d>
  73:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  77:	90                   	nop
  78:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  7c:	83 c2 01             	add    $0x1,%edx
  7f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  82:	84 c0                	test   %al,%al
  84:	74 1a                	je     a0 <strcmp+0x40>
    p++, q++;
  86:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  88:	0f b6 19             	movzbl (%ecx),%ebx
  8b:	38 c3                	cmp    %al,%bl
  8d:	74 e9                	je     78 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  8f:	29 d8                	sub    %ebx,%eax
}
  91:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  94:	c9                   	leave  
  95:	c3                   	ret    
  96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  a4:	31 c0                	xor    %eax,%eax
  a6:	29 d8                	sub    %ebx,%eax
}
  a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  ab:	c9                   	leave  
  ac:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  ad:	0f b6 19             	movzbl (%ecx),%ebx
  b0:	31 c0                	xor    %eax,%eax
  b2:	eb db                	jmp    8f <strcmp+0x2f>
  b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bf:	90                   	nop

000000c0 <strlen>:

uint
strlen(const char *s)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
  c6:	80 3a 00             	cmpb   $0x0,(%edx)
  c9:	74 15                	je     e0 <strlen+0x20>
  cb:	31 c0                	xor    %eax,%eax
  cd:	8d 76 00             	lea    0x0(%esi),%esi
  d0:	83 c0 01             	add    $0x1,%eax
  d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  d7:	89 c1                	mov    %eax,%ecx
  d9:	75 f5                	jne    d0 <strlen+0x10>
    ;
  return n;
}
  db:	89 c8                	mov    %ecx,%eax
  dd:	5d                   	pop    %ebp
  de:	c3                   	ret    
  df:	90                   	nop
  for(n = 0; s[n]; n++)
  e0:	31 c9                	xor    %ecx,%ecx
}
  e2:	5d                   	pop    %ebp
  e3:	89 c8                	mov    %ecx,%eax
  e5:	c3                   	ret    
  e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ed:	8d 76 00             	lea    0x0(%esi),%esi

000000f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	57                   	push   %edi
  f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	89 d7                	mov    %edx,%edi
  ff:	fc                   	cld    
 100:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 102:	8b 7d fc             	mov    -0x4(%ebp),%edi
 105:	89 d0                	mov    %edx,%eax
 107:	c9                   	leave  
 108:	c3                   	ret    
 109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000110 <strchr>:

char*
strchr(const char *s, char c)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 11a:	0f b6 10             	movzbl (%eax),%edx
 11d:	84 d2                	test   %dl,%dl
 11f:	75 12                	jne    133 <strchr+0x23>
 121:	eb 1d                	jmp    140 <strchr+0x30>
 123:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 127:	90                   	nop
 128:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 12c:	83 c0 01             	add    $0x1,%eax
 12f:	84 d2                	test   %dl,%dl
 131:	74 0d                	je     140 <strchr+0x30>
    if(*s == c)
 133:	38 d1                	cmp    %dl,%cl
 135:	75 f1                	jne    128 <strchr+0x18>
      return (char*)s;
  return 0;
}
 137:	5d                   	pop    %ebp
 138:	c3                   	ret    
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 140:	31 c0                	xor    %eax,%eax
}
 142:	5d                   	pop    %ebp
 143:	c3                   	ret    
 144:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 14f:	90                   	nop

00000150 <gets>:

char*
gets(char *buf, int max)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 155:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 158:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 159:	31 db                	xor    %ebx,%ebx
{
 15b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 15e:	eb 27                	jmp    187 <gets+0x37>
    cc = read(0, &c, 1);
 160:	83 ec 04             	sub    $0x4,%esp
 163:	6a 01                	push   $0x1
 165:	57                   	push   %edi
 166:	6a 00                	push   $0x0
 168:	e8 c8 01 00 00       	call   335 <read>
    if(cc < 1)
 16d:	83 c4 10             	add    $0x10,%esp
 170:	85 c0                	test   %eax,%eax
 172:	7e 1d                	jle    191 <gets+0x41>
      break;
    buf[i++] = c;
 174:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 178:	8b 55 08             	mov    0x8(%ebp),%edx
 17b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 17f:	3c 0a                	cmp    $0xa,%al
 181:	74 1d                	je     1a0 <gets+0x50>
 183:	3c 0d                	cmp    $0xd,%al
 185:	74 19                	je     1a0 <gets+0x50>
  for(i=0; i+1 < max; ){
 187:	89 de                	mov    %ebx,%esi
 189:	83 c3 01             	add    $0x1,%ebx
 18c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 18f:	7c cf                	jl     160 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 191:	8b 45 08             	mov    0x8(%ebp),%eax
 194:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 198:	8d 65 f4             	lea    -0xc(%ebp),%esp
 19b:	5b                   	pop    %ebx
 19c:	5e                   	pop    %esi
 19d:	5f                   	pop    %edi
 19e:	5d                   	pop    %ebp
 19f:	c3                   	ret    
  buf[i] = '\0';
 1a0:	8b 45 08             	mov    0x8(%ebp),%eax
 1a3:	89 de                	mov    %ebx,%esi
 1a5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ac:	5b                   	pop    %ebx
 1ad:	5e                   	pop    %esi
 1ae:	5f                   	pop    %edi
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    
 1b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bf:	90                   	nop

000001c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	56                   	push   %esi
 1c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c5:	83 ec 08             	sub    $0x8,%esp
 1c8:	6a 00                	push   $0x0
 1ca:	ff 75 08             	pushl  0x8(%ebp)
 1cd:	e8 8b 01 00 00       	call   35d <open>
  if(fd < 0)
 1d2:	83 c4 10             	add    $0x10,%esp
 1d5:	85 c0                	test   %eax,%eax
 1d7:	78 27                	js     200 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1d9:	83 ec 08             	sub    $0x8,%esp
 1dc:	ff 75 0c             	pushl  0xc(%ebp)
 1df:	89 c3                	mov    %eax,%ebx
 1e1:	50                   	push   %eax
 1e2:	e8 8e 01 00 00       	call   375 <fstat>
  close(fd);
 1e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1ea:	89 c6                	mov    %eax,%esi
  close(fd);
 1ec:	e8 54 01 00 00       	call   345 <close>
  return r;
 1f1:	83 c4 10             	add    $0x10,%esp
}
 1f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1f7:	89 f0                	mov    %esi,%eax
 1f9:	5b                   	pop    %ebx
 1fa:	5e                   	pop    %esi
 1fb:	5d                   	pop    %ebp
 1fc:	c3                   	ret    
 1fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 200:	be ff ff ff ff       	mov    $0xffffffff,%esi
 205:	eb ed                	jmp    1f4 <stat+0x34>
 207:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20e:	66 90                	xchg   %ax,%ax

00000210 <atoi>:

int
atoi(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 217:	0f be 02             	movsbl (%edx),%eax
 21a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 21d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 220:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 225:	77 1e                	ja     245 <atoi+0x35>
 227:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 22e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 230:	83 c2 01             	add    $0x1,%edx
 233:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 236:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 23a:	0f be 02             	movsbl (%edx),%eax
 23d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 240:	80 fb 09             	cmp    $0x9,%bl
 243:	76 eb                	jbe    230 <atoi+0x20>
  return n;
}
 245:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 248:	89 c8                	mov    %ecx,%eax
 24a:	c9                   	leave  
 24b:	c3                   	ret    
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000250 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	8b 45 10             	mov    0x10(%ebp),%eax
 257:	8b 55 08             	mov    0x8(%ebp),%edx
 25a:	56                   	push   %esi
 25b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 25e:	85 c0                	test   %eax,%eax
 260:	7e 13                	jle    275 <memmove+0x25>
 262:	01 d0                	add    %edx,%eax
  dst = vdst;
 264:	89 d7                	mov    %edx,%edi
 266:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 270:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 271:	39 f8                	cmp    %edi,%eax
 273:	75 fb                	jne    270 <memmove+0x20>
  return vdst;
}
 275:	5e                   	pop    %esi
 276:	89 d0                	mov    %edx,%eax
 278:	5f                   	pop    %edi
 279:	5d                   	pop    %ebp
 27a:	c3                   	ret    
 27b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <thread_create>:

int
thread_create(void (*fn)(void *), void *arg)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	53                   	push   %ebx
 284:	83 ec 10             	sub    $0x10,%esp
  void *mem = malloc(4096 * 2);
 287:	68 00 20 00 00       	push   $0x2000
 28c:	e8 2f 04 00 00       	call   6c0 <malloc>
  if(mem == 0)
 291:	83 c4 10             	add    $0x10,%esp
 294:	85 c0                	test   %eax,%eax
 296:	74 32                	je     2ca <thread_create+0x4a>
 298:	89 c3                	mov    %eax,%ebx
    return -1;
  
  char *p = (char *)mem;
  while ((uint)p % 4096 != 0) {
 29a:	a9 ff 0f 00 00       	test   $0xfff,%eax
 29f:	74 12                	je     2b3 <thread_create+0x33>
 2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    p++;
 2a8:	83 c3 01             	add    $0x1,%ebx
  while ((uint)p % 4096 != 0) {
 2ab:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
 2b1:	75 f5                	jne    2a8 <thread_create+0x28>
    printf(1, "LOLOLOL %p\n", fn);
    free(stack);
    return -1;
  }
  
  int tid = clone(stack);
 2b3:	83 ec 0c             	sub    $0xc,%esp
 2b6:	53                   	push   %ebx
 2b7:	e8 01 01 00 00       	call   3bd <clone>
  if(tid < 0){
 2bc:	83 c4 10             	add    $0x10,%esp
 2bf:	85 c0                	test   %eax,%eax
 2c1:	78 0e                	js     2d1 <thread_create+0x51>
    free(stack);
    return -1;
  }
  

  if(tid == 0){
 2c3:	74 1f                	je     2e4 <thread_create+0x64>
    exit();
  }
  
  // Parent returns the new thread's id.
  return tid;
}
 2c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2c8:	c9                   	leave  
 2c9:	c3                   	ret    
    return -1;
 2ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2cf:	eb f4                	jmp    2c5 <thread_create+0x45>
    free(stack);
 2d1:	83 ec 0c             	sub    $0xc,%esp
 2d4:	53                   	push   %ebx
 2d5:	e8 56 03 00 00       	call   630 <free>
    return -1;
 2da:	83 c4 10             	add    $0x10,%esp
 2dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2e2:	eb e1                	jmp    2c5 <thread_create+0x45>
    printf(1, "Entering thread function at %p\n", fn);
 2e4:	50                   	push   %eax
 2e5:	ff 75 08             	pushl  0x8(%ebp)
 2e8:	68 b8 07 00 00       	push   $0x7b8
 2ed:	6a 01                	push   $0x1
 2ef:	e8 9c 01 00 00       	call   490 <printf>
    fn(arg);
 2f4:	5a                   	pop    %edx
 2f5:	ff 75 0c             	pushl  0xc(%ebp)
 2f8:	ff 55 08             	call   *0x8(%ebp)
    free(stack);
 2fb:	89 1c 24             	mov    %ebx,(%esp)
 2fe:	e8 2d 03 00 00       	call   630 <free>
    exit();
 303:	e8 15 00 00 00       	call   31d <exit>
 308:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop

00000310 <thread_join>:

int
thread_join(void)
{
  return join();
 310:	e9 c0 00 00 00       	jmp    3d5 <join>

00000315 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 315:	b8 01 00 00 00       	mov    $0x1,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <exit>:
SYSCALL(exit)
 31d:	b8 02 00 00 00       	mov    $0x2,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <wait>:
SYSCALL(wait)
 325:	b8 03 00 00 00       	mov    $0x3,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <pipe>:
SYSCALL(pipe)
 32d:	b8 04 00 00 00       	mov    $0x4,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <read>:
SYSCALL(read)
 335:	b8 05 00 00 00       	mov    $0x5,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <write>:
SYSCALL(write)
 33d:	b8 10 00 00 00       	mov    $0x10,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <close>:
SYSCALL(close)
 345:	b8 15 00 00 00       	mov    $0x15,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <kill>:
SYSCALL(kill)
 34d:	b8 06 00 00 00       	mov    $0x6,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <exec>:
SYSCALL(exec)
 355:	b8 07 00 00 00       	mov    $0x7,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <open>:
SYSCALL(open)
 35d:	b8 0f 00 00 00       	mov    $0xf,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <mknod>:
SYSCALL(mknod)
 365:	b8 11 00 00 00       	mov    $0x11,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <unlink>:
SYSCALL(unlink)
 36d:	b8 12 00 00 00       	mov    $0x12,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <fstat>:
SYSCALL(fstat)
 375:	b8 08 00 00 00       	mov    $0x8,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <link>:
SYSCALL(link)
 37d:	b8 13 00 00 00       	mov    $0x13,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <mkdir>:
SYSCALL(mkdir)
 385:	b8 14 00 00 00       	mov    $0x14,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <chdir>:
SYSCALL(chdir)
 38d:	b8 09 00 00 00       	mov    $0x9,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <dup>:
SYSCALL(dup)
 395:	b8 0a 00 00 00       	mov    $0xa,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <getpid>:
SYSCALL(getpid)
 39d:	b8 0b 00 00 00       	mov    $0xb,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <sbrk>:
SYSCALL(sbrk)
 3a5:	b8 0c 00 00 00       	mov    $0xc,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <sleep>:
SYSCALL(sleep)
 3ad:	b8 0d 00 00 00       	mov    $0xd,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <uptime>:
SYSCALL(uptime)
 3b5:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <clone>:
SYSCALL(clone)
 3bd:	b8 16 00 00 00       	mov    $0x16,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <lock>:
SYSCALL(lock)
 3c5:	b8 17 00 00 00       	mov    $0x17,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <unlock>:
SYSCALL(unlock)
 3cd:	b8 18 00 00 00       	mov    $0x18,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <join>:
SYSCALL(join)
 3d5:	b8 19 00 00 00       	mov    $0x19,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    
 3dd:	66 90                	xchg   %ax,%ax
 3df:	90                   	nop

000003e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	83 ec 3c             	sub    $0x3c,%esp
 3e9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3ec:	89 d1                	mov    %edx,%ecx
{
 3ee:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 3f1:	85 d2                	test   %edx,%edx
 3f3:	0f 89 7f 00 00 00    	jns    478 <printint+0x98>
 3f9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3fd:	74 79                	je     478 <printint+0x98>
    neg = 1;
 3ff:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 406:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 408:	31 db                	xor    %ebx,%ebx
 40a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 40d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 410:	89 c8                	mov    %ecx,%eax
 412:	31 d2                	xor    %edx,%edx
 414:	89 cf                	mov    %ecx,%edi
 416:	f7 75 c4             	divl   -0x3c(%ebp)
 419:	0f b6 92 38 08 00 00 	movzbl 0x838(%edx),%edx
 420:	89 45 c0             	mov    %eax,-0x40(%ebp)
 423:	89 d8                	mov    %ebx,%eax
 425:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 428:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 42b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 42e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 431:	76 dd                	jbe    410 <printint+0x30>
  if(neg)
 433:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 436:	85 c9                	test   %ecx,%ecx
 438:	74 0c                	je     446 <printint+0x66>
    buf[i++] = '-';
 43a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 43f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 441:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 446:	8b 7d b8             	mov    -0x48(%ebp),%edi
 449:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 44d:	eb 07                	jmp    456 <printint+0x76>
 44f:	90                   	nop
    putc(fd, buf[i]);
 450:	0f b6 13             	movzbl (%ebx),%edx
 453:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 456:	83 ec 04             	sub    $0x4,%esp
 459:	88 55 d7             	mov    %dl,-0x29(%ebp)
 45c:	6a 01                	push   $0x1
 45e:	56                   	push   %esi
 45f:	57                   	push   %edi
 460:	e8 d8 fe ff ff       	call   33d <write>
  while(--i >= 0)
 465:	83 c4 10             	add    $0x10,%esp
 468:	39 de                	cmp    %ebx,%esi
 46a:	75 e4                	jne    450 <printint+0x70>
}
 46c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 46f:	5b                   	pop    %ebx
 470:	5e                   	pop    %esi
 471:	5f                   	pop    %edi
 472:	5d                   	pop    %ebp
 473:	c3                   	ret    
 474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 478:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 47f:	eb 87                	jmp    408 <printint+0x28>
 481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 488:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 48f:	90                   	nop

00000490 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
 495:	53                   	push   %ebx
 496:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 499:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 49c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 49f:	0f b6 13             	movzbl (%ebx),%edx
 4a2:	84 d2                	test   %dl,%dl
 4a4:	74 6a                	je     510 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 4a6:	8d 45 10             	lea    0x10(%ebp),%eax
 4a9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4ac:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4af:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 4b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4b4:	eb 36                	jmp    4ec <printf+0x5c>
 4b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
 4c0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4c3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 4c8:	83 f8 25             	cmp    $0x25,%eax
 4cb:	74 15                	je     4e2 <printf+0x52>
  write(fd, &c, 1);
 4cd:	83 ec 04             	sub    $0x4,%esp
 4d0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4d3:	6a 01                	push   $0x1
 4d5:	57                   	push   %edi
 4d6:	56                   	push   %esi
 4d7:	e8 61 fe ff ff       	call   33d <write>
 4dc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 4df:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 4e2:	0f b6 13             	movzbl (%ebx),%edx
 4e5:	83 c3 01             	add    $0x1,%ebx
 4e8:	84 d2                	test   %dl,%dl
 4ea:	74 24                	je     510 <printf+0x80>
    c = fmt[i] & 0xff;
 4ec:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 4ef:	85 c9                	test   %ecx,%ecx
 4f1:	74 cd                	je     4c0 <printf+0x30>
      }
    } else if(state == '%'){
 4f3:	83 f9 25             	cmp    $0x25,%ecx
 4f6:	75 ea                	jne    4e2 <printf+0x52>
      if(c == 'd'){
 4f8:	83 f8 25             	cmp    $0x25,%eax
 4fb:	0f 84 07 01 00 00    	je     608 <printf+0x178>
 501:	83 e8 63             	sub    $0x63,%eax
 504:	83 f8 15             	cmp    $0x15,%eax
 507:	77 17                	ja     520 <printf+0x90>
 509:	ff 24 85 e0 07 00 00 	jmp    *0x7e0(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 510:	8d 65 f4             	lea    -0xc(%ebp),%esp
 513:	5b                   	pop    %ebx
 514:	5e                   	pop    %esi
 515:	5f                   	pop    %edi
 516:	5d                   	pop    %ebp
 517:	c3                   	ret    
 518:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51f:	90                   	nop
  write(fd, &c, 1);
 520:	83 ec 04             	sub    $0x4,%esp
 523:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 526:	6a 01                	push   $0x1
 528:	57                   	push   %edi
 529:	56                   	push   %esi
 52a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 52e:	e8 0a fe ff ff       	call   33d <write>
        putc(fd, c);
 533:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 537:	83 c4 0c             	add    $0xc,%esp
 53a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 53d:	6a 01                	push   $0x1
 53f:	57                   	push   %edi
 540:	56                   	push   %esi
 541:	e8 f7 fd ff ff       	call   33d <write>
        putc(fd, c);
 546:	83 c4 10             	add    $0x10,%esp
      state = 0;
 549:	31 c9                	xor    %ecx,%ecx
 54b:	eb 95                	jmp    4e2 <printf+0x52>
 54d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 550:	83 ec 0c             	sub    $0xc,%esp
 553:	b9 10 00 00 00       	mov    $0x10,%ecx
 558:	6a 00                	push   $0x0
 55a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 55d:	8b 10                	mov    (%eax),%edx
 55f:	89 f0                	mov    %esi,%eax
 561:	e8 7a fe ff ff       	call   3e0 <printint>
        ap++;
 566:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 56a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 56d:	31 c9                	xor    %ecx,%ecx
 56f:	e9 6e ff ff ff       	jmp    4e2 <printf+0x52>
 574:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 578:	8b 45 d0             	mov    -0x30(%ebp),%eax
 57b:	8b 10                	mov    (%eax),%edx
        ap++;
 57d:	83 c0 04             	add    $0x4,%eax
 580:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 583:	85 d2                	test   %edx,%edx
 585:	0f 84 8d 00 00 00    	je     618 <printf+0x188>
        while(*s != 0){
 58b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 58e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 590:	84 c0                	test   %al,%al
 592:	0f 84 4a ff ff ff    	je     4e2 <printf+0x52>
 598:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 59b:	89 d3                	mov    %edx,%ebx
 59d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5a0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5a3:	83 c3 01             	add    $0x1,%ebx
 5a6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5a9:	6a 01                	push   $0x1
 5ab:	57                   	push   %edi
 5ac:	56                   	push   %esi
 5ad:	e8 8b fd ff ff       	call   33d <write>
        while(*s != 0){
 5b2:	0f b6 03             	movzbl (%ebx),%eax
 5b5:	83 c4 10             	add    $0x10,%esp
 5b8:	84 c0                	test   %al,%al
 5ba:	75 e4                	jne    5a0 <printf+0x110>
      state = 0;
 5bc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 5bf:	31 c9                	xor    %ecx,%ecx
 5c1:	e9 1c ff ff ff       	jmp    4e2 <printf+0x52>
 5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5d0:	83 ec 0c             	sub    $0xc,%esp
 5d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5d8:	6a 01                	push   $0x1
 5da:	e9 7b ff ff ff       	jmp    55a <printf+0xca>
 5df:	90                   	nop
        putc(fd, *ap);
 5e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 5e3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5e6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 5e8:	6a 01                	push   $0x1
 5ea:	57                   	push   %edi
 5eb:	56                   	push   %esi
        putc(fd, *ap);
 5ec:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5ef:	e8 49 fd ff ff       	call   33d <write>
        ap++;
 5f4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5f8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5fb:	31 c9                	xor    %ecx,%ecx
 5fd:	e9 e0 fe ff ff       	jmp    4e2 <printf+0x52>
 602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 608:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 60b:	83 ec 04             	sub    $0x4,%esp
 60e:	e9 2a ff ff ff       	jmp    53d <printf+0xad>
 613:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 617:	90                   	nop
          s = "(null)";
 618:	ba d8 07 00 00       	mov    $0x7d8,%edx
        while(*s != 0){
 61d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 620:	b8 28 00 00 00       	mov    $0x28,%eax
 625:	89 d3                	mov    %edx,%ebx
 627:	e9 74 ff ff ff       	jmp    5a0 <printf+0x110>
 62c:	66 90                	xchg   %ax,%ax
 62e:	66 90                	xchg   %ax,%ax

00000630 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 630:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 631:	a1 1c 0b 00 00       	mov    0xb1c,%eax
{
 636:	89 e5                	mov    %esp,%ebp
 638:	57                   	push   %edi
 639:	56                   	push   %esi
 63a:	53                   	push   %ebx
 63b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 63e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 648:	89 c2                	mov    %eax,%edx
 64a:	8b 00                	mov    (%eax),%eax
 64c:	39 ca                	cmp    %ecx,%edx
 64e:	73 30                	jae    680 <free+0x50>
 650:	39 c1                	cmp    %eax,%ecx
 652:	72 04                	jb     658 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 654:	39 c2                	cmp    %eax,%edx
 656:	72 f0                	jb     648 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 658:	8b 73 fc             	mov    -0x4(%ebx),%esi
 65b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 65e:	39 f8                	cmp    %edi,%eax
 660:	74 30                	je     692 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 662:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 665:	8b 42 04             	mov    0x4(%edx),%eax
 668:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 66b:	39 f1                	cmp    %esi,%ecx
 66d:	74 3a                	je     6a9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 66f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 671:	5b                   	pop    %ebx
  freep = p;
 672:	89 15 1c 0b 00 00    	mov    %edx,0xb1c
}
 678:	5e                   	pop    %esi
 679:	5f                   	pop    %edi
 67a:	5d                   	pop    %ebp
 67b:	c3                   	ret    
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 680:	39 c2                	cmp    %eax,%edx
 682:	72 c4                	jb     648 <free+0x18>
 684:	39 c1                	cmp    %eax,%ecx
 686:	73 c0                	jae    648 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 688:	8b 73 fc             	mov    -0x4(%ebx),%esi
 68b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 68e:	39 f8                	cmp    %edi,%eax
 690:	75 d0                	jne    662 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 692:	03 70 04             	add    0x4(%eax),%esi
 695:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 698:	8b 02                	mov    (%edx),%eax
 69a:	8b 00                	mov    (%eax),%eax
 69c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 69f:	8b 42 04             	mov    0x4(%edx),%eax
 6a2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6a5:	39 f1                	cmp    %esi,%ecx
 6a7:	75 c6                	jne    66f <free+0x3f>
    p->s.size += bp->s.size;
 6a9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 6ac:	89 15 1c 0b 00 00    	mov    %edx,0xb1c
    p->s.size += bp->s.size;
 6b2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 6b5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6b8:	89 0a                	mov    %ecx,(%edx)
}
 6ba:	5b                   	pop    %ebx
 6bb:	5e                   	pop    %esi
 6bc:	5f                   	pop    %edi
 6bd:	5d                   	pop    %ebp
 6be:	c3                   	ret    
 6bf:	90                   	nop

000006c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6cc:	8b 3d 1c 0b 00 00    	mov    0xb1c,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6d2:	8d 70 07             	lea    0x7(%eax),%esi
 6d5:	c1 ee 03             	shr    $0x3,%esi
 6d8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 6db:	85 ff                	test   %edi,%edi
 6dd:	0f 84 9d 00 00 00    	je     780 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6e3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 6e5:	8b 4a 04             	mov    0x4(%edx),%ecx
 6e8:	39 f1                	cmp    %esi,%ecx
 6ea:	73 6a                	jae    756 <malloc+0x96>
 6ec:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6f1:	39 de                	cmp    %ebx,%esi
 6f3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 6f6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 700:	eb 17                	jmp    719 <malloc+0x59>
 702:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 708:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 70a:	8b 48 04             	mov    0x4(%eax),%ecx
 70d:	39 f1                	cmp    %esi,%ecx
 70f:	73 4f                	jae    760 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 711:	8b 3d 1c 0b 00 00    	mov    0xb1c,%edi
 717:	89 c2                	mov    %eax,%edx
 719:	39 d7                	cmp    %edx,%edi
 71b:	75 eb                	jne    708 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 71d:	83 ec 0c             	sub    $0xc,%esp
 720:	ff 75 e4             	pushl  -0x1c(%ebp)
 723:	e8 7d fc ff ff       	call   3a5 <sbrk>
  if(p == (char*)-1)
 728:	83 c4 10             	add    $0x10,%esp
 72b:	83 f8 ff             	cmp    $0xffffffff,%eax
 72e:	74 1c                	je     74c <malloc+0x8c>
  hp->s.size = nu;
 730:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 733:	83 ec 0c             	sub    $0xc,%esp
 736:	83 c0 08             	add    $0x8,%eax
 739:	50                   	push   %eax
 73a:	e8 f1 fe ff ff       	call   630 <free>
  return freep;
 73f:	8b 15 1c 0b 00 00    	mov    0xb1c,%edx
      if((p = morecore(nunits)) == 0)
 745:	83 c4 10             	add    $0x10,%esp
 748:	85 d2                	test   %edx,%edx
 74a:	75 bc                	jne    708 <malloc+0x48>
        return 0;
  }
}
 74c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 74f:	31 c0                	xor    %eax,%eax
}
 751:	5b                   	pop    %ebx
 752:	5e                   	pop    %esi
 753:	5f                   	pop    %edi
 754:	5d                   	pop    %ebp
 755:	c3                   	ret    
    if(p->s.size >= nunits){
 756:	89 d0                	mov    %edx,%eax
 758:	89 fa                	mov    %edi,%edx
 75a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 760:	39 ce                	cmp    %ecx,%esi
 762:	74 4c                	je     7b0 <malloc+0xf0>
        p->s.size -= nunits;
 764:	29 f1                	sub    %esi,%ecx
 766:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 769:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 76c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 76f:	89 15 1c 0b 00 00    	mov    %edx,0xb1c
}
 775:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 778:	83 c0 08             	add    $0x8,%eax
}
 77b:	5b                   	pop    %ebx
 77c:	5e                   	pop    %esi
 77d:	5f                   	pop    %edi
 77e:	5d                   	pop    %ebp
 77f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 780:	c7 05 1c 0b 00 00 20 	movl   $0xb20,0xb1c
 787:	0b 00 00 
    base.s.size = 0;
 78a:	bf 20 0b 00 00       	mov    $0xb20,%edi
    base.s.ptr = freep = prevp = &base;
 78f:	c7 05 20 0b 00 00 20 	movl   $0xb20,0xb20
 796:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 799:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 79b:	c7 05 24 0b 00 00 00 	movl   $0x0,0xb24
 7a2:	00 00 00 
    if(p->s.size >= nunits){
 7a5:	e9 42 ff ff ff       	jmp    6ec <malloc+0x2c>
 7aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 7b0:	8b 08                	mov    (%eax),%ecx
 7b2:	89 0a                	mov    %ecx,(%edx)
 7b4:	eb b9                	jmp    76f <malloc+0xaf>
