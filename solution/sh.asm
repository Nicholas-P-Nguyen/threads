
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

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
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      17:	90                   	nop
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 91 00 00 00    	jg     b2 <main+0xb2>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 f9 13 00 00       	push   $0x13f9
      2b:	e8 cd 0e 00 00       	call   efd <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 2e                	jmp    67 <main+0x67>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d e2 1a 00 00 20 	cmpb   $0x20,0x1ae2
      47:	0f 84 88 00 00 00    	je     d5 <main+0xd5>
      4d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 60 0e 00 00       	call   eb5 <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	0f 84 c1 00 00 00    	je     11f <main+0x11f>
    if(fork1() == 0)
      5e:	85 c0                	test   %eax,%eax
      60:	74 5e                	je     c0 <main+0xc0>
    wait();
      62:	e8 5e 0e 00 00       	call   ec5 <wait>
  printf(2, "$ ");
      67:	83 ec 08             	sub    $0x8,%esp
      6a:	68 58 13 00 00       	push   $0x1358
      6f:	6a 02                	push   $0x2
      71:	e8 ba 0f 00 00       	call   1030 <printf>
  memset(buf, 0, nbuf);
      76:	83 c4 0c             	add    $0xc,%esp
      79:	6a 64                	push   $0x64
      7b:	6a 00                	push   $0x0
      7d:	68 e0 1a 00 00       	push   $0x1ae0
      82:	e8 09 0c 00 00       	call   c90 <memset>
  gets(buf, nbuf);
      87:	58                   	pop    %eax
      88:	5a                   	pop    %edx
      89:	6a 64                	push   $0x64
      8b:	68 e0 1a 00 00       	push   $0x1ae0
      90:	e8 5b 0c 00 00       	call   cf0 <gets>
  if(buf[0] == 0) // EOF
      95:	0f b6 05 e0 1a 00 00 	movzbl 0x1ae0,%eax
      9c:	83 c4 10             	add    $0x10,%esp
      9f:	84 c0                	test   %al,%al
      a1:	74 77                	je     11a <main+0x11a>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      a3:	3c 63                	cmp    $0x63,%al
      a5:	75 a9                	jne    50 <main+0x50>
      a7:	80 3d e1 1a 00 00 64 	cmpb   $0x64,0x1ae1
      ae:	75 a0                	jne    50 <main+0x50>
      b0:	eb 8e                	jmp    40 <main+0x40>
      close(fd);
      b2:	83 ec 0c             	sub    $0xc,%esp
      b5:	50                   	push   %eax
      b6:	e8 2a 0e 00 00       	call   ee5 <close>
      break;
      bb:	83 c4 10             	add    $0x10,%esp
      be:	eb a7                	jmp    67 <main+0x67>
      runcmd(parsecmd(buf));
      c0:	83 ec 0c             	sub    $0xc,%esp
      c3:	68 e0 1a 00 00       	push   $0x1ae0
      c8:	e8 93 0a 00 00       	call   b60 <parsecmd>
      cd:	89 04 24             	mov    %eax,(%esp)
      d0:	e8 db 00 00 00       	call   1b0 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      d5:	83 ec 0c             	sub    $0xc,%esp
      d8:	68 e0 1a 00 00       	push   $0x1ae0
      dd:	e8 7e 0b 00 00       	call   c60 <strlen>
      if(chdir(buf+3) < 0)
      e2:	c7 04 24 e3 1a 00 00 	movl   $0x1ae3,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      e9:	c6 80 df 1a 00 00 00 	movb   $0x0,0x1adf(%eax)
      if(chdir(buf+3) < 0)
      f0:	e8 38 0e 00 00       	call   f2d <chdir>
      f5:	83 c4 10             	add    $0x10,%esp
      f8:	85 c0                	test   %eax,%eax
      fa:	0f 89 67 ff ff ff    	jns    67 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
     100:	51                   	push   %ecx
     101:	68 e3 1a 00 00       	push   $0x1ae3
     106:	68 01 14 00 00       	push   $0x1401
     10b:	6a 02                	push   $0x2
     10d:	e8 1e 0f 00 00       	call   1030 <printf>
     112:	83 c4 10             	add    $0x10,%esp
     115:	e9 4d ff ff ff       	jmp    67 <main+0x67>
  exit();
     11a:	e8 9e 0d 00 00       	call   ebd <exit>
    panic("fork");
     11f:	83 ec 0c             	sub    $0xc,%esp
     122:	68 5b 13 00 00       	push   $0x135b
     127:	e8 44 00 00 00       	call   170 <panic>
     12c:	66 90                	xchg   %ax,%ax
     12e:	66 90                	xchg   %ax,%ax

00000130 <getcmd>:
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	56                   	push   %esi
     134:	53                   	push   %ebx
     135:	8b 75 0c             	mov    0xc(%ebp),%esi
     138:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     13b:	83 ec 08             	sub    $0x8,%esp
     13e:	68 58 13 00 00       	push   $0x1358
     143:	6a 02                	push   $0x2
     145:	e8 e6 0e 00 00       	call   1030 <printf>
  memset(buf, 0, nbuf);
     14a:	83 c4 0c             	add    $0xc,%esp
     14d:	56                   	push   %esi
     14e:	6a 00                	push   $0x0
     150:	53                   	push   %ebx
     151:	e8 3a 0b 00 00       	call   c90 <memset>
  gets(buf, nbuf);
     156:	58                   	pop    %eax
     157:	5a                   	pop    %edx
     158:	56                   	push   %esi
     159:	53                   	push   %ebx
     15a:	e8 91 0b 00 00       	call   cf0 <gets>
  if(buf[0] == 0) // EOF
     15f:	83 c4 10             	add    $0x10,%esp
     162:	80 3b 01             	cmpb   $0x1,(%ebx)
     165:	19 c0                	sbb    %eax,%eax
}
     167:	8d 65 f8             	lea    -0x8(%ebp),%esp
     16a:	5b                   	pop    %ebx
     16b:	5e                   	pop    %esi
     16c:	5d                   	pop    %ebp
     16d:	c3                   	ret    
     16e:	66 90                	xchg   %ax,%ax

00000170 <panic>:
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     176:	ff 75 08             	pushl  0x8(%ebp)
     179:	68 f5 13 00 00       	push   $0x13f5
     17e:	6a 02                	push   $0x2
     180:	e8 ab 0e 00 00       	call   1030 <printf>
  exit();
     185:	e8 33 0d 00 00       	call   ebd <exit>
     18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <fork1>:
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     196:	e8 1a 0d 00 00       	call   eb5 <fork>
  if(pid == -1)
     19b:	83 f8 ff             	cmp    $0xffffffff,%eax
     19e:	74 02                	je     1a2 <fork1+0x12>
  return pid;
}
     1a0:	c9                   	leave  
     1a1:	c3                   	ret    
    panic("fork");
     1a2:	83 ec 0c             	sub    $0xc,%esp
     1a5:	68 5b 13 00 00       	push   $0x135b
     1aa:	e8 c1 ff ff ff       	call   170 <panic>
     1af:	90                   	nop

000001b0 <runcmd>:
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	53                   	push   %ebx
     1b4:	83 ec 14             	sub    $0x14,%esp
     1b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     1ba:	85 db                	test   %ebx,%ebx
     1bc:	74 42                	je     200 <runcmd+0x50>
  switch(cmd->type){
     1be:	83 3b 05             	cmpl   $0x5,(%ebx)
     1c1:	0f 87 e3 00 00 00    	ja     2aa <runcmd+0xfa>
     1c7:	8b 03                	mov    (%ebx),%eax
     1c9:	ff 24 85 10 14 00 00 	jmp    *0x1410(,%eax,4)
    if(ecmd->argv[0] == 0)
     1d0:	8b 43 04             	mov    0x4(%ebx),%eax
     1d3:	85 c0                	test   %eax,%eax
     1d5:	74 29                	je     200 <runcmd+0x50>
    exec(ecmd->argv[0], ecmd->argv);
     1d7:	8d 53 04             	lea    0x4(%ebx),%edx
     1da:	51                   	push   %ecx
     1db:	51                   	push   %ecx
     1dc:	52                   	push   %edx
     1dd:	50                   	push   %eax
     1de:	e8 12 0d 00 00       	call   ef5 <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     1e3:	83 c4 0c             	add    $0xc,%esp
     1e6:	ff 73 04             	pushl  0x4(%ebx)
     1e9:	68 67 13 00 00       	push   $0x1367
     1ee:	6a 02                	push   $0x2
     1f0:	e8 3b 0e 00 00       	call   1030 <printf>
    break;
     1f5:	83 c4 10             	add    $0x10,%esp
     1f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1ff:	90                   	nop
    exit();
     200:	e8 b8 0c 00 00       	call   ebd <exit>
    if(fork1() == 0)
     205:	e8 86 ff ff ff       	call   190 <fork1>
     20a:	85 c0                	test   %eax,%eax
     20c:	75 f2                	jne    200 <runcmd+0x50>
     20e:	e9 8c 00 00 00       	jmp    29f <runcmd+0xef>
    if(pipe(p) < 0)
     213:	83 ec 0c             	sub    $0xc,%esp
     216:	8d 45 f0             	lea    -0x10(%ebp),%eax
     219:	50                   	push   %eax
     21a:	e8 ae 0c 00 00       	call   ecd <pipe>
     21f:	83 c4 10             	add    $0x10,%esp
     222:	85 c0                	test   %eax,%eax
     224:	0f 88 a2 00 00 00    	js     2cc <runcmd+0x11c>
    if(fork1() == 0){
     22a:	e8 61 ff ff ff       	call   190 <fork1>
     22f:	85 c0                	test   %eax,%eax
     231:	0f 84 a2 00 00 00    	je     2d9 <runcmd+0x129>
    if(fork1() == 0){
     237:	e8 54 ff ff ff       	call   190 <fork1>
     23c:	85 c0                	test   %eax,%eax
     23e:	0f 84 c3 00 00 00    	je     307 <runcmd+0x157>
    close(p[0]);
     244:	83 ec 0c             	sub    $0xc,%esp
     247:	ff 75 f0             	pushl  -0x10(%ebp)
     24a:	e8 96 0c 00 00       	call   ee5 <close>
    close(p[1]);
     24f:	58                   	pop    %eax
     250:	ff 75 f4             	pushl  -0xc(%ebp)
     253:	e8 8d 0c 00 00       	call   ee5 <close>
    wait();
     258:	e8 68 0c 00 00       	call   ec5 <wait>
    wait();
     25d:	e8 63 0c 00 00       	call   ec5 <wait>
    break;
     262:	83 c4 10             	add    $0x10,%esp
     265:	eb 99                	jmp    200 <runcmd+0x50>
    if(fork1() == 0)
     267:	e8 24 ff ff ff       	call   190 <fork1>
     26c:	85 c0                	test   %eax,%eax
     26e:	74 2f                	je     29f <runcmd+0xef>
    wait();
     270:	e8 50 0c 00 00       	call   ec5 <wait>
    runcmd(lcmd->right);
     275:	83 ec 0c             	sub    $0xc,%esp
     278:	ff 73 08             	pushl  0x8(%ebx)
     27b:	e8 30 ff ff ff       	call   1b0 <runcmd>
    close(rcmd->fd);
     280:	83 ec 0c             	sub    $0xc,%esp
     283:	ff 73 14             	pushl  0x14(%ebx)
     286:	e8 5a 0c 00 00       	call   ee5 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     28b:	58                   	pop    %eax
     28c:	5a                   	pop    %edx
     28d:	ff 73 10             	pushl  0x10(%ebx)
     290:	ff 73 08             	pushl  0x8(%ebx)
     293:	e8 65 0c 00 00       	call   efd <open>
     298:	83 c4 10             	add    $0x10,%esp
     29b:	85 c0                	test   %eax,%eax
     29d:	78 18                	js     2b7 <runcmd+0x107>
      runcmd(bcmd->cmd);
     29f:	83 ec 0c             	sub    $0xc,%esp
     2a2:	ff 73 04             	pushl  0x4(%ebx)
     2a5:	e8 06 ff ff ff       	call   1b0 <runcmd>
    panic("runcmd");
     2aa:	83 ec 0c             	sub    $0xc,%esp
     2ad:	68 60 13 00 00       	push   $0x1360
     2b2:	e8 b9 fe ff ff       	call   170 <panic>
      printf(2, "open %s failed\n", rcmd->file);
     2b7:	51                   	push   %ecx
     2b8:	ff 73 08             	pushl  0x8(%ebx)
     2bb:	68 77 13 00 00       	push   $0x1377
     2c0:	6a 02                	push   $0x2
     2c2:	e8 69 0d 00 00       	call   1030 <printf>
      exit();
     2c7:	e8 f1 0b 00 00       	call   ebd <exit>
      panic("pipe");
     2cc:	83 ec 0c             	sub    $0xc,%esp
     2cf:	68 87 13 00 00       	push   $0x1387
     2d4:	e8 97 fe ff ff       	call   170 <panic>
      close(1);
     2d9:	83 ec 0c             	sub    $0xc,%esp
     2dc:	6a 01                	push   $0x1
     2de:	e8 02 0c 00 00       	call   ee5 <close>
      dup(p[1]);
     2e3:	58                   	pop    %eax
     2e4:	ff 75 f4             	pushl  -0xc(%ebp)
     2e7:	e8 49 0c 00 00       	call   f35 <dup>
      close(p[0]);
     2ec:	58                   	pop    %eax
     2ed:	ff 75 f0             	pushl  -0x10(%ebp)
     2f0:	e8 f0 0b 00 00       	call   ee5 <close>
      close(p[1]);
     2f5:	58                   	pop    %eax
     2f6:	ff 75 f4             	pushl  -0xc(%ebp)
     2f9:	e8 e7 0b 00 00       	call   ee5 <close>
      runcmd(pcmd->left);
     2fe:	5a                   	pop    %edx
     2ff:	ff 73 04             	pushl  0x4(%ebx)
     302:	e8 a9 fe ff ff       	call   1b0 <runcmd>
      close(0);
     307:	83 ec 0c             	sub    $0xc,%esp
     30a:	6a 00                	push   $0x0
     30c:	e8 d4 0b 00 00       	call   ee5 <close>
      dup(p[0]);
     311:	5a                   	pop    %edx
     312:	ff 75 f0             	pushl  -0x10(%ebp)
     315:	e8 1b 0c 00 00       	call   f35 <dup>
      close(p[0]);
     31a:	59                   	pop    %ecx
     31b:	ff 75 f0             	pushl  -0x10(%ebp)
     31e:	e8 c2 0b 00 00       	call   ee5 <close>
      close(p[1]);
     323:	58                   	pop    %eax
     324:	ff 75 f4             	pushl  -0xc(%ebp)
     327:	e8 b9 0b 00 00       	call   ee5 <close>
      runcmd(pcmd->right);
     32c:	58                   	pop    %eax
     32d:	ff 73 08             	pushl  0x8(%ebx)
     330:	e8 7b fe ff ff       	call   1b0 <runcmd>
     335:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     33c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000340 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	53                   	push   %ebx
     344:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     347:	6a 54                	push   $0x54
     349:	e8 12 0f 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     34e:	83 c4 0c             	add    $0xc,%esp
     351:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     353:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     355:	6a 00                	push   $0x0
     357:	50                   	push   %eax
     358:	e8 33 09 00 00       	call   c90 <memset>
  cmd->type = EXEC;
     35d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     363:	89 d8                	mov    %ebx,%eax
     365:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     368:	c9                   	leave  
     369:	c3                   	ret    
     36a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000370 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     370:	55                   	push   %ebp
     371:	89 e5                	mov    %esp,%ebp
     373:	53                   	push   %ebx
     374:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     377:	6a 18                	push   $0x18
     379:	e8 e2 0e 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     37e:	83 c4 0c             	add    $0xc,%esp
     381:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     383:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     385:	6a 00                	push   $0x0
     387:	50                   	push   %eax
     388:	e8 03 09 00 00       	call   c90 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     38d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     390:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     396:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     399:	8b 45 0c             	mov    0xc(%ebp),%eax
     39c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     39f:	8b 45 10             	mov    0x10(%ebp),%eax
     3a2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3a5:	8b 45 14             	mov    0x14(%ebp),%eax
     3a8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3ab:	8b 45 18             	mov    0x18(%ebp),%eax
     3ae:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3b1:	89 d8                	mov    %ebx,%eax
     3b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3b6:	c9                   	leave  
     3b7:	c3                   	ret    
     3b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3bf:	90                   	nop

000003c0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	53                   	push   %ebx
     3c4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3c7:	6a 0c                	push   $0xc
     3c9:	e8 92 0e 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ce:	83 c4 0c             	add    $0xc,%esp
     3d1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3d3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3d5:	6a 00                	push   $0x0
     3d7:	50                   	push   %eax
     3d8:	e8 b3 08 00 00       	call   c90 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3dd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     3e0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3e6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3e9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ec:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3ef:	89 d8                	mov    %ebx,%eax
     3f1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3f4:	c9                   	leave  
     3f5:	c3                   	ret    
     3f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3fd:	8d 76 00             	lea    0x0(%esi),%esi

00000400 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	53                   	push   %ebx
     404:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     407:	6a 0c                	push   $0xc
     409:	e8 52 0e 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     40e:	83 c4 0c             	add    $0xc,%esp
     411:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     413:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     415:	6a 00                	push   $0x0
     417:	50                   	push   %eax
     418:	e8 73 08 00 00       	call   c90 <memset>
  cmd->type = LIST;
  cmd->left = left;
     41d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     420:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     426:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     429:	8b 45 0c             	mov    0xc(%ebp),%eax
     42c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     42f:	89 d8                	mov    %ebx,%eax
     431:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     434:	c9                   	leave  
     435:	c3                   	ret    
     436:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     43d:	8d 76 00             	lea    0x0(%esi),%esi

00000440 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	53                   	push   %ebx
     444:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     447:	6a 08                	push   $0x8
     449:	e8 12 0e 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     44e:	83 c4 0c             	add    $0xc,%esp
     451:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     453:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     455:	6a 00                	push   $0x0
     457:	50                   	push   %eax
     458:	e8 33 08 00 00       	call   c90 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     45d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     460:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     466:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     469:	89 d8                	mov    %ebx,%eax
     46b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     46e:	c9                   	leave  
     46f:	c3                   	ret    

00000470 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     470:	55                   	push   %ebp
     471:	89 e5                	mov    %esp,%ebp
     473:	57                   	push   %edi
     474:	56                   	push   %esi
     475:	53                   	push   %ebx
     476:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     479:	8b 45 08             	mov    0x8(%ebp),%eax
{
     47c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     47f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     482:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     484:	39 df                	cmp    %ebx,%edi
     486:	72 0f                	jb     497 <gettoken+0x27>
     488:	eb 25                	jmp    4af <gettoken+0x3f>
     48a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     490:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     493:	39 fb                	cmp    %edi,%ebx
     495:	74 18                	je     4af <gettoken+0x3f>
     497:	0f be 07             	movsbl (%edi),%eax
     49a:	83 ec 08             	sub    $0x8,%esp
     49d:	50                   	push   %eax
     49e:	68 d8 1a 00 00       	push   $0x1ad8
     4a3:	e8 08 08 00 00       	call   cb0 <strchr>
     4a8:	83 c4 10             	add    $0x10,%esp
     4ab:	85 c0                	test   %eax,%eax
     4ad:	75 e1                	jne    490 <gettoken+0x20>
  if(q)
     4af:	85 f6                	test   %esi,%esi
     4b1:	74 02                	je     4b5 <gettoken+0x45>
    *q = s;
     4b3:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     4b5:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     4b8:	3c 3c                	cmp    $0x3c,%al
     4ba:	0f 8f d0 00 00 00    	jg     590 <gettoken+0x120>
     4c0:	3c 3a                	cmp    $0x3a,%al
     4c2:	0f 8f b4 00 00 00    	jg     57c <gettoken+0x10c>
     4c8:	84 c0                	test   %al,%al
     4ca:	75 44                	jne    510 <gettoken+0xa0>
     4cc:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4ce:	8b 55 14             	mov    0x14(%ebp),%edx
     4d1:	85 d2                	test   %edx,%edx
     4d3:	74 05                	je     4da <gettoken+0x6a>
    *eq = s;
     4d5:	8b 45 14             	mov    0x14(%ebp),%eax
     4d8:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4da:	39 df                	cmp    %ebx,%edi
     4dc:	72 09                	jb     4e7 <gettoken+0x77>
     4de:	eb 1f                	jmp    4ff <gettoken+0x8f>
    s++;
     4e0:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     4e3:	39 fb                	cmp    %edi,%ebx
     4e5:	74 18                	je     4ff <gettoken+0x8f>
     4e7:	0f be 07             	movsbl (%edi),%eax
     4ea:	83 ec 08             	sub    $0x8,%esp
     4ed:	50                   	push   %eax
     4ee:	68 d8 1a 00 00       	push   $0x1ad8
     4f3:	e8 b8 07 00 00       	call   cb0 <strchr>
     4f8:	83 c4 10             	add    $0x10,%esp
     4fb:	85 c0                	test   %eax,%eax
     4fd:	75 e1                	jne    4e0 <gettoken+0x70>
  *ps = s;
     4ff:	8b 45 08             	mov    0x8(%ebp),%eax
     502:	89 38                	mov    %edi,(%eax)
  return ret;
}
     504:	8d 65 f4             	lea    -0xc(%ebp),%esp
     507:	89 f0                	mov    %esi,%eax
     509:	5b                   	pop    %ebx
     50a:	5e                   	pop    %esi
     50b:	5f                   	pop    %edi
     50c:	5d                   	pop    %ebp
     50d:	c3                   	ret    
     50e:	66 90                	xchg   %ax,%ax
  switch(*s){
     510:	79 5e                	jns    570 <gettoken+0x100>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     512:	39 fb                	cmp    %edi,%ebx
     514:	77 34                	ja     54a <gettoken+0xda>
  if(eq)
     516:	8b 45 14             	mov    0x14(%ebp),%eax
     519:	be 61 00 00 00       	mov    $0x61,%esi
     51e:	85 c0                	test   %eax,%eax
     520:	75 b3                	jne    4d5 <gettoken+0x65>
     522:	eb db                	jmp    4ff <gettoken+0x8f>
     524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     528:	0f be 07             	movsbl (%edi),%eax
     52b:	83 ec 08             	sub    $0x8,%esp
     52e:	50                   	push   %eax
     52f:	68 d0 1a 00 00       	push   $0x1ad0
     534:	e8 77 07 00 00       	call   cb0 <strchr>
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
     53e:	75 22                	jne    562 <gettoken+0xf2>
      s++;
     540:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     543:	39 fb                	cmp    %edi,%ebx
     545:	74 cf                	je     516 <gettoken+0xa6>
     547:	0f b6 07             	movzbl (%edi),%eax
     54a:	83 ec 08             	sub    $0x8,%esp
     54d:	0f be f0             	movsbl %al,%esi
     550:	56                   	push   %esi
     551:	68 d8 1a 00 00       	push   $0x1ad8
     556:	e8 55 07 00 00       	call   cb0 <strchr>
     55b:	83 c4 10             	add    $0x10,%esp
     55e:	85 c0                	test   %eax,%eax
     560:	74 c6                	je     528 <gettoken+0xb8>
    ret = 'a';
     562:	be 61 00 00 00       	mov    $0x61,%esi
     567:	e9 62 ff ff ff       	jmp    4ce <gettoken+0x5e>
     56c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     570:	3c 26                	cmp    $0x26,%al
     572:	74 08                	je     57c <gettoken+0x10c>
     574:	8d 48 d8             	lea    -0x28(%eax),%ecx
     577:	80 f9 01             	cmp    $0x1,%cl
     57a:	77 96                	ja     512 <gettoken+0xa2>
  ret = *s;
     57c:	0f be f0             	movsbl %al,%esi
    s++;
     57f:	83 c7 01             	add    $0x1,%edi
    break;
     582:	e9 47 ff ff ff       	jmp    4ce <gettoken+0x5e>
     587:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     58e:	66 90                	xchg   %ax,%ax
  switch(*s){
     590:	3c 3e                	cmp    $0x3e,%al
     592:	75 1c                	jne    5b0 <gettoken+0x140>
    if(*s == '>'){
     594:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
    s++;
     598:	8d 47 01             	lea    0x1(%edi),%eax
    if(*s == '>'){
     59b:	74 1c                	je     5b9 <gettoken+0x149>
    s++;
     59d:	89 c7                	mov    %eax,%edi
     59f:	be 3e 00 00 00       	mov    $0x3e,%esi
     5a4:	e9 25 ff ff ff       	jmp    4ce <gettoken+0x5e>
     5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     5b0:	3c 7c                	cmp    $0x7c,%al
     5b2:	74 c8                	je     57c <gettoken+0x10c>
     5b4:	e9 59 ff ff ff       	jmp    512 <gettoken+0xa2>
      s++;
     5b9:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     5bc:	be 2b 00 00 00       	mov    $0x2b,%esi
     5c1:	e9 08 ff ff ff       	jmp    4ce <gettoken+0x5e>
     5c6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5cd:	8d 76 00             	lea    0x0(%esi),%esi

000005d0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     5d0:	55                   	push   %ebp
     5d1:	89 e5                	mov    %esp,%ebp
     5d3:	57                   	push   %edi
     5d4:	56                   	push   %esi
     5d5:	53                   	push   %ebx
     5d6:	83 ec 0c             	sub    $0xc,%esp
     5d9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     5df:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     5e1:	39 f3                	cmp    %esi,%ebx
     5e3:	72 12                	jb     5f7 <peek+0x27>
     5e5:	eb 28                	jmp    60f <peek+0x3f>
     5e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5ee:	66 90                	xchg   %ax,%ax
    s++;
     5f0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     5f3:	39 de                	cmp    %ebx,%esi
     5f5:	74 18                	je     60f <peek+0x3f>
     5f7:	0f be 03             	movsbl (%ebx),%eax
     5fa:	83 ec 08             	sub    $0x8,%esp
     5fd:	50                   	push   %eax
     5fe:	68 d8 1a 00 00       	push   $0x1ad8
     603:	e8 a8 06 00 00       	call   cb0 <strchr>
     608:	83 c4 10             	add    $0x10,%esp
     60b:	85 c0                	test   %eax,%eax
     60d:	75 e1                	jne    5f0 <peek+0x20>
  *ps = s;
     60f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     611:	0f be 03             	movsbl (%ebx),%eax
     614:	31 d2                	xor    %edx,%edx
     616:	84 c0                	test   %al,%al
     618:	75 0e                	jne    628 <peek+0x58>
}
     61a:	8d 65 f4             	lea    -0xc(%ebp),%esp
     61d:	89 d0                	mov    %edx,%eax
     61f:	5b                   	pop    %ebx
     620:	5e                   	pop    %esi
     621:	5f                   	pop    %edi
     622:	5d                   	pop    %ebp
     623:	c3                   	ret    
     624:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     628:	83 ec 08             	sub    $0x8,%esp
     62b:	50                   	push   %eax
     62c:	ff 75 10             	pushl  0x10(%ebp)
     62f:	e8 7c 06 00 00       	call   cb0 <strchr>
     634:	83 c4 10             	add    $0x10,%esp
     637:	31 d2                	xor    %edx,%edx
     639:	85 c0                	test   %eax,%eax
     63b:	0f 95 c2             	setne  %dl
}
     63e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     641:	5b                   	pop    %ebx
     642:	89 d0                	mov    %edx,%eax
     644:	5e                   	pop    %esi
     645:	5f                   	pop    %edi
     646:	5d                   	pop    %ebp
     647:	c3                   	ret    
     648:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     64f:	90                   	nop

00000650 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	57                   	push   %edi
     654:	56                   	push   %esi
     655:	53                   	push   %ebx
     656:	83 ec 2c             	sub    $0x2c,%esp
     659:	8b 75 0c             	mov    0xc(%ebp),%esi
     65c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     65f:	90                   	nop
     660:	83 ec 04             	sub    $0x4,%esp
     663:	68 a9 13 00 00       	push   $0x13a9
     668:	53                   	push   %ebx
     669:	56                   	push   %esi
     66a:	e8 61 ff ff ff       	call   5d0 <peek>
     66f:	83 c4 10             	add    $0x10,%esp
     672:	85 c0                	test   %eax,%eax
     674:	0f 84 f6 00 00 00    	je     770 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     67a:	6a 00                	push   $0x0
     67c:	6a 00                	push   $0x0
     67e:	53                   	push   %ebx
     67f:	56                   	push   %esi
     680:	e8 eb fd ff ff       	call   470 <gettoken>
     685:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     687:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     68a:	50                   	push   %eax
     68b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     68e:	50                   	push   %eax
     68f:	53                   	push   %ebx
     690:	56                   	push   %esi
     691:	e8 da fd ff ff       	call   470 <gettoken>
     696:	83 c4 20             	add    $0x20,%esp
     699:	83 f8 61             	cmp    $0x61,%eax
     69c:	0f 85 d9 00 00 00    	jne    77b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     6a2:	83 ff 3c             	cmp    $0x3c,%edi
     6a5:	74 69                	je     710 <parseredirs+0xc0>
     6a7:	83 ff 3e             	cmp    $0x3e,%edi
     6aa:	74 05                	je     6b1 <parseredirs+0x61>
     6ac:	83 ff 2b             	cmp    $0x2b,%edi
     6af:	75 af                	jne    660 <parseredirs+0x10>
  cmd = malloc(sizeof(*cmd));
     6b1:	83 ec 0c             	sub    $0xc,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6b4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6b7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     6ba:	6a 18                	push   $0x18
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6bc:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6bf:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6c2:	e8 99 0b 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6c7:	83 c4 0c             	add    $0xc,%esp
     6ca:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6cc:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     6ce:	6a 00                	push   $0x0
     6d0:	50                   	push   %eax
     6d1:	e8 ba 05 00 00       	call   c90 <memset>
  cmd->type = REDIR;
     6d6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     6dc:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     6df:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     6e2:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     6e5:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     6e8:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     6eb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     6ee:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     6f5:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     6f8:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
     6ff:	89 7d 08             	mov    %edi,0x8(%ebp)
     702:	e9 59 ff ff ff       	jmp    660 <parseredirs+0x10>
     707:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     70e:	66 90                	xchg   %ax,%ax
  cmd = malloc(sizeof(*cmd));
     710:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     713:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     716:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     719:	6a 18                	push   $0x18
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     71b:	89 55 d0             	mov    %edx,-0x30(%ebp)
     71e:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     721:	e8 3a 0b 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     726:	83 c4 0c             	add    $0xc,%esp
     729:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     72b:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     72d:	6a 00                	push   $0x0
     72f:	50                   	push   %eax
     730:	e8 5b 05 00 00       	call   c90 <memset>
  cmd->cmd = subcmd;
     735:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     738:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     73b:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
     73e:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     741:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     747:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     74a:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     74d:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     750:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     753:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     75a:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     761:	e9 fa fe ff ff       	jmp    660 <parseredirs+0x10>
     766:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     76d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     770:	8b 45 08             	mov    0x8(%ebp),%eax
     773:	8d 65 f4             	lea    -0xc(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5f                   	pop    %edi
     779:	5d                   	pop    %ebp
     77a:	c3                   	ret    
      panic("missing file for redirection");
     77b:	83 ec 0c             	sub    $0xc,%esp
     77e:	68 8c 13 00 00       	push   $0x138c
     783:	e8 e8 f9 ff ff       	call   170 <panic>
     788:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     78f:	90                   	nop

00000790 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     790:	55                   	push   %ebp
     791:	89 e5                	mov    %esp,%ebp
     793:	57                   	push   %edi
     794:	56                   	push   %esi
     795:	53                   	push   %ebx
     796:	83 ec 30             	sub    $0x30,%esp
     799:	8b 75 08             	mov    0x8(%ebp),%esi
     79c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     79f:	68 ac 13 00 00       	push   $0x13ac
     7a4:	57                   	push   %edi
     7a5:	56                   	push   %esi
     7a6:	e8 25 fe ff ff       	call   5d0 <peek>
     7ab:	83 c4 10             	add    $0x10,%esp
     7ae:	85 c0                	test   %eax,%eax
     7b0:	0f 85 aa 00 00 00    	jne    860 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     7b6:	83 ec 0c             	sub    $0xc,%esp
     7b9:	89 c3                	mov    %eax,%ebx
     7bb:	6a 54                	push   $0x54
     7bd:	e8 9e 0a 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     7c2:	83 c4 0c             	add    $0xc,%esp
     7c5:	6a 54                	push   $0x54
     7c7:	6a 00                	push   $0x0
     7c9:	50                   	push   %eax
     7ca:	89 45 d0             	mov    %eax,-0x30(%ebp)
     7cd:	e8 be 04 00 00       	call   c90 <memset>
  cmd->type = EXEC;
     7d2:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     7d5:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     7d8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     7de:	57                   	push   %edi
     7df:	56                   	push   %esi
     7e0:	50                   	push   %eax
     7e1:	e8 6a fe ff ff       	call   650 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     7e6:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     7e9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7ec:	eb 15                	jmp    803 <parseexec+0x73>
     7ee:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7f0:	83 ec 04             	sub    $0x4,%esp
     7f3:	57                   	push   %edi
     7f4:	56                   	push   %esi
     7f5:	ff 75 d4             	pushl  -0x2c(%ebp)
     7f8:	e8 53 fe ff ff       	call   650 <parseredirs>
     7fd:	83 c4 10             	add    $0x10,%esp
     800:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     803:	83 ec 04             	sub    $0x4,%esp
     806:	68 c3 13 00 00       	push   $0x13c3
     80b:	57                   	push   %edi
     80c:	56                   	push   %esi
     80d:	e8 be fd ff ff       	call   5d0 <peek>
     812:	83 c4 10             	add    $0x10,%esp
     815:	85 c0                	test   %eax,%eax
     817:	75 5f                	jne    878 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     819:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     81c:	50                   	push   %eax
     81d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     820:	50                   	push   %eax
     821:	57                   	push   %edi
     822:	56                   	push   %esi
     823:	e8 48 fc ff ff       	call   470 <gettoken>
     828:	83 c4 10             	add    $0x10,%esp
     82b:	85 c0                	test   %eax,%eax
     82d:	74 49                	je     878 <parseexec+0xe8>
    if(tok != 'a')
     82f:	83 f8 61             	cmp    $0x61,%eax
     832:	75 62                	jne    896 <parseexec+0x106>
    cmd->argv[argc] = q;
     834:	8b 45 e0             	mov    -0x20(%ebp),%eax
     837:	8b 55 d0             	mov    -0x30(%ebp),%edx
     83a:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     83e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     841:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     845:	83 c3 01             	add    $0x1,%ebx
    if(argc >= MAXARGS)
     848:	83 fb 0a             	cmp    $0xa,%ebx
     84b:	75 a3                	jne    7f0 <parseexec+0x60>
      panic("too many args");
     84d:	83 ec 0c             	sub    $0xc,%esp
     850:	68 b5 13 00 00       	push   $0x13b5
     855:	e8 16 f9 ff ff       	call   170 <panic>
     85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     860:	89 7d 0c             	mov    %edi,0xc(%ebp)
     863:	89 75 08             	mov    %esi,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     866:	8d 65 f4             	lea    -0xc(%ebp),%esp
     869:	5b                   	pop    %ebx
     86a:	5e                   	pop    %esi
     86b:	5f                   	pop    %edi
     86c:	5d                   	pop    %ebp
    return parseblock(ps, es);
     86d:	e9 ae 01 00 00       	jmp    a20 <parseblock>
     872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     878:	8b 45 d0             	mov    -0x30(%ebp),%eax
     87b:	c7 44 98 04 00 00 00 	movl   $0x0,0x4(%eax,%ebx,4)
     882:	00 
  cmd->eargv[argc] = 0;
     883:	c7 44 98 2c 00 00 00 	movl   $0x0,0x2c(%eax,%ebx,4)
     88a:	00 
}
     88b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     88e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     891:	5b                   	pop    %ebx
     892:	5e                   	pop    %esi
     893:	5f                   	pop    %edi
     894:	5d                   	pop    %ebp
     895:	c3                   	ret    
      panic("syntax");
     896:	83 ec 0c             	sub    $0xc,%esp
     899:	68 ae 13 00 00       	push   $0x13ae
     89e:	e8 cd f8 ff ff       	call   170 <panic>
     8a3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000008b0 <parsepipe>:
{
     8b0:	55                   	push   %ebp
     8b1:	89 e5                	mov    %esp,%ebp
     8b3:	57                   	push   %edi
     8b4:	56                   	push   %esi
     8b5:	53                   	push   %ebx
     8b6:	83 ec 14             	sub    $0x14,%esp
     8b9:	8b 75 08             	mov    0x8(%ebp),%esi
     8bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     8bf:	57                   	push   %edi
     8c0:	56                   	push   %esi
     8c1:	e8 ca fe ff ff       	call   790 <parseexec>
  if(peek(ps, es, "|")){
     8c6:	83 c4 0c             	add    $0xc,%esp
     8c9:	68 c8 13 00 00       	push   $0x13c8
  cmd = parseexec(ps, es);
     8ce:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     8d0:	57                   	push   %edi
     8d1:	56                   	push   %esi
     8d2:	e8 f9 fc ff ff       	call   5d0 <peek>
     8d7:	83 c4 10             	add    $0x10,%esp
     8da:	85 c0                	test   %eax,%eax
     8dc:	75 12                	jne    8f0 <parsepipe+0x40>
}
     8de:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8e1:	89 d8                	mov    %ebx,%eax
     8e3:	5b                   	pop    %ebx
     8e4:	5e                   	pop    %esi
     8e5:	5f                   	pop    %edi
     8e6:	5d                   	pop    %ebp
     8e7:	c3                   	ret    
     8e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8ef:	90                   	nop
    gettoken(ps, es, 0, 0);
     8f0:	6a 00                	push   $0x0
     8f2:	6a 00                	push   $0x0
     8f4:	57                   	push   %edi
     8f5:	56                   	push   %esi
     8f6:	e8 75 fb ff ff       	call   470 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8fb:	58                   	pop    %eax
     8fc:	5a                   	pop    %edx
     8fd:	57                   	push   %edi
     8fe:	56                   	push   %esi
     8ff:	e8 ac ff ff ff       	call   8b0 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     904:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     90b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     90d:	e8 4e 09 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     912:	83 c4 0c             	add    $0xc,%esp
     915:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     917:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     919:	6a 00                	push   $0x0
     91b:	50                   	push   %eax
     91c:	e8 6f 03 00 00       	call   c90 <memset>
  cmd->left = left;
     921:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     924:	83 c4 10             	add    $0x10,%esp
     927:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     929:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     92f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     931:	89 7e 08             	mov    %edi,0x8(%esi)
}
     934:	8d 65 f4             	lea    -0xc(%ebp),%esp
     937:	5b                   	pop    %ebx
     938:	5e                   	pop    %esi
     939:	5f                   	pop    %edi
     93a:	5d                   	pop    %ebp
     93b:	c3                   	ret    
     93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000940 <parseline>:
{
     940:	55                   	push   %ebp
     941:	89 e5                	mov    %esp,%ebp
     943:	57                   	push   %edi
     944:	56                   	push   %esi
     945:	53                   	push   %ebx
     946:	83 ec 24             	sub    $0x24,%esp
     949:	8b 75 08             	mov    0x8(%ebp),%esi
     94c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     94f:	57                   	push   %edi
     950:	56                   	push   %esi
     951:	e8 5a ff ff ff       	call   8b0 <parsepipe>
  while(peek(ps, es, "&")){
     956:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     959:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     95b:	eb 3b                	jmp    998 <parseline+0x58>
     95d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     960:	6a 00                	push   $0x0
     962:	6a 00                	push   $0x0
     964:	57                   	push   %edi
     965:	56                   	push   %esi
     966:	e8 05 fb ff ff       	call   470 <gettoken>
  cmd = malloc(sizeof(*cmd));
     96b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     972:	e8 e9 08 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     977:	83 c4 0c             	add    $0xc,%esp
     97a:	6a 08                	push   $0x8
     97c:	6a 00                	push   $0x0
     97e:	50                   	push   %eax
     97f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     982:	e8 09 03 00 00       	call   c90 <memset>
  cmd->type = BACK;
     987:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     98a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     98d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     993:	89 5a 04             	mov    %ebx,0x4(%edx)
     996:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     998:	83 ec 04             	sub    $0x4,%esp
     99b:	68 ca 13 00 00       	push   $0x13ca
     9a0:	57                   	push   %edi
     9a1:	56                   	push   %esi
     9a2:	e8 29 fc ff ff       	call   5d0 <peek>
     9a7:	83 c4 10             	add    $0x10,%esp
     9aa:	85 c0                	test   %eax,%eax
     9ac:	75 b2                	jne    960 <parseline+0x20>
  if(peek(ps, es, ";")){
     9ae:	83 ec 04             	sub    $0x4,%esp
     9b1:	68 c6 13 00 00       	push   $0x13c6
     9b6:	57                   	push   %edi
     9b7:	56                   	push   %esi
     9b8:	e8 13 fc ff ff       	call   5d0 <peek>
     9bd:	83 c4 10             	add    $0x10,%esp
     9c0:	85 c0                	test   %eax,%eax
     9c2:	75 0c                	jne    9d0 <parseline+0x90>
}
     9c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c7:	89 d8                	mov    %ebx,%eax
     9c9:	5b                   	pop    %ebx
     9ca:	5e                   	pop    %esi
     9cb:	5f                   	pop    %edi
     9cc:	5d                   	pop    %ebp
     9cd:	c3                   	ret    
     9ce:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     9d0:	6a 00                	push   $0x0
     9d2:	6a 00                	push   $0x0
     9d4:	57                   	push   %edi
     9d5:	56                   	push   %esi
     9d6:	e8 95 fa ff ff       	call   470 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     9db:	58                   	pop    %eax
     9dc:	5a                   	pop    %edx
     9dd:	57                   	push   %edi
     9de:	56                   	push   %esi
     9df:	e8 5c ff ff ff       	call   940 <parseline>
  cmd = malloc(sizeof(*cmd));
     9e4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     9eb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     9ed:	e8 6e 08 00 00       	call   1260 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     9f2:	83 c4 0c             	add    $0xc,%esp
     9f5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     9f7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     9f9:	6a 00                	push   $0x0
     9fb:	50                   	push   %eax
     9fc:	e8 8f 02 00 00       	call   c90 <memset>
  cmd->left = left;
     a01:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     a04:	83 c4 10             	add    $0x10,%esp
     a07:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     a09:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     a0f:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     a11:	89 7e 08             	mov    %edi,0x8(%esi)
}
     a14:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a17:	5b                   	pop    %ebx
     a18:	5e                   	pop    %esi
     a19:	5f                   	pop    %edi
     a1a:	5d                   	pop    %ebp
     a1b:	c3                   	ret    
     a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a20 <parseblock>:
{
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	57                   	push   %edi
     a24:	56                   	push   %esi
     a25:	53                   	push   %ebx
     a26:	83 ec 10             	sub    $0x10,%esp
     a29:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a2c:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     a2f:	68 ac 13 00 00       	push   $0x13ac
     a34:	56                   	push   %esi
     a35:	53                   	push   %ebx
     a36:	e8 95 fb ff ff       	call   5d0 <peek>
     a3b:	83 c4 10             	add    $0x10,%esp
     a3e:	85 c0                	test   %eax,%eax
     a40:	74 4a                	je     a8c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     a42:	6a 00                	push   $0x0
     a44:	6a 00                	push   $0x0
     a46:	56                   	push   %esi
     a47:	53                   	push   %ebx
     a48:	e8 23 fa ff ff       	call   470 <gettoken>
  cmd = parseline(ps, es);
     a4d:	58                   	pop    %eax
     a4e:	5a                   	pop    %edx
     a4f:	56                   	push   %esi
     a50:	53                   	push   %ebx
     a51:	e8 ea fe ff ff       	call   940 <parseline>
  if(!peek(ps, es, ")"))
     a56:	83 c4 0c             	add    $0xc,%esp
     a59:	68 e8 13 00 00       	push   $0x13e8
  cmd = parseline(ps, es);
     a5e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a60:	56                   	push   %esi
     a61:	53                   	push   %ebx
     a62:	e8 69 fb ff ff       	call   5d0 <peek>
     a67:	83 c4 10             	add    $0x10,%esp
     a6a:	85 c0                	test   %eax,%eax
     a6c:	74 2b                	je     a99 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     a6e:	6a 00                	push   $0x0
     a70:	6a 00                	push   $0x0
     a72:	56                   	push   %esi
     a73:	53                   	push   %ebx
     a74:	e8 f7 f9 ff ff       	call   470 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a79:	83 c4 0c             	add    $0xc,%esp
     a7c:	56                   	push   %esi
     a7d:	53                   	push   %ebx
     a7e:	57                   	push   %edi
     a7f:	e8 cc fb ff ff       	call   650 <parseredirs>
}
     a84:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a87:	5b                   	pop    %ebx
     a88:	5e                   	pop    %esi
     a89:	5f                   	pop    %edi
     a8a:	5d                   	pop    %ebp
     a8b:	c3                   	ret    
    panic("parseblock");
     a8c:	83 ec 0c             	sub    $0xc,%esp
     a8f:	68 cc 13 00 00       	push   $0x13cc
     a94:	e8 d7 f6 ff ff       	call   170 <panic>
    panic("syntax - missing )");
     a99:	83 ec 0c             	sub    $0xc,%esp
     a9c:	68 d7 13 00 00       	push   $0x13d7
     aa1:	e8 ca f6 ff ff       	call   170 <panic>
     aa6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     aad:	8d 76 00             	lea    0x0(%esi),%esi

00000ab0 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     ab0:	55                   	push   %ebp
     ab1:	89 e5                	mov    %esp,%ebp
     ab3:	53                   	push   %ebx
     ab4:	83 ec 04             	sub    $0x4,%esp
     ab7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     aba:	85 db                	test   %ebx,%ebx
     abc:	0f 84 8e 00 00 00    	je     b50 <nulterminate+0xa0>
    return 0;

  switch(cmd->type){
     ac2:	83 3b 05             	cmpl   $0x5,(%ebx)
     ac5:	77 61                	ja     b28 <nulterminate+0x78>
     ac7:	8b 03                	mov    (%ebx),%eax
     ac9:	ff 24 85 28 14 00 00 	jmp    *0x1428(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     ad0:	83 ec 0c             	sub    $0xc,%esp
     ad3:	ff 73 04             	pushl  0x4(%ebx)
     ad6:	e8 d5 ff ff ff       	call   ab0 <nulterminate>
    nulterminate(lcmd->right);
     adb:	58                   	pop    %eax
     adc:	ff 73 08             	pushl  0x8(%ebx)
     adf:	e8 cc ff ff ff       	call   ab0 <nulterminate>
    break;
     ae4:	83 c4 10             	add    $0x10,%esp
     ae7:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     ae9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     aec:	c9                   	leave  
     aed:	c3                   	ret    
     aee:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     af0:	83 ec 0c             	sub    $0xc,%esp
     af3:	ff 73 04             	pushl  0x4(%ebx)
     af6:	e8 b5 ff ff ff       	call   ab0 <nulterminate>
    break;
     afb:	89 d8                	mov    %ebx,%eax
     afd:	83 c4 10             	add    $0x10,%esp
}
     b00:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b03:	c9                   	leave  
     b04:	c3                   	ret    
     b05:	8d 76 00             	lea    0x0(%esi),%esi
    for(i=0; ecmd->argv[i]; i++)
     b08:	8b 4b 04             	mov    0x4(%ebx),%ecx
     b0b:	8d 43 08             	lea    0x8(%ebx),%eax
     b0e:	85 c9                	test   %ecx,%ecx
     b10:	74 16                	je     b28 <nulterminate+0x78>
     b12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     b18:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     b1b:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     b1e:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     b21:	8b 50 fc             	mov    -0x4(%eax),%edx
     b24:	85 d2                	test   %edx,%edx
     b26:	75 f0                	jne    b18 <nulterminate+0x68>
  switch(cmd->type){
     b28:	89 d8                	mov    %ebx,%eax
}
     b2a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b2d:	c9                   	leave  
     b2e:	c3                   	ret    
     b2f:	90                   	nop
    nulterminate(rcmd->cmd);
     b30:	83 ec 0c             	sub    $0xc,%esp
     b33:	ff 73 04             	pushl  0x4(%ebx)
     b36:	e8 75 ff ff ff       	call   ab0 <nulterminate>
    *rcmd->efile = 0;
     b3b:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     b3e:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     b41:	c6 00 00             	movb   $0x0,(%eax)
    break;
     b44:	89 d8                	mov    %ebx,%eax
}
     b46:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b49:	c9                   	leave  
     b4a:	c3                   	ret    
     b4b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b4f:	90                   	nop
    return 0;
     b50:	31 c0                	xor    %eax,%eax
     b52:	eb 95                	jmp    ae9 <nulterminate+0x39>
     b54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b5f:	90                   	nop

00000b60 <parsecmd>:
{
     b60:	55                   	push   %ebp
     b61:	89 e5                	mov    %esp,%ebp
     b63:	57                   	push   %edi
     b64:	56                   	push   %esi
  cmd = parseline(&s, es);
     b65:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     b68:	53                   	push   %ebx
     b69:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     b6c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b6f:	53                   	push   %ebx
     b70:	e8 eb 00 00 00       	call   c60 <strlen>
  cmd = parseline(&s, es);
     b75:	59                   	pop    %ecx
     b76:	5e                   	pop    %esi
  es = s + strlen(s);
     b77:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b79:	53                   	push   %ebx
     b7a:	57                   	push   %edi
     b7b:	e8 c0 fd ff ff       	call   940 <parseline>
  peek(&s, es, "");
     b80:	83 c4 0c             	add    $0xc,%esp
     b83:	68 76 13 00 00       	push   $0x1376
  cmd = parseline(&s, es);
     b88:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b8a:	53                   	push   %ebx
     b8b:	57                   	push   %edi
     b8c:	e8 3f fa ff ff       	call   5d0 <peek>
  if(s != es){
     b91:	8b 45 08             	mov    0x8(%ebp),%eax
     b94:	83 c4 10             	add    $0x10,%esp
     b97:	39 d8                	cmp    %ebx,%eax
     b99:	75 13                	jne    bae <parsecmd+0x4e>
  nulterminate(cmd);
     b9b:	83 ec 0c             	sub    $0xc,%esp
     b9e:	56                   	push   %esi
     b9f:	e8 0c ff ff ff       	call   ab0 <nulterminate>
}
     ba4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ba7:	89 f0                	mov    %esi,%eax
     ba9:	5b                   	pop    %ebx
     baa:	5e                   	pop    %esi
     bab:	5f                   	pop    %edi
     bac:	5d                   	pop    %ebp
     bad:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     bae:	52                   	push   %edx
     baf:	50                   	push   %eax
     bb0:	68 ea 13 00 00       	push   $0x13ea
     bb5:	6a 02                	push   $0x2
     bb7:	e8 74 04 00 00       	call   1030 <printf>
    panic("syntax");
     bbc:	c7 04 24 ae 13 00 00 	movl   $0x13ae,(%esp)
     bc3:	e8 a8 f5 ff ff       	call   170 <panic>
     bc8:	66 90                	xchg   %ax,%ax
     bca:	66 90                	xchg   %ax,%ax
     bcc:	66 90                	xchg   %ax,%ax
     bce:	66 90                	xchg   %ax,%ax

00000bd0 <strcpy>:
#include "x86.h"
#include "spinlock.h"

char*
strcpy(char *s, const char *t)
{
     bd0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     bd1:	31 c0                	xor    %eax,%eax
{
     bd3:	89 e5                	mov    %esp,%ebp
     bd5:	53                   	push   %ebx
     bd6:	8b 4d 08             	mov    0x8(%ebp),%ecx
     bd9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     be0:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     be4:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     be7:	83 c0 01             	add    $0x1,%eax
     bea:	84 d2                	test   %dl,%dl
     bec:	75 f2                	jne    be0 <strcpy+0x10>
    ;
  return os;
}
     bee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bf1:	89 c8                	mov    %ecx,%eax
     bf3:	c9                   	leave  
     bf4:	c3                   	ret    
     bf5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000c00 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	53                   	push   %ebx
     c04:	8b 55 08             	mov    0x8(%ebp),%edx
     c07:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     c0a:	0f b6 02             	movzbl (%edx),%eax
     c0d:	84 c0                	test   %al,%al
     c0f:	75 17                	jne    c28 <strcmp+0x28>
     c11:	eb 3a                	jmp    c4d <strcmp+0x4d>
     c13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c17:	90                   	nop
     c18:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     c1c:	83 c2 01             	add    $0x1,%edx
     c1f:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     c22:	84 c0                	test   %al,%al
     c24:	74 1a                	je     c40 <strcmp+0x40>
    p++, q++;
     c26:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     c28:	0f b6 19             	movzbl (%ecx),%ebx
     c2b:	38 c3                	cmp    %al,%bl
     c2d:	74 e9                	je     c18 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     c2f:	29 d8                	sub    %ebx,%eax
}
     c31:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c34:	c9                   	leave  
     c35:	c3                   	ret    
     c36:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c3d:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     c40:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     c44:	31 c0                	xor    %eax,%eax
     c46:	29 d8                	sub    %ebx,%eax
}
     c48:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c4b:	c9                   	leave  
     c4c:	c3                   	ret    
  return (uchar)*p - (uchar)*q;
     c4d:	0f b6 19             	movzbl (%ecx),%ebx
     c50:	31 c0                	xor    %eax,%eax
     c52:	eb db                	jmp    c2f <strcmp+0x2f>
     c54:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c5b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c5f:	90                   	nop

00000c60 <strlen>:

uint
strlen(const char *s)
{
     c60:	55                   	push   %ebp
     c61:	89 e5                	mov    %esp,%ebp
     c63:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     c66:	80 3a 00             	cmpb   $0x0,(%edx)
     c69:	74 15                	je     c80 <strlen+0x20>
     c6b:	31 c0                	xor    %eax,%eax
     c6d:	8d 76 00             	lea    0x0(%esi),%esi
     c70:	83 c0 01             	add    $0x1,%eax
     c73:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     c77:	89 c1                	mov    %eax,%ecx
     c79:	75 f5                	jne    c70 <strlen+0x10>
    ;
  return n;
}
     c7b:	89 c8                	mov    %ecx,%eax
     c7d:	5d                   	pop    %ebp
     c7e:	c3                   	ret    
     c7f:	90                   	nop
  for(n = 0; s[n]; n++)
     c80:	31 c9                	xor    %ecx,%ecx
}
     c82:	5d                   	pop    %ebp
     c83:	89 c8                	mov    %ecx,%eax
     c85:	c3                   	ret    
     c86:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c8d:	8d 76 00             	lea    0x0(%esi),%esi

00000c90 <memset>:

void*
memset(void *dst, int c, uint n)
{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	57                   	push   %edi
     c94:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     c97:	8b 4d 10             	mov    0x10(%ebp),%ecx
     c9a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c9d:	89 d7                	mov    %edx,%edi
     c9f:	fc                   	cld    
     ca0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     ca2:	8b 7d fc             	mov    -0x4(%ebp),%edi
     ca5:	89 d0                	mov    %edx,%eax
     ca7:	c9                   	leave  
     ca8:	c3                   	ret    
     ca9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cb0 <strchr>:

char*
strchr(const char *s, char c)
{
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	8b 45 08             	mov    0x8(%ebp),%eax
     cb6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     cba:	0f b6 10             	movzbl (%eax),%edx
     cbd:	84 d2                	test   %dl,%dl
     cbf:	75 12                	jne    cd3 <strchr+0x23>
     cc1:	eb 1d                	jmp    ce0 <strchr+0x30>
     cc3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cc7:	90                   	nop
     cc8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     ccc:	83 c0 01             	add    $0x1,%eax
     ccf:	84 d2                	test   %dl,%dl
     cd1:	74 0d                	je     ce0 <strchr+0x30>
    if(*s == c)
     cd3:	38 d1                	cmp    %dl,%cl
     cd5:	75 f1                	jne    cc8 <strchr+0x18>
      return (char*)s;
  return 0;
}
     cd7:	5d                   	pop    %ebp
     cd8:	c3                   	ret    
     cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     ce0:	31 c0                	xor    %eax,%eax
}
     ce2:	5d                   	pop    %ebp
     ce3:	c3                   	ret    
     ce4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ceb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     cef:	90                   	nop

00000cf0 <gets>:

char*
gets(char *buf, int max)
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	57                   	push   %edi
     cf4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     cf5:	8d 7d e7             	lea    -0x19(%ebp),%edi
{
     cf8:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     cf9:	31 db                	xor    %ebx,%ebx
{
     cfb:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     cfe:	eb 27                	jmp    d27 <gets+0x37>
    cc = read(0, &c, 1);
     d00:	83 ec 04             	sub    $0x4,%esp
     d03:	6a 01                	push   $0x1
     d05:	57                   	push   %edi
     d06:	6a 00                	push   $0x0
     d08:	e8 c8 01 00 00       	call   ed5 <read>
    if(cc < 1)
     d0d:	83 c4 10             	add    $0x10,%esp
     d10:	85 c0                	test   %eax,%eax
     d12:	7e 1d                	jle    d31 <gets+0x41>
      break;
    buf[i++] = c;
     d14:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     d18:	8b 55 08             	mov    0x8(%ebp),%edx
     d1b:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     d1f:	3c 0a                	cmp    $0xa,%al
     d21:	74 1d                	je     d40 <gets+0x50>
     d23:	3c 0d                	cmp    $0xd,%al
     d25:	74 19                	je     d40 <gets+0x50>
  for(i=0; i+1 < max; ){
     d27:	89 de                	mov    %ebx,%esi
     d29:	83 c3 01             	add    $0x1,%ebx
     d2c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d2f:	7c cf                	jl     d00 <gets+0x10>
      break;
  }
  buf[i] = '\0';
     d31:	8b 45 08             	mov    0x8(%ebp),%eax
     d34:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     d38:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d3b:	5b                   	pop    %ebx
     d3c:	5e                   	pop    %esi
     d3d:	5f                   	pop    %edi
     d3e:	5d                   	pop    %ebp
     d3f:	c3                   	ret    
  buf[i] = '\0';
     d40:	8b 45 08             	mov    0x8(%ebp),%eax
     d43:	89 de                	mov    %ebx,%esi
     d45:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
}
     d49:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d4c:	5b                   	pop    %ebx
     d4d:	5e                   	pop    %esi
     d4e:	5f                   	pop    %edi
     d4f:	5d                   	pop    %ebp
     d50:	c3                   	ret    
     d51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d58:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d5f:	90                   	nop

00000d60 <stat>:

int
stat(const char *n, struct stat *st)
{
     d60:	55                   	push   %ebp
     d61:	89 e5                	mov    %esp,%ebp
     d63:	56                   	push   %esi
     d64:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     d65:	83 ec 08             	sub    $0x8,%esp
     d68:	6a 00                	push   $0x0
     d6a:	ff 75 08             	pushl  0x8(%ebp)
     d6d:	e8 8b 01 00 00       	call   efd <open>
  if(fd < 0)
     d72:	83 c4 10             	add    $0x10,%esp
     d75:	85 c0                	test   %eax,%eax
     d77:	78 27                	js     da0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     d79:	83 ec 08             	sub    $0x8,%esp
     d7c:	ff 75 0c             	pushl  0xc(%ebp)
     d7f:	89 c3                	mov    %eax,%ebx
     d81:	50                   	push   %eax
     d82:	e8 8e 01 00 00       	call   f15 <fstat>
  close(fd);
     d87:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     d8a:	89 c6                	mov    %eax,%esi
  close(fd);
     d8c:	e8 54 01 00 00       	call   ee5 <close>
  return r;
     d91:	83 c4 10             	add    $0x10,%esp
}
     d94:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d97:	89 f0                	mov    %esi,%eax
     d99:	5b                   	pop    %ebx
     d9a:	5e                   	pop    %esi
     d9b:	5d                   	pop    %ebp
     d9c:	c3                   	ret    
     d9d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     da0:	be ff ff ff ff       	mov    $0xffffffff,%esi
     da5:	eb ed                	jmp    d94 <stat+0x34>
     da7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dae:	66 90                	xchg   %ax,%ax

00000db0 <atoi>:

int
atoi(const char *s)
{
     db0:	55                   	push   %ebp
     db1:	89 e5                	mov    %esp,%ebp
     db3:	53                   	push   %ebx
     db4:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     db7:	0f be 02             	movsbl (%edx),%eax
     dba:	8d 48 d0             	lea    -0x30(%eax),%ecx
     dbd:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     dc0:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     dc5:	77 1e                	ja     de5 <atoi+0x35>
     dc7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dce:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     dd0:	83 c2 01             	add    $0x1,%edx
     dd3:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     dd6:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     dda:	0f be 02             	movsbl (%edx),%eax
     ddd:	8d 58 d0             	lea    -0x30(%eax),%ebx
     de0:	80 fb 09             	cmp    $0x9,%bl
     de3:	76 eb                	jbe    dd0 <atoi+0x20>
  return n;
}
     de5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     de8:	89 c8                	mov    %ecx,%eax
     dea:	c9                   	leave  
     deb:	c3                   	ret    
     dec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000df0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     df0:	55                   	push   %ebp
     df1:	89 e5                	mov    %esp,%ebp
     df3:	57                   	push   %edi
     df4:	8b 45 10             	mov    0x10(%ebp),%eax
     df7:	8b 55 08             	mov    0x8(%ebp),%edx
     dfa:	56                   	push   %esi
     dfb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     dfe:	85 c0                	test   %eax,%eax
     e00:	7e 13                	jle    e15 <memmove+0x25>
     e02:	01 d0                	add    %edx,%eax
  dst = vdst;
     e04:	89 d7                	mov    %edx,%edi
     e06:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e0d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     e10:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     e11:	39 f8                	cmp    %edi,%eax
     e13:	75 fb                	jne    e10 <memmove+0x20>
  return vdst;
}
     e15:	5e                   	pop    %esi
     e16:	89 d0                	mov    %edx,%eax
     e18:	5f                   	pop    %edi
     e19:	5d                   	pop    %ebp
     e1a:	c3                   	ret    
     e1b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e1f:	90                   	nop

00000e20 <thread_create>:

int
thread_create(void (*fn)(void *), void *arg)
{
     e20:	55                   	push   %ebp
     e21:	89 e5                	mov    %esp,%ebp
     e23:	53                   	push   %ebx
     e24:	83 ec 10             	sub    $0x10,%esp
  void *mem = malloc(4096 * 2);
     e27:	68 00 20 00 00       	push   $0x2000
     e2c:	e8 2f 04 00 00       	call   1260 <malloc>
  if(mem == 0)
     e31:	83 c4 10             	add    $0x10,%esp
     e34:	85 c0                	test   %eax,%eax
     e36:	74 32                	je     e6a <thread_create+0x4a>
     e38:	89 c3                	mov    %eax,%ebx
    return -1;
  
  char *p = (char *)mem;
  while ((uint)p % 4096 != 0) {
     e3a:	a9 ff 0f 00 00       	test   $0xfff,%eax
     e3f:	74 12                	je     e53 <thread_create+0x33>
     e41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    p++;
     e48:	83 c3 01             	add    $0x1,%ebx
  while ((uint)p % 4096 != 0) {
     e4b:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
     e51:	75 f5                	jne    e48 <thread_create+0x28>
    printf(1, "LOLOLOL %p\n", fn);
    free(stack);
    return -1;
  }
  
  int tid = clone(stack);
     e53:	83 ec 0c             	sub    $0xc,%esp
     e56:	53                   	push   %ebx
     e57:	e8 01 01 00 00       	call   f5d <clone>
  if(tid < 0){
     e5c:	83 c4 10             	add    $0x10,%esp
     e5f:	85 c0                	test   %eax,%eax
     e61:	78 0e                	js     e71 <thread_create+0x51>
    free(stack);
    return -1;
  }
  

  if(tid == 0){
     e63:	74 1f                	je     e84 <thread_create+0x64>
    exit();
  }
  
  // Parent returns the new thread's id.
  return tid;
}
     e65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e68:	c9                   	leave  
     e69:	c3                   	ret    
    return -1;
     e6a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     e6f:	eb f4                	jmp    e65 <thread_create+0x45>
    free(stack);
     e71:	83 ec 0c             	sub    $0xc,%esp
     e74:	53                   	push   %ebx
     e75:	e8 56 03 00 00       	call   11d0 <free>
    return -1;
     e7a:	83 c4 10             	add    $0x10,%esp
     e7d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     e82:	eb e1                	jmp    e65 <thread_create+0x45>
    printf(1, "Entering thread function at %p\n", fn);
     e84:	50                   	push   %eax
     e85:	ff 75 08             	pushl  0x8(%ebp)
     e88:	68 40 14 00 00       	push   $0x1440
     e8d:	6a 01                	push   $0x1
     e8f:	e8 9c 01 00 00       	call   1030 <printf>
    fn(arg);
     e94:	5a                   	pop    %edx
     e95:	ff 75 0c             	pushl  0xc(%ebp)
     e98:	ff 55 08             	call   *0x8(%ebp)
    free(stack);
     e9b:	89 1c 24             	mov    %ebx,(%esp)
     e9e:	e8 2d 03 00 00       	call   11d0 <free>
    exit();
     ea3:	e8 15 00 00 00       	call   ebd <exit>
     ea8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     eaf:	90                   	nop

00000eb0 <thread_join>:

int
thread_join(void)
{
  return join();
     eb0:	e9 c0 00 00 00       	jmp    f75 <join>

00000eb5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     eb5:	b8 01 00 00 00       	mov    $0x1,%eax
     eba:	cd 40                	int    $0x40
     ebc:	c3                   	ret    

00000ebd <exit>:
SYSCALL(exit)
     ebd:	b8 02 00 00 00       	mov    $0x2,%eax
     ec2:	cd 40                	int    $0x40
     ec4:	c3                   	ret    

00000ec5 <wait>:
SYSCALL(wait)
     ec5:	b8 03 00 00 00       	mov    $0x3,%eax
     eca:	cd 40                	int    $0x40
     ecc:	c3                   	ret    

00000ecd <pipe>:
SYSCALL(pipe)
     ecd:	b8 04 00 00 00       	mov    $0x4,%eax
     ed2:	cd 40                	int    $0x40
     ed4:	c3                   	ret    

00000ed5 <read>:
SYSCALL(read)
     ed5:	b8 05 00 00 00       	mov    $0x5,%eax
     eda:	cd 40                	int    $0x40
     edc:	c3                   	ret    

00000edd <write>:
SYSCALL(write)
     edd:	b8 10 00 00 00       	mov    $0x10,%eax
     ee2:	cd 40                	int    $0x40
     ee4:	c3                   	ret    

00000ee5 <close>:
SYSCALL(close)
     ee5:	b8 15 00 00 00       	mov    $0x15,%eax
     eea:	cd 40                	int    $0x40
     eec:	c3                   	ret    

00000eed <kill>:
SYSCALL(kill)
     eed:	b8 06 00 00 00       	mov    $0x6,%eax
     ef2:	cd 40                	int    $0x40
     ef4:	c3                   	ret    

00000ef5 <exec>:
SYSCALL(exec)
     ef5:	b8 07 00 00 00       	mov    $0x7,%eax
     efa:	cd 40                	int    $0x40
     efc:	c3                   	ret    

00000efd <open>:
SYSCALL(open)
     efd:	b8 0f 00 00 00       	mov    $0xf,%eax
     f02:	cd 40                	int    $0x40
     f04:	c3                   	ret    

00000f05 <mknod>:
SYSCALL(mknod)
     f05:	b8 11 00 00 00       	mov    $0x11,%eax
     f0a:	cd 40                	int    $0x40
     f0c:	c3                   	ret    

00000f0d <unlink>:
SYSCALL(unlink)
     f0d:	b8 12 00 00 00       	mov    $0x12,%eax
     f12:	cd 40                	int    $0x40
     f14:	c3                   	ret    

00000f15 <fstat>:
SYSCALL(fstat)
     f15:	b8 08 00 00 00       	mov    $0x8,%eax
     f1a:	cd 40                	int    $0x40
     f1c:	c3                   	ret    

00000f1d <link>:
SYSCALL(link)
     f1d:	b8 13 00 00 00       	mov    $0x13,%eax
     f22:	cd 40                	int    $0x40
     f24:	c3                   	ret    

00000f25 <mkdir>:
SYSCALL(mkdir)
     f25:	b8 14 00 00 00       	mov    $0x14,%eax
     f2a:	cd 40                	int    $0x40
     f2c:	c3                   	ret    

00000f2d <chdir>:
SYSCALL(chdir)
     f2d:	b8 09 00 00 00       	mov    $0x9,%eax
     f32:	cd 40                	int    $0x40
     f34:	c3                   	ret    

00000f35 <dup>:
SYSCALL(dup)
     f35:	b8 0a 00 00 00       	mov    $0xa,%eax
     f3a:	cd 40                	int    $0x40
     f3c:	c3                   	ret    

00000f3d <getpid>:
SYSCALL(getpid)
     f3d:	b8 0b 00 00 00       	mov    $0xb,%eax
     f42:	cd 40                	int    $0x40
     f44:	c3                   	ret    

00000f45 <sbrk>:
SYSCALL(sbrk)
     f45:	b8 0c 00 00 00       	mov    $0xc,%eax
     f4a:	cd 40                	int    $0x40
     f4c:	c3                   	ret    

00000f4d <sleep>:
SYSCALL(sleep)
     f4d:	b8 0d 00 00 00       	mov    $0xd,%eax
     f52:	cd 40                	int    $0x40
     f54:	c3                   	ret    

00000f55 <uptime>:
SYSCALL(uptime)
     f55:	b8 0e 00 00 00       	mov    $0xe,%eax
     f5a:	cd 40                	int    $0x40
     f5c:	c3                   	ret    

00000f5d <clone>:
SYSCALL(clone)
     f5d:	b8 16 00 00 00       	mov    $0x16,%eax
     f62:	cd 40                	int    $0x40
     f64:	c3                   	ret    

00000f65 <lock>:
SYSCALL(lock)
     f65:	b8 17 00 00 00       	mov    $0x17,%eax
     f6a:	cd 40                	int    $0x40
     f6c:	c3                   	ret    

00000f6d <unlock>:
SYSCALL(unlock)
     f6d:	b8 18 00 00 00       	mov    $0x18,%eax
     f72:	cd 40                	int    $0x40
     f74:	c3                   	ret    

00000f75 <join>:
SYSCALL(join)
     f75:	b8 19 00 00 00       	mov    $0x19,%eax
     f7a:	cd 40                	int    $0x40
     f7c:	c3                   	ret    
     f7d:	66 90                	xchg   %ax,%ax
     f7f:	90                   	nop

00000f80 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     f80:	55                   	push   %ebp
     f81:	89 e5                	mov    %esp,%ebp
     f83:	57                   	push   %edi
     f84:	56                   	push   %esi
     f85:	53                   	push   %ebx
     f86:	83 ec 3c             	sub    $0x3c,%esp
     f89:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     f8c:	89 d1                	mov    %edx,%ecx
{
     f8e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
     f91:	85 d2                	test   %edx,%edx
     f93:	0f 89 7f 00 00 00    	jns    1018 <printint+0x98>
     f99:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     f9d:	74 79                	je     1018 <printint+0x98>
    neg = 1;
     f9f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
     fa6:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
     fa8:	31 db                	xor    %ebx,%ebx
     faa:	8d 75 d7             	lea    -0x29(%ebp),%esi
     fad:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     fb0:	89 c8                	mov    %ecx,%eax
     fb2:	31 d2                	xor    %edx,%edx
     fb4:	89 cf                	mov    %ecx,%edi
     fb6:	f7 75 c4             	divl   -0x3c(%ebp)
     fb9:	0f b6 92 c0 14 00 00 	movzbl 0x14c0(%edx),%edx
     fc0:	89 45 c0             	mov    %eax,-0x40(%ebp)
     fc3:	89 d8                	mov    %ebx,%eax
     fc5:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
     fc8:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
     fcb:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
     fce:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
     fd1:	76 dd                	jbe    fb0 <printint+0x30>
  if(neg)
     fd3:	8b 4d bc             	mov    -0x44(%ebp),%ecx
     fd6:	85 c9                	test   %ecx,%ecx
     fd8:	74 0c                	je     fe6 <printint+0x66>
    buf[i++] = '-';
     fda:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
     fdf:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
     fe1:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
     fe6:	8b 7d b8             	mov    -0x48(%ebp),%edi
     fe9:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
     fed:	eb 07                	jmp    ff6 <printint+0x76>
     fef:	90                   	nop
    putc(fd, buf[i]);
     ff0:	0f b6 13             	movzbl (%ebx),%edx
     ff3:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
     ff6:	83 ec 04             	sub    $0x4,%esp
     ff9:	88 55 d7             	mov    %dl,-0x29(%ebp)
     ffc:	6a 01                	push   $0x1
     ffe:	56                   	push   %esi
     fff:	57                   	push   %edi
    1000:	e8 d8 fe ff ff       	call   edd <write>
  while(--i >= 0)
    1005:	83 c4 10             	add    $0x10,%esp
    1008:	39 de                	cmp    %ebx,%esi
    100a:	75 e4                	jne    ff0 <printint+0x70>
}
    100c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    100f:	5b                   	pop    %ebx
    1010:	5e                   	pop    %esi
    1011:	5f                   	pop    %edi
    1012:	5d                   	pop    %ebp
    1013:	c3                   	ret    
    1014:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    1018:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
    101f:	eb 87                	jmp    fa8 <printint+0x28>
    1021:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1028:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    102f:	90                   	nop

00001030 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	57                   	push   %edi
    1034:	56                   	push   %esi
    1035:	53                   	push   %ebx
    1036:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1039:	8b 5d 0c             	mov    0xc(%ebp),%ebx
{
    103c:	8b 75 08             	mov    0x8(%ebp),%esi
  for(i = 0; fmt[i]; i++){
    103f:	0f b6 13             	movzbl (%ebx),%edx
    1042:	84 d2                	test   %dl,%dl
    1044:	74 6a                	je     10b0 <printf+0x80>
  ap = (uint*)(void*)&fmt + 1;
    1046:	8d 45 10             	lea    0x10(%ebp),%eax
    1049:	83 c3 01             	add    $0x1,%ebx
  write(fd, &c, 1);
    104c:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
    104f:	31 c9                	xor    %ecx,%ecx
  ap = (uint*)(void*)&fmt + 1;
    1051:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1054:	eb 36                	jmp    108c <printf+0x5c>
    1056:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    105d:	8d 76 00             	lea    0x0(%esi),%esi
    1060:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1063:	b9 25 00 00 00       	mov    $0x25,%ecx
      if(c == '%'){
    1068:	83 f8 25             	cmp    $0x25,%eax
    106b:	74 15                	je     1082 <printf+0x52>
  write(fd, &c, 1);
    106d:	83 ec 04             	sub    $0x4,%esp
    1070:	88 55 e7             	mov    %dl,-0x19(%ebp)
    1073:	6a 01                	push   $0x1
    1075:	57                   	push   %edi
    1076:	56                   	push   %esi
    1077:	e8 61 fe ff ff       	call   edd <write>
    107c:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      } else {
        putc(fd, c);
    107f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    1082:	0f b6 13             	movzbl (%ebx),%edx
    1085:	83 c3 01             	add    $0x1,%ebx
    1088:	84 d2                	test   %dl,%dl
    108a:	74 24                	je     10b0 <printf+0x80>
    c = fmt[i] & 0xff;
    108c:	0f b6 c2             	movzbl %dl,%eax
    if(state == 0){
    108f:	85 c9                	test   %ecx,%ecx
    1091:	74 cd                	je     1060 <printf+0x30>
      }
    } else if(state == '%'){
    1093:	83 f9 25             	cmp    $0x25,%ecx
    1096:	75 ea                	jne    1082 <printf+0x52>
      if(c == 'd'){
    1098:	83 f8 25             	cmp    $0x25,%eax
    109b:	0f 84 07 01 00 00    	je     11a8 <printf+0x178>
    10a1:	83 e8 63             	sub    $0x63,%eax
    10a4:	83 f8 15             	cmp    $0x15,%eax
    10a7:	77 17                	ja     10c0 <printf+0x90>
    10a9:	ff 24 85 68 14 00 00 	jmp    *0x1468(,%eax,4)
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    10b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    10b3:	5b                   	pop    %ebx
    10b4:	5e                   	pop    %esi
    10b5:	5f                   	pop    %edi
    10b6:	5d                   	pop    %ebp
    10b7:	c3                   	ret    
    10b8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10bf:	90                   	nop
  write(fd, &c, 1);
    10c0:	83 ec 04             	sub    $0x4,%esp
    10c3:	88 55 d4             	mov    %dl,-0x2c(%ebp)
    10c6:	6a 01                	push   $0x1
    10c8:	57                   	push   %edi
    10c9:	56                   	push   %esi
    10ca:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    10ce:	e8 0a fe ff ff       	call   edd <write>
        putc(fd, c);
    10d3:	0f b6 55 d4          	movzbl -0x2c(%ebp),%edx
  write(fd, &c, 1);
    10d7:	83 c4 0c             	add    $0xc,%esp
    10da:	88 55 e7             	mov    %dl,-0x19(%ebp)
    10dd:	6a 01                	push   $0x1
    10df:	57                   	push   %edi
    10e0:	56                   	push   %esi
    10e1:	e8 f7 fd ff ff       	call   edd <write>
        putc(fd, c);
    10e6:	83 c4 10             	add    $0x10,%esp
      state = 0;
    10e9:	31 c9                	xor    %ecx,%ecx
    10eb:	eb 95                	jmp    1082 <printf+0x52>
    10ed:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    10f0:	83 ec 0c             	sub    $0xc,%esp
    10f3:	b9 10 00 00 00       	mov    $0x10,%ecx
    10f8:	6a 00                	push   $0x0
    10fa:	8b 45 d0             	mov    -0x30(%ebp),%eax
    10fd:	8b 10                	mov    (%eax),%edx
    10ff:	89 f0                	mov    %esi,%eax
    1101:	e8 7a fe ff ff       	call   f80 <printint>
        ap++;
    1106:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    110a:	83 c4 10             	add    $0x10,%esp
      state = 0;
    110d:	31 c9                	xor    %ecx,%ecx
    110f:	e9 6e ff ff ff       	jmp    1082 <printf+0x52>
    1114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    1118:	8b 45 d0             	mov    -0x30(%ebp),%eax
    111b:	8b 10                	mov    (%eax),%edx
        ap++;
    111d:	83 c0 04             	add    $0x4,%eax
    1120:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    1123:	85 d2                	test   %edx,%edx
    1125:	0f 84 8d 00 00 00    	je     11b8 <printf+0x188>
        while(*s != 0){
    112b:	0f b6 02             	movzbl (%edx),%eax
      state = 0;
    112e:	31 c9                	xor    %ecx,%ecx
        while(*s != 0){
    1130:	84 c0                	test   %al,%al
    1132:	0f 84 4a ff ff ff    	je     1082 <printf+0x52>
    1138:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    113b:	89 d3                	mov    %edx,%ebx
    113d:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1140:	83 ec 04             	sub    $0x4,%esp
          s++;
    1143:	83 c3 01             	add    $0x1,%ebx
    1146:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1149:	6a 01                	push   $0x1
    114b:	57                   	push   %edi
    114c:	56                   	push   %esi
    114d:	e8 8b fd ff ff       	call   edd <write>
        while(*s != 0){
    1152:	0f b6 03             	movzbl (%ebx),%eax
    1155:	83 c4 10             	add    $0x10,%esp
    1158:	84 c0                	test   %al,%al
    115a:	75 e4                	jne    1140 <printf+0x110>
      state = 0;
    115c:	8b 5d d4             	mov    -0x2c(%ebp),%ebx
    115f:	31 c9                	xor    %ecx,%ecx
    1161:	e9 1c ff ff ff       	jmp    1082 <printf+0x52>
    1166:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    116d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1170:	83 ec 0c             	sub    $0xc,%esp
    1173:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1178:	6a 01                	push   $0x1
    117a:	e9 7b ff ff ff       	jmp    10fa <printf+0xca>
    117f:	90                   	nop
        putc(fd, *ap);
    1180:	8b 45 d0             	mov    -0x30(%ebp),%eax
  write(fd, &c, 1);
    1183:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    1186:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
    1188:	6a 01                	push   $0x1
    118a:	57                   	push   %edi
    118b:	56                   	push   %esi
        putc(fd, *ap);
    118c:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    118f:	e8 49 fd ff ff       	call   edd <write>
        ap++;
    1194:	83 45 d0 04          	addl   $0x4,-0x30(%ebp)
    1198:	83 c4 10             	add    $0x10,%esp
      state = 0;
    119b:	31 c9                	xor    %ecx,%ecx
    119d:	e9 e0 fe ff ff       	jmp    1082 <printf+0x52>
    11a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, c);
    11a8:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
    11ab:	83 ec 04             	sub    $0x4,%esp
    11ae:	e9 2a ff ff ff       	jmp    10dd <printf+0xad>
    11b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11b7:	90                   	nop
          s = "(null)";
    11b8:	ba 60 14 00 00       	mov    $0x1460,%edx
        while(*s != 0){
    11bd:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
    11c0:	b8 28 00 00 00       	mov    $0x28,%eax
    11c5:	89 d3                	mov    %edx,%ebx
    11c7:	e9 74 ff ff ff       	jmp    1140 <printf+0x110>
    11cc:	66 90                	xchg   %ax,%ax
    11ce:	66 90                	xchg   %ax,%ax

000011d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    11d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11d1:	a1 44 1b 00 00       	mov    0x1b44,%eax
{
    11d6:	89 e5                	mov    %esp,%ebp
    11d8:	57                   	push   %edi
    11d9:	56                   	push   %esi
    11da:	53                   	push   %ebx
    11db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    11de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    11e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11e8:	89 c2                	mov    %eax,%edx
    11ea:	8b 00                	mov    (%eax),%eax
    11ec:	39 ca                	cmp    %ecx,%edx
    11ee:	73 30                	jae    1220 <free+0x50>
    11f0:	39 c1                	cmp    %eax,%ecx
    11f2:	72 04                	jb     11f8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    11f4:	39 c2                	cmp    %eax,%edx
    11f6:	72 f0                	jb     11e8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    11f8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    11fb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    11fe:	39 f8                	cmp    %edi,%eax
    1200:	74 30                	je     1232 <free+0x62>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    1202:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    1205:	8b 42 04             	mov    0x4(%edx),%eax
    1208:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    120b:	39 f1                	cmp    %esi,%ecx
    120d:	74 3a                	je     1249 <free+0x79>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    120f:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1211:	5b                   	pop    %ebx
  freep = p;
    1212:	89 15 44 1b 00 00    	mov    %edx,0x1b44
}
    1218:	5e                   	pop    %esi
    1219:	5f                   	pop    %edi
    121a:	5d                   	pop    %ebp
    121b:	c3                   	ret    
    121c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1220:	39 c2                	cmp    %eax,%edx
    1222:	72 c4                	jb     11e8 <free+0x18>
    1224:	39 c1                	cmp    %eax,%ecx
    1226:	73 c0                	jae    11e8 <free+0x18>
  if(bp + bp->s.size == p->s.ptr){
    1228:	8b 73 fc             	mov    -0x4(%ebx),%esi
    122b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    122e:	39 f8                	cmp    %edi,%eax
    1230:	75 d0                	jne    1202 <free+0x32>
    bp->s.size += p->s.ptr->s.size;
    1232:	03 70 04             	add    0x4(%eax),%esi
    1235:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1238:	8b 02                	mov    (%edx),%eax
    123a:	8b 00                	mov    (%eax),%eax
    123c:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    123f:	8b 42 04             	mov    0x4(%edx),%eax
    1242:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1245:	39 f1                	cmp    %esi,%ecx
    1247:	75 c6                	jne    120f <free+0x3f>
    p->s.size += bp->s.size;
    1249:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    124c:	89 15 44 1b 00 00    	mov    %edx,0x1b44
    p->s.size += bp->s.size;
    1252:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1255:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1258:	89 0a                	mov    %ecx,(%edx)
}
    125a:	5b                   	pop    %ebx
    125b:	5e                   	pop    %esi
    125c:	5f                   	pop    %edi
    125d:	5d                   	pop    %ebp
    125e:	c3                   	ret    
    125f:	90                   	nop

00001260 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	57                   	push   %edi
    1264:	56                   	push   %esi
    1265:	53                   	push   %ebx
    1266:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1269:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    126c:	8b 3d 44 1b 00 00    	mov    0x1b44,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1272:	8d 70 07             	lea    0x7(%eax),%esi
    1275:	c1 ee 03             	shr    $0x3,%esi
    1278:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
    127b:	85 ff                	test   %edi,%edi
    127d:	0f 84 9d 00 00 00    	je     1320 <malloc+0xc0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1283:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
    1285:	8b 4a 04             	mov    0x4(%edx),%ecx
    1288:	39 f1                	cmp    %esi,%ecx
    128a:	73 6a                	jae    12f6 <malloc+0x96>
    128c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1291:	39 de                	cmp    %ebx,%esi
    1293:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
    1296:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
    129d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    12a0:	eb 17                	jmp    12b9 <malloc+0x59>
    12a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    12a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    12aa:	8b 48 04             	mov    0x4(%eax),%ecx
    12ad:	39 f1                	cmp    %esi,%ecx
    12af:	73 4f                	jae    1300 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    12b1:	8b 3d 44 1b 00 00    	mov    0x1b44,%edi
    12b7:	89 c2                	mov    %eax,%edx
    12b9:	39 d7                	cmp    %edx,%edi
    12bb:	75 eb                	jne    12a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    12bd:	83 ec 0c             	sub    $0xc,%esp
    12c0:	ff 75 e4             	pushl  -0x1c(%ebp)
    12c3:	e8 7d fc ff ff       	call   f45 <sbrk>
  if(p == (char*)-1)
    12c8:	83 c4 10             	add    $0x10,%esp
    12cb:	83 f8 ff             	cmp    $0xffffffff,%eax
    12ce:	74 1c                	je     12ec <malloc+0x8c>
  hp->s.size = nu;
    12d0:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    12d3:	83 ec 0c             	sub    $0xc,%esp
    12d6:	83 c0 08             	add    $0x8,%eax
    12d9:	50                   	push   %eax
    12da:	e8 f1 fe ff ff       	call   11d0 <free>
  return freep;
    12df:	8b 15 44 1b 00 00    	mov    0x1b44,%edx
      if((p = morecore(nunits)) == 0)
    12e5:	83 c4 10             	add    $0x10,%esp
    12e8:	85 d2                	test   %edx,%edx
    12ea:	75 bc                	jne    12a8 <malloc+0x48>
        return 0;
  }
}
    12ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    12ef:	31 c0                	xor    %eax,%eax
}
    12f1:	5b                   	pop    %ebx
    12f2:	5e                   	pop    %esi
    12f3:	5f                   	pop    %edi
    12f4:	5d                   	pop    %ebp
    12f5:	c3                   	ret    
    if(p->s.size >= nunits){
    12f6:	89 d0                	mov    %edx,%eax
    12f8:	89 fa                	mov    %edi,%edx
    12fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1300:	39 ce                	cmp    %ecx,%esi
    1302:	74 4c                	je     1350 <malloc+0xf0>
        p->s.size -= nunits;
    1304:	29 f1                	sub    %esi,%ecx
    1306:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1309:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    130c:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
    130f:	89 15 44 1b 00 00    	mov    %edx,0x1b44
}
    1315:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    1318:	83 c0 08             	add    $0x8,%eax
}
    131b:	5b                   	pop    %ebx
    131c:	5e                   	pop    %esi
    131d:	5f                   	pop    %edi
    131e:	5d                   	pop    %ebp
    131f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1320:	c7 05 44 1b 00 00 48 	movl   $0x1b48,0x1b44
    1327:	1b 00 00 
    base.s.size = 0;
    132a:	bf 48 1b 00 00       	mov    $0x1b48,%edi
    base.s.ptr = freep = prevp = &base;
    132f:	c7 05 48 1b 00 00 48 	movl   $0x1b48,0x1b48
    1336:	1b 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1339:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
    133b:	c7 05 4c 1b 00 00 00 	movl   $0x0,0x1b4c
    1342:	00 00 00 
    if(p->s.size >= nunits){
    1345:	e9 42 ff ff ff       	jmp    128c <malloc+0x2c>
    134a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
    1350:	8b 08                	mov    (%eax),%ecx
    1352:	89 0a                	mov    %ecx,(%edx)
    1354:	eb b9                	jmp    130f <malloc+0xaf>
