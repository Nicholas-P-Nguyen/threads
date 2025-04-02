
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   f:	83 ec 08             	sub    $0x8,%esp
  12:	6a 02                	push   $0x2
  14:	68 58 08 00 00       	push   $0x858
  19:	e8 df 03 00 00       	call   3fd <open>
  1e:	83 c4 10             	add    $0x10,%esp
  21:	85 c0                	test   %eax,%eax
  23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
  29:	83 ec 0c             	sub    $0xc,%esp
  2c:	6a 00                	push   $0x0
  2e:	e8 02 04 00 00       	call   435 <dup>
  dup(0);  // stderr
  33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  3a:	e8 f6 03 00 00       	call   435 <dup>
  3f:	83 c4 10             	add    $0x10,%esp
  42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
  48:	83 ec 08             	sub    $0x8,%esp
  4b:	68 60 08 00 00       	push   $0x860
  50:	6a 01                	push   $0x1
  52:	e8 d9 04 00 00       	call   530 <printf>
    pid = fork();
  57:	e8 59 03 00 00       	call   3b5 <fork>
    if(pid < 0){
  5c:	83 c4 10             	add    $0x10,%esp
    pid = fork();
  5f:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
  61:	85 c0                	test   %eax,%eax
  63:	78 2c                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
  65:	74 3d                	je     a4 <main+0xa4>
  67:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6e:	66 90                	xchg   %ax,%ax
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  70:	e8 50 03 00 00       	call   3c5 <wait>
  75:	85 c0                	test   %eax,%eax
  77:	78 cf                	js     48 <main+0x48>
  79:	39 c3                	cmp    %eax,%ebx
  7b:	74 cb                	je     48 <main+0x48>
      printf(1, "zombie!\n");
  7d:	83 ec 08             	sub    $0x8,%esp
  80:	68 9f 08 00 00       	push   $0x89f
  85:	6a 01                	push   $0x1
  87:	e8 a4 04 00 00       	call   530 <printf>
  8c:	83 c4 10             	add    $0x10,%esp
  8f:	eb df                	jmp    70 <main+0x70>
      printf(1, "init: fork failed\n");
  91:	53                   	push   %ebx
  92:	53                   	push   %ebx
  93:	68 73 08 00 00       	push   $0x873
  98:	6a 01                	push   $0x1
  9a:	e8 91 04 00 00       	call   530 <printf>
      exit();
  9f:	e8 19 03 00 00       	call   3bd <exit>
      exec("sh", argv);
  a4:	50                   	push   %eax
  a5:	50                   	push   %eax
  a6:	68 f0 0b 00 00       	push   $0xbf0
  ab:	68 86 08 00 00       	push   $0x886
  b0:	e8 40 03 00 00       	call   3f5 <exec>
      printf(1, "init: exec sh failed\n");
  b5:	5a                   	pop    %edx
  b6:	59                   	pop    %ecx
  b7:	68 89 08 00 00       	push   $0x889
  bc:	6a 01                	push   $0x1
  be:	e8 6d 04 00 00       	call   530 <printf>
      exit();
  c3:	e8 f5 02 00 00       	call   3bd <exit>
    mknod("console", 1, 1);
  c8:	50                   	push   %eax
  c9:	6a 01                	push   $0x1
  cb:	6a 01                	push   $0x1
  cd:	68 58 08 00 00       	push   $0x858
  d2:	e8 2e 03 00 00       	call   405 <mknod>
    open("console", O_RDWR);
  d7:	58                   	pop    %eax
  d8:	5a                   	pop    %edx
  d9:	6a 02                	push   $0x2
  db:	68 58 08 00 00       	push   $0x858
  e0:	e8 18 03 00 00       	call   3fd <open>
  e5:	83 c4 10             	add    $0x10,%esp
  e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
  ed:	66 90                	xchg   %ax,%ax
  ef:	90                   	nop

000000f0 <strcpy>:
#include "x86.h"
#include "spinlock.h"

char*
strcpy(char *s, const char *t)
{
  f0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  f1:	31 c0                	xor    %eax,%eax
{
  f3:	89 e5                	mov    %esp,%ebp
  f5:	53                   	push   %ebx
  f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 100:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 104:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 107:	83 c0 01             	add    $0x1,%eax
 10a:	84 d2                	test   %dl,%dl
 10c:	75 f2                	jne    100 <strcpy+0x10>
    ;
  return os;
}
 10e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 111:	89 c8                	mov    %ecx,%eax
 113:	c9                   	leave  
 114:	c3                   	ret    
 115:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	53                   	push   %ebx
 124:	8b 55 08             	mov    0x8(%ebp),%edx
 127:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 12a:	0f b6 02             	movzbl (%edx),%eax
 12d:	84 c0                	test   %al,%al
 12f:	75 17                	jne    148 <strcmp+0x28>
 131:	eb 3a                	jmp    16d <strcmp+0x4d>
 133:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 137:	90                   	nop
 138:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 13c:	83 c2 01             	add    $0x1,%edx
 13f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 142:	84 c0                	test   %al,%al
 144:	74 1a                	je     160 <strcmp+0x40>
    p++, q++;
 146:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 148:	0f b6 19             	movzbl (%ecx),%ebx
 14b:	38 c3                	cmp    %al,%bl
 14d:	74 e9                	je     138 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 14f:	29 d8                	sub    %ebx,%eax
}
 151:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 154:	c9                   	leave  
 155:	c3                   	ret    
 156:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 15d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 160:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 164:	31 c0                	xor    %eax,%eax
 166:	29 d8                	sub    %ebx,%eax
}
 168:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 16b:	c9                   	leave  
 16c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 16d:	0f b6 19             	movzbl (%ecx),%ebx
 170:	31 c0                	xor    %eax,%eax
 172:	eb db                	jmp    14f <strcmp+0x2f>
 174:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 17b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 17f:	90                   	nop

00000180 <strlen>:

uint
strlen(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 186:	80 3a 00             	cmpb   $0x0,(%edx)
 189:	74 15                	je     1a0 <strlen+0x20>
 18b:	31 c0                	xor    %eax,%eax
 18d:	8d 76 00             	lea    0x0(%esi),%esi
 190:	83 c0 01             	add    $0x1,%eax
 193:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 197:	89 c1                	mov    %eax,%ecx
 199:	75 f5                	jne    190 <strlen+0x10>
    ;
  return n;
}
 19b:	89 c8                	mov    %ecx,%eax
 19d:	5d                   	pop    %ebp
 19e:	c3                   	ret    
 19f:	90                   	nop
  for(n = 0; s[n]; n++)
 1a0:	31 c9                	xor    %ecx,%ecx
}
 1a2:	5d                   	pop    %ebp
 1a3:	89 c8                	mov    %ecx,%eax
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi

000001b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bd:	89 d7                	mov    %edx,%edi
 1bf:	fc                   	cld    
 1c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1c2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1c5:	89 d0                	mov    %edx,%eax
 1c7:	c9                   	leave  
 1c8:	c3                   	ret    
 1c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001d0 <strchr>:

char*
strchr(const char *s, char c)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 1da:	0f b6 10             	movzbl (%eax),%edx
 1dd:	84 d2                	test   %dl,%dl
 1df:	75 12                	jne    1f3 <strchr+0x23>
 1e1:	eb 1d                	jmp    200 <strchr+0x30>
 1e3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1e7:	90                   	nop
 1e8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 1ec:	83 c0 01             	add    $0x1,%eax
 1ef:	84 d2                	test   %dl,%dl
 1f1:	74 0d                	je     200 <strchr+0x30>
    if(*s == c)
 1f3:	38 d1                	cmp    %dl,%cl
 1f5:	75 f1                	jne    1e8 <strchr+0x18>
      return (char*)s;
  return 0;
}
 1f7:	5d                   	pop    %ebp
 1f8:	c3                   	ret    
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 200:	31 c0                	xor    %eax,%eax
}
 202:	5d                   	pop    %ebp
 203:	c3                   	ret    
 204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <gets>:

char*
gets(char *buf, int max)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	57                   	push   %edi
 214:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 215:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 218:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 219:	31 db                	xor    %ebx,%ebx
{
 21b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 21e:	eb 27                	jmp    247 <gets+0x37>
    cc = read(0, &c, 1);
 220:	83 ec 04             	sub    $0x4,%esp
 223:	6a 01                	push   $0x1
 225:	57                   	push   %edi
 226:	6a 00                	push   $0x0
 228:	e8 a8 01 00 00       	call   3d5 <read>
    if(cc < 1)
 22d:	83 c4 10             	add    $0x10,%esp
 230:	85 c0                	test   %eax,%eax
 232:	7e 1d                	jle    251 <gets+0x41>
      break;
    buf[i++] = c;
 234:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 238:	8b 55 08             	mov    0x8(%ebp),%edx
 23b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 23f:	3c 0a                	cmp    $0xa,%al
 241:	74 1d                	je     260 <gets+0x50>
 243:	3c 0d                	cmp    $0xd,%al
 245:	74 19                	je     260 <gets+0x50>
  for(i=0; i+1 < max; ){
 247:	89 de                	mov    %ebx,%esi
 249:	83 c3 01             	add    $0x1,%ebx
 24c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 24f:	7c cf                	jl     220 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 251:	8b 45 08             	mov    0x8(%ebp),%eax
 254:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 258:	8d 65 f4             	lea    -0xc(%ebp),%esp
 25b:	5b                   	pop    %ebx
 25c:	5e                   	pop    %esi
 25d:	5f                   	pop    %edi
 25e:	5d                   	pop    %ebp
 25f:	c3                   	ret    
  buf[i] = '\0';
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	89 de                	mov    %ebx,%esi
 265:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 269:	8d 65 f4             	lea    -0xc(%ebp),%esp
 26c:	5b                   	pop    %ebx
 26d:	5e                   	pop    %esi
 26e:	5f                   	pop    %edi
 26f:	5d                   	pop    %ebp
 270:	c3                   	ret    
 271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 278:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <stat>:

int
stat(const char *n, struct stat *st)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 285:	83 ec 08             	sub    $0x8,%esp
 288:	6a 00                	push   $0x0
 28a:	ff 75 08             	pushl  0x8(%ebp)
 28d:	e8 6b 01 00 00       	call   3fd <open>
  if(fd < 0)
 292:	83 c4 10             	add    $0x10,%esp
 295:	85 c0                	test   %eax,%eax
 297:	78 27                	js     2c0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	ff 75 0c             	pushl  0xc(%ebp)
 29f:	89 c3                	mov    %eax,%ebx
 2a1:	50                   	push   %eax
 2a2:	e8 6e 01 00 00       	call   415 <fstat>
  close(fd);
 2a7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2aa:	89 c6                	mov    %eax,%esi
  close(fd);
 2ac:	e8 34 01 00 00       	call   3e5 <close>
  return r;
 2b1:	83 c4 10             	add    $0x10,%esp
}
 2b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2b7:	89 f0                	mov    %esi,%eax
 2b9:	5b                   	pop    %ebx
 2ba:	5e                   	pop    %esi
 2bb:	5d                   	pop    %ebp
 2bc:	c3                   	ret    
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2c0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2c5:	eb ed                	jmp    2b4 <stat+0x34>
 2c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ce:	66 90                	xchg   %ax,%ax

000002d0 <atoi>:

int
atoi(const char *s)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	53                   	push   %ebx
 2d4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d7:	0f be 02             	movsbl (%edx),%eax
 2da:	8d 48 d0             	lea    -0x30(%eax),%ecx
 2dd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 2e0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 2e5:	77 1e                	ja     305 <atoi+0x35>
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 2f0:	83 c2 01             	add    $0x1,%edx
 2f3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 2f6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 2fa:	0f be 02             	movsbl (%edx),%eax
 2fd:	8d 58 d0             	lea    -0x30(%eax),%ebx
 300:	80 fb 09             	cmp    $0x9,%bl
 303:	76 eb                	jbe    2f0 <atoi+0x20>
  return n;
}
 305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 308:	89 c8                	mov    %ecx,%eax
 30a:	c9                   	leave  
 30b:	c3                   	ret    
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	57                   	push   %edi
 314:	8b 45 10             	mov    0x10(%ebp),%eax
 317:	8b 55 08             	mov    0x8(%ebp),%edx
 31a:	56                   	push   %esi
 31b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 31e:	85 c0                	test   %eax,%eax
 320:	7e 13                	jle    335 <memmove+0x25>
 322:	01 d0                	add    %edx,%eax
  dst = vdst;
 324:	89 d7                	mov    %edx,%edi
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 330:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 331:	39 f8                	cmp    %edi,%eax
 333:	75 fb                	jne    330 <memmove+0x20>
  return vdst;
}
 335:	5e                   	pop    %esi
 336:	89 d0                	mov    %edx,%eax
 338:	5f                   	pop    %edi
 339:	5d                   	pop    %ebp
 33a:	c3                   	ret    
 33b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 33f:	90                   	nop

00000340 <thread_create>:

int
thread_create(void (*fn)(void *), void *arg)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	53                   	push   %ebx
 344:	83 ec 10             	sub    $0x10,%esp
  void *stack = malloc(4096);
 347:	68 00 10 00 00       	push   $0x1000
 34c:	e8 0f 04 00 00       	call   760 <malloc>
  if(stack == 0)
 351:	83 c4 10             	add    $0x10,%esp
 354:	85 c0                	test   %eax,%eax
 356:	74 3b                	je     393 <thread_create+0x53>
 358:	89 c3                	mov    %eax,%ebx
    return -1;
  
  // Check for page alignment.
  if(((uint)stack % 4096) != 0){
 35a:	a9 ff 0f 00 00       	test   $0xfff,%eax
 35f:	75 1f                	jne    380 <thread_create+0x40>
    free(stack);
    return -1;
  }
  
  int tid = clone(stack);
 361:	83 ec 0c             	sub    $0xc,%esp
 364:	50                   	push   %eax
 365:	e8 f3 00 00 00       	call   45d <clone>
  if(tid < 0){
 36a:	83 c4 10             	add    $0x10,%esp
 36d:	85 c0                	test   %eax,%eax
 36f:	78 0f                	js     380 <thread_create+0x40>
    free(stack);
    return -1;
  }
  
  if(tid == 0){
 371:	74 27                	je     39a <thread_create+0x5a>
    exit();
  }
  
  // Parent returns the new thread's id.
  return tid;
}
 373:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 376:	c9                   	leave  
 377:	c3                   	ret    
 378:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37f:	90                   	nop
    free(stack);
 380:	83 ec 0c             	sub    $0xc,%esp
 383:	53                   	push   %ebx
 384:	e8 47 03 00 00       	call   6d0 <free>
    return -1;
 389:	83 c4 10             	add    $0x10,%esp
 38c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 391:	eb e0                	jmp    373 <thread_create+0x33>
    return -1;
 393:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 398:	eb d9                	jmp    373 <thread_create+0x33>
    fn(arg);
 39a:	83 ec 0c             	sub    $0xc,%esp
 39d:	ff 75 0c             	pushl  0xc(%ebp)
 3a0:	ff 55 08             	call   *0x8(%ebp)
    free(stack);
 3a3:	89 1c 24             	mov    %ebx,(%esp)
 3a6:	e8 25 03 00 00       	call   6d0 <free>
    exit();
 3ab:	e8 0d 00 00 00       	call   3bd <exit>

000003b0 <thread_join>:

int
thread_join(void)
{
  return join();
 3b0:	e9 c0 00 00 00       	jmp    475 <join>

000003b5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3b5:	b8 01 00 00 00       	mov    $0x1,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <exit>:
SYSCALL(exit)
 3bd:	b8 02 00 00 00       	mov    $0x2,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <wait>:
SYSCALL(wait)
 3c5:	b8 03 00 00 00       	mov    $0x3,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <pipe>:
SYSCALL(pipe)
 3cd:	b8 04 00 00 00       	mov    $0x4,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <read>:
SYSCALL(read)
 3d5:	b8 05 00 00 00       	mov    $0x5,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <write>:
SYSCALL(write)
 3dd:	b8 10 00 00 00       	mov    $0x10,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <close>:
SYSCALL(close)
 3e5:	b8 15 00 00 00       	mov    $0x15,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <kill>:
SYSCALL(kill)
 3ed:	b8 06 00 00 00       	mov    $0x6,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <exec>:
SYSCALL(exec)
 3f5:	b8 07 00 00 00       	mov    $0x7,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <open>:
SYSCALL(open)
 3fd:	b8 0f 00 00 00       	mov    $0xf,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <mknod>:
SYSCALL(mknod)
 405:	b8 11 00 00 00       	mov    $0x11,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <unlink>:
SYSCALL(unlink)
 40d:	b8 12 00 00 00       	mov    $0x12,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <fstat>:
SYSCALL(fstat)
 415:	b8 08 00 00 00       	mov    $0x8,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <link>:
SYSCALL(link)
 41d:	b8 13 00 00 00       	mov    $0x13,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <mkdir>:
SYSCALL(mkdir)
 425:	b8 14 00 00 00       	mov    $0x14,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <chdir>:
SYSCALL(chdir)
 42d:	b8 09 00 00 00       	mov    $0x9,%eax
 432:	cd 40                	int    $0x40
 434:	c3                   	ret    

00000435 <dup>:
SYSCALL(dup)
 435:	b8 0a 00 00 00       	mov    $0xa,%eax
 43a:	cd 40                	int    $0x40
 43c:	c3                   	ret    

0000043d <getpid>:
SYSCALL(getpid)
 43d:	b8 0b 00 00 00       	mov    $0xb,%eax
 442:	cd 40                	int    $0x40
 444:	c3                   	ret    

00000445 <sbrk>:
SYSCALL(sbrk)
 445:	b8 0c 00 00 00       	mov    $0xc,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <sleep>:
SYSCALL(sleep)
 44d:	b8 0d 00 00 00       	mov    $0xd,%eax
 452:	cd 40                	int    $0x40
 454:	c3                   	ret    

00000455 <uptime>:
SYSCALL(uptime)
 455:	b8 0e 00 00 00       	mov    $0xe,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <clone>:
SYSCALL(clone)
 45d:	b8 16 00 00 00       	mov    $0x16,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <lock>:
SYSCALL(lock)
 465:	b8 17 00 00 00       	mov    $0x17,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    

0000046d <unlock>:
SYSCALL(unlock)
 46d:	b8 18 00 00 00       	mov    $0x18,%eax
 472:	cd 40                	int    $0x40
 474:	c3                   	ret    

00000475 <join>:
SYSCALL(join)
 475:	b8 19 00 00 00       	mov    $0x19,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    
 47d:	66 90                	xchg   %ax,%ax
 47f:	90                   	nop

00000480 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 480:	55                   	push   %ebp
 481:	89 e5                	mov    %esp,%ebp
 483:	57                   	push   %edi
 484:	56                   	push   %esi
 485:	53                   	push   %ebx
 486:	83 ec 3c             	sub    $0x3c,%esp
 489:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 48c:	89 d1                	mov    %edx,%ecx
{
 48e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 491:	85 d2                	test   %edx,%edx
 493:	0f 89 7f 00 00 00    	jns    518 <printint+0x98>
 499:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 49d:	74 79                	je     518 <printint+0x98>
    neg = 1;
 49f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4a6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4a8:	31 db                	xor    %ebx,%ebx
 4aa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4ad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 4b0:	89 c8                	mov    %ecx,%eax
 4b2:	31 d2                	xor    %edx,%edx
 4b4:	89 cf                	mov    %ecx,%edi
 4b6:	f7 75 c4             	divl   -0x3c(%ebp)
 4b9:	0f b6 92 08 09 00 00 	movzbl 0x908(%edx),%edx
 4c0:	89 45 c0             	mov    %eax,-0x40(%ebp)
 4c3:	89 d8                	mov    %ebx,%eax
 4c5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 4c8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 4cb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 4ce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 4d1:	76 dd                	jbe    4b0 <printint+0x30>
  if(neg)
 4d3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 4d6:	85 c9                	test   %ecx,%ecx
 4d8:	74 0c                	je     4e6 <printint+0x66>
    buf[i++] = '-';
 4da:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 4df:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 4e1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 4e6:	8b 7d b8             	mov    -0x48(%ebp),%edi
 4e9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 4ed:	eb 07                	jmp    4f6 <printint+0x76>
 4ef:	90                   	nop
    putc(fd, buf[i]);
 4f0:	0f b6 13             	movzbl (%ebx),%edx
 4f3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 4f6:	83 ec 04             	sub    $0x4,%esp
 4f9:	88 55 d7             	mov    %dl,-0x29(%ebp)
 4fc:	6a 01                	push   $0x1
 4fe:	56                   	push   %esi
 4ff:	57                   	push   %edi
 500:	e8 d8 fe ff ff       	call   3dd <write>
  while(--i >= 0)
 505:	83 c4 10             	add    $0x10,%esp
 508:	39 de                	cmp    %ebx,%esi
 50a:	75 e4                	jne    4f0 <printint+0x70>
}
 50c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 50f:	5b                   	pop    %ebx
 510:	5e                   	pop    %esi
 511:	5f                   	pop    %edi
 512:	5d                   	pop    %ebp
 513:	c3                   	ret    
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 518:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 51f:	eb 87                	jmp    4a8 <printint+0x28>
 521:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 528:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 52f:	90                   	nop

00000530 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 539:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 53c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 53f:	0f b6 13             	movzbl (%ebx),%edx
 542:	84 d2                	test   %dl,%dl
 544:	74 6a                	je     5b0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 546:	8d 45 10             	lea    0x10(%ebp),%eax
 549:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 54c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 54f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 551:	89 45 d0             	mov    %eax,-0x30(%ebp)
 554:	eb 36                	jmp    58c <printf+0x5c>
 556:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 55d:	8d 76 00             	lea    0x0(%esi),%esi
 560:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 563:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 568:	83 f8 25             	cmp    $0x25,%eax
 56b:	74 15                	je     582 <printf+0x52>
  write(fd, &c, 1);
 56d:	83 ec 04             	sub    $0x4,%esp
 570:	88 55 e7             	mov    %dl,-0x19(%ebp)
 573:	6a 01                	push   $0x1
 575:	57                   	push   %edi
 576:	56                   	push   %esi
 577:	e8 61 fe ff ff       	call   3dd <write>
 57c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 57f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 582:	0f b6 13             	movzbl (%ebx),%edx
 585:	83 c3 01             	add    $0x1,%ebx
 588:	84 d2                	test   %dl,%dl
 58a:	74 24                	je     5b0 <printf+0x80>
    c = fmt[i] & 0xff;
 58c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 58f:	85 c9                	test   %ecx,%ecx
 591:	74 cd                	je     560 <printf+0x30>
      }
    } else if(state == '%'){
 593:	83 f9 25             	cmp    $0x25,%ecx
 596:	75 ea                	jne    582 <printf+0x52>
      if(c == 'd'){
 598:	83 f8 25             	cmp    $0x25,%eax
 59b:	0f 84 07 01 00 00    	je     6a8 <printf+0x178>
 5a1:	83 e8 63             	sub    $0x63,%eax
 5a4:	83 f8 15             	cmp    $0x15,%eax
 5a7:	77 17                	ja     5c0 <printf+0x90>
 5a9:	ff 24 85 b0 08 00 00 	jmp    *0x8b0(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5b3:	5b                   	pop    %ebx
 5b4:	5e                   	pop    %esi
 5b5:	5f                   	pop    %edi
 5b6:	5d                   	pop    %ebp
 5b7:	c3                   	ret    
 5b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bf:	90                   	nop
  write(fd, &c, 1);
 5c0:	83 ec 04             	sub    $0x4,%esp
 5c3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 5c6:	6a 01                	push   $0x1
 5c8:	57                   	push   %edi
 5c9:	56                   	push   %esi
 5ca:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5ce:	e8 0a fe ff ff       	call   3dd <write>
        putc(fd, c);
 5d3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 5d7:	83 c4 0c             	add    $0xc,%esp
 5da:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5dd:	6a 01                	push   $0x1
 5df:	57                   	push   %edi
 5e0:	56                   	push   %esi
 5e1:	e8 f7 fd ff ff       	call   3dd <write>
        putc(fd, c);
 5e6:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5e9:	31 c9                	xor    %ecx,%ecx
 5eb:	eb 95                	jmp    582 <printf+0x52>
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 5f0:	83 ec 0c             	sub    $0xc,%esp
 5f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 5f8:	6a 00                	push   $0x0
 5fa:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5fd:	8b 10                	mov    (%eax),%edx
 5ff:	89 f0                	mov    %esi,%eax
 601:	e8 7a fe ff ff       	call   480 <printint>
        ap++;
 606:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 60a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 60d:	31 c9                	xor    %ecx,%ecx
 60f:	e9 6e ff ff ff       	jmp    582 <printf+0x52>
 614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 618:	8b 45 d0             	mov    -0x30(%ebp),%eax
 61b:	8b 10                	mov    (%eax),%edx
        ap++;
 61d:	83 c0 04             	add    $0x4,%eax
 620:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 623:	85 d2                	test   %edx,%edx
 625:	0f 84 8d 00 00 00    	je     6b8 <printf+0x188>
        while(*s != 0){
 62b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 62e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 630:	84 c0                	test   %al,%al
 632:	0f 84 4a ff ff ff    	je     582 <printf+0x52>
 638:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 63b:	89 d3                	mov    %edx,%ebx
 63d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 640:	83 ec 04             	sub    $0x4,%esp
          s++;
 643:	83 c3 01             	add    $0x1,%ebx
 646:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 649:	6a 01                	push   $0x1
 64b:	57                   	push   %edi
 64c:	56                   	push   %esi
 64d:	e8 8b fd ff ff       	call   3dd <write>
        while(*s != 0){
 652:	0f b6 03             	movzbl (%ebx),%eax
 655:	83 c4 10             	add    $0x10,%esp
 658:	84 c0                	test   %al,%al
 65a:	75 e4                	jne    640 <printf+0x110>
      state = 0;
 65c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 65f:	31 c9                	xor    %ecx,%ecx
 661:	e9 1c ff ff ff       	jmp    582 <printf+0x52>
 666:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 66d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 670:	83 ec 0c             	sub    $0xc,%esp
 673:	b9 0a 00 00 00       	mov    $0xa,%ecx
 678:	6a 01                	push   $0x1
 67a:	e9 7b ff ff ff       	jmp    5fa <printf+0xca>
 67f:	90                   	nop
        putc(fd, *ap);
 680:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 683:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 686:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 688:	6a 01                	push   $0x1
 68a:	57                   	push   %edi
 68b:	56                   	push   %esi
        putc(fd, *ap);
 68c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 68f:	e8 49 fd ff ff       	call   3dd <write>
        ap++;
 694:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 698:	83 c4 10             	add    $0x10,%esp
      state = 0;
 69b:	31 c9                	xor    %ecx,%ecx
 69d:	e9 e0 fe ff ff       	jmp    582 <printf+0x52>
 6a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 6a8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 6ab:	83 ec 04             	sub    $0x4,%esp
 6ae:	e9 2a ff ff ff       	jmp    5dd <printf+0xad>
 6b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6b7:	90                   	nop
          s = "(null)";
 6b8:	ba a8 08 00 00       	mov    $0x8a8,%edx
        while(*s != 0){
 6bd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6c0:	b8 28 00 00 00       	mov    $0x28,%eax
 6c5:	89 d3                	mov    %edx,%ebx
 6c7:	e9 74 ff ff ff       	jmp    640 <printf+0x110>
 6cc:	66 90                	xchg   %ax,%ax
 6ce:	66 90                	xchg   %ax,%ax

000006d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d1:	a1 f8 0b 00 00       	mov    0xbf8,%eax
{
 6d6:	89 e5                	mov    %esp,%ebp
 6d8:	57                   	push   %edi
 6d9:	56                   	push   %esi
 6da:	53                   	push   %ebx
 6db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 6de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6e8:	89 c2                	mov    %eax,%edx
 6ea:	8b 00                	mov    (%eax),%eax
 6ec:	39 ca                	cmp    %ecx,%edx
 6ee:	73 30                	jae    720 <free+0x50>
 6f0:	39 c1                	cmp    %eax,%ecx
 6f2:	72 04                	jb     6f8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f4:	39 c2                	cmp    %eax,%edx
 6f6:	72 f0                	jb     6e8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6fe:	39 f8                	cmp    %edi,%eax
 700:	74 30                	je     732 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 702:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 705:	8b 42 04             	mov    0x4(%edx),%eax
 708:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 70b:	39 f1                	cmp    %esi,%ecx
 70d:	74 3a                	je     749 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 70f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 711:	5b                   	pop    %ebx
  freep = p;
 712:	89 15 f8 0b 00 00    	mov    %edx,0xbf8
}
 718:	5e                   	pop    %esi
 719:	5f                   	pop    %edi
 71a:	5d                   	pop    %ebp
 71b:	c3                   	ret    
 71c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 720:	39 c2                	cmp    %eax,%edx
 722:	72 c4                	jb     6e8 <free+0x18>
 724:	39 c1                	cmp    %eax,%ecx
 726:	73 c0                	jae    6e8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 728:	8b 73 fc             	mov    -0x4(%ebx),%esi
 72b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 72e:	39 f8                	cmp    %edi,%eax
 730:	75 d0                	jne    702 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 732:	03 70 04             	add    0x4(%eax),%esi
 735:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 738:	8b 02                	mov    (%edx),%eax
 73a:	8b 00                	mov    (%eax),%eax
 73c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 73f:	8b 42 04             	mov    0x4(%edx),%eax
 742:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 745:	39 f1                	cmp    %esi,%ecx
 747:	75 c6                	jne    70f <free+0x3f>
    p->s.size += bp->s.size;
 749:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 74c:	89 15 f8 0b 00 00    	mov    %edx,0xbf8
    p->s.size += bp->s.size;
 752:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 755:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 758:	89 0a                	mov    %ecx,(%edx)
}
 75a:	5b                   	pop    %ebx
 75b:	5e                   	pop    %esi
 75c:	5f                   	pop    %edi
 75d:	5d                   	pop    %ebp
 75e:	c3                   	ret    
 75f:	90                   	nop

00000760 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	57                   	push   %edi
 764:	56                   	push   %esi
 765:	53                   	push   %ebx
 766:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 769:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 76c:	8b 3d f8 0b 00 00    	mov    0xbf8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 772:	8d 70 07             	lea    0x7(%eax),%esi
 775:	c1 ee 03             	shr    $0x3,%esi
 778:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 77b:	85 ff                	test   %edi,%edi
 77d:	0f 84 9d 00 00 00    	je     820 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 783:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 785:	8b 4a 04             	mov    0x4(%edx),%ecx
 788:	39 f1                	cmp    %esi,%ecx
 78a:	73 6a                	jae    7f6 <malloc+0x96>
 78c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 791:	39 de                	cmp    %ebx,%esi
 793:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 796:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 79d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7a0:	eb 17                	jmp    7b9 <malloc+0x59>
 7a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7aa:	8b 48 04             	mov    0x4(%eax),%ecx
 7ad:	39 f1                	cmp    %esi,%ecx
 7af:	73 4f                	jae    800 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7b1:	8b 3d f8 0b 00 00    	mov    0xbf8,%edi
 7b7:	89 c2                	mov    %eax,%edx
 7b9:	39 d7                	cmp    %edx,%edi
 7bb:	75 eb                	jne    7a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 7bd:	83 ec 0c             	sub    $0xc,%esp
 7c0:	ff 75 e4             	pushl  -0x1c(%ebp)
 7c3:	e8 7d fc ff ff       	call   445 <sbrk>
  if(p == (char*)-1)
 7c8:	83 c4 10             	add    $0x10,%esp
 7cb:	83 f8 ff             	cmp    $0xffffffff,%eax
 7ce:	74 1c                	je     7ec <malloc+0x8c>
  hp->s.size = nu;
 7d0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 7d3:	83 ec 0c             	sub    $0xc,%esp
 7d6:	83 c0 08             	add    $0x8,%eax
 7d9:	50                   	push   %eax
 7da:	e8 f1 fe ff ff       	call   6d0 <free>
  return freep;
 7df:	8b 15 f8 0b 00 00    	mov    0xbf8,%edx
      if((p = morecore(nunits)) == 0)
 7e5:	83 c4 10             	add    $0x10,%esp
 7e8:	85 d2                	test   %edx,%edx
 7ea:	75 bc                	jne    7a8 <malloc+0x48>
        return 0;
  }
}
 7ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 7ef:	31 c0                	xor    %eax,%eax
}
 7f1:	5b                   	pop    %ebx
 7f2:	5e                   	pop    %esi
 7f3:	5f                   	pop    %edi
 7f4:	5d                   	pop    %ebp
 7f5:	c3                   	ret    
    if(p->s.size >= nunits){
 7f6:	89 d0                	mov    %edx,%eax
 7f8:	89 fa                	mov    %edi,%edx
 7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 800:	39 ce                	cmp    %ecx,%esi
 802:	74 4c                	je     850 <malloc+0xf0>
        p->s.size -= nunits;
 804:	29 f1                	sub    %esi,%ecx
 806:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 809:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 80c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 80f:	89 15 f8 0b 00 00    	mov    %edx,0xbf8
}
 815:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 818:	83 c0 08             	add    $0x8,%eax
}
 81b:	5b                   	pop    %ebx
 81c:	5e                   	pop    %esi
 81d:	5f                   	pop    %edi
 81e:	5d                   	pop    %ebp
 81f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 820:	c7 05 f8 0b 00 00 fc 	movl   $0xbfc,0xbf8
 827:	0b 00 00 
    base.s.size = 0;
 82a:	bf fc 0b 00 00       	mov    $0xbfc,%edi
    base.s.ptr = freep = prevp = &base;
 82f:	c7 05 fc 0b 00 00 fc 	movl   $0xbfc,0xbfc
 836:	0b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 839:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 83b:	c7 05 00 0c 00 00 00 	movl   $0x0,0xc00
 842:	00 00 00 
    if(p->s.size >= nunits){
 845:	e9 42 ff ff ff       	jmp    78c <malloc+0x2c>
 84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 850:	8b 08                	mov    (%eax),%ecx
 852:	89 0a                	mov    %ecx,(%edx)
 854:	eb b9                	jmp    80f <malloc+0xaf>
