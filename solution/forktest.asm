
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "fork test OK\n");
}

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
  forktest();
   6:	e8 35 00 00 00       	call   40 <forktest>
  exit();
   b:	e8 7e 03 00 00       	call   38e <exit>

00000010 <printf>:
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	53                   	push   %ebx
  14:	83 ec 10             	sub    $0x10,%esp
  17:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  write(fd, s, strlen(s));
  1a:	53                   	push   %ebx
  1b:	e8 90 01 00 00       	call   1b0 <strlen>
  20:	83 c4 0c             	add    $0xc,%esp
  23:	50                   	push   %eax
  24:	53                   	push   %ebx
  25:	ff 75 08             	pushl  0x8(%ebp)
  28:	e8 81 03 00 00       	call   3ae <write>
}
  2d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  30:	83 c4 10             	add    $0x10,%esp
  33:	c9                   	leave  
  34:	c3                   	ret    
  35:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000040 <forktest>:
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	53                   	push   %ebx
  for(n=0; n<N; n++){
  44:	31 db                	xor    %ebx,%ebx
{
  46:	83 ec 10             	sub    $0x10,%esp
  write(fd, s, strlen(s));
  49:	68 d8 05 00 00       	push   $0x5d8
  4e:	e8 5d 01 00 00       	call   1b0 <strlen>
  53:	83 c4 0c             	add    $0xc,%esp
  56:	50                   	push   %eax
  57:	68 d8 05 00 00       	push   $0x5d8
  5c:	6a 01                	push   $0x1
  5e:	e8 4b 03 00 00       	call   3ae <write>
  63:	83 c4 10             	add    $0x10,%esp
  66:	eb 19                	jmp    81 <forktest+0x41>
  68:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  6f:	90                   	nop
    if(pid == 0)
  70:	74 58                	je     ca <forktest+0x8a>
  for(n=0; n<N; n++){
  72:	83 c3 01             	add    $0x1,%ebx
  75:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
  7b:	0f 84 83 00 00 00    	je     104 <forktest+0xc4>
    pid = fork();
  81:	e8 00 03 00 00       	call   386 <fork>
    if(pid < 0)
  86:	85 c0                	test   %eax,%eax
  88:	79 e6                	jns    70 <forktest+0x30>
  for(; n > 0; n--){
  8a:	85 db                	test   %ebx,%ebx
  8c:	74 10                	je     9e <forktest+0x5e>
  8e:	66 90                	xchg   %ax,%ax
    if(wait() < 0){
  90:	e8 01 03 00 00       	call   396 <wait>
  95:	85 c0                	test   %eax,%eax
  97:	78 36                	js     cf <forktest+0x8f>
  for(; n > 0; n--){
  99:	83 eb 01             	sub    $0x1,%ebx
  9c:	75 f2                	jne    90 <forktest+0x50>
  if(wait() != -1){
  9e:	e8 f3 02 00 00       	call   396 <wait>
  a3:	83 f8 ff             	cmp    $0xffffffff,%eax
  a6:	75 49                	jne    f1 <forktest+0xb1>
  write(fd, s, strlen(s));
  a8:	83 ec 0c             	sub    $0xc,%esp
  ab:	68 0a 06 00 00       	push   $0x60a
  b0:	e8 fb 00 00 00       	call   1b0 <strlen>
  b5:	83 c4 0c             	add    $0xc,%esp
  b8:	50                   	push   %eax
  b9:	68 0a 06 00 00       	push   $0x60a
  be:	6a 01                	push   $0x1
  c0:	e8 e9 02 00 00       	call   3ae <write>
}
  c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  c8:	c9                   	leave  
  c9:	c3                   	ret    
      exit();
  ca:	e8 bf 02 00 00       	call   38e <exit>
  write(fd, s, strlen(s));
  cf:	83 ec 0c             	sub    $0xc,%esp
  d2:	68 e3 05 00 00       	push   $0x5e3
  d7:	e8 d4 00 00 00       	call   1b0 <strlen>
  dc:	83 c4 0c             	add    $0xc,%esp
  df:	50                   	push   %eax
  e0:	68 e3 05 00 00       	push   $0x5e3
  e5:	6a 01                	push   $0x1
  e7:	e8 c2 02 00 00       	call   3ae <write>
      exit();
  ec:	e8 9d 02 00 00       	call   38e <exit>
    printf(1, "wait got too many\n");
  f1:	52                   	push   %edx
  f2:	52                   	push   %edx
  f3:	68 f7 05 00 00       	push   $0x5f7
  f8:	6a 01                	push   $0x1
  fa:	e8 11 ff ff ff       	call   10 <printf>
    exit();
  ff:	e8 8a 02 00 00       	call   38e <exit>
    printf(1, "fork claimed to work N times!\n", N);
 104:	50                   	push   %eax
 105:	68 e8 03 00 00       	push   $0x3e8
 10a:	68 18 06 00 00       	push   $0x618
 10f:	6a 01                	push   $0x1
 111:	e8 fa fe ff ff       	call   10 <printf>
    exit();
 116:	e8 73 02 00 00       	call   38e <exit>
 11b:	66 90                	xchg   %ax,%ax
 11d:	66 90                	xchg   %ax,%ax
 11f:	90                   	nop

00000120 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 120:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 121:	31 c0                	xor    %eax,%eax
{
 123:	89 e5                	mov    %esp,%ebp
 125:	53                   	push   %ebx
 126:	8b 4d 08             	mov    0x8(%ebp),%ecx
 129:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 12c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 130:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 134:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 137:	83 c0 01             	add    $0x1,%eax
 13a:	84 d2                	test   %dl,%dl
 13c:	75 f2                	jne    130 <strcpy+0x10>
    ;
  return os;
}
 13e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 141:	89 c8                	mov    %ecx,%eax
 143:	c9                   	leave  
 144:	c3                   	ret    
 145:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000150 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 55 08             	mov    0x8(%ebp),%edx
 157:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 15a:	0f b6 02             	movzbl (%edx),%eax
 15d:	84 c0                	test   %al,%al
 15f:	75 17                	jne    178 <strcmp+0x28>
 161:	eb 3a                	jmp    19d <strcmp+0x4d>
 163:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 167:	90                   	nop
 168:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 16c:	83 c2 01             	add    $0x1,%edx
 16f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 172:	84 c0                	test   %al,%al
 174:	74 1a                	je     190 <strcmp+0x40>
    p++, q++;
 176:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 178:	0f b6 19             	movzbl (%ecx),%ebx
 17b:	38 c3                	cmp    %al,%bl
 17d:	74 e9                	je     168 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 17f:	29 d8                	sub    %ebx,%eax
}
 181:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 184:	c9                   	leave  
 185:	c3                   	ret    
 186:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 190:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 194:	31 c0                	xor    %eax,%eax
 196:	29 d8                	sub    %ebx,%eax
}
 198:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 19b:	c9                   	leave  
 19c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 19d:	0f b6 19             	movzbl (%ecx),%ebx
 1a0:	31 c0                	xor    %eax,%eax
 1a2:	eb db                	jmp    17f <strcmp+0x2f>
 1a4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ab:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1af:	90                   	nop

000001b0 <strlen>:

uint
strlen(const char *s)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1b6:	80 3a 00             	cmpb   $0x0,(%edx)
 1b9:	74 15                	je     1d0 <strlen+0x20>
 1bb:	31 c0                	xor    %eax,%eax
 1bd:	8d 76 00             	lea    0x0(%esi),%esi
 1c0:	83 c0 01             	add    $0x1,%eax
 1c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1c7:	89 c1                	mov    %eax,%ecx
 1c9:	75 f5                	jne    1c0 <strlen+0x10>
    ;
  return n;
}
 1cb:	89 c8                	mov    %ecx,%eax
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret    
 1cf:	90                   	nop
  for(n = 0; s[n]; n++)
 1d0:	31 c9                	xor    %ecx,%ecx
}
 1d2:	5d                   	pop    %ebp
 1d3:	89 c8                	mov    %ecx,%eax
 1d5:	c3                   	ret    
 1d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1dd:	8d 76 00             	lea    0x0(%esi),%esi

000001e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	57                   	push   %edi
 1e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 1e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 1ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ed:	89 d7                	mov    %edx,%edi
 1ef:	fc                   	cld    
 1f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 1f2:	8b 7d fc             	mov    -0x4(%ebp),%edi
 1f5:	89 d0                	mov    %edx,%eax
 1f7:	c9                   	leave  
 1f8:	c3                   	ret    
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000200 <strchr>:

char*
strchr(const char *s, char c)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 20a:	0f b6 10             	movzbl (%eax),%edx
 20d:	84 d2                	test   %dl,%dl
 20f:	75 12                	jne    223 <strchr+0x23>
 211:	eb 1d                	jmp    230 <strchr+0x30>
 213:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 217:	90                   	nop
 218:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 21c:	83 c0 01             	add    $0x1,%eax
 21f:	84 d2                	test   %dl,%dl
 221:	74 0d                	je     230 <strchr+0x30>
    if(*s == c)
 223:	38 d1                	cmp    %dl,%cl
 225:	75 f1                	jne    218 <strchr+0x18>
      return (char*)s;
  return 0;
}
 227:	5d                   	pop    %ebp
 228:	c3                   	ret    
 229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 230:	31 c0                	xor    %eax,%eax
}
 232:	5d                   	pop    %ebp
 233:	c3                   	ret    
 234:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 23f:	90                   	nop

00000240 <gets>:

char*
gets(char *buf, int max)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 245:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 248:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 249:	31 db                	xor    %ebx,%ebx
{
 24b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 24e:	eb 27                	jmp    277 <gets+0x37>
    cc = read(0, &c, 1);
 250:	83 ec 04             	sub    $0x4,%esp
 253:	6a 01                	push   $0x1
 255:	57                   	push   %edi
 256:	6a 00                	push   $0x0
 258:	e8 49 01 00 00       	call   3a6 <read>
    if(cc < 1)
 25d:	83 c4 10             	add    $0x10,%esp
 260:	85 c0                	test   %eax,%eax
 262:	7e 1d                	jle    281 <gets+0x41>
      break;
    buf[i++] = c;
 264:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 268:	8b 55 08             	mov    0x8(%ebp),%edx
 26b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 26f:	3c 0a                	cmp    $0xa,%al
 271:	74 1d                	je     290 <gets+0x50>
 273:	3c 0d                	cmp    $0xd,%al
 275:	74 19                	je     290 <gets+0x50>
  for(i=0; i+1 < max; ){
 277:	89 de                	mov    %ebx,%esi
 279:	83 c3 01             	add    $0x1,%ebx
 27c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 27f:	7c cf                	jl     250 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 281:	8b 45 08             	mov    0x8(%ebp),%eax
 284:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 288:	8d 65 f4             	lea    -0xc(%ebp),%esp
 28b:	5b                   	pop    %ebx
 28c:	5e                   	pop    %esi
 28d:	5f                   	pop    %edi
 28e:	5d                   	pop    %ebp
 28f:	c3                   	ret    
  buf[i] = '\0';
 290:	8b 45 08             	mov    0x8(%ebp),%eax
 293:	89 de                	mov    %ebx,%esi
 295:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 299:	8d 65 f4             	lea    -0xc(%ebp),%esp
 29c:	5b                   	pop    %ebx
 29d:	5e                   	pop    %esi
 29e:	5f                   	pop    %edi
 29f:	5d                   	pop    %ebp
 2a0:	c3                   	ret    
 2a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2af:	90                   	nop

000002b0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	56                   	push   %esi
 2b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b5:	83 ec 08             	sub    $0x8,%esp
 2b8:	6a 00                	push   $0x0
 2ba:	ff 75 08             	pushl  0x8(%ebp)
 2bd:	e8 0c 01 00 00       	call   3ce <open>
  if(fd < 0)
 2c2:	83 c4 10             	add    $0x10,%esp
 2c5:	85 c0                	test   %eax,%eax
 2c7:	78 27                	js     2f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2c9:	83 ec 08             	sub    $0x8,%esp
 2cc:	ff 75 0c             	pushl  0xc(%ebp)
 2cf:	89 c3                	mov    %eax,%ebx
 2d1:	50                   	push   %eax
 2d2:	e8 0f 01 00 00       	call   3e6 <fstat>
  close(fd);
 2d7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2da:	89 c6                	mov    %eax,%esi
  close(fd);
 2dc:	e8 d5 00 00 00       	call   3b6 <close>
  return r;
 2e1:	83 c4 10             	add    $0x10,%esp
}
 2e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2e7:	89 f0                	mov    %esi,%eax
 2e9:	5b                   	pop    %ebx
 2ea:	5e                   	pop    %esi
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret    
 2ed:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 2f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 2f5:	eb ed                	jmp    2e4 <stat+0x34>
 2f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fe:	66 90                	xchg   %ax,%ax

00000300 <atoi>:

int
atoi(const char *s)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	53                   	push   %ebx
 304:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 307:	0f be 02             	movsbl (%edx),%eax
 30a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 30d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 310:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 315:	77 1e                	ja     335 <atoi+0x35>
 317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 320:	83 c2 01             	add    $0x1,%edx
 323:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 326:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 32a:	0f be 02             	movsbl (%edx),%eax
 32d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 330:	80 fb 09             	cmp    $0x9,%bl
 333:	76 eb                	jbe    320 <atoi+0x20>
  return n;
}
 335:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 338:	89 c8                	mov    %ecx,%eax
 33a:	c9                   	leave  
 33b:	c3                   	ret    
 33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000340 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	8b 45 10             	mov    0x10(%ebp),%eax
 347:	8b 55 08             	mov    0x8(%ebp),%edx
 34a:	56                   	push   %esi
 34b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 34e:	85 c0                	test   %eax,%eax
 350:	7e 13                	jle    365 <memmove+0x25>
 352:	01 d0                	add    %edx,%eax
  dst = vdst;
 354:	89 d7                	mov    %edx,%edi
 356:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 360:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 361:	39 f8                	cmp    %edi,%eax
 363:	75 fb                	jne    360 <memmove+0x20>
  return vdst;
}
 365:	5e                   	pop    %esi
 366:	89 d0                	mov    %edx,%eax
 368:	5f                   	pop    %edi
 369:	5d                   	pop    %ebp
 36a:	c3                   	ret    
 36b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 36f:	90                   	nop

00000370 <thread_create>:

int thread_create(void (*fn)(void *), void *arg) {
  return -1;
}
 370:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 375:	c3                   	ret    
 376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37d:	8d 76 00             	lea    0x0(%esi),%esi

00000380 <thread_join>:

int thread_join() {
  return -1;
}
 380:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 385:	c3                   	ret    

00000386 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 386:	b8 01 00 00 00       	mov    $0x1,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <exit>:
SYSCALL(exit)
 38e:	b8 02 00 00 00       	mov    $0x2,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <wait>:
SYSCALL(wait)
 396:	b8 03 00 00 00       	mov    $0x3,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <pipe>:
SYSCALL(pipe)
 39e:	b8 04 00 00 00       	mov    $0x4,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <read>:
SYSCALL(read)
 3a6:	b8 05 00 00 00       	mov    $0x5,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <write>:
SYSCALL(write)
 3ae:	b8 10 00 00 00       	mov    $0x10,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <close>:
SYSCALL(close)
 3b6:	b8 15 00 00 00       	mov    $0x15,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <kill>:
SYSCALL(kill)
 3be:	b8 06 00 00 00       	mov    $0x6,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <exec>:
SYSCALL(exec)
 3c6:	b8 07 00 00 00       	mov    $0x7,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <open>:
SYSCALL(open)
 3ce:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <mknod>:
SYSCALL(mknod)
 3d6:	b8 11 00 00 00       	mov    $0x11,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <unlink>:
SYSCALL(unlink)
 3de:	b8 12 00 00 00       	mov    $0x12,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <fstat>:
SYSCALL(fstat)
 3e6:	b8 08 00 00 00       	mov    $0x8,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <link>:
SYSCALL(link)
 3ee:	b8 13 00 00 00       	mov    $0x13,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <mkdir>:
SYSCALL(mkdir)
 3f6:	b8 14 00 00 00       	mov    $0x14,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <chdir>:
SYSCALL(chdir)
 3fe:	b8 09 00 00 00       	mov    $0x9,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <dup>:
SYSCALL(dup)
 406:	b8 0a 00 00 00       	mov    $0xa,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <getpid>:
SYSCALL(getpid)
 40e:	b8 0b 00 00 00       	mov    $0xb,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <sbrk>:
SYSCALL(sbrk)
 416:	b8 0c 00 00 00       	mov    $0xc,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <sleep>:
SYSCALL(sleep)
 41e:	b8 0d 00 00 00       	mov    $0xd,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <uptime>:
SYSCALL(uptime)
 426:	b8 0e 00 00 00       	mov    $0xe,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <clone>:
SYSCALL(clone)
 42e:	b8 16 00 00 00       	mov    $0x16,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <lock>:
SYSCALL(lock)
 436:	b8 17 00 00 00       	mov    $0x17,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <unlock>:
SYSCALL(unlock)
 43e:	b8 18 00 00 00       	mov    $0x18,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <join>:
SYSCALL(join)
 446:	b8 19 00 00 00       	mov    $0x19,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    
 44e:	66 90                	xchg   %ax,%ax

00000450 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 450:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 451:	a1 d8 08 00 00       	mov    0x8d8,%eax
{
 456:	89 e5                	mov    %esp,%ebp
 458:	57                   	push   %edi
 459:	56                   	push   %esi
 45a:	53                   	push   %ebx
 45b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 45e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 461:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 468:	89 c2                	mov    %eax,%edx
 46a:	8b 00                	mov    (%eax),%eax
 46c:	39 ca                	cmp    %ecx,%edx
 46e:	73 30                	jae    4a0 <free+0x50>
 470:	39 c1                	cmp    %eax,%ecx
 472:	72 04                	jb     478 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 474:	39 c2                	cmp    %eax,%edx
 476:	72 f0                	jb     468 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 478:	8b 73 fc             	mov    -0x4(%ebx),%esi
 47b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 47e:	39 f8                	cmp    %edi,%eax
 480:	74 30                	je     4b2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 482:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 485:	8b 42 04             	mov    0x4(%edx),%eax
 488:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 48b:	39 f1                	cmp    %esi,%ecx
 48d:	74 3a                	je     4c9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 48f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 491:	5b                   	pop    %ebx
  freep = p;
 492:	89 15 d8 08 00 00    	mov    %edx,0x8d8
}
 498:	5e                   	pop    %esi
 499:	5f                   	pop    %edi
 49a:	5d                   	pop    %ebp
 49b:	c3                   	ret    
 49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 4a0:	39 c2                	cmp    %eax,%edx
 4a2:	72 c4                	jb     468 <free+0x18>
 4a4:	39 c1                	cmp    %eax,%ecx
 4a6:	73 c0                	jae    468 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 4a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 4ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 4ae:	39 f8                	cmp    %edi,%eax
 4b0:	75 d0                	jne    482 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 4b2:	03 70 04             	add    0x4(%eax),%esi
 4b5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 4b8:	8b 02                	mov    (%edx),%eax
 4ba:	8b 00                	mov    (%eax),%eax
 4bc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 4bf:	8b 42 04             	mov    0x4(%edx),%eax
 4c2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 4c5:	39 f1                	cmp    %esi,%ecx
 4c7:	75 c6                	jne    48f <free+0x3f>
    p->s.size += bp->s.size;
 4c9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 4cc:	89 15 d8 08 00 00    	mov    %edx,0x8d8
    p->s.size += bp->s.size;
 4d2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 4d5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 4d8:	89 0a                	mov    %ecx,(%edx)
}
 4da:	5b                   	pop    %ebx
 4db:	5e                   	pop    %esi
 4dc:	5f                   	pop    %edi
 4dd:	5d                   	pop    %ebp
 4de:	c3                   	ret    
 4df:	90                   	nop

000004e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	57                   	push   %edi
 4e4:	56                   	push   %esi
 4e5:	53                   	push   %ebx
 4e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 4e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 4ec:	8b 3d d8 08 00 00    	mov    0x8d8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 4f2:	8d 70 07             	lea    0x7(%eax),%esi
 4f5:	c1 ee 03             	shr    $0x3,%esi
 4f8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 4fb:	85 ff                	test   %edi,%edi
 4fd:	0f 84 9d 00 00 00    	je     5a0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 503:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 505:	8b 4a 04             	mov    0x4(%edx),%ecx
 508:	39 f1                	cmp    %esi,%ecx
 50a:	73 6a                	jae    576 <malloc+0x96>
 50c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 511:	39 de                	cmp    %ebx,%esi
 513:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 516:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 51d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 520:	eb 17                	jmp    539 <malloc+0x59>
 522:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 528:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 52a:	8b 48 04             	mov    0x4(%eax),%ecx
 52d:	39 f1                	cmp    %esi,%ecx
 52f:	73 4f                	jae    580 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 531:	8b 3d d8 08 00 00    	mov    0x8d8,%edi
 537:	89 c2                	mov    %eax,%edx
 539:	39 d7                	cmp    %edx,%edi
 53b:	75 eb                	jne    528 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 53d:	83 ec 0c             	sub    $0xc,%esp
 540:	ff 75 e4             	pushl  -0x1c(%ebp)
 543:	e8 ce fe ff ff       	call   416 <sbrk>
  if(p == (char*)-1)
 548:	83 c4 10             	add    $0x10,%esp
 54b:	83 f8 ff             	cmp    $0xffffffff,%eax
 54e:	74 1c                	je     56c <malloc+0x8c>
  hp->s.size = nu;
 550:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 553:	83 ec 0c             	sub    $0xc,%esp
 556:	83 c0 08             	add    $0x8,%eax
 559:	50                   	push   %eax
 55a:	e8 f1 fe ff ff       	call   450 <free>
  return freep;
 55f:	8b 15 d8 08 00 00    	mov    0x8d8,%edx
      if((p = morecore(nunits)) == 0)
 565:	83 c4 10             	add    $0x10,%esp
 568:	85 d2                	test   %edx,%edx
 56a:	75 bc                	jne    528 <malloc+0x48>
        return 0;
  }
}
 56c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 56f:	31 c0                	xor    %eax,%eax
}
 571:	5b                   	pop    %ebx
 572:	5e                   	pop    %esi
 573:	5f                   	pop    %edi
 574:	5d                   	pop    %ebp
 575:	c3                   	ret    
    if(p->s.size >= nunits){
 576:	89 d0                	mov    %edx,%eax
 578:	89 fa                	mov    %edi,%edx
 57a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 580:	39 ce                	cmp    %ecx,%esi
 582:	74 4c                	je     5d0 <malloc+0xf0>
        p->s.size -= nunits;
 584:	29 f1                	sub    %esi,%ecx
 586:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 589:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 58c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 58f:	89 15 d8 08 00 00    	mov    %edx,0x8d8
}
 595:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 598:	83 c0 08             	add    $0x8,%eax
}
 59b:	5b                   	pop    %ebx
 59c:	5e                   	pop    %esi
 59d:	5f                   	pop    %edi
 59e:	5d                   	pop    %ebp
 59f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 5a0:	c7 05 d8 08 00 00 dc 	movl   $0x8dc,0x8d8
 5a7:	08 00 00 
    base.s.size = 0;
 5aa:	bf dc 08 00 00       	mov    $0x8dc,%edi
    base.s.ptr = freep = prevp = &base;
 5af:	c7 05 dc 08 00 00 dc 	movl   $0x8dc,0x8dc
 5b6:	08 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 5b9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 5bb:	c7 05 e0 08 00 00 00 	movl   $0x0,0x8e0
 5c2:	00 00 00 
    if(p->s.size >= nunits){
 5c5:	e9 42 ff ff ff       	jmp    50c <malloc+0x2c>
 5ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 5d0:	8b 08                	mov    (%eax),%ecx
 5d2:	89 0a                	mov    %ecx,(%edx)
 5d4:	eb b9                	jmp    58f <malloc+0xaf>
