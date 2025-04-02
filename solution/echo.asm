
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 47                	jle    65 <main+0x65>
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  23:	83 c3 01             	add    $0x1,%ebx
  26:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  2a:	39 f3                	cmp    %esi,%ebx
  2c:	74 22                	je     50 <main+0x50>
  2e:	66 90                	xchg   %ax,%ax
  30:	68 d8 07 00 00       	push   $0x7d8
  35:	83 c3 01             	add    $0x1,%ebx
  38:	50                   	push   %eax
  39:	68 da 07 00 00       	push   $0x7da
  3e:	6a 01                	push   $0x1
  40:	e8 6b 04 00 00       	call   4b0 <printf>
  45:	8b 44 9f fc          	mov    -0x4(%edi,%ebx,4),%eax
  49:	83 c4 10             	add    $0x10,%esp
  4c:	39 f3                	cmp    %esi,%ebx
  4e:	75 e0                	jne    30 <main+0x30>
  50:	68 df 07 00 00       	push   $0x7df
  55:	50                   	push   %eax
  56:	68 da 07 00 00       	push   $0x7da
  5b:	6a 01                	push   $0x1
  5d:	e8 4e 04 00 00       	call   4b0 <printf>
  62:	83 c4 10             	add    $0x10,%esp
  exit();
  65:	e8 d3 02 00 00       	call   33d <exit>
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
#include "x86.h"
#include "spinlock.h"

char*
strcpy(char *s, const char *t)
{
  70:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  71:	31 c0                	xor    %eax,%eax
{
  73:	89 e5                	mov    %esp,%ebp
  75:	53                   	push   %ebx
  76:	8b 4d 08             	mov    0x8(%ebp),%ecx
  79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  87:	83 c0 01             	add    $0x1,%eax
  8a:	84 d2                	test   %dl,%dl
  8c:	75 f2                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  91:	89 c8                	mov    %ecx,%eax
  93:	c9                   	leave  
  94:	c3                   	ret    
  95:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 55 08             	mov    0x8(%ebp),%edx
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  aa:	0f b6 02             	movzbl (%edx),%eax
  ad:	84 c0                	test   %al,%al
  af:	75 17                	jne    c8 <strcmp+0x28>
  b1:	eb 3a                	jmp    ed <strcmp+0x4d>
  b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b7:	90                   	nop
  b8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
  bc:	83 c2 01             	add    $0x1,%edx
  bf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
  c2:	84 c0                	test   %al,%al
  c4:	74 1a                	je     e0 <strcmp+0x40>
    p++, q++;
  c6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
  c8:	0f b6 19             	movzbl (%ecx),%ebx
  cb:	38 c3                	cmp    %al,%bl
  cd:	74 e9                	je     b8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
  cf:	29 d8                	sub    %ebx,%eax
}
  d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  d4:	c9                   	leave  
  d5:	c3                   	ret    
  d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
  e0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  e4:	31 c0                	xor    %eax,%eax
  e6:	29 d8                	sub    %ebx,%eax
}
  e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  eb:	c9                   	leave  
  ec:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
  ed:	0f b6 19             	movzbl (%ecx),%ebx
  f0:	31 c0                	xor    %eax,%eax
  f2:	eb db                	jmp    cf <strcmp+0x2f>
  f4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  ff:	90                   	nop

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 3a 00             	cmpb   $0x0,(%edx)
 109:	74 15                	je     120 <strlen+0x20>
 10b:	31 c0                	xor    %eax,%eax
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c0 01             	add    $0x1,%eax
 113:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 117:	89 c1                	mov    %eax,%ecx
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	89 c8                	mov    %ecx,%eax
 11d:	5d                   	pop    %ebp
 11e:	c3                   	ret    
 11f:	90                   	nop
  for(n = 0; s[n]; n++)
 120:	31 c9                	xor    %ecx,%ecx
}
 122:	5d                   	pop    %ebp
 123:	89 c8                	mov    %ecx,%eax
 125:	c3                   	ret    
 126:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12d:	8d 76 00             	lea    0x0(%esi),%esi

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	8b 7d fc             	mov    -0x4(%ebp),%edi
 145:	89 d0                	mov    %edx,%eax
 147:	c9                   	leave  
 148:	c3                   	ret    
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	8b 45 08             	mov    0x8(%ebp),%eax
 156:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	75 12                	jne    173 <strchr+0x23>
 161:	eb 1d                	jmp    180 <strchr+0x30>
 163:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 167:	90                   	nop
 168:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 16c:	83 c0 01             	add    $0x1,%eax
 16f:	84 d2                	test   %dl,%dl
 171:	74 0d                	je     180 <strchr+0x30>
    if(*s == c)
 173:	38 d1                	cmp    %dl,%cl
 175:	75 f1                	jne    168 <strchr+0x18>
      return (char*)s;
  return 0;
}
 177:	5d                   	pop    %ebp
 178:	c3                   	ret    
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 180:	31 c0                	xor    %eax,%eax
}
 182:	5d                   	pop    %ebp
 183:	c3                   	ret    
 184:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 18f:	90                   	nop

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 195:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 198:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 199:	31 db                	xor    %ebx,%ebx
{
 19b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 19e:	eb 27                	jmp    1c7 <gets+0x37>
    cc = read(0, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	6a 01                	push   $0x1
 1a5:	57                   	push   %edi
 1a6:	6a 00                	push   $0x0
 1a8:	e8 a8 01 00 00       	call   355 <read>
    if(cc < 1)
 1ad:	83 c4 10             	add    $0x10,%esp
 1b0:	85 c0                	test   %eax,%eax
 1b2:	7e 1d                	jle    1d1 <gets+0x41>
      break;
    buf[i++] = c;
 1b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
 1bb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1bf:	3c 0a                	cmp    $0xa,%al
 1c1:	74 1d                	je     1e0 <gets+0x50>
 1c3:	3c 0d                	cmp    $0xd,%al
 1c5:	74 19                	je     1e0 <gets+0x50>
  for(i=0; i+1 < max; ){
 1c7:	89 de                	mov    %ebx,%esi
 1c9:	83 c3 01             	add    $0x1,%ebx
 1cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1cf:	7c cf                	jl     1a0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 1d1:	8b 45 08             	mov    0x8(%ebp),%eax
 1d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1db:	5b                   	pop    %ebx
 1dc:	5e                   	pop    %esi
 1dd:	5f                   	pop    %edi
 1de:	5d                   	pop    %ebp
 1df:	c3                   	ret    
  buf[i] = '\0';
 1e0:	8b 45 08             	mov    0x8(%ebp),%eax
 1e3:	89 de                	mov    %ebx,%esi
 1e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 1e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ec:	5b                   	pop    %ebx
 1ed:	5e                   	pop    %esi
 1ee:	5f                   	pop    %edi
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    
 1f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ff:	90                   	nop

00000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 205:	83 ec 08             	sub    $0x8,%esp
 208:	6a 00                	push   $0x0
 20a:	ff 75 08             	pushl  0x8(%ebp)
 20d:	e8 6b 01 00 00       	call   37d <open>
  if(fd < 0)
 212:	83 c4 10             	add    $0x10,%esp
 215:	85 c0                	test   %eax,%eax
 217:	78 27                	js     240 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 219:	83 ec 08             	sub    $0x8,%esp
 21c:	ff 75 0c             	pushl  0xc(%ebp)
 21f:	89 c3                	mov    %eax,%ebx
 221:	50                   	push   %eax
 222:	e8 6e 01 00 00       	call   395 <fstat>
  close(fd);
 227:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 22a:	89 c6                	mov    %eax,%esi
  close(fd);
 22c:	e8 34 01 00 00       	call   365 <close>
  return r;
 231:	83 c4 10             	add    $0x10,%esp
}
 234:	8d 65 f8             	lea    -0x8(%ebp),%esp
 237:	89 f0                	mov    %esi,%eax
 239:	5b                   	pop    %ebx
 23a:	5e                   	pop    %esi
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 240:	be ff ff ff ff       	mov    $0xffffffff,%esi
 245:	eb ed                	jmp    234 <stat+0x34>
 247:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24e:	66 90                	xchg   %ax,%ax

00000250 <atoi>:

int
atoi(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 257:	0f be 02             	movsbl (%edx),%eax
 25a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 25d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 260:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 265:	77 1e                	ja     285 <atoi+0x35>
 267:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 270:	83 c2 01             	add    $0x1,%edx
 273:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 276:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 27a:	0f be 02             	movsbl (%edx),%eax
 27d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x20>
  return n;
}
 285:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 288:	89 c8                	mov    %ecx,%eax
 28a:	c9                   	leave  
 28b:	c3                   	ret    
 28c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000290 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	8b 45 10             	mov    0x10(%ebp),%eax
 297:	8b 55 08             	mov    0x8(%ebp),%edx
 29a:	56                   	push   %esi
 29b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 29e:	85 c0                	test   %eax,%eax
 2a0:	7e 13                	jle    2b5 <memmove+0x25>
 2a2:	01 d0                	add    %edx,%eax
  dst = vdst;
 2a4:	89 d7                	mov    %edx,%edi
 2a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2b0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2b1:	39 f8                	cmp    %edi,%eax
 2b3:	75 fb                	jne    2b0 <memmove+0x20>
  return vdst;
}
 2b5:	5e                   	pop    %esi
 2b6:	89 d0                	mov    %edx,%eax
 2b8:	5f                   	pop    %edi
 2b9:	5d                   	pop    %ebp
 2ba:	c3                   	ret    
 2bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2bf:	90                   	nop

000002c0 <thread_create>:

int
thread_create(void (*fn)(void *), void *arg)
{
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	53                   	push   %ebx
 2c4:	83 ec 10             	sub    $0x10,%esp
  void *stack = malloc(4096);
 2c7:	68 00 10 00 00       	push   $0x1000
 2cc:	e8 0f 04 00 00       	call   6e0 <malloc>
  if(stack == 0)
 2d1:	83 c4 10             	add    $0x10,%esp
 2d4:	85 c0                	test   %eax,%eax
 2d6:	74 3b                	je     313 <thread_create+0x53>
 2d8:	89 c3                	mov    %eax,%ebx
    return -1;
  
  // Check for page alignment.
  if(((uint)stack % 4096) != 0){
 2da:	a9 ff 0f 00 00       	test   $0xfff,%eax
 2df:	75 1f                	jne    300 <thread_create+0x40>
    free(stack);
    return -1;
  }
  
  int tid = clone(stack);
 2e1:	83 ec 0c             	sub    $0xc,%esp
 2e4:	50                   	push   %eax
 2e5:	e8 f3 00 00 00       	call   3dd <clone>
  if(tid < 0){
 2ea:	83 c4 10             	add    $0x10,%esp
 2ed:	85 c0                	test   %eax,%eax
 2ef:	78 0f                	js     300 <thread_create+0x40>
    free(stack);
    return -1;
  }
  
  if(tid == 0){
 2f1:	74 27                	je     31a <thread_create+0x5a>
    exit();
  }
  
  // Parent returns the new thread's id.
  return tid;
}
 2f3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 2f6:	c9                   	leave  
 2f7:	c3                   	ret    
 2f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ff:	90                   	nop
    free(stack);
 300:	83 ec 0c             	sub    $0xc,%esp
 303:	53                   	push   %ebx
 304:	e8 47 03 00 00       	call   650 <free>
    return -1;
 309:	83 c4 10             	add    $0x10,%esp
 30c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 311:	eb e0                	jmp    2f3 <thread_create+0x33>
    return -1;
 313:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 318:	eb d9                	jmp    2f3 <thread_create+0x33>
    fn(arg);
 31a:	83 ec 0c             	sub    $0xc,%esp
 31d:	ff 75 0c             	pushl  0xc(%ebp)
 320:	ff 55 08             	call   *0x8(%ebp)
    free(stack);
 323:	89 1c 24             	mov    %ebx,(%esp)
 326:	e8 25 03 00 00       	call   650 <free>
    exit();
 32b:	e8 0d 00 00 00       	call   33d <exit>

00000330 <thread_join>:

int
thread_join(void)
{
  return join();
 330:	e9 c0 00 00 00       	jmp    3f5 <join>

00000335 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 335:	b8 01 00 00 00       	mov    $0x1,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <exit>:
SYSCALL(exit)
 33d:	b8 02 00 00 00       	mov    $0x2,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <wait>:
SYSCALL(wait)
 345:	b8 03 00 00 00       	mov    $0x3,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <pipe>:
SYSCALL(pipe)
 34d:	b8 04 00 00 00       	mov    $0x4,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <read>:
SYSCALL(read)
 355:	b8 05 00 00 00       	mov    $0x5,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <write>:
SYSCALL(write)
 35d:	b8 10 00 00 00       	mov    $0x10,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <close>:
SYSCALL(close)
 365:	b8 15 00 00 00       	mov    $0x15,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <kill>:
SYSCALL(kill)
 36d:	b8 06 00 00 00       	mov    $0x6,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <exec>:
SYSCALL(exec)
 375:	b8 07 00 00 00       	mov    $0x7,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <open>:
SYSCALL(open)
 37d:	b8 0f 00 00 00       	mov    $0xf,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <mknod>:
SYSCALL(mknod)
 385:	b8 11 00 00 00       	mov    $0x11,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <unlink>:
SYSCALL(unlink)
 38d:	b8 12 00 00 00       	mov    $0x12,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <fstat>:
SYSCALL(fstat)
 395:	b8 08 00 00 00       	mov    $0x8,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <link>:
SYSCALL(link)
 39d:	b8 13 00 00 00       	mov    $0x13,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <mkdir>:
SYSCALL(mkdir)
 3a5:	b8 14 00 00 00       	mov    $0x14,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <chdir>:
SYSCALL(chdir)
 3ad:	b8 09 00 00 00       	mov    $0x9,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <dup>:
SYSCALL(dup)
 3b5:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <getpid>:
SYSCALL(getpid)
 3bd:	b8 0b 00 00 00       	mov    $0xb,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <sbrk>:
SYSCALL(sbrk)
 3c5:	b8 0c 00 00 00       	mov    $0xc,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <sleep>:
SYSCALL(sleep)
 3cd:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <uptime>:
SYSCALL(uptime)
 3d5:	b8 0e 00 00 00       	mov    $0xe,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <clone>:
SYSCALL(clone)
 3dd:	b8 16 00 00 00       	mov    $0x16,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <lock>:
SYSCALL(lock)
 3e5:	b8 17 00 00 00       	mov    $0x17,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <unlock>:
SYSCALL(unlock)
 3ed:	b8 18 00 00 00       	mov    $0x18,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <join>:
SYSCALL(join)
 3f5:	b8 19 00 00 00       	mov    $0x19,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    
 3fd:	66 90                	xchg   %ax,%ax
 3ff:	90                   	nop

00000400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	56                   	push   %esi
 405:	53                   	push   %ebx
 406:	83 ec 3c             	sub    $0x3c,%esp
 409:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 40c:	89 d1                	mov    %edx,%ecx
{
 40e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 411:	85 d2                	test   %edx,%edx
 413:	0f 89 7f 00 00 00    	jns    498 <printint+0x98>
 419:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 41d:	74 79                	je     498 <printint+0x98>
    neg = 1;
 41f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 426:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 428:	31 db                	xor    %ebx,%ebx
 42a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 42d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 430:	89 c8                	mov    %ecx,%eax
 432:	31 d2                	xor    %edx,%edx
 434:	89 cf                	mov    %ecx,%edi
 436:	f7 75 c4             	divl   -0x3c(%ebp)
 439:	0f b6 92 40 08 00 00 	movzbl 0x840(%edx),%edx
 440:	89 45 c0             	mov    %eax,-0x40(%ebp)
 443:	89 d8                	mov    %ebx,%eax
 445:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 448:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 44b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 44e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 451:	76 dd                	jbe    430 <printint+0x30>
  if(neg)
 453:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 456:	85 c9                	test   %ecx,%ecx
 458:	74 0c                	je     466 <printint+0x66>
    buf[i++] = '-';
 45a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 45f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 461:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 466:	8b 7d b8             	mov    -0x48(%ebp),%edi
 469:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 46d:	eb 07                	jmp    476 <printint+0x76>
 46f:	90                   	nop
    putc(fd, buf[i]);
 470:	0f b6 13             	movzbl (%ebx),%edx
 473:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 476:	83 ec 04             	sub    $0x4,%esp
 479:	88 55 d7             	mov    %dl,-0x29(%ebp)
 47c:	6a 01                	push   $0x1
 47e:	56                   	push   %esi
 47f:	57                   	push   %edi
 480:	e8 d8 fe ff ff       	call   35d <write>
  while(--i >= 0)
 485:	83 c4 10             	add    $0x10,%esp
 488:	39 de                	cmp    %ebx,%esi
 48a:	75 e4                	jne    470 <printint+0x70>
}
 48c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48f:	5b                   	pop    %ebx
 490:	5e                   	pop    %esi
 491:	5f                   	pop    %edi
 492:	5d                   	pop    %ebp
 493:	c3                   	ret    
 494:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 498:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 49f:	eb 87                	jmp    428 <printint+0x28>
 4a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4af:	90                   	nop

000004b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4b9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 4bc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 4bf:	0f b6 13             	movzbl (%ebx),%edx
 4c2:	84 d2                	test   %dl,%dl
 4c4:	74 6a                	je     530 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 4c6:	8d 45 10             	lea    0x10(%ebp),%eax
 4c9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 4cc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4cf:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 4d1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4d4:	eb 36                	jmp    50c <printf+0x5c>
 4d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4dd:	8d 76 00             	lea    0x0(%esi),%esi
 4e0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4e3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 4e8:	83 f8 25             	cmp    $0x25,%eax
 4eb:	74 15                	je     502 <printf+0x52>
  write(fd, &c, 1);
 4ed:	83 ec 04             	sub    $0x4,%esp
 4f0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 4f3:	6a 01                	push   $0x1
 4f5:	57                   	push   %edi
 4f6:	56                   	push   %esi
 4f7:	e8 61 fe ff ff       	call   35d <write>
 4fc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 4ff:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 502:	0f b6 13             	movzbl (%ebx),%edx
 505:	83 c3 01             	add    $0x1,%ebx
 508:	84 d2                	test   %dl,%dl
 50a:	74 24                	je     530 <printf+0x80>
    c = fmt[i] & 0xff;
 50c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 50f:	85 c9                	test   %ecx,%ecx
 511:	74 cd                	je     4e0 <printf+0x30>
      }
    } else if(state == '%'){
 513:	83 f9 25             	cmp    $0x25,%ecx
 516:	75 ea                	jne    502 <printf+0x52>
      if(c == 'd'){
 518:	83 f8 25             	cmp    $0x25,%eax
 51b:	0f 84 07 01 00 00    	je     628 <printf+0x178>
 521:	83 e8 63             	sub    $0x63,%eax
 524:	83 f8 15             	cmp    $0x15,%eax
 527:	77 17                	ja     540 <printf+0x90>
 529:	ff 24 85 e8 07 00 00 	jmp    *0x7e8(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 530:	8d 65 f4             	lea    -0xc(%ebp),%esp
 533:	5b                   	pop    %ebx
 534:	5e                   	pop    %esi
 535:	5f                   	pop    %edi
 536:	5d                   	pop    %ebp
 537:	c3                   	ret    
 538:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 53f:	90                   	nop
  write(fd, &c, 1);
 540:	83 ec 04             	sub    $0x4,%esp
 543:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 546:	6a 01                	push   $0x1
 548:	57                   	push   %edi
 549:	56                   	push   %esi
 54a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 54e:	e8 0a fe ff ff       	call   35d <write>
        putc(fd, c);
 553:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 557:	83 c4 0c             	add    $0xc,%esp
 55a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 55d:	6a 01                	push   $0x1
 55f:	57                   	push   %edi
 560:	56                   	push   %esi
 561:	e8 f7 fd ff ff       	call   35d <write>
        putc(fd, c);
 566:	83 c4 10             	add    $0x10,%esp
      state = 0;
 569:	31 c9                	xor    %ecx,%ecx
 56b:	eb 95                	jmp    502 <printf+0x52>
 56d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 570:	83 ec 0c             	sub    $0xc,%esp
 573:	b9 10 00 00 00       	mov    $0x10,%ecx
 578:	6a 00                	push   $0x0
 57a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 57d:	8b 10                	mov    (%eax),%edx
 57f:	89 f0                	mov    %esi,%eax
 581:	e8 7a fe ff ff       	call   400 <printint>
        ap++;
 586:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 58a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 58d:	31 c9                	xor    %ecx,%ecx
 58f:	e9 6e ff ff ff       	jmp    502 <printf+0x52>
 594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 598:	8b 45 d0             	mov    -0x30(%ebp),%eax
 59b:	8b 10                	mov    (%eax),%edx
        ap++;
 59d:	83 c0 04             	add    $0x4,%eax
 5a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5a3:	85 d2                	test   %edx,%edx
 5a5:	0f 84 8d 00 00 00    	je     638 <printf+0x188>
        while(*s != 0){
 5ab:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 5ae:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 5b0:	84 c0                	test   %al,%al
 5b2:	0f 84 4a ff ff ff    	je     502 <printf+0x52>
 5b8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 5bb:	89 d3                	mov    %edx,%ebx
 5bd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 5c0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5c3:	83 c3 01             	add    $0x1,%ebx
 5c6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5c9:	6a 01                	push   $0x1
 5cb:	57                   	push   %edi
 5cc:	56                   	push   %esi
 5cd:	e8 8b fd ff ff       	call   35d <write>
        while(*s != 0){
 5d2:	0f b6 03             	movzbl (%ebx),%eax
 5d5:	83 c4 10             	add    $0x10,%esp
 5d8:	84 c0                	test   %al,%al
 5da:	75 e4                	jne    5c0 <printf+0x110>
      state = 0;
 5dc:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 5df:	31 c9                	xor    %ecx,%ecx
 5e1:	e9 1c ff ff ff       	jmp    502 <printf+0x52>
 5e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 5f0:	83 ec 0c             	sub    $0xc,%esp
 5f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5f8:	6a 01                	push   $0x1
 5fa:	e9 7b ff ff ff       	jmp    57a <printf+0xca>
 5ff:	90                   	nop
        putc(fd, *ap);
 600:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 603:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 606:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 608:	6a 01                	push   $0x1
 60a:	57                   	push   %edi
 60b:	56                   	push   %esi
        putc(fd, *ap);
 60c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 60f:	e8 49 fd ff ff       	call   35d <write>
        ap++;
 614:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 618:	83 c4 10             	add    $0x10,%esp
      state = 0;
 61b:	31 c9                	xor    %ecx,%ecx
 61d:	e9 e0 fe ff ff       	jmp    502 <printf+0x52>
 622:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 628:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 62b:	83 ec 04             	sub    $0x4,%esp
 62e:	e9 2a ff ff ff       	jmp    55d <printf+0xad>
 633:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 637:	90                   	nop
          s = "(null)";
 638:	ba e1 07 00 00       	mov    $0x7e1,%edx
        while(*s != 0){
 63d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 640:	b8 28 00 00 00       	mov    $0x28,%eax
 645:	89 d3                	mov    %edx,%ebx
 647:	e9 74 ff ff ff       	jmp    5c0 <printf+0x110>
 64c:	66 90                	xchg   %ax,%ax
 64e:	66 90                	xchg   %ax,%ax

00000650 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 650:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 651:	a1 30 0b 00 00       	mov    0xb30,%eax
{
 656:	89 e5                	mov    %esp,%ebp
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	53                   	push   %ebx
 65b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 65e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 668:	89 c2                	mov    %eax,%edx
 66a:	8b 00                	mov    (%eax),%eax
 66c:	39 ca                	cmp    %ecx,%edx
 66e:	73 30                	jae    6a0 <free+0x50>
 670:	39 c1                	cmp    %eax,%ecx
 672:	72 04                	jb     678 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 674:	39 c2                	cmp    %eax,%edx
 676:	72 f0                	jb     668 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 678:	8b 73 fc             	mov    -0x4(%ebx),%esi
 67b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 67e:	39 f8                	cmp    %edi,%eax
 680:	74 30                	je     6b2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 682:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 685:	8b 42 04             	mov    0x4(%edx),%eax
 688:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 68b:	39 f1                	cmp    %esi,%ecx
 68d:	74 3a                	je     6c9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 68f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 691:	5b                   	pop    %ebx
  freep = p;
 692:	89 15 30 0b 00 00    	mov    %edx,0xb30
}
 698:	5e                   	pop    %esi
 699:	5f                   	pop    %edi
 69a:	5d                   	pop    %ebp
 69b:	c3                   	ret    
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a0:	39 c2                	cmp    %eax,%edx
 6a2:	72 c4                	jb     668 <free+0x18>
 6a4:	39 c1                	cmp    %eax,%ecx
 6a6:	73 c0                	jae    668 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 6a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ae:	39 f8                	cmp    %edi,%eax
 6b0:	75 d0                	jne    682 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 6b2:	03 70 04             	add    0x4(%eax),%esi
 6b5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6b8:	8b 02                	mov    (%edx),%eax
 6ba:	8b 00                	mov    (%eax),%eax
 6bc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 6bf:	8b 42 04             	mov    0x4(%edx),%eax
 6c2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 6c5:	39 f1                	cmp    %esi,%ecx
 6c7:	75 c6                	jne    68f <free+0x3f>
    p->s.size += bp->s.size;
 6c9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 6cc:	89 15 30 0b 00 00    	mov    %edx,0xb30
    p->s.size += bp->s.size;
 6d2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 6d5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 6d8:	89 0a                	mov    %ecx,(%edx)
}
 6da:	5b                   	pop    %ebx
 6db:	5e                   	pop    %esi
 6dc:	5f                   	pop    %edi
 6dd:	5d                   	pop    %ebp
 6de:	c3                   	ret    
 6df:	90                   	nop

000006e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	57                   	push   %edi
 6e4:	56                   	push   %esi
 6e5:	53                   	push   %ebx
 6e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6ec:	8b 3d 30 0b 00 00    	mov    0xb30,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f2:	8d 70 07             	lea    0x7(%eax),%esi
 6f5:	c1 ee 03             	shr    $0x3,%esi
 6f8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 6fb:	85 ff                	test   %edi,%edi
 6fd:	0f 84 9d 00 00 00    	je     7a0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 703:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 705:	8b 4a 04             	mov    0x4(%edx),%ecx
 708:	39 f1                	cmp    %esi,%ecx
 70a:	73 6a                	jae    776 <malloc+0x96>
 70c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 711:	39 de                	cmp    %ebx,%esi
 713:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 716:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 71d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 720:	eb 17                	jmp    739 <malloc+0x59>
 722:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 728:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 72a:	8b 48 04             	mov    0x4(%eax),%ecx
 72d:	39 f1                	cmp    %esi,%ecx
 72f:	73 4f                	jae    780 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 731:	8b 3d 30 0b 00 00    	mov    0xb30,%edi
 737:	89 c2                	mov    %eax,%edx
 739:	39 d7                	cmp    %edx,%edi
 73b:	75 eb                	jne    728 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 73d:	83 ec 0c             	sub    $0xc,%esp
 740:	ff 75 e4             	pushl  -0x1c(%ebp)
 743:	e8 7d fc ff ff       	call   3c5 <sbrk>
  if(p == (char*)-1)
 748:	83 c4 10             	add    $0x10,%esp
 74b:	83 f8 ff             	cmp    $0xffffffff,%eax
 74e:	74 1c                	je     76c <malloc+0x8c>
  hp->s.size = nu;
 750:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 753:	83 ec 0c             	sub    $0xc,%esp
 756:	83 c0 08             	add    $0x8,%eax
 759:	50                   	push   %eax
 75a:	e8 f1 fe ff ff       	call   650 <free>
  return freep;
 75f:	8b 15 30 0b 00 00    	mov    0xb30,%edx
      if((p = morecore(nunits)) == 0)
 765:	83 c4 10             	add    $0x10,%esp
 768:	85 d2                	test   %edx,%edx
 76a:	75 bc                	jne    728 <malloc+0x48>
        return 0;
  }
}
 76c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 76f:	31 c0                	xor    %eax,%eax
}
 771:	5b                   	pop    %ebx
 772:	5e                   	pop    %esi
 773:	5f                   	pop    %edi
 774:	5d                   	pop    %ebp
 775:	c3                   	ret    
    if(p->s.size >= nunits){
 776:	89 d0                	mov    %edx,%eax
 778:	89 fa                	mov    %edi,%edx
 77a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 780:	39 ce                	cmp    %ecx,%esi
 782:	74 4c                	je     7d0 <malloc+0xf0>
        p->s.size -= nunits;
 784:	29 f1                	sub    %esi,%ecx
 786:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 789:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 78c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 78f:	89 15 30 0b 00 00    	mov    %edx,0xb30
}
 795:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 798:	83 c0 08             	add    $0x8,%eax
}
 79b:	5b                   	pop    %ebx
 79c:	5e                   	pop    %esi
 79d:	5f                   	pop    %edi
 79e:	5d                   	pop    %ebp
 79f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 7a0:	c7 05 30 0b 00 00 34 	movl   $0xb34,0xb30
 7a7:	0b 00 00 
    base.s.size = 0;
 7aa:	bf 34 0b 00 00       	mov    $0xb34,%edi
    base.s.ptr = freep = prevp = &base;
 7af:	c7 05 34 0b 00 00 34 	movl   $0xb34,0xb34
 7b6:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 7bb:	c7 05 38 0b 00 00 00 	movl   $0x0,0xb38
 7c2:	00 00 00 
    if(p->s.size >= nunits){
 7c5:	e9 42 ff ff ff       	jmp    70c <malloc+0x2c>
 7ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 7d0:	8b 08                	mov    (%eax),%ecx
 7d2:	89 0a                	mov    %ecx,(%edx)
 7d4:	eb b9                	jmp    78f <malloc+0xaf>
