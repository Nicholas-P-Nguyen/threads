
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

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
   f:	be 01 00 00 00       	mov    $0x1,%esi
  14:	53                   	push   %ebx
  15:	51                   	push   %ecx
  16:	83 ec 18             	sub    $0x18,%esp
  19:	8b 01                	mov    (%ecx),%eax
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  21:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
  24:	83 f8 01             	cmp    $0x1,%eax
  27:	7e 56                	jle    7f <main+0x7f>
  29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  30:	83 ec 08             	sub    $0x8,%esp
  33:	6a 00                	push   $0x0
  35:	ff 33                	pushl  (%ebx)
  37:	e8 51 04 00 00       	call   48d <open>
  3c:	83 c4 10             	add    $0x10,%esp
  3f:	89 c7                	mov    %eax,%edi
  41:	85 c0                	test   %eax,%eax
  43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  45:	83 ec 08             	sub    $0x8,%esp
  48:	ff 33                	pushl  (%ebx)
  for(i = 1; i < argc; i++){
  4a:	83 c6 01             	add    $0x1,%esi
  4d:	83 c3 04             	add    $0x4,%ebx
    wc(fd, argv[i]);
  50:	50                   	push   %eax
  51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
  56:	89 3c 24             	mov    %edi,(%esp)
  59:	e8 17 04 00 00       	call   475 <close>
  for(i = 1; i < argc; i++){
  5e:	83 c4 10             	add    $0x10,%esp
  61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
  64:	75 ca                	jne    30 <main+0x30>
  }
  exit();
  66:	e8 e2 03 00 00       	call   44d <exit>
      printf(1, "wc: cannot open %s\n", argv[i]);
  6b:	50                   	push   %eax
  6c:	ff 33                	pushl  (%ebx)
  6e:	68 0b 09 00 00       	push   $0x90b
  73:	6a 01                	push   $0x1
  75:	e8 46 05 00 00       	call   5c0 <printf>
      exit();
  7a:	e8 ce 03 00 00       	call   44d <exit>
    wc(0, "");
  7f:	52                   	push   %edx
  80:	52                   	push   %edx
  81:	68 fd 08 00 00       	push   $0x8fd
  86:	6a 00                	push   $0x0
  88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
  8d:	e8 bb 03 00 00       	call   44d <exit>
  92:	66 90                	xchg   %ax,%ax
  94:	66 90                	xchg   %ax,%ax
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  a5:	53                   	push   %ebx
  l = w = c = 0;
  a6:	31 db                	xor    %ebx,%ebx
{
  a8:	83 ec 1c             	sub    $0x1c,%esp
  inword = 0;
  ab:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  l = w = c = 0;
  b2:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  b9:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	83 ec 04             	sub    $0x4,%esp
  c3:	68 00 02 00 00       	push   $0x200
  c8:	68 c0 0c 00 00       	push   $0xcc0
  cd:	ff 75 08             	pushl  0x8(%ebp)
  d0:	e8 90 03 00 00       	call   465 <read>
  d5:	83 c4 10             	add    $0x10,%esp
  d8:	89 c6                	mov    %eax,%esi
  da:	85 c0                	test   %eax,%eax
  dc:	7e 62                	jle    140 <wc+0xa0>
    for(i=0; i<n; i++){
  de:	31 ff                	xor    %edi,%edi
  e0:	eb 14                	jmp    f6 <wc+0x56>
  e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        inword = 0;
  e8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    for(i=0; i<n; i++){
  ef:	83 c7 01             	add    $0x1,%edi
  f2:	39 fe                	cmp    %edi,%esi
  f4:	74 42                	je     138 <wc+0x98>
      if(buf[i] == '\n')
  f6:	0f be 87 c0 0c 00 00 	movsbl 0xcc0(%edi),%eax
        l++;
  fd:	31 c9                	xor    %ecx,%ecx
  ff:	3c 0a                	cmp    $0xa,%al
 101:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 104:	83 ec 08             	sub    $0x8,%esp
 107:	50                   	push   %eax
        l++;
 108:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 10a:	68 e8 08 00 00       	push   $0x8e8
 10f:	e8 4c 01 00 00       	call   260 <strchr>
 114:	83 c4 10             	add    $0x10,%esp
 117:	85 c0                	test   %eax,%eax
 119:	75 cd                	jne    e8 <wc+0x48>
      else if(!inword){
 11b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 11e:	85 d2                	test   %edx,%edx
 120:	75 cd                	jne    ef <wc+0x4f>
    for(i=0; i<n; i++){
 122:	83 c7 01             	add    $0x1,%edi
        w++;
 125:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
        inword = 1;
 129:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
 130:	39 fe                	cmp    %edi,%esi
 132:	75 c2                	jne    f6 <wc+0x56>
 134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      c++;
 138:	01 75 dc             	add    %esi,-0x24(%ebp)
 13b:	eb 83                	jmp    c0 <wc+0x20>
 13d:	8d 76 00             	lea    0x0(%esi),%esi
  if(n < 0){
 140:	75 24                	jne    166 <wc+0xc6>
  printf(1, "%d %d %d %s\n", l, w, c, name);
 142:	83 ec 08             	sub    $0x8,%esp
 145:	ff 75 0c             	pushl  0xc(%ebp)
 148:	ff 75 dc             	pushl  -0x24(%ebp)
 14b:	ff 75 e0             	pushl  -0x20(%ebp)
 14e:	53                   	push   %ebx
 14f:	68 fe 08 00 00       	push   $0x8fe
 154:	6a 01                	push   $0x1
 156:	e8 65 04 00 00       	call   5c0 <printf>
}
 15b:	83 c4 20             	add    $0x20,%esp
 15e:	8d 65 f4             	lea    -0xc(%ebp),%esp
 161:	5b                   	pop    %ebx
 162:	5e                   	pop    %esi
 163:	5f                   	pop    %edi
 164:	5d                   	pop    %ebp
 165:	c3                   	ret    
    printf(1, "wc: read error\n");
 166:	50                   	push   %eax
 167:	50                   	push   %eax
 168:	68 ee 08 00 00       	push   $0x8ee
 16d:	6a 01                	push   $0x1
 16f:	e8 4c 04 00 00       	call   5c0 <printf>
    exit();
 174:	e8 d4 02 00 00       	call   44d <exit>
 179:	66 90                	xchg   %ax,%ax
 17b:	66 90                	xchg   %ax,%ax
 17d:	66 90                	xchg   %ax,%ax
 17f:	90                   	nop

00000180 <strcpy>:
#include "x86.h"
#include "spinlock.h"

char*
strcpy(char *s, const char *t)
{
 180:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 181:	31 c0                	xor    %eax,%eax
{
 183:	89 e5                	mov    %esp,%ebp
 185:	53                   	push   %ebx
 186:	8b 4d 08             	mov    0x8(%ebp),%ecx
 189:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
 190:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 194:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 197:	83 c0 01             	add    $0x1,%eax
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strcpy+0x10>
    ;
  return os;
}
 19e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1a1:	89 c8                	mov    %ecx,%eax
 1a3:	c9                   	leave  
 1a4:	c3                   	ret    
 1a5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	53                   	push   %ebx
 1b4:	8b 55 08             	mov    0x8(%ebp),%edx
 1b7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ba:	0f b6 02             	movzbl (%edx),%eax
 1bd:	84 c0                	test   %al,%al
 1bf:	75 17                	jne    1d8 <strcmp+0x28>
 1c1:	eb 3a                	jmp    1fd <strcmp+0x4d>
 1c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1c7:	90                   	nop
 1c8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
 1cc:	83 c2 01             	add    $0x1,%edx
 1cf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 1d2:	84 c0                	test   %al,%al
 1d4:	74 1a                	je     1f0 <strcmp+0x40>
    p++, q++;
 1d6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
 1d8:	0f b6 19             	movzbl (%ecx),%ebx
 1db:	38 c3                	cmp    %al,%bl
 1dd:	74 e9                	je     1c8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
 1df:	29 d8                	sub    %ebx,%eax
}
 1e1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    
 1e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ed:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
 1f0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1f4:	31 c0                	xor    %eax,%eax
 1f6:	29 d8                	sub    %ebx,%eax
}
 1f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1fb:	c9                   	leave  
 1fc:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
 1fd:	0f b6 19             	movzbl (%ecx),%ebx
 200:	31 c0                	xor    %eax,%eax
 202:	eb db                	jmp    1df <strcmp+0x2f>
 204:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 20b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 20f:	90                   	nop

00000210 <strlen>:

uint
strlen(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 216:	80 3a 00             	cmpb   $0x0,(%edx)
 219:	74 15                	je     230 <strlen+0x20>
 21b:	31 c0                	xor    %eax,%eax
 21d:	8d 76 00             	lea    0x0(%esi),%esi
 220:	83 c0 01             	add    $0x1,%eax
 223:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 227:	89 c1                	mov    %eax,%ecx
 229:	75 f5                	jne    220 <strlen+0x10>
    ;
  return n;
}
 22b:	89 c8                	mov    %ecx,%eax
 22d:	5d                   	pop    %ebp
 22e:	c3                   	ret    
 22f:	90                   	nop
  for(n = 0; s[n]; n++)
 230:	31 c9                	xor    %ecx,%ecx
}
 232:	5d                   	pop    %ebp
 233:	89 c8                	mov    %ecx,%eax
 235:	c3                   	ret    
 236:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23d:	8d 76 00             	lea    0x0(%esi),%esi

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	57                   	push   %edi
 244:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 247:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 d7                	mov    %edx,%edi
 24f:	fc                   	cld    
 250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 252:	8b 7d fc             	mov    -0x4(%ebp),%edi
 255:	89 d0                	mov    %edx,%eax
 257:	c9                   	leave  
 258:	c3                   	ret    
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 26a:	0f b6 10             	movzbl (%eax),%edx
 26d:	84 d2                	test   %dl,%dl
 26f:	75 12                	jne    283 <strchr+0x23>
 271:	eb 1d                	jmp    290 <strchr+0x30>
 273:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 277:	90                   	nop
 278:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 27c:	83 c0 01             	add    $0x1,%eax
 27f:	84 d2                	test   %dl,%dl
 281:	74 0d                	je     290 <strchr+0x30>
    if(*s == c)
 283:	38 d1                	cmp    %dl,%cl
 285:	75 f1                	jne    278 <strchr+0x18>
      return (char*)s;
  return 0;
}
 287:	5d                   	pop    %ebp
 288:	c3                   	ret    
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 290:	31 c0                	xor    %eax,%eax
}
 292:	5d                   	pop    %ebp
 293:	c3                   	ret    
 294:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 29f:	90                   	nop

000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2a5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
 2a8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
 2a9:	31 db                	xor    %ebx,%ebx
{
 2ab:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
 2ae:	eb 27                	jmp    2d7 <gets+0x37>
    cc = read(0, &c, 1);
 2b0:	83 ec 04             	sub    $0x4,%esp
 2b3:	6a 01                	push   $0x1
 2b5:	57                   	push   %edi
 2b6:	6a 00                	push   $0x0
 2b8:	e8 a8 01 00 00       	call   465 <read>
    if(cc < 1)
 2bd:	83 c4 10             	add    $0x10,%esp
 2c0:	85 c0                	test   %eax,%eax
 2c2:	7e 1d                	jle    2e1 <gets+0x41>
      break;
    buf[i++] = c;
 2c4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2c8:	8b 55 08             	mov    0x8(%ebp),%edx
 2cb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2cf:	3c 0a                	cmp    $0xa,%al
 2d1:	74 1d                	je     2f0 <gets+0x50>
 2d3:	3c 0d                	cmp    $0xd,%al
 2d5:	74 19                	je     2f0 <gets+0x50>
  for(i=0; i+1 < max; ){
 2d7:	89 de                	mov    %ebx,%esi
 2d9:	83 c3 01             	add    $0x1,%ebx
 2dc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2df:	7c cf                	jl     2b0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2eb:	5b                   	pop    %ebx
 2ec:	5e                   	pop    %esi
 2ed:	5f                   	pop    %edi
 2ee:	5d                   	pop    %ebp
 2ef:	c3                   	ret    
  buf[i] = '\0';
 2f0:	8b 45 08             	mov    0x8(%ebp),%eax
 2f3:	89 de                	mov    %ebx,%esi
 2f5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
 2f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fc:	5b                   	pop    %ebx
 2fd:	5e                   	pop    %esi
 2fe:	5f                   	pop    %edi
 2ff:	5d                   	pop    %ebp
 300:	c3                   	ret    
 301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 308:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 30f:	90                   	nop

00000310 <stat>:

int
stat(const char *n, struct stat *st)
{
 310:	55                   	push   %ebp
 311:	89 e5                	mov    %esp,%ebp
 313:	56                   	push   %esi
 314:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 315:	83 ec 08             	sub    $0x8,%esp
 318:	6a 00                	push   $0x0
 31a:	ff 75 08             	pushl  0x8(%ebp)
 31d:	e8 6b 01 00 00       	call   48d <open>
  if(fd < 0)
 322:	83 c4 10             	add    $0x10,%esp
 325:	85 c0                	test   %eax,%eax
 327:	78 27                	js     350 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 329:	83 ec 08             	sub    $0x8,%esp
 32c:	ff 75 0c             	pushl  0xc(%ebp)
 32f:	89 c3                	mov    %eax,%ebx
 331:	50                   	push   %eax
 332:	e8 6e 01 00 00       	call   4a5 <fstat>
  close(fd);
 337:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 33a:	89 c6                	mov    %eax,%esi
  close(fd);
 33c:	e8 34 01 00 00       	call   475 <close>
  return r;
 341:	83 c4 10             	add    $0x10,%esp
}
 344:	8d 65 f8             	lea    -0x8(%ebp),%esp
 347:	89 f0                	mov    %esi,%eax
 349:	5b                   	pop    %ebx
 34a:	5e                   	pop    %esi
 34b:	5d                   	pop    %ebp
 34c:	c3                   	ret    
 34d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 350:	be ff ff ff ff       	mov    $0xffffffff,%esi
 355:	eb ed                	jmp    344 <stat+0x34>
 357:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 35e:	66 90                	xchg   %ax,%ax

00000360 <atoi>:

int
atoi(const char *s)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 367:	0f be 02             	movsbl (%edx),%eax
 36a:	8d 48 d0             	lea    -0x30(%eax),%ecx
 36d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 370:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 375:	77 1e                	ja     395 <atoi+0x35>
 377:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 37e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 380:	83 c2 01             	add    $0x1,%edx
 383:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 386:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 38a:	0f be 02             	movsbl (%edx),%eax
 38d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 390:	80 fb 09             	cmp    $0x9,%bl
 393:	76 eb                	jbe    380 <atoi+0x20>
  return n;
}
 395:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 398:	89 c8                	mov    %ecx,%eax
 39a:	c9                   	leave  
 39b:	c3                   	ret    
 39c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	57                   	push   %edi
 3a4:	8b 45 10             	mov    0x10(%ebp),%eax
 3a7:	8b 55 08             	mov    0x8(%ebp),%edx
 3aa:	56                   	push   %esi
 3ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ae:	85 c0                	test   %eax,%eax
 3b0:	7e 13                	jle    3c5 <memmove+0x25>
 3b2:	01 d0                	add    %edx,%eax
  dst = vdst;
 3b4:	89 d7                	mov    %edx,%edi
 3b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 3c0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 3c1:	39 f8                	cmp    %edi,%eax
 3c3:	75 fb                	jne    3c0 <memmove+0x20>
  return vdst;
}
 3c5:	5e                   	pop    %esi
 3c6:	89 d0                	mov    %edx,%eax
 3c8:	5f                   	pop    %edi
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    
 3cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3cf:	90                   	nop

000003d0 <thread_create>:

int
thread_create(void (*fn)(void *), void *arg)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	53                   	push   %ebx
 3d4:	83 ec 10             	sub    $0x10,%esp
  void *stack = malloc(4096);
 3d7:	68 00 10 00 00       	push   $0x1000
 3dc:	e8 0f 04 00 00       	call   7f0 <malloc>
  if(stack == 0)
 3e1:	83 c4 10             	add    $0x10,%esp
 3e4:	85 c0                	test   %eax,%eax
 3e6:	74 3b                	je     423 <thread_create+0x53>
 3e8:	89 c3                	mov    %eax,%ebx
    return -1;
  
  // Check for page alignment.
  if(((uint)stack % 4096) != 0){
 3ea:	a9 ff 0f 00 00       	test   $0xfff,%eax
 3ef:	75 1f                	jne    410 <thread_create+0x40>
    free(stack);
    return -1;
  }
  
  int tid = clone(stack);
 3f1:	83 ec 0c             	sub    $0xc,%esp
 3f4:	50                   	push   %eax
 3f5:	e8 f3 00 00 00       	call   4ed <clone>
  if(tid < 0){
 3fa:	83 c4 10             	add    $0x10,%esp
 3fd:	85 c0                	test   %eax,%eax
 3ff:	78 0f                	js     410 <thread_create+0x40>
    free(stack);
    return -1;
  }
  
  if(tid == 0){
 401:	74 27                	je     42a <thread_create+0x5a>
    exit();
  }
  
  // Parent returns the new thread's id.
  return tid;
}
 403:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 406:	c9                   	leave  
 407:	c3                   	ret    
 408:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 40f:	90                   	nop
    free(stack);
 410:	83 ec 0c             	sub    $0xc,%esp
 413:	53                   	push   %ebx
 414:	e8 47 03 00 00       	call   760 <free>
    return -1;
 419:	83 c4 10             	add    $0x10,%esp
 41c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 421:	eb e0                	jmp    403 <thread_create+0x33>
    return -1;
 423:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 428:	eb d9                	jmp    403 <thread_create+0x33>
    fn(arg);
 42a:	83 ec 0c             	sub    $0xc,%esp
 42d:	ff 75 0c             	pushl  0xc(%ebp)
 430:	ff 55 08             	call   *0x8(%ebp)
    free(stack);
 433:	89 1c 24             	mov    %ebx,(%esp)
 436:	e8 25 03 00 00       	call   760 <free>
    exit();
 43b:	e8 0d 00 00 00       	call   44d <exit>

00000440 <thread_join>:

int
thread_join(void)
{
  return join();
 440:	e9 c0 00 00 00       	jmp    505 <join>

00000445 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 445:	b8 01 00 00 00       	mov    $0x1,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <exit>:
SYSCALL(exit)
 44d:	b8 02 00 00 00       	mov    $0x2,%eax
 452:	cd 40                	int    $0x40
 454:	c3                   	ret    

00000455 <wait>:
SYSCALL(wait)
 455:	b8 03 00 00 00       	mov    $0x3,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <pipe>:
SYSCALL(pipe)
 45d:	b8 04 00 00 00       	mov    $0x4,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <read>:
SYSCALL(read)
 465:	b8 05 00 00 00       	mov    $0x5,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    

0000046d <write>:
SYSCALL(write)
 46d:	b8 10 00 00 00       	mov    $0x10,%eax
 472:	cd 40                	int    $0x40
 474:	c3                   	ret    

00000475 <close>:
SYSCALL(close)
 475:	b8 15 00 00 00       	mov    $0x15,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    

0000047d <kill>:
SYSCALL(kill)
 47d:	b8 06 00 00 00       	mov    $0x6,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    

00000485 <exec>:
SYSCALL(exec)
 485:	b8 07 00 00 00       	mov    $0x7,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <open>:
SYSCALL(open)
 48d:	b8 0f 00 00 00       	mov    $0xf,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <mknod>:
SYSCALL(mknod)
 495:	b8 11 00 00 00       	mov    $0x11,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <unlink>:
SYSCALL(unlink)
 49d:	b8 12 00 00 00       	mov    $0x12,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <fstat>:
SYSCALL(fstat)
 4a5:	b8 08 00 00 00       	mov    $0x8,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <link>:
SYSCALL(link)
 4ad:	b8 13 00 00 00       	mov    $0x13,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <mkdir>:
SYSCALL(mkdir)
 4b5:	b8 14 00 00 00       	mov    $0x14,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <chdir>:
SYSCALL(chdir)
 4bd:	b8 09 00 00 00       	mov    $0x9,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <dup>:
SYSCALL(dup)
 4c5:	b8 0a 00 00 00       	mov    $0xa,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <getpid>:
SYSCALL(getpid)
 4cd:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <sbrk>:
SYSCALL(sbrk)
 4d5:	b8 0c 00 00 00       	mov    $0xc,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <sleep>:
SYSCALL(sleep)
 4dd:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <uptime>:
SYSCALL(uptime)
 4e5:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <clone>:
SYSCALL(clone)
 4ed:	b8 16 00 00 00       	mov    $0x16,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <lock>:
SYSCALL(lock)
 4f5:	b8 17 00 00 00       	mov    $0x17,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <unlock>:
SYSCALL(unlock)
 4fd:	b8 18 00 00 00       	mov    $0x18,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <join>:
SYSCALL(join)
 505:	b8 19 00 00 00       	mov    $0x19,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    
 50d:	66 90                	xchg   %ax,%ax
 50f:	90                   	nop

00000510 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 510:	55                   	push   %ebp
 511:	89 e5                	mov    %esp,%ebp
 513:	57                   	push   %edi
 514:	56                   	push   %esi
 515:	53                   	push   %ebx
 516:	83 ec 3c             	sub    $0x3c,%esp
 519:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 51c:	89 d1                	mov    %edx,%ecx
{
 51e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 521:	85 d2                	test   %edx,%edx
 523:	0f 89 7f 00 00 00    	jns    5a8 <printint+0x98>
 529:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 52d:	74 79                	je     5a8 <printint+0x98>
    neg = 1;
 52f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 536:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 538:	31 db                	xor    %ebx,%ebx
 53a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 53d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 540:	89 c8                	mov    %ecx,%eax
 542:	31 d2                	xor    %edx,%edx
 544:	89 cf                	mov    %ecx,%edi
 546:	f7 75 c4             	divl   -0x3c(%ebp)
 549:	0f b6 92 80 09 00 00 	movzbl 0x980(%edx),%edx
 550:	89 45 c0             	mov    %eax,-0x40(%ebp)
 553:	89 d8                	mov    %ebx,%eax
 555:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 558:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 55b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 55e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 561:	76 dd                	jbe    540 <printint+0x30>
  if(neg)
 563:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 566:	85 c9                	test   %ecx,%ecx
 568:	74 0c                	je     576 <printint+0x66>
    buf[i++] = '-';
 56a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 56f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 571:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 576:	8b 7d b8             	mov    -0x48(%ebp),%edi
 579:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 57d:	eb 07                	jmp    586 <printint+0x76>
 57f:	90                   	nop
    putc(fd, buf[i]);
 580:	0f b6 13             	movzbl (%ebx),%edx
 583:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 586:	83 ec 04             	sub    $0x4,%esp
 589:	88 55 d7             	mov    %dl,-0x29(%ebp)
 58c:	6a 01                	push   $0x1
 58e:	56                   	push   %esi
 58f:	57                   	push   %edi
 590:	e8 d8 fe ff ff       	call   46d <write>
  while(--i >= 0)
 595:	83 c4 10             	add    $0x10,%esp
 598:	39 de                	cmp    %ebx,%esi
 59a:	75 e4                	jne    580 <printint+0x70>
}
 59c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 59f:	5b                   	pop    %ebx
 5a0:	5e                   	pop    %esi
 5a1:	5f                   	pop    %edi
 5a2:	5d                   	pop    %ebp
 5a3:	c3                   	ret    
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5a8:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 5af:	eb 87                	jmp    538 <printint+0x28>
 5b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5bf:	90                   	nop

000005c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	57                   	push   %edi
 5c4:	56                   	push   %esi
 5c5:	53                   	push   %ebx
 5c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
 5cc:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
 5cf:	0f b6 13             	movzbl (%ebx),%edx
 5d2:	84 d2                	test   %dl,%dl
 5d4:	74 6a                	je     640 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
 5d6:	8d 45 10             	lea    0x10(%ebp),%eax
 5d9:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
 5dc:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5df:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
 5e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5e4:	eb 36                	jmp    61c <printf+0x5c>
 5e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
 5f0:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5f3:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
 5f8:	83 f8 25             	cmp    $0x25,%eax
 5fb:	74 15                	je     612 <printf+0x52>
  write(fd, &c, 1);
 5fd:	83 ec 04             	sub    $0x4,%esp
 600:	88 55 e7             	mov    %dl,-0x19(%ebp)
 603:	6a 01                	push   $0x1
 605:	57                   	push   %edi
 606:	56                   	push   %esi
 607:	e8 61 fe ff ff       	call   46d <write>
 60c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
 60f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 612:	0f b6 13             	movzbl (%ebx),%edx
 615:	83 c3 01             	add    $0x1,%ebx
 618:	84 d2                	test   %dl,%dl
 61a:	74 24                	je     640 <printf+0x80>
    c = fmt[i] & 0xff;
 61c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
 61f:	85 c9                	test   %ecx,%ecx
 621:	74 cd                	je     5f0 <printf+0x30>
      }
    } else if(state == '%'){
 623:	83 f9 25             	cmp    $0x25,%ecx
 626:	75 ea                	jne    612 <printf+0x52>
      if(c == 'd'){
 628:	83 f8 25             	cmp    $0x25,%eax
 62b:	0f 84 07 01 00 00    	je     738 <printf+0x178>
 631:	83 e8 63             	sub    $0x63,%eax
 634:	83 f8 15             	cmp    $0x15,%eax
 637:	77 17                	ja     650 <printf+0x90>
 639:	ff 24 85 28 09 00 00 	jmp    *0x928(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 640:	8d 65 f4             	lea    -0xc(%ebp),%esp
 643:	5b                   	pop    %ebx
 644:	5e                   	pop    %esi
 645:	5f                   	pop    %edi
 646:	5d                   	pop    %ebp
 647:	c3                   	ret    
 648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 64f:	90                   	nop
  write(fd, &c, 1);
 650:	83 ec 04             	sub    $0x4,%esp
 653:	88 55 d4             	mov    %dl,-0x2c(%ebp)
 656:	6a 01                	push   $0x1
 658:	57                   	push   %edi
 659:	56                   	push   %esi
 65a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 65e:	e8 0a fe ff ff       	call   46d <write>
        putc(fd, c);
 663:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
 667:	83 c4 0c             	add    $0xc,%esp
 66a:	88 55 e7             	mov    %dl,-0x19(%ebp)
 66d:	6a 01                	push   $0x1
 66f:	57                   	push   %edi
 670:	56                   	push   %esi
 671:	e8 f7 fd ff ff       	call   46d <write>
        putc(fd, c);
 676:	83 c4 10             	add    $0x10,%esp
      state = 0;
 679:	31 c9                	xor    %ecx,%ecx
 67b:	eb 95                	jmp    612 <printf+0x52>
 67d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 680:	83 ec 0c             	sub    $0xc,%esp
 683:	b9 10 00 00 00       	mov    $0x10,%ecx
 688:	6a 00                	push   $0x0
 68a:	8b 45 d0             	mov    -0x30(%ebp),%eax
 68d:	8b 10                	mov    (%eax),%edx
 68f:	89 f0                	mov    %esi,%eax
 691:	e8 7a fe ff ff       	call   510 <printint>
        ap++;
 696:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 69a:	83 c4 10             	add    $0x10,%esp
      state = 0;
 69d:	31 c9                	xor    %ecx,%ecx
 69f:	e9 6e ff ff ff       	jmp    612 <printf+0x52>
 6a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 6a8:	8b 45 d0             	mov    -0x30(%ebp),%eax
 6ab:	8b 10                	mov    (%eax),%edx
        ap++;
 6ad:	83 c0 04             	add    $0x4,%eax
 6b0:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 6b3:	85 d2                	test   %edx,%edx
 6b5:	0f 84 8d 00 00 00    	je     748 <printf+0x188>
        while(*s != 0){
 6bb:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
 6be:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
 6c0:	84 c0                	test   %al,%al
 6c2:	0f 84 4a ff ff ff    	je     612 <printf+0x52>
 6c8:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 6cb:	89 d3                	mov    %edx,%ebx
 6cd:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 6d0:	83 ec 04             	sub    $0x4,%esp
          s++;
 6d3:	83 c3 01             	add    $0x1,%ebx
 6d6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6d9:	6a 01                	push   $0x1
 6db:	57                   	push   %edi
 6dc:	56                   	push   %esi
 6dd:	e8 8b fd ff ff       	call   46d <write>
        while(*s != 0){
 6e2:	0f b6 03             	movzbl (%ebx),%eax
 6e5:	83 c4 10             	add    $0x10,%esp
 6e8:	84 c0                	test   %al,%al
 6ea:	75 e4                	jne    6d0 <printf+0x110>
      state = 0;
 6ec:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
 6ef:	31 c9                	xor    %ecx,%ecx
 6f1:	e9 1c ff ff ff       	jmp    612 <printf+0x52>
 6f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 700:	83 ec 0c             	sub    $0xc,%esp
 703:	b9 0a 00 00 00       	mov    $0xa,%ecx
 708:	6a 01                	push   $0x1
 70a:	e9 7b ff ff ff       	jmp    68a <printf+0xca>
 70f:	90                   	nop
        putc(fd, *ap);
 710:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
 713:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 716:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 718:	6a 01                	push   $0x1
 71a:	57                   	push   %edi
 71b:	56                   	push   %esi
        putc(fd, *ap);
 71c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 71f:	e8 49 fd ff ff       	call   46d <write>
        ap++;
 724:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
 728:	83 c4 10             	add    $0x10,%esp
      state = 0;
 72b:	31 c9                	xor    %ecx,%ecx
 72d:	e9 e0 fe ff ff       	jmp    612 <printf+0x52>
 732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
 738:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 73b:	83 ec 04             	sub    $0x4,%esp
 73e:	e9 2a ff ff ff       	jmp    66d <printf+0xad>
 743:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 747:	90                   	nop
          s = "(null)";
 748:	ba 1f 09 00 00       	mov    $0x91f,%edx
        while(*s != 0){
 74d:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 750:	b8 28 00 00 00       	mov    $0x28,%eax
 755:	89 d3                	mov    %edx,%ebx
 757:	e9 74 ff ff ff       	jmp    6d0 <printf+0x110>
 75c:	66 90                	xchg   %ax,%ax
 75e:	66 90                	xchg   %ax,%ax

00000760 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 760:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	a1 c0 0e 00 00       	mov    0xec0,%eax
{
 766:	89 e5                	mov    %esp,%ebp
 768:	57                   	push   %edi
 769:	56                   	push   %esi
 76a:	53                   	push   %ebx
 76b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 76e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 778:	89 c2                	mov    %eax,%edx
 77a:	8b 00                	mov    (%eax),%eax
 77c:	39 ca                	cmp    %ecx,%edx
 77e:	73 30                	jae    7b0 <free+0x50>
 780:	39 c1                	cmp    %eax,%ecx
 782:	72 04                	jb     788 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 784:	39 c2                	cmp    %eax,%edx
 786:	72 f0                	jb     778 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
 788:	8b 73 fc             	mov    -0x4(%ebx),%esi
 78b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 78e:	39 f8                	cmp    %edi,%eax
 790:	74 30                	je     7c2 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
 792:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 795:	8b 42 04             	mov    0x4(%edx),%eax
 798:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 79b:	39 f1                	cmp    %esi,%ecx
 79d:	74 3a                	je     7d9 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
 79f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
 7a1:	5b                   	pop    %ebx
  freep = p;
 7a2:	89 15 c0 0e 00 00    	mov    %edx,0xec0
}
 7a8:	5e                   	pop    %esi
 7a9:	5f                   	pop    %edi
 7aa:	5d                   	pop    %ebp
 7ab:	c3                   	ret    
 7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b0:	39 c2                	cmp    %eax,%edx
 7b2:	72 c4                	jb     778 <free+0x18>
 7b4:	39 c1                	cmp    %eax,%ecx
 7b6:	73 c0                	jae    778 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
 7b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7be:	39 f8                	cmp    %edi,%eax
 7c0:	75 d0                	jne    792 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
 7c2:	03 70 04             	add    0x4(%eax),%esi
 7c5:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c8:	8b 02                	mov    (%edx),%eax
 7ca:	8b 00                	mov    (%eax),%eax
 7cc:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
 7cf:	8b 42 04             	mov    0x4(%edx),%eax
 7d2:	8d 34 c2             	lea    (%edx,%eax,8),%esi
 7d5:	39 f1                	cmp    %esi,%ecx
 7d7:	75 c6                	jne    79f <free+0x3f>
    p->s.size += bp->s.size;
 7d9:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
 7dc:	89 15 c0 0e 00 00    	mov    %edx,0xec0
    p->s.size += bp->s.size;
 7e2:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
 7e5:	8b 4b f8             	mov    -0x8(%ebx),%ecx
 7e8:	89 0a                	mov    %ecx,(%edx)
}
 7ea:	5b                   	pop    %ebx
 7eb:	5e                   	pop    %esi
 7ec:	5f                   	pop    %edi
 7ed:	5d                   	pop    %ebp
 7ee:	c3                   	ret    
 7ef:	90                   	nop

000007f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	57                   	push   %edi
 7f4:	56                   	push   %esi
 7f5:	53                   	push   %ebx
 7f6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7fc:	8b 3d c0 0e 00 00    	mov    0xec0,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 802:	8d 70 07             	lea    0x7(%eax),%esi
 805:	c1 ee 03             	shr    $0x3,%esi
 808:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 80b:	85 ff                	test   %edi,%edi
 80d:	0f 84 9d 00 00 00    	je     8b0 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 813:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 815:	8b 4a 04             	mov    0x4(%edx),%ecx
 818:	39 f1                	cmp    %esi,%ecx
 81a:	73 6a                	jae    886 <malloc+0x96>
 81c:	bb 00 10 00 00       	mov    $0x1000,%ebx
 821:	39 de                	cmp    %ebx,%esi
 823:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 826:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 82d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 830:	eb 17                	jmp    849 <malloc+0x59>
 832:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 838:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 83a:	8b 48 04             	mov    0x4(%eax),%ecx
 83d:	39 f1                	cmp    %esi,%ecx
 83f:	73 4f                	jae    890 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 841:	8b 3d c0 0e 00 00    	mov    0xec0,%edi
 847:	89 c2                	mov    %eax,%edx
 849:	39 d7                	cmp    %edx,%edi
 84b:	75 eb                	jne    838 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 84d:	83 ec 0c             	sub    $0xc,%esp
 850:	ff 75 e4             	pushl  -0x1c(%ebp)
 853:	e8 7d fc ff ff       	call   4d5 <sbrk>
  if(p == (char*)-1)
 858:	83 c4 10             	add    $0x10,%esp
 85b:	83 f8 ff             	cmp    $0xffffffff,%eax
 85e:	74 1c                	je     87c <malloc+0x8c>
  hp->s.size = nu;
 860:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 863:	83 ec 0c             	sub    $0xc,%esp
 866:	83 c0 08             	add    $0x8,%eax
 869:	50                   	push   %eax
 86a:	e8 f1 fe ff ff       	call   760 <free>
  return freep;
 86f:	8b 15 c0 0e 00 00    	mov    0xec0,%edx
      if((p = morecore(nunits)) == 0)
 875:	83 c4 10             	add    $0x10,%esp
 878:	85 d2                	test   %edx,%edx
 87a:	75 bc                	jne    838 <malloc+0x48>
        return 0;
  }
}
 87c:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 87f:	31 c0                	xor    %eax,%eax
}
 881:	5b                   	pop    %ebx
 882:	5e                   	pop    %esi
 883:	5f                   	pop    %edi
 884:	5d                   	pop    %ebp
 885:	c3                   	ret    
    if(p->s.size >= nunits){
 886:	89 d0                	mov    %edx,%eax
 888:	89 fa                	mov    %edi,%edx
 88a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 890:	39 ce                	cmp    %ecx,%esi
 892:	74 4c                	je     8e0 <malloc+0xf0>
        p->s.size -= nunits;
 894:	29 f1                	sub    %esi,%ecx
 896:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 899:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 89c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 89f:	89 15 c0 0e 00 00    	mov    %edx,0xec0
}
 8a5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8a8:	83 c0 08             	add    $0x8,%eax
}
 8ab:	5b                   	pop    %ebx
 8ac:	5e                   	pop    %esi
 8ad:	5f                   	pop    %edi
 8ae:	5d                   	pop    %ebp
 8af:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 8b0:	c7 05 c0 0e 00 00 c4 	movl   $0xec4,0xec0
 8b7:	0e 00 00 
    base.s.size = 0;
 8ba:	bf c4 0e 00 00       	mov    $0xec4,%edi
    base.s.ptr = freep = prevp = &base;
 8bf:	c7 05 c4 0e 00 00 c4 	movl   $0xec4,0xec4
 8c6:	0e 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 8cb:	c7 05 c8 0e 00 00 00 	movl   $0x0,0xec8
 8d2:	00 00 00 
    if(p->s.size >= nunits){
 8d5:	e9 42 ff ff ff       	jmp    81c <malloc+0x2c>
 8da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 8e0:	8b 08                	mov    (%eax),%ecx
 8e2:	89 0a                	mov    %ecx,(%edx)
 8e4:	eb b9                	jmp    89f <malloc+0xaf>
