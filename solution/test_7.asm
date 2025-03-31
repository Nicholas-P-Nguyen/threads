
_test_7:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

void cb(void* arg) {}

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
    ASSERT(thread_join() == -1, "expected join before clone to return -1");
   f:	e8 7c 03 00 00       	call   390 <thread_join>
  14:	83 f8 ff             	cmp    $0xffffffff,%eax
  17:	74 3d                	je     56 <main+0x56>
  19:	83 ec 0c             	sub    $0xc,%esp
  1c:	6a 0d                	push   $0xd
  1e:	68 38 08 00 00       	push   $0x838
  23:	68 41 08 00 00       	push   $0x841
  28:	68 4b 08 00 00       	push   $0x84b
  2d:	6a 01                	push   $0x1
  2f:	e8 dc 04 00 00       	call   510 <printf>
  34:	83 c4 18             	add    $0x18,%esp
  37:	68 6c 08 00 00       	push   $0x86c
    int tid_c = thread_create(&cb, (void*)0);
    ASSERT(tid_c != 0, "expected clone to return non-zero thread id");
  3c:	6a 01                	push   $0x1
  3e:	e8 cd 04 00 00       	call   510 <printf>
  43:	5a                   	pop    %edx
  44:	59                   	pop    %ecx
  45:	68 55 08 00 00       	push   $0x855
  4a:	6a 01                	push   $0x1
  4c:	e8 bf 04 00 00       	call   510 <printf>
  51:	e8 48 03 00 00       	call   39e <exit>
    int tid_c = thread_create(&cb, (void*)0);
  56:	53                   	push   %ebx
  57:	53                   	push   %ebx
  58:	6a 00                	push   $0x0
  5a:	68 20 01 00 00       	push   $0x120
  5f:	e8 1c 03 00 00       	call   380 <thread_create>
    ASSERT(tid_c != 0, "expected clone to return non-zero thread id");
  64:	83 c4 10             	add    $0x10,%esp
    int tid_c = thread_create(&cb, (void*)0);
  67:	89 c3                	mov    %eax,%ebx
    ASSERT(tid_c != 0, "expected clone to return non-zero thread id");
  69:	85 c0                	test   %eax,%eax
  6b:	74 2e                	je     9b <main+0x9b>
    int tid_j = thread_join();
  6d:	e8 1e 03 00 00       	call   390 <thread_join>
    ASSERT(tid_c == tid_j, "expected join to return the same thread id as clone did.");
  72:	39 c3                	cmp    %eax,%ebx
  74:	74 4d                	je     c3 <main+0xc3>
  76:	83 ec 0c             	sub    $0xc,%esp
  79:	6a 11                	push   $0x11
  7b:	68 38 08 00 00       	push   $0x838
  80:	68 41 08 00 00       	push   $0x841
  85:	68 4b 08 00 00       	push   $0x84b
  8a:	6a 01                	push   $0x1
  8c:	e8 7f 04 00 00       	call   510 <printf>
  91:	83 c4 18             	add    $0x18,%esp
  94:	68 c0 08 00 00       	push   $0x8c0
  99:	eb a1                	jmp    3c <main+0x3c>
    ASSERT(tid_c != 0, "expected clone to return non-zero thread id");
  9b:	83 ec 0c             	sub    $0xc,%esp
  9e:	6a 0f                	push   $0xf
  a0:	68 38 08 00 00       	push   $0x838
  a5:	68 41 08 00 00       	push   $0x841
  aa:	68 4b 08 00 00       	push   $0x84b
  af:	6a 01                	push   $0x1
  b1:	e8 5a 04 00 00       	call   510 <printf>
  b6:	83 c4 18             	add    $0x18,%esp
  b9:	68 94 08 00 00       	push   $0x894
  be:	e9 79 ff ff ff       	jmp    3c <main+0x3c>
    int tid_j2 = thread_join();
  c3:	e8 c8 02 00 00       	call   390 <thread_join>
  c8:	89 c3                	mov    %eax,%ebx
    ASSERT(tid_j2 == -1, "expected second join to return -1 %d", tid_j2);
  ca:	83 f8 ff             	cmp    $0xffffffff,%eax
  cd:	74 29                	je     f8 <main+0xf8>
  cf:	83 ec 0c             	sub    $0xc,%esp
  d2:	6a 13                	push   $0x13
  d4:	68 38 08 00 00       	push   $0x838
  d9:	68 41 08 00 00       	push   $0x841
  de:	68 4b 08 00 00       	push   $0x84b
  e3:	6a 01                	push   $0x1
  e5:	e8 26 04 00 00       	call   510 <printf>
  ea:	83 c4 1c             	add    $0x1c,%esp
  ed:	53                   	push   %ebx
  ee:	68 fc 08 00 00       	push   $0x8fc
  f3:	e9 44 ff ff ff       	jmp    3c <main+0x3c>
                        printf(1, "\n");


#define SUCCESS_MSG "TEST PASSED"
static void test_passed() {
    PRINTF("%s", SUCCESS_MSG);
  f8:	50                   	push   %eax
  f9:	68 41 08 00 00       	push   $0x841
  fe:	68 57 08 00 00       	push   $0x857
 103:	6a 01                	push   $0x1
 105:	e8 06 04 00 00       	call   510 <printf>
 10a:	83 c4 0c             	add    $0xc,%esp
 10d:	68 5c 08 00 00       	push   $0x85c
 112:	68 68 08 00 00       	push   $0x868
 117:	e9 20 ff ff ff       	jmp    3c <main+0x3c>
 11c:	66 90                	xchg   %ax,%ax
 11e:	66 90                	xchg   %ax,%ax

00000120 <cb>:
void cb(void* arg) {}
 120:	c3                   	ret    
 121:	66 90                	xchg   %ax,%ax
 123:	66 90                	xchg   %ax,%ax
 125:	66 90                	xchg   %ax,%ax
 127:	66 90                	xchg   %ax,%ax
 129:	66 90                	xchg   %ax,%ax
 12b:	66 90                	xchg   %ax,%ax
 12d:	66 90                	xchg   %ax,%ax
 12f:	90                   	nop

00000130 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 130:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 131:	31 c0                	xor    %eax,%eax
{
 133:	89 e5                	mov    %esp,%ebp
 135:	53                   	push   %ebx
 136:	8b 4d 08             	mov    0x8(%ebp),%ecx
 139:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 13c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 140:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 144:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 147:	83 c0 01             	add    $0x1,%eax
 14a:	84 d2                	test   %dl,%dl
 14c:	75 f2                	jne    140 <strcpy+0x10>
    ;
  return os;
}
 14e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 151:	89 c8                	mov    %ecx,%eax
 153:	c9                   	leave  
 154:	c3                   	ret    
 155:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000160 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	53                   	push   %ebx
 164:	8b 55 08             	mov    0x8(%ebp),%edx
 167:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 16a:	0f b6 02             	movzbl (%edx),%eax
 16d:	84 c0                	test   %al,%al
 16f:	75 17                	jne    188 <strcmp+0x28>
 171:	eb 3a                	jmp    1ad <strcmp+0x4d>
 173:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 177:	90                   	nop
 178:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 17c:	83 c2 01             	add    $0x1,%edx
 17f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 182:	84 c0                	test   %al,%al
 184:	74 1a                	je     1a0 <strcmp+0x40>
    p++, q++;
 186:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 188:	0f b6 19             	movzbl (%ecx),%ebx
 18b:	38 c3                	cmp    %al,%bl
 18d:	74 e9                	je     178 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 18f:	29 d8                	sub    %ebx,%eax
}
 191:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 194:	c9                   	leave  
 195:	c3                   	ret    
 196:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 19d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 1a0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1a4:	31 c0                	xor    %eax,%eax
 1a6:	29 d8                	sub    %ebx,%eax
}
 1a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ab:	c9                   	leave  
 1ac:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 1ad:	0f b6 19             	movzbl (%ecx),%ebx
 1b0:	31 c0                	xor    %eax,%eax
 1b2:	eb db                	jmp    18f <strcmp+0x2f>
 1b4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1bf:	90                   	nop

000001c0 <strlen>:

uint
strlen(const char *s)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1c6:	80 3a 00             	cmpb   $0x0,(%edx)
 1c9:	74 15                	je     1e0 <strlen+0x20>
 1cb:	31 c0                	xor    %eax,%eax
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
 1d0:	83 c0 01             	add    $0x1,%eax
 1d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1d7:	89 c1                	mov    %eax,%ecx
 1d9:	75 f5                	jne    1d0 <strlen+0x10>
    ;
  return n;
}
 1db:	89 c8                	mov    %ecx,%eax
 1dd:	5d                   	pop    %ebp
 1de:	c3                   	ret    
 1df:	90                   	nop
  for(n = 0; s[n]; n++)
 1e0:	31 c9                	xor    %ecx,%ecx
}
 1e2:	5d                   	pop    %ebp
 1e3:	89 c8                	mov    %ecx,%eax
 1e5:	c3                   	ret    
 1e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ed:	8d 76 00             	lea    0x0(%esi),%esi

000001f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	57                   	push   %edi
 1f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fd:	89 d7                	mov    %edx,%edi
 1ff:	fc                   	cld    
 200:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 202:	8b 7d fc             	mov    -0x4(%ebp),%edi
 205:	89 d0                	mov    %edx,%eax
 207:	c9                   	leave  
 208:	c3                   	ret    
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000210 <strchr>:

char*
strchr(const char *s, char c)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 21a:	0f b6 10             	movzbl (%eax),%edx
 21d:	84 d2                	test   %dl,%dl
 21f:	75 12                	jne    233 <strchr+0x23>
 221:	eb 1d                	jmp    240 <strchr+0x30>
 223:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 227:	90                   	nop
 228:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 22c:	83 c0 01             	add    $0x1,%eax
 22f:	84 d2                	test   %dl,%dl
 231:	74 0d                	je     240 <strchr+0x30>
    if(*s == c)
 233:	38 d1                	cmp    %dl,%cl
 235:	75 f1                	jne    228 <strchr+0x18>
      return (char*)s;
  return 0;
}
 237:	5d                   	pop    %ebp
 238:	c3                   	ret    
 239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 240:	31 c0                	xor    %eax,%eax
}
 242:	5d                   	pop    %ebp
 243:	c3                   	ret    
 244:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 24f:	90                   	nop

00000250 <gets>:

char*
gets(char *buf, int max)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 255:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 258:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 259:	31 db                	xor    %ebx,%ebx
{
 25b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 25e:	eb 27                	jmp    287 <gets+0x37>
    cc = read(0, &c, 1);
 260:	83 ec 04             	sub    $0x4,%esp
 263:	6a 01                	push   $0x1
 265:	57                   	push   %edi
 266:	6a 00                	push   $0x0
 268:	e8 49 01 00 00       	call   3b6 <read>
    if(cc < 1)
 26d:	83 c4 10             	add    $0x10,%esp
 270:	85 c0                	test   %eax,%eax
 272:	7e 1d                	jle    291 <gets+0x41>
      break;
    buf[i++] = c;
 274:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 278:	8b 55 08             	mov    0x8(%ebp),%edx
 27b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 27f:	3c 0a                	cmp    $0xa,%al
 281:	74 1d                	je     2a0 <gets+0x50>
 283:	3c 0d                	cmp    $0xd,%al
 285:	74 19                	je     2a0 <gets+0x50>
  for(i=0; i+1 < max; ){
 287:	89 de                	mov    %ebx,%esi
 289:	83 c3 01             	add    $0x1,%ebx
 28c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 28f:	7c cf                	jl     260 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 291:	8b 45 08             	mov    0x8(%ebp),%eax
 294:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 298:	8d 65 f4             	lea    -0xc(%ebp),%esp
 29b:	5b                   	pop    %ebx
 29c:	5e                   	pop    %esi
 29d:	5f                   	pop    %edi
 29e:	5d                   	pop    %ebp
 29f:	c3                   	ret    
  buf[i] = '\0';
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
 2a3:	89 de                	mov    %ebx,%esi
 2a5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ac:	5b                   	pop    %ebx
 2ad:	5e                   	pop    %esi
 2ae:	5f                   	pop    %edi
 2af:	5d                   	pop    %ebp
 2b0:	c3                   	ret    
 2b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bf:	90                   	nop

000002c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	56                   	push   %esi
 2c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c5:	83 ec 08             	sub    $0x8,%esp
 2c8:	6a 00                	push   $0x0
 2ca:	ff 75 08             	pushl  0x8(%ebp)
 2cd:	e8 0c 01 00 00       	call   3de <open>
  if(fd < 0)
 2d2:	83 c4 10             	add    $0x10,%esp
 2d5:	85 c0                	test   %eax,%eax
 2d7:	78 27                	js     300 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2d9:	83 ec 08             	sub    $0x8,%esp
 2dc:	ff 75 0c             	pushl  0xc(%ebp)
 2df:	89 c3                	mov    %eax,%ebx
 2e1:	50                   	push   %eax
 2e2:	e8 0f 01 00 00       	call   3f6 <fstat>
  close(fd);
 2e7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2ea:	89 c6                	mov    %eax,%esi
  close(fd);
 2ec:	e8 d5 00 00 00       	call   3c6 <close>
  return r;
 2f1:	83 c4 10             	add    $0x10,%esp
}
 2f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2f7:	89 f0                	mov    %esi,%eax
 2f9:	5b                   	pop    %ebx
 2fa:	5e                   	pop    %esi
 2fb:	5d                   	pop    %ebp
 2fc:	c3                   	ret    
 2fd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 300:	be ff ff ff ff       	mov    $0xffffffff,%esi
 305:	eb ed                	jmp    2f4 <stat+0x34>
 307:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30e:	66 90                	xchg   %ax,%ax

00000310 <atoi>:

int
atoi(const char *s)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	53                   	push   %ebx
 314:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 317:	0f be 02             	movsbl (%edx),%eax
 31a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 31d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 320:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 325:	77 1e                	ja     345 <atoi+0x35>
 327:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 330:	83 c2 01             	add    $0x1,%edx
 333:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 336:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 33a:	0f be 02             	movsbl (%edx),%eax
 33d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 340:	80 fb 09             	cmp    $0x9,%bl
 343:	76 eb                	jbe    330 <atoi+0x20>
  return n;
}
 345:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 348:	89 c8                	mov    %ecx,%eax
 34a:	c9                   	leave  
 34b:	c3                   	ret    
 34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000350 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	8b 45 10             	mov    0x10(%ebp),%eax
 357:	8b 55 08             	mov    0x8(%ebp),%edx
 35a:	56                   	push   %esi
 35b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 35e:	85 c0                	test   %eax,%eax
 360:	7e 13                	jle    375 <memmove+0x25>
 362:	01 d0                	add    %edx,%eax
  dst = vdst;
 364:	89 d7                	mov    %edx,%edi
 366:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 36d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 370:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 371:	39 f8                	cmp    %edi,%eax
 373:	75 fb                	jne    370 <memmove+0x20>
  return vdst;
}
 375:	5e                   	pop    %esi
 376:	89 d0                	mov    %edx,%eax
 378:	5f                   	pop    %edi
 379:	5d                   	pop    %ebp
 37a:	c3                   	ret    
 37b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop

00000380 <thread_create>:

int thread_create(void (*fn)(void *), void *arg) {
  return -1;
}
 380:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 385:	c3                   	ret    
 386:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 38d:	8d 76 00             	lea    0x0(%esi),%esi

00000390 <thread_join>:

int thread_join() {
  return -1;
}
 390:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 395:	c3                   	ret    

00000396 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 396:	b8 01 00 00 00       	mov    $0x1,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <exit>:
SYSCALL(exit)
 39e:	b8 02 00 00 00       	mov    $0x2,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <wait>:
SYSCALL(wait)
 3a6:	b8 03 00 00 00       	mov    $0x3,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <pipe>:
SYSCALL(pipe)
 3ae:	b8 04 00 00 00       	mov    $0x4,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <read>:
SYSCALL(read)
 3b6:	b8 05 00 00 00       	mov    $0x5,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <write>:
SYSCALL(write)
 3be:	b8 10 00 00 00       	mov    $0x10,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <close>:
SYSCALL(close)
 3c6:	b8 15 00 00 00       	mov    $0x15,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <kill>:
SYSCALL(kill)
 3ce:	b8 06 00 00 00       	mov    $0x6,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <exec>:
SYSCALL(exec)
 3d6:	b8 07 00 00 00       	mov    $0x7,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <open>:
SYSCALL(open)
 3de:	b8 0f 00 00 00       	mov    $0xf,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <mknod>:
SYSCALL(mknod)
 3e6:	b8 11 00 00 00       	mov    $0x11,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <unlink>:
SYSCALL(unlink)
 3ee:	b8 12 00 00 00       	mov    $0x12,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <fstat>:
SYSCALL(fstat)
 3f6:	b8 08 00 00 00       	mov    $0x8,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <link>:
SYSCALL(link)
 3fe:	b8 13 00 00 00       	mov    $0x13,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <mkdir>:
SYSCALL(mkdir)
 406:	b8 14 00 00 00       	mov    $0x14,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <chdir>:
SYSCALL(chdir)
 40e:	b8 09 00 00 00       	mov    $0x9,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <dup>:
SYSCALL(dup)
 416:	b8 0a 00 00 00       	mov    $0xa,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <getpid>:
SYSCALL(getpid)
 41e:	b8 0b 00 00 00       	mov    $0xb,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <sbrk>:
SYSCALL(sbrk)
 426:	b8 0c 00 00 00       	mov    $0xc,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <sleep>:
SYSCALL(sleep)
 42e:	b8 0d 00 00 00       	mov    $0xd,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <uptime>:
SYSCALL(uptime)
 436:	b8 0e 00 00 00       	mov    $0xe,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <clone>:
SYSCALL(clone)
 43e:	b8 16 00 00 00       	mov    $0x16,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <lock>:
SYSCALL(lock)
 446:	b8 17 00 00 00       	mov    $0x17,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <unlock>:
SYSCALL(unlock)
 44e:	b8 18 00 00 00       	mov    $0x18,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <join>:
SYSCALL(join)
 456:	b8 19 00 00 00       	mov    $0x19,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    
 45e:	66 90                	xchg   %ax,%ax

00000460 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
 466:	83 ec 3c             	sub    $0x3c,%esp
 469:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 46c:	89 d1                	mov    %edx,%ecx
{
 46e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 471:	85 d2                	test   %edx,%edx
 473:	0f 89 7f 00 00 00    	jns    4f8 <printint+0x98>
 479:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 47d:	74 79                	je     4f8 <printint+0x98>
    neg = 1;
 47f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 486:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 488:	31 db                	xor    %ebx,%ebx
 48a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 48d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 490:	89 c8                	mov    %ecx,%eax
 492:	31 d2                	xor    %edx,%edx
 494:	89 cf                	mov    %ecx,%edi
 496:	f7 75 c4             	divl   -0x3c(%ebp)
 499:	0f b6 92 80 09 00 00 	movzbl 0x980(%edx),%edx
 4a0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4a3:	89 d8                	mov    %ebx,%eax
 4a5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4a8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4ab:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4ae:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4b1:	76 dd                	jbe    490 <printint+0x30>
  if(neg)
 4b3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4b6:	85 c9                	test   %ecx,%ecx
 4b8:	74 0c                	je     4c6 <printint+0x66>
    buf[i++] = '-';
 4ba:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4bf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4c1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4c6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4c9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4cd:	eb 07                	jmp    4d6 <printint+0x76>
 4cf:	90                   	nop
    putc(fd, buf[i]);
 4d0:	0f b6 13             	movzbl (%ebx),%edx
 4d3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4d6:	83 ec 04             	sub    $0x4,%esp
 4d9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4dc:	6a 01                	push   $0x1
 4de:	56                   	push   %esi
 4df:	57                   	push   %edi
 4e0:	e8 d9 fe ff ff       	call   3be <write>
  while(--i >= 0)
 4e5:	83 c4 10             	add    $0x10,%esp
 4e8:	39 de                	cmp    %ebx,%esi
 4ea:	75 e4                	jne    4d0 <printint+0x70>
}
 4ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4ef:	5b                   	pop    %ebx
 4f0:	5e                   	pop    %esi
 4f1:	5f                   	pop    %edi
 4f2:	5d                   	pop    %ebp
 4f3:	c3                   	ret    
 4f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 4f8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 4ff:	eb 87                	jmp    488 <printint+0x28>
 501:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 508:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 50f:	90                   	nop

00000510 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
 516:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 519:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 51c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 51f:	0f b6 13             	movzbl (%ebx),%edx
 522:	84 d2                	test   %dl,%dl
 524:	74 6a                	je     590 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 526:	8d 45 10             	lea    0x10(%ebp),%eax
 529:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 52c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 52f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 531:	89 45 d0             	mov    %eax,-0x30(%ebp)
 534:	eb 36                	jmp    56c <printf+0x5c>
 536:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53d:	8d 76 00             	lea    0x0(%esi),%esi
 540:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 543:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 548:	83 f8 25             	cmp    $0x25,%eax
 54b:	74 15                	je     562 <printf+0x52>
  write(fd, &c, 1);
 54d:	83 ec 04             	sub    $0x4,%esp
 550:	88 55 e7             	mov    %dl,-0x19(%ebp)
 553:	6a 01                	push   $0x1
 555:	57                   	push   %edi
 556:	56                   	push   %esi
 557:	e8 62 fe ff ff       	call   3be <write>
 55c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 55f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 562:	0f b6 13             	movzbl (%ebx),%edx
 565:	83 c3 01             	add    $0x1,%ebx
 568:	84 d2                	test   %dl,%dl
 56a:	74 24                	je     590 <printf+0x80>
    c = fmt[i] & 0xff;
 56c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 56f:	85 c9                	test   %ecx,%ecx
 571:	74 cd                	je     540 <printf+0x30>
      }
    } else if(state == '%'){
 573:	83 f9 25             	cmp    $0x25,%ecx
 576:	75 ea                	jne    562 <printf+0x52>
      if(c == 'd'){
 578:	83 f8 25             	cmp    $0x25,%eax
 57b:	0f 84 07 01 00 00    	je     688 <printf+0x178>
 581:	83 e8 63             	sub    $0x63,%eax
 584:	83 f8 15             	cmp    $0x15,%eax
 587:	77 17                	ja     5a0 <printf+0x90>
 589:	ff 24 85 28 09 00 00 	jmp    *0x928(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 590:	8d 65 f4             	lea    -0xc(%ebp),%esp
 593:	5b                   	pop    %ebx
 594:	5e                   	pop    %esi
 595:	5f                   	pop    %edi
 596:	5d                   	pop    %ebp
 597:	c3                   	ret    
 598:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop
  write(fd, &c, 1);
 5a0:	83 ec 04             	sub    $0x4,%esp
 5a3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 5a6:	6a 01                	push   $0x1
 5a8:	57                   	push   %edi
 5a9:	56                   	push   %esi
 5aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5ae:	e8 0b fe ff ff       	call   3be <write>
        putc(fd, c);
 5b3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 5b7:	83 c4 0c             	add    $0xc,%esp
 5ba:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5bd:	6a 01                	push   $0x1
 5bf:	57                   	push   %edi
 5c0:	56                   	push   %esi
 5c1:	e8 f8 fd ff ff       	call   3be <write>
        putc(fd, c);
 5c6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5c9:	31 c9                	xor    %ecx,%ecx
 5cb:	eb 95                	jmp    562 <printf+0x52>
 5cd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5d0:	83 ec 0c             	sub    $0xc,%esp
 5d3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5d8:	6a 00                	push   $0x0
 5da:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5dd:	8b 10                	mov    (%eax),%edx
 5df:	89 f0                	mov    %esi,%eax
 5e1:	e8 7a fe ff ff       	call   460 <printint>
        ap++;
 5e6:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 5ea:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5ed:	31 c9                	xor    %ecx,%ecx
 5ef:	e9 6e ff ff ff       	jmp    562 <printf+0x52>
 5f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 5f8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5fb:	8b 10                	mov    (%eax),%edx
        ap++;
 5fd:	83 c0 04             	add    $0x4,%eax
 600:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 603:	85 d2                	test   %edx,%edx
 605:	0f 84 8d 00 00 00    	je     698 <printf+0x188>
        while(*s != 0){
 60b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 60e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 610:	84 c0                	test   %al,%al
 612:	0f 84 4a ff ff ff    	je     562 <printf+0x52>
 618:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 61b:	89 d3                	mov    %edx,%ebx
 61d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 620:	83 ec 04             	sub    $0x4,%esp
          s++;
 623:	83 c3 01             	add    $0x1,%ebx
 626:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 629:	6a 01                	push   $0x1
 62b:	57                   	push   %edi
 62c:	56                   	push   %esi
 62d:	e8 8c fd ff ff       	call   3be <write>
        while(*s != 0){
 632:	0f b6 03             	movzbl (%ebx),%eax
 635:	83 c4 10             	add    $0x10,%esp
 638:	84 c0                	test   %al,%al
 63a:	75 e4                	jne    620 <printf+0x110>
      state = 0;
 63c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 63f:	31 c9                	xor    %ecx,%ecx
 641:	e9 1c ff ff ff       	jmp    562 <printf+0x52>
 646:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 650:	83 ec 0c             	sub    $0xc,%esp
 653:	b9 0a 00 00 00       	mov    $0xa,%ecx
 658:	6a 01                	push   $0x1
 65a:	e9 7b ff ff ff       	jmp    5da <printf+0xca>
 65f:	90                   	nop
        putc(fd, *ap);
 660:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 663:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 666:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 668:	6a 01                	push   $0x1
 66a:	57                   	push   %edi
 66b:	56                   	push   %esi
        putc(fd, *ap);
 66c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 66f:	e8 4a fd ff ff       	call   3be <write>
        ap++;
 674:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 678:	83 c4 10             	add    $0x10,%esp
      state = 0;
 67b:	31 c9                	xor    %ecx,%ecx
 67d:	e9 e0 fe ff ff       	jmp    562 <printf+0x52>
 682:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 688:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 68b:	83 ec 04             	sub    $0x4,%esp
 68e:	e9 2a ff ff ff       	jmp    5bd <printf+0xad>
 693:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 697:	90                   	nop
          s = "(null)";
 698:	ba 21 09 00 00       	mov    $0x921,%edx
        while(*s != 0){
 69d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6a0:	b8 28 00 00 00       	mov    $0x28,%eax
 6a5:	89 d3                	mov    %edx,%ebx
 6a7:	e9 74 ff ff ff       	jmp    620 <printf+0x110>
 6ac:	66 90                	xchg   %ax,%ax
 6ae:	66 90                	xchg   %ax,%ax

000006b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b1:	a1 00 50 00 00       	mov    0x5000,%eax
{
 6b6:	89 e5                	mov    %esp,%ebp
 6b8:	57                   	push   %edi
 6b9:	56                   	push   %esi
 6ba:	53                   	push   %ebx
 6bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6c8:	89 c2                	mov    %eax,%edx
 6ca:	8b 00                	mov    (%eax),%eax
 6cc:	39 ca                	cmp    %ecx,%edx
 6ce:	73 30                	jae    700 <free+0x50>
 6d0:	39 c1                	cmp    %eax,%ecx
 6d2:	72 04                	jb     6d8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d4:	39 c2                	cmp    %eax,%edx
 6d6:	72 f0                	jb     6c8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6d8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6db:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6de:	39 f8                	cmp    %edi,%eax
 6e0:	74 30                	je     712 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 6e2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 6e5:	8b 42 04             	mov    0x4(%edx),%eax
 6e8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6eb:	39 f1                	cmp    %esi,%ecx
 6ed:	74 3a                	je     729 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 6ef:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 6f1:	5b                   	pop    %ebx
  freep = p;
 6f2:	89 15 00 50 00 00    	mov    %edx,0x5000
}
 6f8:	5e                   	pop    %esi
 6f9:	5f                   	pop    %edi
 6fa:	5d                   	pop    %ebp
 6fb:	c3                   	ret    
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 700:	39 c2                	cmp    %eax,%edx
 702:	72 c4                	jb     6c8 <free+0x18>
 704:	39 c1                	cmp    %eax,%ecx
 706:	73 c0                	jae    6c8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 708:	8b 73 fc             	mov    -0x4(%ebx),%esi
 70b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 70e:	39 f8                	cmp    %edi,%eax
 710:	75 d0                	jne    6e2 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 712:	03 70 04             	add    0x4(%eax),%esi
 715:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 718:	8b 02                	mov    (%edx),%eax
 71a:	8b 00                	mov    (%eax),%eax
 71c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 71f:	8b 42 04             	mov    0x4(%edx),%eax
 722:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 725:	39 f1                	cmp    %esi,%ecx
 727:	75 c6                	jne    6ef <free+0x3f>
    p->s.size += bp->s.size;
 729:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 72c:	89 15 00 50 00 00    	mov    %edx,0x5000
    p->s.size += bp->s.size;
 732:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 735:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 738:	89 0a                	mov    %ecx,(%edx)
}
 73a:	5b                   	pop    %ebx
 73b:	5e                   	pop    %esi
 73c:	5f                   	pop    %edi
 73d:	5d                   	pop    %ebp
 73e:	c3                   	ret    
 73f:	90                   	nop

00000740 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	57                   	push   %edi
 744:	56                   	push   %esi
 745:	53                   	push   %ebx
 746:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 749:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 74c:	8b 3d 00 50 00 00    	mov    0x5000,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 752:	8d 70 07             	lea    0x7(%eax),%esi
 755:	c1 ee 03             	shr    $0x3,%esi
 758:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 75b:	85 ff                	test   %edi,%edi
 75d:	0f 84 9d 00 00 00    	je     800 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 763:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 765:	8b 4a 04             	mov    0x4(%edx),%ecx
 768:	39 f1                	cmp    %esi,%ecx
 76a:	73 6a                	jae    7d6 <malloc+0x96>
 76c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 771:	39 de                	cmp    %ebx,%esi
 773:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 776:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 77d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 780:	eb 17                	jmp    799 <malloc+0x59>
 782:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 788:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 78a:	8b 48 04             	mov    0x4(%eax),%ecx
 78d:	39 f1                	cmp    %esi,%ecx
 78f:	73 4f                	jae    7e0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 791:	8b 3d 00 50 00 00    	mov    0x5000,%edi
 797:	89 c2                	mov    %eax,%edx
 799:	39 d7                	cmp    %edx,%edi
 79b:	75 eb                	jne    788 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 79d:	83 ec 0c             	sub    $0xc,%esp
 7a0:	ff 75 e4             	pushl  -0x1c(%ebp)
 7a3:	e8 7e fc ff ff       	call   426 <sbrk>
  if(p == (char*)-1)
 7a8:	83 c4 10             	add    $0x10,%esp
 7ab:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ae:	74 1c                	je     7cc <malloc+0x8c>
  hp->s.size = nu;
 7b0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7b3:	83 ec 0c             	sub    $0xc,%esp
 7b6:	83 c0 08             	add    $0x8,%eax
 7b9:	50                   	push   %eax
 7ba:	e8 f1 fe ff ff       	call   6b0 <free>
  return freep;
 7bf:	8b 15 00 50 00 00    	mov    0x5000,%edx
      if((p = morecore(nunits)) == 0)
 7c5:	83 c4 10             	add    $0x10,%esp
 7c8:	85 d2                	test   %edx,%edx
 7ca:	75 bc                	jne    788 <malloc+0x48>
        return 0;
  }
}
 7cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7cf:	31 c0                	xor    %eax,%eax
}
 7d1:	5b                   	pop    %ebx
 7d2:	5e                   	pop    %esi
 7d3:	5f                   	pop    %edi
 7d4:	5d                   	pop    %ebp
 7d5:	c3                   	ret    
    if(p->s.size >= nunits){
 7d6:	89 d0                	mov    %edx,%eax
 7d8:	89 fa                	mov    %edi,%edx
 7da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7e0:	39 ce                	cmp    %ecx,%esi
 7e2:	74 4c                	je     830 <malloc+0xf0>
        p->s.size -= nunits;
 7e4:	29 f1                	sub    %esi,%ecx
 7e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7ec:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 7ef:	89 15 00 50 00 00    	mov    %edx,0x5000
}
 7f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7f8:	83 c0 08             	add    $0x8,%eax
}
 7fb:	5b                   	pop    %ebx
 7fc:	5e                   	pop    %esi
 7fd:	5f                   	pop    %edi
 7fe:	5d                   	pop    %ebp
 7ff:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 800:	c7 05 00 50 00 00 04 	movl   $0x5004,0x5000
 807:	50 00 00 
    base.s.size = 0;
 80a:	bf 04 50 00 00       	mov    $0x5004,%edi
    base.s.ptr = freep = prevp = &base;
 80f:	c7 05 04 50 00 00 04 	movl   $0x5004,0x5004
 816:	50 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 819:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 81b:	c7 05 08 50 00 00 00 	movl   $0x0,0x5008
 822:	00 00 00 
    if(p->s.size >= nunits){
 825:	e9 42 ff ff ff       	jmp    76c <malloc+0x2c>
 82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 830:	8b 08                	mov    (%eax),%ecx
 832:	89 0a                	mov    %ecx,(%edx)
 834:	eb b9                	jmp    7ef <malloc+0xaf>
