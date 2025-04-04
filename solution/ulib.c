#include "types.h"
#include "stat.h"
#include "fcntl.h"
#include "user.h"
#include "x86.h"
#include "spinlock.h"

char*
strcpy(char *s, const char *t)
{
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    ;
  return os;
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    p++, q++;
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    ;
  return n;
}

void*
memset(void *dst, int c, uint n)
{
  stosb(dst, c, n);
  return dst;
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    if(*s == c)
      return (char*)s;
  return 0;
}

char*
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
  return buf;
}

int
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
  close(fd);
  return r;
}

int
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    n = n*10 + *s++ - '0';
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
{
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    *dst++ = *src++;
  return vdst;
}

int
thread_create(void (*fn)(void *), void *arg)
{
  void *mem = malloc(4096 * 2);
  if(mem == 0)
    return -1;
  
  char *p = (char *)mem;
  while ((uint)p % 4096 != 0) {
    p++;
  }

  void *stack = (void *)p;
  // Check for page alignment.
  if(((uint)stack % 4096) != 0){
    printf(1, "LOLOLOL %p\n", fn);
    free(stack);
    return -1;
  }
  
  int tid = clone(stack);
  if(tid < 0){
    free(stack);
    return -1;
  }
  

  if(tid == 0){
    printf(1, "Entering thread function at %p\n", fn);

    // In the child thread: call the thread function.
    fn(arg);
    // When the thread function returns, free the stack and exit.
    free(stack);
    exit();
  }
  
  // Parent returns the new thread's id.
  return tid;
}

int
thread_join(void)
{
  return join();
}
