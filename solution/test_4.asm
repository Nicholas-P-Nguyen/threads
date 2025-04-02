
_test_4:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  shared = (int)arg;
}

int
main(int argc, char* argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp

    ASSERT(shared == 0xdead, "if this fails, something has gone dramatically wrong");
  11:	81 3d 94 0c 00 00 ad 	cmpl   $0xdead,0xc94
  18:	de 00 00 
  1b:	74 3d                	je     5a <main+0x5a>
  1d:	83 ec 0c             	sub    $0xc,%esp
  20:	6a 10                	push   $0x10
  22:	68 68 08 00 00       	push   $0x868
  27:	68 71 08 00 00       	push   $0x871
  2c:	68 7b 08 00 00       	push   $0x87b
  31:	6a 01                	push   $0x1
  33:	e8 08 05 00 00       	call   540 <printf>
  38:	83 c4 18             	add    $0x18,%esp
  3b:	68 9c 08 00 00       	push   $0x89c
    thread_create(&cb, (void*)0xbeef);
    thread_join();
    ASSERT(shared == 0xbeef, "expected join to wait until child thread assigns `shared` ");
  40:	6a 01                	push   $0x1
  42:	e8 f9 04 00 00       	call   540 <printf>
  47:	5a                   	pop    %edx
  48:	59                   	pop    %ecx
  49:	68 85 08 00 00       	push   $0x885
  4e:	6a 01                	push   $0x1
  50:	e8 eb 04 00 00       	call   540 <printf>
  55:	e8 73 03 00 00       	call   3cd <exit>
    thread_create(&cb, (void*)0xbeef);
  5a:	50                   	push   %eax
  5b:	50                   	push   %eax
  5c:	68 ef be 00 00       	push   $0xbeef
  61:	68 d0 00 00 00       	push   $0xd0
  66:	e8 c5 02 00 00       	call   330 <thread_create>
    thread_join();
  6b:	e8 50 03 00 00       	call   3c0 <thread_join>
    ASSERT(shared == 0xbeef, "expected join to wait until child thread assigns `shared` ");
  70:	83 c4 10             	add    $0x10,%esp
  73:	81 3d 94 0c 00 00 ef 	cmpl   $0xbeef,0xc94
  7a:	be 00 00 
  7d:	74 25                	je     a4 <main+0xa4>
  7f:	83 ec 0c             	sub    $0xc,%esp
  82:	6a 13                	push   $0x13
  84:	68 68 08 00 00       	push   $0x868
  89:	68 71 08 00 00       	push   $0x871
  8e:	68 7b 08 00 00       	push   $0x87b
  93:	6a 01                	push   $0x1
  95:	e8 a6 04 00 00       	call   540 <printf>
  9a:	83 c4 18             	add    $0x18,%esp
  9d:	68 d4 08 00 00       	push   $0x8d4
  a2:	eb 9c                	jmp    40 <main+0x40>
                        printf(1, "\n");


#define SUCCESS_MSG "TEST PASSED"
static void test_passed() {
    PRINTF("%s", SUCCESS_MSG);
  a4:	50                   	push   %eax
  a5:	68 71 08 00 00       	push   $0x871
  aa:	68 87 08 00 00       	push   $0x887
  af:	6a 01                	push   $0x1
  b1:	e8 8a 04 00 00       	call   540 <printf>
  b6:	83 c4 0c             	add    $0xc,%esp
  b9:	68 8c 08 00 00       	push   $0x88c
  be:	68 98 08 00 00       	push   $0x898
  c3:	e9 78 ff ff ff       	jmp    40 <main+0x40>
  c8:	66 90                	xchg   %ax,%ax
  ca:	66 90                	xchg   %ax,%ax
  cc:	66 90                	xchg   %ax,%ax
  ce:	66 90                	xchg   %ax,%ax

000000d0 <cb>:
static void cb(void* arg) {
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  shared = (int)arg;
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
}
  d6:	5d                   	pop    %ebp
  shared = (int)arg;
  d7:	a3 94 0c 00 00       	mov    %eax,0xc94
}
  dc:	c3                   	ret    
  dd:	66 90                	xchg   %ax,%ax
  df:	90                   	nop

000000e0 <strcpy>:
#include "x86.h"
#include "spinlock.h"

char*
strcpy(char *s, const char *t)
{
  e0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  e1:	31 c0                	xor    %eax,%eax
{
  e3:	89 e5                	mov    %esp,%ebp
  e5:	53                   	push   %ebx
  e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  e9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  f0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  f4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  f7:	83 c0 01             	add    $0x1,%eax
  fa:	84 d2                	test   %dl,%dl
  fc:	75 f2                	jne    f0 <strcpy+0x10>
    ;
  return os;
}
  fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 101:	89 c8                	mov    %ecx,%eax
 103:	c9                   	leave  
 104:	c3                   	ret    
 105:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000110 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	53                   	push   %ebx
 114:	8b 55 08             	mov    0x8(%ebp),%edx
 117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 11a:	0f b6 02             	movzbl (%edx),%eax
 11d:	84 c0                	test   %al,%al
 11f:	75 17                	jne    138 <strcmp+0x28>
 121:	eb 3a                	jmp    15d <strcmp+0x4d>
 123:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 127:	90                   	nop
 128:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 12c:	83 c2 01             	add    $0x1,%edx
 12f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 132:	84 c0                	test   %al,%al
 134:	74 1a                	je     150 <strcmp+0x40>
    p++, q++;
 136:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 138:	0f b6 19             	movzbl (%ecx),%ebx
 13b:	38 c3                	cmp    %al,%bl
 13d:	74 e9                	je     128 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 13f:	29 d8                	sub    %ebx,%eax
}
 141:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 144:	c9                   	leave  
 145:	c3                   	ret    
 146:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 150:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 154:	31 c0                	xor    %eax,%eax
 156:	29 d8                	sub    %ebx,%eax
}
 158:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 15b:	c9                   	leave  
 15c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 15d:	0f b6 19             	movzbl (%ecx),%ebx
 160:	31 c0                	xor    %eax,%eax
 162:	eb db                	jmp    13f <strcmp+0x2f>
 164:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 16f:	90                   	nop

00000170 <strlen>:

uint
strlen(const char *s)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 176:	80 3a 00             	cmpb   $0x0,(%edx)
 179:	74 15                	je     190 <strlen+0x20>
 17b:	31 c0                	xor    %eax,%eax
 17d:	8d 76 00             	lea    0x0(%esi),%esi
 180:	83 c0 01             	add    $0x1,%eax
 183:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 187:	89 c1                	mov    %eax,%ecx
 189:	75 f5                	jne    180 <strlen+0x10>
    ;
  return n;
}
 18b:	89 c8                	mov    %ecx,%eax
 18d:	5d                   	pop    %ebp
 18e:	c3                   	ret    
 18f:	90                   	nop
  for(n = 0; s[n]; n++)
 190:	31 c9                	xor    %ecx,%ecx
}
 192:	5d                   	pop    %ebp
 193:	89 c8                	mov    %ecx,%eax
 195:	c3                   	ret    
 196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19d:	8d 76 00             	lea    0x0(%esi),%esi

000001a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ad:	89 d7                	mov    %edx,%edi
 1af:	fc                   	cld    
 1b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1b2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1b5:	89 d0                	mov    %edx,%eax
 1b7:	c9                   	leave  
 1b8:	c3                   	ret    
 1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <strchr>:

char*
strchr(const char *s, char c)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
 1c6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1ca:	0f b6 10             	movzbl (%eax),%edx
 1cd:	84 d2                	test   %dl,%dl
 1cf:	75 12                	jne    1e3 <strchr+0x23>
 1d1:	eb 1d                	jmp    1f0 <strchr+0x30>
 1d3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1d7:	90                   	nop
 1d8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	84 d2                	test   %dl,%dl
 1e1:	74 0d                	je     1f0 <strchr+0x30>
    if(*s == c)
 1e3:	38 d1                	cmp    %dl,%cl
 1e5:	75 f1                	jne    1d8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret    
 1e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 1f0:	31 c0                	xor    %eax,%eax
}
 1f2:	5d                   	pop    %ebp
 1f3:	c3                   	ret    
 1f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1ff:	90                   	nop

00000200 <gets>:

char*
gets(char *buf, int max)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 205:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 208:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 209:	31 db                	xor    %ebx,%ebx
{
 20b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 20e:	eb 27                	jmp    237 <gets+0x37>
    cc = read(0, &c, 1);
 210:	83 ec 04             	sub    $0x4,%esp
 213:	6a 01                	push   $0x1
 215:	57                   	push   %edi
 216:	6a 00                	push   $0x0
 218:	e8 c8 01 00 00       	call   3e5 <read>
    if(cc < 1)
 21d:	83 c4 10             	add    $0x10,%esp
 220:	85 c0                	test   %eax,%eax
 222:	7e 1d                	jle    241 <gets+0x41>
      break;
    buf[i++] = c;
 224:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 228:	8b 55 08             	mov    0x8(%ebp),%edx
 22b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 22f:	3c 0a                	cmp    $0xa,%al
 231:	74 1d                	je     250 <gets+0x50>
 233:	3c 0d                	cmp    $0xd,%al
 235:	74 19                	je     250 <gets+0x50>
  for(i=0; i+1 < max; ){
 237:	89 de                	mov    %ebx,%esi
 239:	83 c3 01             	add    $0x1,%ebx
 23c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 23f:	7c cf                	jl     210 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 241:	8b 45 08             	mov    0x8(%ebp),%eax
 244:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 248:	8d 65 f4             	lea    -0xc(%ebp),%esp
 24b:	5b                   	pop    %ebx
 24c:	5e                   	pop    %esi
 24d:	5f                   	pop    %edi
 24e:	5d                   	pop    %ebp
 24f:	c3                   	ret    
  buf[i] = '\0';
 250:	8b 45 08             	mov    0x8(%ebp),%eax
 253:	89 de                	mov    %ebx,%esi
 255:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 259:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25c:	5b                   	pop    %ebx
 25d:	5e                   	pop    %esi
 25e:	5f                   	pop    %edi
 25f:	5d                   	pop    %ebp
 260:	c3                   	ret    
 261:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 268:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26f:	90                   	nop

00000270 <stat>:

int
stat(const char *n, struct stat *st)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 275:	83 ec 08             	sub    $0x8,%esp
 278:	6a 00                	push   $0x0
 27a:	ff 75 08             	pushl  0x8(%ebp)
 27d:	e8 8b 01 00 00       	call   40d <open>
  if(fd < 0)
 282:	83 c4 10             	add    $0x10,%esp
 285:	85 c0                	test   %eax,%eax
 287:	78 27                	js     2b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 289:	83 ec 08             	sub    $0x8,%esp
 28c:	ff 75 0c             	pushl  0xc(%ebp)
 28f:	89 c3                	mov    %eax,%ebx
 291:	50                   	push   %eax
 292:	e8 8e 01 00 00       	call   425 <fstat>
  close(fd);
 297:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 29a:	89 c6                	mov    %eax,%esi
  close(fd);
 29c:	e8 54 01 00 00       	call   3f5 <close>
  return r;
 2a1:	83 c4 10             	add    $0x10,%esp
}
 2a4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2a7:	89 f0                	mov    %esi,%eax
 2a9:	5b                   	pop    %ebx
 2aa:	5e                   	pop    %esi
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2b0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2b5:	eb ed                	jmp    2a4 <stat+0x34>
 2b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2be:	66 90                	xchg   %ax,%ax

000002c0 <atoi>:

int
atoi(const char *s)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c7:	0f be 02             	movsbl (%edx),%eax
 2ca:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2cd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2d0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2d5:	77 1e                	ja     2f5 <atoi+0x35>
 2d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2de:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2e0:	83 c2 01             	add    $0x1,%edx
 2e3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2e6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2ea:	0f be 02             	movsbl (%edx),%eax
 2ed:	8d 58 d0             	lea    -0x30(%eax),%ebx
 2f0:	80 fb 09             	cmp    $0x9,%bl
 2f3:	76 eb                	jbe    2e0 <atoi+0x20>
  return n;
}
 2f5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f8:	89 c8                	mov    %ecx,%eax
 2fa:	c9                   	leave  
 2fb:	c3                   	ret    
 2fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000300 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	8b 45 10             	mov    0x10(%ebp),%eax
 307:	8b 55 08             	mov    0x8(%ebp),%edx
 30a:	56                   	push   %esi
 30b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 30e:	85 c0                	test   %eax,%eax
 310:	7e 13                	jle    325 <memmove+0x25>
 312:	01 d0                	add    %edx,%eax
  dst = vdst;
 314:	89 d7                	mov    %edx,%edi
 316:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 320:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 321:	39 f8                	cmp    %edi,%eax
 323:	75 fb                	jne    320 <memmove+0x20>
  return vdst;
}
 325:	5e                   	pop    %esi
 326:	89 d0                	mov    %edx,%eax
 328:	5f                   	pop    %edi
 329:	5d                   	pop    %ebp
 32a:	c3                   	ret    
 32b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 32f:	90                   	nop

00000330 <thread_create>:

int
thread_create(void (*fn)(void *), void *arg)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	53                   	push   %ebx
 334:	83 ec 10             	sub    $0x10,%esp
  void *mem = malloc(4096 * 2);
 337:	68 00 20 00 00       	push   $0x2000
 33c:	e8 2f 04 00 00       	call   770 <malloc>
  if(mem == 0)
 341:	83 c4 10             	add    $0x10,%esp
 344:	85 c0                	test   %eax,%eax
 346:	74 32                	je     37a <thread_create+0x4a>
 348:	89 c3                	mov    %eax,%ebx
    return -1;
  
  char *p = (char *)mem;
  while ((uint)p % 4096 != 0) {
 34a:	a9 ff 0f 00 00       	test   $0xfff,%eax
 34f:	74 12                	je     363 <thread_create+0x33>
 351:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    p++;
 358:	83 c3 01             	add    $0x1,%ebx
  while ((uint)p % 4096 != 0) {
 35b:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
 361:	75 f5                	jne    358 <thread_create+0x28>
    printf(1, "LOLOLOL %p\n", fn);
    free(stack);
    return -1;
  }
  
  int tid = clone(stack);
 363:	83 ec 0c             	sub    $0xc,%esp
 366:	53                   	push   %ebx
 367:	e8 01 01 00 00       	call   46d <clone>
  if(tid < 0){
 36c:	83 c4 10             	add    $0x10,%esp
 36f:	85 c0                	test   %eax,%eax
 371:	78 0e                	js     381 <thread_create+0x51>
    free(stack);
    return -1;
  }
  

  if(tid == 0){
 373:	74 1f                	je     394 <thread_create+0x64>
    exit();
  }
  
  // Parent returns the new thread's id.
  return tid;
}
 375:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 378:	c9                   	leave  
 379:	c3                   	ret    
    return -1;
 37a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 37f:	eb f4                	jmp    375 <thread_create+0x45>
    free(stack);
 381:	83 ec 0c             	sub    $0xc,%esp
 384:	53                   	push   %ebx
 385:	e8 56 03 00 00       	call   6e0 <free>
    return -1;
 38a:	83 c4 10             	add    $0x10,%esp
 38d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 392:	eb e1                	jmp    375 <thread_create+0x45>
    printf(1, "Entering thread function at %p\n", fn);
 394:	50                   	push   %eax
 395:	ff 75 08             	pushl  0x8(%ebp)
 398:	68 10 09 00 00       	push   $0x910
 39d:	6a 01                	push   $0x1
 39f:	e8 9c 01 00 00       	call   540 <printf>
    fn(arg);
 3a4:	5a                   	pop    %edx
 3a5:	ff 75 0c             	pushl  0xc(%ebp)
 3a8:	ff 55 08             	call   *0x8(%ebp)
    free(stack);
 3ab:	89 1c 24             	mov    %ebx,(%esp)
 3ae:	e8 2d 03 00 00       	call   6e0 <free>
    exit();
 3b3:	e8 15 00 00 00       	call   3cd <exit>
 3b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bf:	90                   	nop

000003c0 <thread_join>:

int
thread_join(void)
{
  return join();
 3c0:	e9 c0 00 00 00       	jmp    485 <join>

000003c5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3c5:	b8 01 00 00 00       	mov    $0x1,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <exit>:
SYSCALL(exit)
 3cd:	b8 02 00 00 00       	mov    $0x2,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <wait>:
SYSCALL(wait)
 3d5:	b8 03 00 00 00       	mov    $0x3,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <pipe>:
SYSCALL(pipe)
 3dd:	b8 04 00 00 00       	mov    $0x4,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <read>:
SYSCALL(read)
 3e5:	b8 05 00 00 00       	mov    $0x5,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <write>:
SYSCALL(write)
 3ed:	b8 10 00 00 00       	mov    $0x10,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <close>:
SYSCALL(close)
 3f5:	b8 15 00 00 00       	mov    $0x15,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <kill>:
SYSCALL(kill)
 3fd:	b8 06 00 00 00       	mov    $0x6,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <exec>:
SYSCALL(exec)
 405:	b8 07 00 00 00       	mov    $0x7,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <open>:
SYSCALL(open)
 40d:	b8 0f 00 00 00       	mov    $0xf,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <mknod>:
SYSCALL(mknod)
 415:	b8 11 00 00 00       	mov    $0x11,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <unlink>:
SYSCALL(unlink)
 41d:	b8 12 00 00 00       	mov    $0x12,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <fstat>:
SYSCALL(fstat)
 425:	b8 08 00 00 00       	mov    $0x8,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <link>:
SYSCALL(link)
 42d:	b8 13 00 00 00       	mov    $0x13,%eax
 432:	cd 40                	int    $0x40
 434:	c3                   	ret    

00000435 <mkdir>:
SYSCALL(mkdir)
 435:	b8 14 00 00 00       	mov    $0x14,%eax
 43a:	cd 40                	int    $0x40
 43c:	c3                   	ret    

0000043d <chdir>:
SYSCALL(chdir)
 43d:	b8 09 00 00 00       	mov    $0x9,%eax
 442:	cd 40                	int    $0x40
 444:	c3                   	ret    

00000445 <dup>:
SYSCALL(dup)
 445:	b8 0a 00 00 00       	mov    $0xa,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <getpid>:
SYSCALL(getpid)
 44d:	b8 0b 00 00 00       	mov    $0xb,%eax
 452:	cd 40                	int    $0x40
 454:	c3                   	ret    

00000455 <sbrk>:
SYSCALL(sbrk)
 455:	b8 0c 00 00 00       	mov    $0xc,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <sleep>:
SYSCALL(sleep)
 45d:	b8 0d 00 00 00       	mov    $0xd,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <uptime>:
SYSCALL(uptime)
 465:	b8 0e 00 00 00       	mov    $0xe,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    

0000046d <clone>:
SYSCALL(clone)
 46d:	b8 16 00 00 00       	mov    $0x16,%eax
 472:	cd 40                	int    $0x40
 474:	c3                   	ret    

00000475 <lock>:
SYSCALL(lock)
 475:	b8 17 00 00 00       	mov    $0x17,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    

0000047d <unlock>:
SYSCALL(unlock)
 47d:	b8 18 00 00 00       	mov    $0x18,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    

00000485 <join>:
SYSCALL(join)
 485:	b8 19 00 00 00       	mov    $0x19,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    
 48d:	66 90                	xchg   %ax,%ax
 48f:	90                   	nop

00000490 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
 495:	53                   	push   %ebx
 496:	83 ec 3c             	sub    $0x3c,%esp
 499:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 49c:	89 d1                	mov    %edx,%ecx
{
 49e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 4a1:	85 d2                	test   %edx,%edx
 4a3:	0f 89 7f 00 00 00    	jns    528 <printint+0x98>
 4a9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4ad:	74 79                	je     528 <printint+0x98>
    neg = 1;
 4af:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4b6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4b8:	31 db                	xor    %ebx,%ebx
 4ba:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4bd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4c0:	89 c8                	mov    %ecx,%eax
 4c2:	31 d2                	xor    %edx,%edx
 4c4:	89 cf                	mov    %ecx,%edi
 4c6:	f7 75 c4             	divl   -0x3c(%ebp)
 4c9:	0f b6 92 90 09 00 00 	movzbl 0x990(%edx),%edx
 4d0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4d3:	89 d8                	mov    %ebx,%eax
 4d5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4d8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4db:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4de:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4e1:	76 dd                	jbe    4c0 <printint+0x30>
  if(neg)
 4e3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4e6:	85 c9                	test   %ecx,%ecx
 4e8:	74 0c                	je     4f6 <printint+0x66>
    buf[i++] = '-';
 4ea:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4ef:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4f1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4f6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4f9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4fd:	eb 07                	jmp    506 <printint+0x76>
 4ff:	90                   	nop
    putc(fd, buf[i]);
 500:	0f b6 13             	movzbl (%ebx),%edx
 503:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 506:	83 ec 04             	sub    $0x4,%esp
 509:	88 55 d7             	mov    %dl,-0x29(%ebp)
 50c:	6a 01                	push   $0x1
 50e:	56                   	push   %esi
 50f:	57                   	push   %edi
 510:	e8 d8 fe ff ff       	call   3ed <write>
  while(--i >= 0)
 515:	83 c4 10             	add    $0x10,%esp
 518:	39 de                	cmp    %ebx,%esi
 51a:	75 e4                	jne    500 <printint+0x70>
}
 51c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 51f:	5b                   	pop    %ebx
 520:	5e                   	pop    %esi
 521:	5f                   	pop    %edi
 522:	5d                   	pop    %ebp
 523:	c3                   	ret    
 524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 528:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 52f:	eb 87                	jmp    4b8 <printint+0x28>
 531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 538:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53f:	90                   	nop

00000540 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	57                   	push   %edi
 544:	56                   	push   %esi
 545:	53                   	push   %ebx
 546:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 549:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 54c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 54f:	0f b6 13             	movzbl (%ebx),%edx
 552:	84 d2                	test   %dl,%dl
 554:	74 6a                	je     5c0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 556:	8d 45 10             	lea    0x10(%ebp),%eax
 559:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 55c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 55f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 561:	89 45 d0             	mov    %eax,-0x30(%ebp)
 564:	eb 36                	jmp    59c <printf+0x5c>
 566:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 56d:	8d 76 00             	lea    0x0(%esi),%esi
 570:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 573:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 578:	83 f8 25             	cmp    $0x25,%eax
 57b:	74 15                	je     592 <printf+0x52>
  write(fd, &c, 1);
 57d:	83 ec 04             	sub    $0x4,%esp
 580:	88 55 e7             	mov    %dl,-0x19(%ebp)
 583:	6a 01                	push   $0x1
 585:	57                   	push   %edi
 586:	56                   	push   %esi
 587:	e8 61 fe ff ff       	call   3ed <write>
 58c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 58f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 592:	0f b6 13             	movzbl (%ebx),%edx
 595:	83 c3 01             	add    $0x1,%ebx
 598:	84 d2                	test   %dl,%dl
 59a:	74 24                	je     5c0 <printf+0x80>
    c = fmt[i] & 0xff;
 59c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 59f:	85 c9                	test   %ecx,%ecx
 5a1:	74 cd                	je     570 <printf+0x30>
      }
    } else if(state == '%'){
 5a3:	83 f9 25             	cmp    $0x25,%ecx
 5a6:	75 ea                	jne    592 <printf+0x52>
      if(c == 'd'){
 5a8:	83 f8 25             	cmp    $0x25,%eax
 5ab:	0f 84 07 01 00 00    	je     6b8 <printf+0x178>
 5b1:	83 e8 63             	sub    $0x63,%eax
 5b4:	83 f8 15             	cmp    $0x15,%eax
 5b7:	77 17                	ja     5d0 <printf+0x90>
 5b9:	ff 24 85 38 09 00 00 	jmp    *0x938(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5c3:	5b                   	pop    %ebx
 5c4:	5e                   	pop    %esi
 5c5:	5f                   	pop    %edi
 5c6:	5d                   	pop    %ebp
 5c7:	c3                   	ret    
 5c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5cf:	90                   	nop
  write(fd, &c, 1);
 5d0:	83 ec 04             	sub    $0x4,%esp
 5d3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 5d6:	6a 01                	push   $0x1
 5d8:	57                   	push   %edi
 5d9:	56                   	push   %esi
 5da:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5de:	e8 0a fe ff ff       	call   3ed <write>
        putc(fd, c);
 5e3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 5e7:	83 c4 0c             	add    $0xc,%esp
 5ea:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5ed:	6a 01                	push   $0x1
 5ef:	57                   	push   %edi
 5f0:	56                   	push   %esi
 5f1:	e8 f7 fd ff ff       	call   3ed <write>
        putc(fd, c);
 5f6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5f9:	31 c9                	xor    %ecx,%ecx
 5fb:	eb 95                	jmp    592 <printf+0x52>
 5fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 600:	83 ec 0c             	sub    $0xc,%esp
 603:	b9 10 00 00 00       	mov    $0x10,%ecx
 608:	6a 00                	push   $0x0
 60a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 60d:	8b 10                	mov    (%eax),%edx
 60f:	89 f0                	mov    %esi,%eax
 611:	e8 7a fe ff ff       	call   490 <printint>
        ap++;
 616:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 61a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 61d:	31 c9                	xor    %ecx,%ecx
 61f:	e9 6e ff ff ff       	jmp    592 <printf+0x52>
 624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 628:	8b 45 d0             	mov    -0x30(%ebp),%eax
 62b:	8b 10                	mov    (%eax),%edx
        ap++;
 62d:	83 c0 04             	add    $0x4,%eax
 630:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 633:	85 d2                	test   %edx,%edx
 635:	0f 84 8d 00 00 00    	je     6c8 <printf+0x188>
        while(*s != 0){
 63b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 63e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 640:	84 c0                	test   %al,%al
 642:	0f 84 4a ff ff ff    	je     592 <printf+0x52>
 648:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 64b:	89 d3                	mov    %edx,%ebx
 64d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
          s++;
 653:	83 c3 01             	add    $0x1,%ebx
 656:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 659:	6a 01                	push   $0x1
 65b:	57                   	push   %edi
 65c:	56                   	push   %esi
 65d:	e8 8b fd ff ff       	call   3ed <write>
        while(*s != 0){
 662:	0f b6 03             	movzbl (%ebx),%eax
 665:	83 c4 10             	add    $0x10,%esp
 668:	84 c0                	test   %al,%al
 66a:	75 e4                	jne    650 <printf+0x110>
      state = 0;
 66c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 66f:	31 c9                	xor    %ecx,%ecx
 671:	e9 1c ff ff ff       	jmp    592 <printf+0x52>
 676:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 67d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	b9 0a 00 00 00       	mov    $0xa,%ecx
 688:	6a 01                	push   $0x1
 68a:	e9 7b ff ff ff       	jmp    60a <printf+0xca>
 68f:	90                   	nop
        putc(fd, *ap);
 690:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 693:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 696:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 698:	6a 01                	push   $0x1
 69a:	57                   	push   %edi
 69b:	56                   	push   %esi
        putc(fd, *ap);
 69c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 69f:	e8 49 fd ff ff       	call   3ed <write>
        ap++;
 6a4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6a8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ab:	31 c9                	xor    %ecx,%ecx
 6ad:	e9 e0 fe ff ff       	jmp    592 <printf+0x52>
 6b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 6b8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 6bb:	83 ec 04             	sub    $0x4,%esp
 6be:	e9 2a ff ff ff       	jmp    5ed <printf+0xad>
 6c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6c7:	90                   	nop
          s = "(null)";
 6c8:	ba 30 09 00 00       	mov    $0x930,%edx
        while(*s != 0){
 6cd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6d0:	b8 28 00 00 00       	mov    $0x28,%eax
 6d5:	89 d3                	mov    %edx,%ebx
 6d7:	e9 74 ff ff ff       	jmp    650 <printf+0x110>
 6dc:	66 90                	xchg   %ax,%ax
 6de:	66 90                	xchg   %ax,%ax

000006e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	a1 98 0c 00 00       	mov    0xc98,%eax
{
 6e6:	89 e5                	mov    %esp,%ebp
 6e8:	57                   	push   %edi
 6e9:	56                   	push   %esi
 6ea:	53                   	push   %ebx
 6eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6f8:	89 c2                	mov    %eax,%edx
 6fa:	8b 00                	mov    (%eax),%eax
 6fc:	39 ca                	cmp    %ecx,%edx
 6fe:	73 30                	jae    730 <free+0x50>
 700:	39 c1                	cmp    %eax,%ecx
 702:	72 04                	jb     708 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 704:	39 c2                	cmp    %eax,%edx
 706:	72 f0                	jb     6f8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 708:	8b 73 fc             	mov    -0x4(%ebx),%esi
 70b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 70e:	39 f8                	cmp    %edi,%eax
 710:	74 30                	je     742 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 712:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 715:	8b 42 04             	mov    0x4(%edx),%eax
 718:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 71b:	39 f1                	cmp    %esi,%ecx
 71d:	74 3a                	je     759 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 71f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 721:	5b                   	pop    %ebx
  freep = p;
 722:	89 15 98 0c 00 00    	mov    %edx,0xc98
}
 728:	5e                   	pop    %esi
 729:	5f                   	pop    %edi
 72a:	5d                   	pop    %ebp
 72b:	c3                   	ret    
 72c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 730:	39 c2                	cmp    %eax,%edx
 732:	72 c4                	jb     6f8 <free+0x18>
 734:	39 c1                	cmp    %eax,%ecx
 736:	73 c0                	jae    6f8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 738:	8b 73 fc             	mov    -0x4(%ebx),%esi
 73b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 73e:	39 f8                	cmp    %edi,%eax
 740:	75 d0                	jne    712 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 742:	03 70 04             	add    0x4(%eax),%esi
 745:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 748:	8b 02                	mov    (%edx),%eax
 74a:	8b 00                	mov    (%eax),%eax
 74c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 74f:	8b 42 04             	mov    0x4(%edx),%eax
 752:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 755:	39 f1                	cmp    %esi,%ecx
 757:	75 c6                	jne    71f <free+0x3f>
    p->s.size += bp->s.size;
 759:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 75c:	89 15 98 0c 00 00    	mov    %edx,0xc98
    p->s.size += bp->s.size;
 762:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 765:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 768:	89 0a                	mov    %ecx,(%edx)
}
 76a:	5b                   	pop    %ebx
 76b:	5e                   	pop    %esi
 76c:	5f                   	pop    %edi
 76d:	5d                   	pop    %ebp
 76e:	c3                   	ret    
 76f:	90                   	nop

00000770 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 779:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 77c:	8b 3d 98 0c 00 00    	mov    0xc98,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 782:	8d 70 07             	lea    0x7(%eax),%esi
 785:	c1 ee 03             	shr    $0x3,%esi
 788:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 78b:	85 ff                	test   %edi,%edi
 78d:	0f 84 9d 00 00 00    	je     830 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 793:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 795:	8b 4a 04             	mov    0x4(%edx),%ecx
 798:	39 f1                	cmp    %esi,%ecx
 79a:	73 6a                	jae    806 <malloc+0x96>
 79c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7a1:	39 de                	cmp    %ebx,%esi
 7a3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 7a6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7b0:	eb 17                	jmp    7c9 <malloc+0x59>
 7b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7ba:	8b 48 04             	mov    0x4(%eax),%ecx
 7bd:	39 f1                	cmp    %esi,%ecx
 7bf:	73 4f                	jae    810 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7c1:	8b 3d 98 0c 00 00    	mov    0xc98,%edi
 7c7:	89 c2                	mov    %eax,%edx
 7c9:	39 d7                	cmp    %edx,%edi
 7cb:	75 eb                	jne    7b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7cd:	83 ec 0c             	sub    $0xc,%esp
 7d0:	ff 75 e4             	pushl  -0x1c(%ebp)
 7d3:	e8 7d fc ff ff       	call   455 <sbrk>
  if(p == (char*)-1)
 7d8:	83 c4 10             	add    $0x10,%esp
 7db:	83 f8 ff             	cmp    $0xffffffff,%eax
 7de:	74 1c                	je     7fc <malloc+0x8c>
  hp->s.size = nu;
 7e0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7e3:	83 ec 0c             	sub    $0xc,%esp
 7e6:	83 c0 08             	add    $0x8,%eax
 7e9:	50                   	push   %eax
 7ea:	e8 f1 fe ff ff       	call   6e0 <free>
  return freep;
 7ef:	8b 15 98 0c 00 00    	mov    0xc98,%edx
      if((p = morecore(nunits)) == 0)
 7f5:	83 c4 10             	add    $0x10,%esp
 7f8:	85 d2                	test   %edx,%edx
 7fa:	75 bc                	jne    7b8 <malloc+0x48>
        return 0;
  }
}
 7fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7ff:	31 c0                	xor    %eax,%eax
}
 801:	5b                   	pop    %ebx
 802:	5e                   	pop    %esi
 803:	5f                   	pop    %edi
 804:	5d                   	pop    %ebp
 805:	c3                   	ret    
    if(p->s.size >= nunits){
 806:	89 d0                	mov    %edx,%eax
 808:	89 fa                	mov    %edi,%edx
 80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 810:	39 ce                	cmp    %ecx,%esi
 812:	74 4c                	je     860 <malloc+0xf0>
        p->s.size -= nunits;
 814:	29 f1                	sub    %esi,%ecx
 816:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 819:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 81c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 81f:	89 15 98 0c 00 00    	mov    %edx,0xc98
}
 825:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 828:	83 c0 08             	add    $0x8,%eax
}
 82b:	5b                   	pop    %ebx
 82c:	5e                   	pop    %esi
 82d:	5f                   	pop    %edi
 82e:	5d                   	pop    %ebp
 82f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 830:	c7 05 98 0c 00 00 9c 	movl   $0xc9c,0xc98
 837:	0c 00 00 
    base.s.size = 0;
 83a:	bf 9c 0c 00 00       	mov    $0xc9c,%edi
    base.s.ptr = freep = prevp = &base;
 83f:	c7 05 9c 0c 00 00 9c 	movl   $0xc9c,0xc9c
 846:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 849:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 84b:	c7 05 a0 0c 00 00 00 	movl   $0x0,0xca0
 852:	00 00 00 
    if(p->s.size >= nunits){
 855:	e9 42 ff ff ff       	jmp    79c <malloc+0x2c>
 85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 860:	8b 08                	mov    (%eax),%ecx
 862:	89 0a                	mov    %ecx,(%edx)
 864:	eb b9                	jmp    81f <malloc+0xaf>
