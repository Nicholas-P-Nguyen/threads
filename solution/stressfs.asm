
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
   7:	b8 30 00 00 00       	mov    $0x30,%eax
{
   c:	ff 71 fc             	pushl  -0x4(%ecx)
   f:	55                   	push   %ebp
  10:	89 e5                	mov    %esp,%ebp
  12:	57                   	push   %edi
  13:	56                   	push   %esi
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
  14:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi
{
  1a:	53                   	push   %ebx

  for(i = 0; i < 4; i++)
  1b:	31 db                	xor    %ebx,%ebx
{
  1d:	51                   	push   %ecx
  1e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  char path[] = "stressfs0";
  24:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
  printf(1, "stressfs starting\n");
  2b:	68 a8 08 00 00       	push   $0x8a8
  30:	6a 01                	push   $0x1
  char path[] = "stressfs0";
  32:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
  39:	74 72 65 
  3c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
  43:	73 66 73 
  printf(1, "stressfs starting\n");
  46:	e8 35 05 00 00       	call   580 <printf>
  memset(data, 'a', sizeof(data));
  4b:	83 c4 0c             	add    $0xc,%esp
  4e:	68 00 02 00 00       	push   $0x200
  53:	6a 61                	push   $0x61
  55:	56                   	push   %esi
  56:	e8 a5 01 00 00       	call   200 <memset>
  5b:	83 c4 10             	add    $0x10,%esp
    if(fork() > 0)
  5e:	e8 a2 03 00 00       	call   405 <fork>
  63:	85 c0                	test   %eax,%eax
  65:	0f 8f bf 00 00 00    	jg     12a <main+0x12a>
  for(i = 0; i < 4; i++)
  6b:	83 c3 01             	add    $0x1,%ebx
  6e:	83 fb 04             	cmp    $0x4,%ebx
  71:	75 eb                	jne    5e <main+0x5e>
  73:	bf 04 00 00 00       	mov    $0x4,%edi
      break;

  printf(1, "write %d\n", i);
  78:	83 ec 04             	sub    $0x4,%esp
  7b:	53                   	push   %ebx

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  7c:	bb 14 00 00 00       	mov    $0x14,%ebx
  printf(1, "write %d\n", i);
  81:	68 bb 08 00 00       	push   $0x8bb
  86:	6a 01                	push   $0x1
  88:	e8 f3 04 00 00       	call   580 <printf>
  path[8] += i;
  8d:	89 f8                	mov    %edi,%eax
  fd = open(path, O_CREATE | O_RDWR);
  8f:	5f                   	pop    %edi
  path[8] += i;
  90:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  96:	58                   	pop    %eax
  97:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  9d:	68 02 02 00 00       	push   $0x202
  a2:	50                   	push   %eax
  a3:	e8 a5 03 00 00       	call   44d <open>
  a8:	83 c4 10             	add    $0x10,%esp
  ab:	89 c7                	mov    %eax,%edi
  for(i = 0; i < 20; i++)
  ad:	8d 76 00             	lea    0x0(%esi),%esi
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b0:	83 ec 04             	sub    $0x4,%esp
  b3:	68 00 02 00 00       	push   $0x200
  b8:	56                   	push   %esi
  b9:	57                   	push   %edi
  ba:	e8 6e 03 00 00       	call   42d <write>
  for(i = 0; i < 20; i++)
  bf:	83 c4 10             	add    $0x10,%esp
  c2:	83 eb 01             	sub    $0x1,%ebx
  c5:	75 e9                	jne    b0 <main+0xb0>
  close(fd);
  c7:	83 ec 0c             	sub    $0xc,%esp
  ca:	57                   	push   %edi
  cb:	e8 65 03 00 00       	call   435 <close>

  printf(1, "read\n");
  d0:	58                   	pop    %eax
  d1:	5a                   	pop    %edx
  d2:	68 c5 08 00 00       	push   $0x8c5
  d7:	6a 01                	push   $0x1
  d9:	e8 a2 04 00 00       	call   580 <printf>

  fd = open(path, O_RDONLY);
  de:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
  e4:	59                   	pop    %ecx
  e5:	5b                   	pop    %ebx
  e6:	6a 00                	push   $0x0
  e8:	bb 14 00 00 00       	mov    $0x14,%ebx
  ed:	50                   	push   %eax
  ee:	e8 5a 03 00 00       	call   44d <open>
  f3:	83 c4 10             	add    $0x10,%esp
  f6:	89 c7                	mov    %eax,%edi
  for (i = 0; i < 20; i++)
  f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ff:	90                   	nop
    read(fd, data, sizeof(data));
 100:	83 ec 04             	sub    $0x4,%esp
 103:	68 00 02 00 00       	push   $0x200
 108:	56                   	push   %esi
 109:	57                   	push   %edi
 10a:	e8 16 03 00 00       	call   425 <read>
  for (i = 0; i < 20; i++)
 10f:	83 c4 10             	add    $0x10,%esp
 112:	83 eb 01             	sub    $0x1,%ebx
 115:	75 e9                	jne    100 <main+0x100>
  close(fd);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	57                   	push   %edi
 11b:	e8 15 03 00 00       	call   435 <close>

  wait();
 120:	e8 f0 02 00 00       	call   415 <wait>

  exit();
 125:	e8 e3 02 00 00       	call   40d <exit>
  path[8] += i;
 12a:	89 df                	mov    %ebx,%edi
 12c:	e9 47 ff ff ff       	jmp    78 <main+0x78>
 131:	66 90                	xchg   %ax,%ax
 133:	66 90                	xchg   %ax,%ax
 135:	66 90                	xchg   %ax,%ax
 137:	66 90                	xchg   %ax,%ax
 139:	66 90                	xchg   %ax,%ax
 13b:	66 90                	xchg   %ax,%ax
 13d:	66 90                	xchg   %ax,%ax
 13f:	90                   	nop

00000140 <strcpy>:
#include "x86.h"
#include "spinlock.h"

char*
strcpy(char *s, const char *t)
{
 140:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 141:	31 c0                	xor    %eax,%eax
{
 143:	89 e5                	mov    %esp,%ebp
 145:	53                   	push   %ebx
 146:	8b 4d 08             	mov    0x8(%ebp),%ecx
 149:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 150:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 154:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 157:	83 c0 01             	add    $0x1,%eax
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strcpy+0x10>
    ;
  return os;
}
 15e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 161:	89 c8                	mov    %ecx,%eax
 163:	c9                   	leave  
 164:	c3                   	ret    
 165:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 55 08             	mov    0x8(%ebp),%edx
 177:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 17a:	0f b6 02             	movzbl (%edx),%eax
 17d:	84 c0                	test   %al,%al
 17f:	75 17                	jne    198 <strcmp+0x28>
 181:	eb 3a                	jmp    1bd <strcmp+0x4d>
 183:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 187:	90                   	nop
 188:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 18c:	83 c2 01             	add    $0x1,%edx
 18f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 192:	84 c0                	test   %al,%al
 194:	74 1a                	je     1b0 <strcmp+0x40>
    p++, q++;
 196:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 198:	0f b6 19             	movzbl (%ecx),%ebx
 19b:	38 c3                	cmp    %al,%bl
 19d:	74 e9                	je     188 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 19f:	29 d8                	sub    %ebx,%eax
}
 1a1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a4:	c9                   	leave  
 1a5:	c3                   	ret    
 1a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ad:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 1b0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1b4:	31 c0                	xor    %eax,%eax
 1b6:	29 d8                	sub    %ebx,%eax
}
 1b8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1bb:	c9                   	leave  
 1bc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 1bd:	0f b6 19             	movzbl (%ecx),%ebx
 1c0:	31 c0                	xor    %eax,%eax
 1c2:	eb db                	jmp    19f <strcmp+0x2f>
 1c4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop

000001d0 <strlen>:

uint
strlen(const char *s)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 1d6:	80 3a 00             	cmpb   $0x0,(%edx)
 1d9:	74 15                	je     1f0 <strlen+0x20>
 1db:	31 c0                	xor    %eax,%eax
 1dd:	8d 76 00             	lea    0x0(%esi),%esi
 1e0:	83 c0 01             	add    $0x1,%eax
 1e3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 1e7:	89 c1                	mov    %eax,%ecx
 1e9:	75 f5                	jne    1e0 <strlen+0x10>
    ;
  return n;
}
 1eb:	89 c8                	mov    %ecx,%eax
 1ed:	5d                   	pop    %ebp
 1ee:	c3                   	ret    
 1ef:	90                   	nop
  for(n = 0; s[n]; n++)
 1f0:	31 c9                	xor    %ecx,%ecx
}
 1f2:	5d                   	pop    %ebp
 1f3:	89 c8                	mov    %ecx,%eax
 1f5:	c3                   	ret    
 1f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <memset>:

void*
memset(void *dst, int c, uint n)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	57                   	push   %edi
 204:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 207:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20a:	8b 45 0c             	mov    0xc(%ebp),%eax
 20d:	89 d7                	mov    %edx,%edi
 20f:	fc                   	cld    
 210:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 212:	8b 7d fc             	mov    -0x4(%ebp),%edi
 215:	89 d0                	mov    %edx,%eax
 217:	c9                   	leave  
 218:	c3                   	ret    
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <strchr>:

char*
strchr(const char *s, char c)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	84 d2                	test   %dl,%dl
 22f:	75 12                	jne    243 <strchr+0x23>
 231:	eb 1d                	jmp    250 <strchr+0x30>
 233:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 237:	90                   	nop
 238:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 23c:	83 c0 01             	add    $0x1,%eax
 23f:	84 d2                	test   %dl,%dl
 241:	74 0d                	je     250 <strchr+0x30>
    if(*s == c)
 243:	38 d1                	cmp    %dl,%cl
 245:	75 f1                	jne    238 <strchr+0x18>
      return (char*)s;
  return 0;
}
 247:	5d                   	pop    %ebp
 248:	c3                   	ret    
 249:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 250:	31 c0                	xor    %eax,%eax
}
 252:	5d                   	pop    %ebp
 253:	c3                   	ret    
 254:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 25f:	90                   	nop

00000260 <gets>:

char*
gets(char *buf, int max)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	57                   	push   %edi
 264:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 265:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 268:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 269:	31 db                	xor    %ebx,%ebx
{
 26b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 26e:	eb 27                	jmp    297 <gets+0x37>
    cc = read(0, &c, 1);
 270:	83 ec 04             	sub    $0x4,%esp
 273:	6a 01                	push   $0x1
 275:	57                   	push   %edi
 276:	6a 00                	push   $0x0
 278:	e8 a8 01 00 00       	call   425 <read>
    if(cc < 1)
 27d:	83 c4 10             	add    $0x10,%esp
 280:	85 c0                	test   %eax,%eax
 282:	7e 1d                	jle    2a1 <gets+0x41>
      break;
    buf[i++] = c;
 284:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 288:	8b 55 08             	mov    0x8(%ebp),%edx
 28b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 28f:	3c 0a                	cmp    $0xa,%al
 291:	74 1d                	je     2b0 <gets+0x50>
 293:	3c 0d                	cmp    $0xd,%al
 295:	74 19                	je     2b0 <gets+0x50>
  for(i=0; i+1 < max; ){
 297:	89 de                	mov    %ebx,%esi
 299:	83 c3 01             	add    $0x1,%ebx
 29c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 29f:	7c cf                	jl     270 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
 2a4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2ab:	5b                   	pop    %ebx
 2ac:	5e                   	pop    %esi
 2ad:	5f                   	pop    %edi
 2ae:	5d                   	pop    %ebp
 2af:	c3                   	ret    
  buf[i] = '\0';
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
 2b3:	89 de                	mov    %ebx,%esi
 2b5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2b9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2bc:	5b                   	pop    %ebx
 2bd:	5e                   	pop    %esi
 2be:	5f                   	pop    %edi
 2bf:	5d                   	pop    %ebp
 2c0:	c3                   	ret    
 2c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <stat>:

int
stat(const char *n, struct stat *st)
{
 2d0:	55                   	push   %ebp
 2d1:	89 e5                	mov    %esp,%ebp
 2d3:	56                   	push   %esi
 2d4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d5:	83 ec 08             	sub    $0x8,%esp
 2d8:	6a 00                	push   $0x0
 2da:	ff 75 08             	pushl  0x8(%ebp)
 2dd:	e8 6b 01 00 00       	call   44d <open>
  if(fd < 0)
 2e2:	83 c4 10             	add    $0x10,%esp
 2e5:	85 c0                	test   %eax,%eax
 2e7:	78 27                	js     310 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 2e9:	83 ec 08             	sub    $0x8,%esp
 2ec:	ff 75 0c             	pushl  0xc(%ebp)
 2ef:	89 c3                	mov    %eax,%ebx
 2f1:	50                   	push   %eax
 2f2:	e8 6e 01 00 00       	call   465 <fstat>
  close(fd);
 2f7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 2fa:	89 c6                	mov    %eax,%esi
  close(fd);
 2fc:	e8 34 01 00 00       	call   435 <close>
  return r;
 301:	83 c4 10             	add    $0x10,%esp
}
 304:	8d 65 f8             	lea    -0x8(%ebp),%esp
 307:	89 f0                	mov    %esi,%eax
 309:	5b                   	pop    %ebx
 30a:	5e                   	pop    %esi
 30b:	5d                   	pop    %ebp
 30c:	c3                   	ret    
 30d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 310:	be ff ff ff ff       	mov    $0xffffffff,%esi
 315:	eb ed                	jmp    304 <stat+0x34>
 317:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 31e:	66 90                	xchg   %ax,%ax

00000320 <atoi>:

int
atoi(const char *s)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 327:	0f be 02             	movsbl (%edx),%eax
 32a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 32d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 330:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 335:	77 1e                	ja     355 <atoi+0x35>
 337:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 33e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 340:	83 c2 01             	add    $0x1,%edx
 343:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 346:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 34a:	0f be 02             	movsbl (%edx),%eax
 34d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 350:	80 fb 09             	cmp    $0x9,%bl
 353:	76 eb                	jbe    340 <atoi+0x20>
  return n;
}
 355:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 358:	89 c8                	mov    %ecx,%eax
 35a:	c9                   	leave  
 35b:	c3                   	ret    
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000360 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	57                   	push   %edi
 364:	8b 45 10             	mov    0x10(%ebp),%eax
 367:	8b 55 08             	mov    0x8(%ebp),%edx
 36a:	56                   	push   %esi
 36b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36e:	85 c0                	test   %eax,%eax
 370:	7e 13                	jle    385 <memmove+0x25>
 372:	01 d0                	add    %edx,%eax
  dst = vdst;
 374:	89 d7                	mov    %edx,%edi
 376:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 380:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 381:	39 f8                	cmp    %edi,%eax
 383:	75 fb                	jne    380 <memmove+0x20>
  return vdst;
}
 385:	5e                   	pop    %esi
 386:	89 d0                	mov    %edx,%eax
 388:	5f                   	pop    %edi
 389:	5d                   	pop    %ebp
 38a:	c3                   	ret    
 38b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 38f:	90                   	nop

00000390 <thread_create>:

int
thread_create(void (*fn)(void *), void *arg)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	53                   	push   %ebx
 394:	83 ec 10             	sub    $0x10,%esp
  void *stack = malloc(4096);
 397:	68 00 10 00 00       	push   $0x1000
 39c:	e8 0f 04 00 00       	call   7b0 <malloc>
  if(stack == 0)
 3a1:	83 c4 10             	add    $0x10,%esp
 3a4:	85 c0                	test   %eax,%eax
 3a6:	74 3b                	je     3e3 <thread_create+0x53>
 3a8:	89 c3                	mov    %eax,%ebx
    return -1;
  
  // Check for page alignment.
  if(((uint)stack % 4096) != 0){
 3aa:	a9 ff 0f 00 00       	test   $0xfff,%eax
 3af:	75 1f                	jne    3d0 <thread_create+0x40>
    free(stack);
    return -1;
  }
  
  int tid = clone(stack);
 3b1:	83 ec 0c             	sub    $0xc,%esp
 3b4:	50                   	push   %eax
 3b5:	e8 f3 00 00 00       	call   4ad <clone>
  if(tid < 0){
 3ba:	83 c4 10             	add    $0x10,%esp
 3bd:	85 c0                	test   %eax,%eax
 3bf:	78 0f                	js     3d0 <thread_create+0x40>
    free(stack);
    return -1;
  }
  
  if(tid == 0){
 3c1:	74 27                	je     3ea <thread_create+0x5a>
    exit();
  }
  
  // Parent returns the new thread's id.
  return tid;
}
 3c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 3c6:	c9                   	leave  
 3c7:	c3                   	ret    
 3c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop
    free(stack);
 3d0:	83 ec 0c             	sub    $0xc,%esp
 3d3:	53                   	push   %ebx
 3d4:	e8 47 03 00 00       	call   720 <free>
    return -1;
 3d9:	83 c4 10             	add    $0x10,%esp
 3dc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3e1:	eb e0                	jmp    3c3 <thread_create+0x33>
    return -1;
 3e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3e8:	eb d9                	jmp    3c3 <thread_create+0x33>
    fn(arg);
 3ea:	83 ec 0c             	sub    $0xc,%esp
 3ed:	ff 75 0c             	pushl  0xc(%ebp)
 3f0:	ff 55 08             	call   *0x8(%ebp)
    free(stack);
 3f3:	89 1c 24             	mov    %ebx,(%esp)
 3f6:	e8 25 03 00 00       	call   720 <free>
    exit();
 3fb:	e8 0d 00 00 00       	call   40d <exit>

00000400 <thread_join>:

int
thread_join(void)
{
  return join();
 400:	e9 c0 00 00 00       	jmp    4c5 <join>

00000405 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 405:	b8 01 00 00 00       	mov    $0x1,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <exit>:
SYSCALL(exit)
 40d:	b8 02 00 00 00       	mov    $0x2,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <wait>:
SYSCALL(wait)
 415:	b8 03 00 00 00       	mov    $0x3,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <pipe>:
SYSCALL(pipe)
 41d:	b8 04 00 00 00       	mov    $0x4,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <read>:
SYSCALL(read)
 425:	b8 05 00 00 00       	mov    $0x5,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <write>:
SYSCALL(write)
 42d:	b8 10 00 00 00       	mov    $0x10,%eax
 432:	cd 40                	int    $0x40
 434:	c3                   	ret    

00000435 <close>:
SYSCALL(close)
 435:	b8 15 00 00 00       	mov    $0x15,%eax
 43a:	cd 40                	int    $0x40
 43c:	c3                   	ret    

0000043d <kill>:
SYSCALL(kill)
 43d:	b8 06 00 00 00       	mov    $0x6,%eax
 442:	cd 40                	int    $0x40
 444:	c3                   	ret    

00000445 <exec>:
SYSCALL(exec)
 445:	b8 07 00 00 00       	mov    $0x7,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <open>:
SYSCALL(open)
 44d:	b8 0f 00 00 00       	mov    $0xf,%eax
 452:	cd 40                	int    $0x40
 454:	c3                   	ret    

00000455 <mknod>:
SYSCALL(mknod)
 455:	b8 11 00 00 00       	mov    $0x11,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <unlink>:
SYSCALL(unlink)
 45d:	b8 12 00 00 00       	mov    $0x12,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <fstat>:
SYSCALL(fstat)
 465:	b8 08 00 00 00       	mov    $0x8,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    

0000046d <link>:
SYSCALL(link)
 46d:	b8 13 00 00 00       	mov    $0x13,%eax
 472:	cd 40                	int    $0x40
 474:	c3                   	ret    

00000475 <mkdir>:
SYSCALL(mkdir)
 475:	b8 14 00 00 00       	mov    $0x14,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    

0000047d <chdir>:
SYSCALL(chdir)
 47d:	b8 09 00 00 00       	mov    $0x9,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    

00000485 <dup>:
SYSCALL(dup)
 485:	b8 0a 00 00 00       	mov    $0xa,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <getpid>:
SYSCALL(getpid)
 48d:	b8 0b 00 00 00       	mov    $0xb,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <sbrk>:
SYSCALL(sbrk)
 495:	b8 0c 00 00 00       	mov    $0xc,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <sleep>:
SYSCALL(sleep)
 49d:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <uptime>:
SYSCALL(uptime)
 4a5:	b8 0e 00 00 00       	mov    $0xe,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <clone>:
SYSCALL(clone)
 4ad:	b8 16 00 00 00       	mov    $0x16,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <lock>:
SYSCALL(lock)
 4b5:	b8 17 00 00 00       	mov    $0x17,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <unlock>:
SYSCALL(unlock)
 4bd:	b8 18 00 00 00       	mov    $0x18,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <join>:
SYSCALL(join)
 4c5:	b8 19 00 00 00       	mov    $0x19,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    
 4cd:	66 90                	xchg   %ax,%ax
 4cf:	90                   	nop

000004d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	57                   	push   %edi
 4d4:	56                   	push   %esi
 4d5:	53                   	push   %ebx
 4d6:	83 ec 3c             	sub    $0x3c,%esp
 4d9:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 4dc:	89 d1                	mov    %edx,%ecx
{
 4de:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 4e1:	85 d2                	test   %edx,%edx
 4e3:	0f 89 7f 00 00 00    	jns    568 <printint+0x98>
 4e9:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 4ed:	74 79                	je     568 <printint+0x98>
    neg = 1;
 4ef:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 4f6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 4f8:	31 db                	xor    %ebx,%ebx
 4fa:	8d 75 d7             	lea    -0x29(%ebp),%esi
 4fd:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 500:	89 c8                	mov    %ecx,%eax
 502:	31 d2                	xor    %edx,%edx
 504:	89 cf                	mov    %ecx,%edi
 506:	f7 75 c4             	divl   -0x3c(%ebp)
 509:	0f b6 92 2c 09 00 00 	movzbl 0x92c(%edx),%edx
 510:	89 45 c0             	mov    %eax,-0x40(%ebp)
 513:	89 d8                	mov    %ebx,%eax
 515:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 518:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 51b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 51e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 521:	76 dd                	jbe    500 <printint+0x30>
  if(neg)
 523:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 526:	85 c9                	test   %ecx,%ecx
 528:	74 0c                	je     536 <printint+0x66>
    buf[i++] = '-';
 52a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 52f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 531:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 536:	8b 7d b8             	mov    -0x48(%ebp),%edi
 539:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 53d:	eb 07                	jmp    546 <printint+0x76>
 53f:	90                   	nop
    putc(fd, buf[i]);
 540:	0f b6 13             	movzbl (%ebx),%edx
 543:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 546:	83 ec 04             	sub    $0x4,%esp
 549:	88 55 d7             	mov    %dl,-0x29(%ebp)
 54c:	6a 01                	push   $0x1
 54e:	56                   	push   %esi
 54f:	57                   	push   %edi
 550:	e8 d8 fe ff ff       	call   42d <write>
  while(--i >= 0)
 555:	83 c4 10             	add    $0x10,%esp
 558:	39 de                	cmp    %ebx,%esi
 55a:	75 e4                	jne    540 <printint+0x70>
}
 55c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 55f:	5b                   	pop    %ebx
 560:	5e                   	pop    %esi
 561:	5f                   	pop    %edi
 562:	5d                   	pop    %ebp
 563:	c3                   	ret    
 564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 568:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 56f:	eb 87                	jmp    4f8 <printint+0x28>
 571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 578:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57f:	90                   	nop

00000580 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
 584:	56                   	push   %esi
 585:	53                   	push   %ebx
 586:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 589:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 58c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 58f:	0f b6 13             	movzbl (%ebx),%edx
 592:	84 d2                	test   %dl,%dl
 594:	74 6a                	je     600 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 596:	8d 45 10             	lea    0x10(%ebp),%eax
 599:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 59c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 59f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5a4:	eb 36                	jmp    5dc <printf+0x5c>
 5a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
 5b0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5b3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5b8:	83 f8 25             	cmp    $0x25,%eax
 5bb:	74 15                	je     5d2 <printf+0x52>
  write(fd, &c, 1);
 5bd:	83 ec 04             	sub    $0x4,%esp
 5c0:	88 55 e7             	mov    %dl,-0x19(%ebp)
 5c3:	6a 01                	push   $0x1
 5c5:	57                   	push   %edi
 5c6:	56                   	push   %esi
 5c7:	e8 61 fe ff ff       	call   42d <write>
 5cc:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 5cf:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 5d2:	0f b6 13             	movzbl (%ebx),%edx
 5d5:	83 c3 01             	add    $0x1,%ebx
 5d8:	84 d2                	test   %dl,%dl
 5da:	74 24                	je     600 <printf+0x80>
    c = fmt[i] & 0xff;
 5dc:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 5df:	85 c9                	test   %ecx,%ecx
 5e1:	74 cd                	je     5b0 <printf+0x30>
      }
    } else if(state == '%'){
 5e3:	83 f9 25             	cmp    $0x25,%ecx
 5e6:	75 ea                	jne    5d2 <printf+0x52>
      if(c == 'd'){
 5e8:	83 f8 25             	cmp    $0x25,%eax
 5eb:	0f 84 07 01 00 00    	je     6f8 <printf+0x178>
 5f1:	83 e8 63             	sub    $0x63,%eax
 5f4:	83 f8 15             	cmp    $0x15,%eax
 5f7:	77 17                	ja     610 <printf+0x90>
 5f9:	ff 24 85 d4 08 00 00 	jmp    *0x8d4(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 600:	8d 65 f4             	lea    -0xc(%ebp),%esp
 603:	5b                   	pop    %ebx
 604:	5e                   	pop    %esi
 605:	5f                   	pop    %edi
 606:	5d                   	pop    %ebp
 607:	c3                   	ret    
 608:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 60f:	90                   	nop
  write(fd, &c, 1);
 610:	83 ec 04             	sub    $0x4,%esp
 613:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 616:	6a 01                	push   $0x1
 618:	57                   	push   %edi
 619:	56                   	push   %esi
 61a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 61e:	e8 0a fe ff ff       	call   42d <write>
        putc(fd, c);
 623:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 627:	83 c4 0c             	add    $0xc,%esp
 62a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 62d:	6a 01                	push   $0x1
 62f:	57                   	push   %edi
 630:	56                   	push   %esi
 631:	e8 f7 fd ff ff       	call   42d <write>
        putc(fd, c);
 636:	83 c4 10             	add    $0x10,%esp
      state = 0;
 639:	31 c9                	xor    %ecx,%ecx
 63b:	eb 95                	jmp    5d2 <printf+0x52>
 63d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 640:	83 ec 0c             	sub    $0xc,%esp
 643:	b9 10 00 00 00       	mov    $0x10,%ecx
 648:	6a 00                	push   $0x0
 64a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 64d:	8b 10                	mov    (%eax),%edx
 64f:	89 f0                	mov    %esi,%eax
 651:	e8 7a fe ff ff       	call   4d0 <printint>
        ap++;
 656:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 65a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 65d:	31 c9                	xor    %ecx,%ecx
 65f:	e9 6e ff ff ff       	jmp    5d2 <printf+0x52>
 664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 668:	8b 45 d0             	mov    -0x30(%ebp),%eax
 66b:	8b 10                	mov    (%eax),%edx
        ap++;
 66d:	83 c0 04             	add    $0x4,%eax
 670:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 673:	85 d2                	test   %edx,%edx
 675:	0f 84 8d 00 00 00    	je     708 <printf+0x188>
        while(*s != 0){
 67b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 67e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 680:	84 c0                	test   %al,%al
 682:	0f 84 4a ff ff ff    	je     5d2 <printf+0x52>
 688:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 68b:	89 d3                	mov    %edx,%ebx
 68d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 690:	83 ec 04             	sub    $0x4,%esp
          s++;
 693:	83 c3 01             	add    $0x1,%ebx
 696:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 699:	6a 01                	push   $0x1
 69b:	57                   	push   %edi
 69c:	56                   	push   %esi
 69d:	e8 8b fd ff ff       	call   42d <write>
        while(*s != 0){
 6a2:	0f b6 03             	movzbl (%ebx),%eax
 6a5:	83 c4 10             	add    $0x10,%esp
 6a8:	84 c0                	test   %al,%al
 6aa:	75 e4                	jne    690 <printf+0x110>
      state = 0;
 6ac:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6af:	31 c9                	xor    %ecx,%ecx
 6b1:	e9 1c ff ff ff       	jmp    5d2 <printf+0x52>
 6b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 6c0:	83 ec 0c             	sub    $0xc,%esp
 6c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6c8:	6a 01                	push   $0x1
 6ca:	e9 7b ff ff ff       	jmp    64a <printf+0xca>
 6cf:	90                   	nop
        putc(fd, *ap);
 6d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 6d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6d6:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 6d8:	6a 01                	push   $0x1
 6da:	57                   	push   %edi
 6db:	56                   	push   %esi
        putc(fd, *ap);
 6dc:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6df:	e8 49 fd ff ff       	call   42d <write>
        ap++;
 6e4:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 6e8:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6eb:	31 c9                	xor    %ecx,%ecx
 6ed:	e9 e0 fe ff ff       	jmp    5d2 <printf+0x52>
 6f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 6f8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 6fb:	83 ec 04             	sub    $0x4,%esp
 6fe:	e9 2a ff ff ff       	jmp    62d <printf+0xad>
 703:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 707:	90                   	nop
          s = "(null)";
 708:	ba cb 08 00 00       	mov    $0x8cb,%edx
        while(*s != 0){
 70d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 710:	b8 28 00 00 00       	mov    $0x28,%eax
 715:	89 d3                	mov    %edx,%ebx
 717:	e9 74 ff ff ff       	jmp    690 <printf+0x110>
 71c:	66 90                	xchg   %ax,%ax
 71e:	66 90                	xchg   %ax,%ax

00000720 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 720:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 721:	a1 20 0c 00 00       	mov    0xc20,%eax
{
 726:	89 e5                	mov    %esp,%ebp
 728:	57                   	push   %edi
 729:	56                   	push   %esi
 72a:	53                   	push   %ebx
 72b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 72e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 731:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 738:	89 c2                	mov    %eax,%edx
 73a:	8b 00                	mov    (%eax),%eax
 73c:	39 ca                	cmp    %ecx,%edx
 73e:	73 30                	jae    770 <free+0x50>
 740:	39 c1                	cmp    %eax,%ecx
 742:	72 04                	jb     748 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 744:	39 c2                	cmp    %eax,%edx
 746:	72 f0                	jb     738 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 748:	8b 73 fc             	mov    -0x4(%ebx),%esi
 74b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 74e:	39 f8                	cmp    %edi,%eax
 750:	74 30                	je     782 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 752:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 755:	8b 42 04             	mov    0x4(%edx),%eax
 758:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 75b:	39 f1                	cmp    %esi,%ecx
 75d:	74 3a                	je     799 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 75f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 761:	5b                   	pop    %ebx
  freep = p;
 762:	89 15 20 0c 00 00    	mov    %edx,0xc20
}
 768:	5e                   	pop    %esi
 769:	5f                   	pop    %edi
 76a:	5d                   	pop    %ebp
 76b:	c3                   	ret    
 76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 770:	39 c2                	cmp    %eax,%edx
 772:	72 c4                	jb     738 <free+0x18>
 774:	39 c1                	cmp    %eax,%ecx
 776:	73 c0                	jae    738 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 778:	8b 73 fc             	mov    -0x4(%ebx),%esi
 77b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 77e:	39 f8                	cmp    %edi,%eax
 780:	75 d0                	jne    752 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 782:	03 70 04             	add    0x4(%eax),%esi
 785:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 788:	8b 02                	mov    (%edx),%eax
 78a:	8b 00                	mov    (%eax),%eax
 78c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 78f:	8b 42 04             	mov    0x4(%edx),%eax
 792:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 795:	39 f1                	cmp    %esi,%ecx
 797:	75 c6                	jne    75f <free+0x3f>
    p->s.size += bp->s.size;
 799:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 79c:	89 15 20 0c 00 00    	mov    %edx,0xc20
    p->s.size += bp->s.size;
 7a2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7a5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7a8:	89 0a                	mov    %ecx,(%edx)
}
 7aa:	5b                   	pop    %ebx
 7ab:	5e                   	pop    %esi
 7ac:	5f                   	pop    %edi
 7ad:	5d                   	pop    %ebp
 7ae:	c3                   	ret    
 7af:	90                   	nop

000007b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7bc:	8b 3d 20 0c 00 00    	mov    0xc20,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c2:	8d 70 07             	lea    0x7(%eax),%esi
 7c5:	c1 ee 03             	shr    $0x3,%esi
 7c8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 7cb:	85 ff                	test   %edi,%edi
 7cd:	0f 84 9d 00 00 00    	je     870 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 7d5:	8b 4a 04             	mov    0x4(%edx),%ecx
 7d8:	39 f1                	cmp    %esi,%ecx
 7da:	73 6a                	jae    846 <malloc+0x96>
 7dc:	bb 00 10 00 00       	mov    $0x1000,%ebx
 7e1:	39 de                	cmp    %ebx,%esi
 7e3:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 7e6:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 7ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7f0:	eb 17                	jmp    809 <malloc+0x59>
 7f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7fa:	8b 48 04             	mov    0x4(%eax),%ecx
 7fd:	39 f1                	cmp    %esi,%ecx
 7ff:	73 4f                	jae    850 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 801:	8b 3d 20 0c 00 00    	mov    0xc20,%edi
 807:	89 c2                	mov    %eax,%edx
 809:	39 d7                	cmp    %edx,%edi
 80b:	75 eb                	jne    7f8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 80d:	83 ec 0c             	sub    $0xc,%esp
 810:	ff 75 e4             	pushl  -0x1c(%ebp)
 813:	e8 7d fc ff ff       	call   495 <sbrk>
  if(p == (char*)-1)
 818:	83 c4 10             	add    $0x10,%esp
 81b:	83 f8 ff             	cmp    $0xffffffff,%eax
 81e:	74 1c                	je     83c <malloc+0x8c>
  hp->s.size = nu;
 820:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 823:	83 ec 0c             	sub    $0xc,%esp
 826:	83 c0 08             	add    $0x8,%eax
 829:	50                   	push   %eax
 82a:	e8 f1 fe ff ff       	call   720 <free>
  return freep;
 82f:	8b 15 20 0c 00 00    	mov    0xc20,%edx
      if((p = morecore(nunits)) == 0)
 835:	83 c4 10             	add    $0x10,%esp
 838:	85 d2                	test   %edx,%edx
 83a:	75 bc                	jne    7f8 <malloc+0x48>
        return 0;
  }
}
 83c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 83f:	31 c0                	xor    %eax,%eax
}
 841:	5b                   	pop    %ebx
 842:	5e                   	pop    %esi
 843:	5f                   	pop    %edi
 844:	5d                   	pop    %ebp
 845:	c3                   	ret    
    if(p->s.size >= nunits){
 846:	89 d0                	mov    %edx,%eax
 848:	89 fa                	mov    %edi,%edx
 84a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 850:	39 ce                	cmp    %ecx,%esi
 852:	74 4c                	je     8a0 <malloc+0xf0>
        p->s.size -= nunits;
 854:	29 f1                	sub    %esi,%ecx
 856:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 859:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 85c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 85f:	89 15 20 0c 00 00    	mov    %edx,0xc20
}
 865:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 868:	83 c0 08             	add    $0x8,%eax
}
 86b:	5b                   	pop    %ebx
 86c:	5e                   	pop    %esi
 86d:	5f                   	pop    %edi
 86e:	5d                   	pop    %ebp
 86f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 870:	c7 05 20 0c 00 00 24 	movl   $0xc24,0xc20
 877:	0c 00 00 
    base.s.size = 0;
 87a:	bf 24 0c 00 00       	mov    $0xc24,%edi
    base.s.ptr = freep = prevp = &base;
 87f:	c7 05 24 0c 00 00 24 	movl   $0xc24,0xc24
 886:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 889:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 88b:	c7 05 28 0c 00 00 00 	movl   $0x0,0xc28
 892:	00 00 00 
    if(p->s.size >= nunits){
 895:	e9 42 ff ff ff       	jmp    7dc <malloc+0x2c>
 89a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8a0:	8b 08                	mov    (%eax),%ecx
 8a2:	89 0a                	mov    %ecx,(%edx)
 8a4:	eb b9                	jmp    85f <malloc+0xaf>
