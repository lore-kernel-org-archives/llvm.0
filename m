Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD609FBF5
	for <llvm@lists.linux.dev>; Thu, 16 Nov 2023 07:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOATWYZS"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-280137f1a1bso365734a91.1
        for <llvm@lists.linux.dev>; Wed, 15 Nov 2023 23:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700121226; x=1700726026; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s2rueceyLKuf+oIfLtz1hogPF/8hc+TFDvA2ySUUX4c=;
        b=mOATWYZSytt4QQRX0I07aURSrEOaUES/ViUTrHCjLWMwm3X+hlXRK9W27I0Zf5gyH2
         gB0lJt5Pqr7dLYb2mgQ9x/4gAAKoJKSS8sVaE20ZlqBcYVEJZ3tUm77Src8y3/uZTjbn
         gI1pdlBvZDhBQqfT4Wn51r2hqZC/NOZomca0ZyrRs4zCYahbvKIbmRvmbepFkK+3tNyw
         qGXJ7u7ymaVI54dWR+W4hXvOOIAFdIRCB9pJd9T9TrgcojFV/X9VygBk+EftSqDE65hl
         IR+I3Ttl3K3Pw31ysHlUfGF15lTpzexHznJhVF8VG93koJat4cazcmLePV7v7BNZZf4a
         vQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700121226; x=1700726026;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s2rueceyLKuf+oIfLtz1hogPF/8hc+TFDvA2ySUUX4c=;
        b=EFZRmljIWyCYvNcCCCZtXSq1rHoGkkCGHUpfybGWS5sEYJpv/c5fjQbpKwMjAY9rsh
         Xq+Ow1hudmcaZanAJotclwwinxvN8jMreGMJGDeb3T0ALPV14Aq28nodeHKYPSD752eF
         BQq39n05cjyCFlENfjYdwyDC3z0Djcr08hd/vnL60KKDo1QCMudiXB8aZo/TcrHaht9J
         nZO3QFzts1LZb0HV6vvVkvaAa0K0KAJUJK9Yv4KD6hMOpAZ9oF+ubC2uIr3EAvanPJeu
         U0TvHQCcsZx8qx4MIY9uFbtkC7IhAhad1atzCBhQd5jtk4Qv4LhqSGLaKElfMdF7oW/G
         pxNQ==
X-Gm-Message-State: AOJu0Yxl6hIQrm+CAF7ZsphN7Yu5WCqDQcf9NSGKvqwDnFCiQ9ACQW3R
	laVKtNhBbU26qKf88W/wHNwqi6zosu5fe2MexUY=
X-Google-Smtp-Source: AGHT+IEr9zRV0jk9gJP+6/gBrgMhl+1zgVChybGkPF7tpOrpXAmzGMINvL8eGj2X+ehqDKop68emVbn3BuR/id3mfjw=
X-Received: by 2002:a17:90b:3908:b0:27f:bd9e:5a15 with SMTP id
 ob8-20020a17090b390800b0027fbd9e5a15mr14657711pjb.28.1700121225739; Wed, 15
 Nov 2023 23:53:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: xingwei lee <xrivendell7@gmail.com>
Date: Thu, 16 Nov 2023 15:53:34 +0800
Message-ID: <CABOYnLzpDMPd3fJhi38N_jcQS6ZSa8RNik5j_APKQYNk0kJRkw@mail.gmail.com>
Subject: Re: [syzbot] [mm?] general protection fault in hugetlb_vma_lock_read
To: syzbot+93e7c679006f0d4e6105@syzkaller.appspotmail.com
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, mike.kravetz@oracle.com, 
	muchun.song@linux.dev, Nathan Chancellor <nathan@kernel.org>, ndesaulniers@google.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: multipart/mixed; boundary="000000000000bc64d6060a4051be"

--000000000000bc64d6060a4051be
Content-Type: multipart/alternative; boundary="000000000000bc64d1060a4051bc"

--000000000000bc64d1060a4051bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, since I found there is no reproduce from then to now. I try to
reproduce this bug to generate repro.c.
Maybe this bug is the same bug as [syzbot] [mm?] general protection fault
in hugetlb_vma_lock_write I guess...
But no matter what, with the reproduce.c, we can quickly fix this bug or
check the correctness of our fix.

#define _GNU_SOURCE

#include <dirent.h>
#include <endian.h>
#include <errno.h>
#include <fcntl.h>
#include <sched.h>
#include <signal.h>
#include <stdarg.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/prctl.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <time.h>
#include <unistd.h>

#ifndef __NR_memfd_create
#define __NR_memfd_create 319
#endif

static void sleep_ms(uint64_t ms)
{
    usleep(ms * 1000);
}

static uint64_t current_time_ms(void)
{
    struct timespec ts;
    if (clock_gettime(CLOCK_MONOTONIC, &ts))
    exit(1);
    return (uint64_t)ts.tv_sec * 1000 + (uint64_t)ts.tv_nsec / 1000000;
}

static bool write_file(const char* file, const char* what, ...)
{
    char buf[1024];
    va_list args;
    va_start(args, what);
    vsnprintf(buf, sizeof(buf), what, args);
    va_end(args);
    buf[sizeof(buf) - 1] =3D 0;
    int len =3D strlen(buf);
    int fd =3D open(file, O_WRONLY | O_CLOEXEC);
    if (fd =3D=3D -1)
        return false;
    if (write(fd, buf, len) !=3D len) {
        int err =3D errno;
        close(fd);
        errno =3D err;
        return false;
    }
    close(fd);
    return true;
}

static void kill_and_wait(int pid, int* status)
{
    kill(-pid, SIGKILL);
    kill(pid, SIGKILL);
    for (int i =3D 0; i < 100; i++) {
        if (waitpid(-1, status, WNOHANG | __WALL) =3D=3D pid)
            return;
        usleep(1000);
    }
    DIR* dir =3D opendir("/sys/fs/fuse/connections");
    if (dir) {
        for (;;) {
            struct dirent* ent =3D readdir(dir);
            if (!ent)
                break;
            if (strcmp(ent->d_name, ".") =3D=3D 0 || strcmp(ent->d_name, ".=
.")
=3D=3D 0)
                continue;
            char abort[300];
            snprintf(abort, sizeof(abort),
"/sys/fs/fuse/connections/%s/abort", ent->d_name);
            int fd =3D open(abort, O_WRONLY);
            if (fd =3D=3D -1) {
                continue;
            }
            if (write(fd, abort, 1) < 0) {
            }
            close(fd);
        }
        closedir(dir);
    } else {
    }
    while (waitpid(-1, status, __WALL) !=3D pid) {
    }
}

static void setup_test()
{
    prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);
    setpgrp();
    write_file("/proc/self/oom_score_adj", "1000");
}

#define USLEEP_FORKED_CHILD (3 * 50 *1000)

static long handle_clone_ret(long ret)
{
    if (ret !=3D 0) {
        return ret;
    }
    usleep(USLEEP_FORKED_CHILD);
    syscall(__NR_exit, 0);
    while (1) {
    }
}

static long syz_clone(volatile long flags, volatile long stack, volatile
long stack_len,
              volatile long ptid, volatile long ctid, volatile long tls)
{
    long sp =3D (stack + stack_len) & ~15;
    long ret =3D (long)syscall(__NR_clone, flags & ~CLONE_VM, sp, ptid, cti=
d,
tls);
    return handle_clone_ret(ret);
}

static void execute_one(void);

#define WAIT_FLAGS __WALL

static void loop(void)
{
    int iter =3D 0;
    for (;; iter++) {
        int pid =3D fork();
        if (pid < 0)
    exit(1);
        if (pid =3D=3D 0) {
            setup_test();
            execute_one();
            exit(0);
        }
        int status =3D 0;
        uint64_t start =3D current_time_ms();
        for (;;) {
            if (waitpid(-1, &status, WNOHANG | WAIT_FLAGS) =3D=3D pid)
                break;
            sleep_ms(1);
            if (current_time_ms() - start < 5000)
                continue;
            kill_and_wait(pid, &status);
            break;
        }
    }
}

uint64_t r[2] =3D {0xffffffffffffffff, 0x0};

void execute_one(void)
{
        intptr_t res =3D 0;
memcpy((void*)0x20000800,
"\001\375\256.+\246\214\266?2\0319\224S,|x?Ue[\275\341!\0033\274\'#\377\027=
\233%\363[d
\227\365G\227A\302\330\360Uq\346+\245l\224\v\266\a\027\\\373\004!\344\304\2=
61\262\034\377C;\224Q\r\266}\234\354C\v\317\353\344\232R\345,\202\003\000\0=
31\215\350\306\271\344\264\231\212\031P\270\214x\b\231\004R\005\257\242\352=
5\f\314\032\233\000Uf\245\367\200Tgi\264\300\346\264\357\250i\330\242\322(\=
230\233A\217\023\353\364b/\357!\217\366]-\351k\2662\211gEv\023\364\307\262\=
365\\\027\220\265\246\250\270o\017\342
\347\234$\327\362@\367cdv[\t\000\215\363\3141\r$\036\377\360P\262\227\270\2=
74\353\221\207\213u\277\324\'\377\037\f\0016\235Q\356T\350\bY\000\262\006\2=
46\276l\233.o\276\200\235x\325O\326h\\I\311\215\a\035\311\017\202\333s\307\=
203L\236\242\321\263\254\215\330\264\264\352\220Q\330\307\353%\213Op\032b\2=
26\317\273\025\317\374N\355\000\000\000\000\000\000\000\000\000\000\000\000=
\000s\257\242\024]p+\226\036i|n\332\356\\\256\226*\202*\270j\332\252\024\03=
7\035\370\370\256\374H\304\263j\350\317O\357\016\257e\265*\211\030\262w\226=
\b\033y\352T\335\263g6\274\205\262Y\314v\006\000\000\000\305e\220\3051\237\=
v_#
\b\245\274P,|\351\326s\037\037\276\323\200\261\250
\316|df\2203\v\002\352.\003X\265\344,8\267\255EI\334A\247\314\327\371n\033\=
225\370\021Z\346:\003\316\376\002\214tdy~_oC\236\357\360\242K\351;\216:\001=
\003C\222\353\026\000\000\000\000\314Uxhg\377\344\a\203\246z\377\001\235
o_{!O\252jU\204
\351\2659r\234w\030Z\323\315\016\272\\\333\360\341\206\340\037\373\322\247\=
2040\216\n\275^\005\300\316uC}\250\307\255\206\327\025&\271]1\005J\226\360\=
204\301\f\246p\226\270\002\023pA\031\tf\022\210\310\234\311Cn\324\2447V\'+\=
314\277\r\251\020\035\317\353Klb\345:\000\000\000\000\000\000\000\000\000\0=
00\000\000\000\000\000G\337\273\300_\231F\364n]\024\274\315\323\237\237e\30=
5\346\350Mb\306\202\202\314\312Xe\341\242\252\002\206\270\030\342C\353\251\=
027&\001&\'w\241t0\200\360\223\200\237\233\340\237\352\271\236D]#V\332\222\=
312\306\372.\326\3431\376\350\002\353X\220@\352\224\237a/\242-E\337\030yoSY=
ua\031\357\363I\001\361\266\222gl7\361\035\027\027\361\313\217]\351Z\263q\3=
65N\207\326q\300\320\213\273+\205\v\335n2lV\260]\254T\2636J\352\324\236\357=
L^
\301\364\374\000\000\000\000\000\000\000\000\000\000\000", 746);
    res =3D syscall(__NR_memfd_create, /*name=3D*/0x20000800ul, /*flags=3D*=
/5ul);
    if (res !=3D -1)
        r[0] =3D res;
    syscall(__NR_mmap, /*addr=3D*/0x20000000ul, /*len=3D*/0x4000ul,
/*prot=3D*/0xeul, /*flags=3D*/0x12ul, /*fd=3D*/r[0], /*offset=3D*/0ul);
    syscall(__NR_socketpair, /*domain=3D*/2ul, /*type=3D*/2ul, /*proto=3D*/=
0,
/*fds=3D*/0x200008c0ul);
    res =3D -1;
res =3D syz_clone(/*flags=3D*/0, /*stack=3D*/0, /*stack_len=3D*/0, /*parent=
id=3D*/0,
/*childtid=3D*/0, /*tls=3D*/0);
    if (res !=3D -1)
        r[1] =3D res;
*(uint64_t*)0x20000f80 =3D 0;
*(uint64_t*)0x20000f88 =3D 0;
    syscall(__NR_process_vm_writev, /*pid=3D*/r[1], /*loc_vec=3D*/0ul,
/*loc_vlen=3D*/0ul, /*rem_vec=3D*/0x20000f80ul, /*rem_vlen=3D*/1ul,
/*flags=3D*/0ul);

}
int main(void)
{
        syscall(__NR_mmap, /*addr=3D*/0x1ffff000ul, /*len=3D*/0x1000ul,
/*prot=3D*/0ul, /*flags=3D*/0x32ul, /*fd=3D*/-1, /*offset=3D*/0ul);
    syscall(__NR_mmap, /*addr=3D*/0x20000000ul, /*len=3D*/0x1000000ul,
/*prot=3D*/7ul, /*flags=3D*/0x32ul, /*fd=3D*/-1, /*offset=3D*/0ul);
    syscall(__NR_mmap, /*addr=3D*/0x21000000ul, /*len=3D*/0x1000ul,
/*prot=3D*/0ul, /*flags=3D*/0x32ul, /*fd=3D*/-1, /*offset=3D*/0ul);
            loop();
    return 0;

}

--000000000000bc64d1060a4051bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, since I found there is no reproduce from then to no=
w. I try to reproduce this bug to generate repro.c.<br>
Maybe this bug is the same bug as [syzbot] [mm?] general protection fault i=
n hugetlb_vma_lock_write I guess...<br>
But no matter what, with the reproduce.c, we can quickly fix this bug or ch=
eck the correctness of our fix.<br>
<br>
#define _GNU_SOURCE<br>
<br>
#include &lt;dirent.h&gt;<br>
#include &lt;endian.h&gt;<br>
#include &lt;errno.h&gt;<br>
#include &lt;fcntl.h&gt;<br>
#include &lt;sched.h&gt;<br>
#include &lt;signal.h&gt;<br>
#include &lt;stdarg.h&gt;<br>
#include &lt;stdbool.h&gt;<br>
#include &lt;stdint.h&gt;<br>
#include &lt;stdio.h&gt;<br>
#include &lt;stdlib.h&gt;<br>
#include &lt;string.h&gt;<br>
#include &lt;sys/prctl.h&gt;<br>
#include &lt;sys/stat.h&gt;<br>
#include &lt;sys/syscall.h&gt;<br>
#include &lt;sys/types.h&gt;<br>
#include &lt;sys/wait.h&gt;<br>
#include &lt;time.h&gt;<br>
#include &lt;unistd.h&gt;<br>
<br>
#ifndef __NR_memfd_create<br>
#define __NR_memfd_create 319<br>
#endif<br>
<br>
static void sleep_ms(uint64_t ms)<br>
{<br>
=C2=A0=C2=A0=C2=A0 usleep(ms * 1000);<br>
}<br>
<br>
static uint64_t current_time_ms(void)<br>
{<br>
=C2=A0=C2=A0=C2=A0 struct timespec ts;<br>
=C2=A0=C2=A0=C2=A0 if (clock_gettime(CLOCK_MONOTONIC, &amp;ts))<br>
=C2=A0=C2=A0=C2=A0 exit(1);<br>
=C2=A0=C2=A0=C2=A0 return (uint64_t)ts.tv_sec * 1000 + (uint64_t)ts.tv_nsec=
 / 1000000;<br>
}<br>
<br>
static bool write_file(const char* file, const char* what, ...)<br>
{<br>
=C2=A0=C2=A0=C2=A0 char buf[1024];<br>
=C2=A0=C2=A0=C2=A0 va_list args;<br>
=C2=A0=C2=A0=C2=A0 va_start(args, what);<br>
=C2=A0=C2=A0=C2=A0 vsnprintf(buf, sizeof(buf), what, args);<br>
=C2=A0=C2=A0=C2=A0 va_end(args);<br>
=C2=A0=C2=A0=C2=A0 buf[sizeof(buf) - 1] =3D 0;<br>
=C2=A0=C2=A0=C2=A0 int len =3D strlen(buf);<br>
=C2=A0=C2=A0=C2=A0 int fd =3D open(file, O_WRONLY | O_CLOEXEC);<br>
=C2=A0=C2=A0=C2=A0 if (fd =3D=3D -1)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;<br>
=C2=A0=C2=A0=C2=A0 if (write(fd, buf, len) !=3D len) {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err =3D errno;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 close(fd);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D err;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;<br>
=C2=A0=C2=A0=C2=A0 }<br>
=C2=A0=C2=A0=C2=A0 close(fd);<br>
=C2=A0=C2=A0=C2=A0 return true;<br>
}<br>
<br>
static void kill_and_wait(int pid, int* status)<br>
{<br>
=C2=A0=C2=A0=C2=A0 kill(-pid, SIGKILL);<br>
=C2=A0=C2=A0=C2=A0 kill(pid, SIGKILL);<br>
=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i &lt; 100; i++) {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (waitpid(-1, status, WNOHANG =
| __WALL) =3D=3D pid)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;<=
br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usleep(1000);<br>
=C2=A0=C2=A0=C2=A0 }<br>
=C2=A0=C2=A0=C2=A0 DIR* dir =3D opendir(&quot;/sys/fs/fuse/connections&quot=
;);<br>
=C2=A0=C2=A0=C2=A0 if (dir) {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (;;) {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct d=
irent* ent =3D readdir(dir);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ent=
)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 break;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strc=
mp(ent-&gt;d_name, &quot;.&quot;) =3D=3D 0 || strcmp(ent-&gt;d_name, &quot;=
..&quot;) =3D=3D 0)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 continue;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char abo=
rt[300];<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 snprintf=
(abort, sizeof(abort), &quot;/sys/fs/fuse/connections/%s/abort&quot;, ent-&=
gt;d_name);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int fd =
=3D open(abort, O_WRONLY);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (fd =
=3D=3D -1) {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 continue;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (writ=
e(fd, abort, 1) &lt; 0) {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 close(fd=
);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 closedir(dir);<br>
=C2=A0=C2=A0=C2=A0 } else {<br>
=C2=A0=C2=A0=C2=A0 }<br>
=C2=A0=C2=A0=C2=A0 while (waitpid(-1, status, __WALL) !=3D pid) {<br>
=C2=A0=C2=A0=C2=A0 }<br>
}<br>
<br>
static void setup_test()<br>
{<br>
=C2=A0=C2=A0=C2=A0 prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);<br>
=C2=A0=C2=A0=C2=A0 setpgrp();<br>
=C2=A0=C2=A0=C2=A0 write_file(&quot;/proc/self/oom_score_adj&quot;, &quot;1=
000&quot;);<br>
}<br>
<br>
#define USLEEP_FORKED_CHILD (3 * 50 *1000)<br>
<br>
static long handle_clone_ret(long ret)<br>
{<br>
=C2=A0=C2=A0=C2=A0 if (ret !=3D 0) {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;<br>
=C2=A0=C2=A0=C2=A0 }<br>
=C2=A0=C2=A0=C2=A0 usleep(USLEEP_FORKED_CHILD);<br>
=C2=A0=C2=A0=C2=A0 syscall(__NR_exit, 0);<br>
=C2=A0=C2=A0=C2=A0 while (1) {<br>
=C2=A0=C2=A0=C2=A0 }<br>
}<br>
<br>
static long syz_clone(volatile long flags, volatile long stack, volatile lo=
ng stack_len,<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 volatile long ptid, volatile long ctid, volatile long tls)<br>
{<br>
=C2=A0=C2=A0=C2=A0 long sp =3D (stack + stack_len) &amp; ~15;<br>
=C2=A0=C2=A0=C2=A0 long ret =3D (long)syscall(__NR_clone, flags &amp; ~CLON=
E_VM, sp, ptid, ctid, tls);<br>
=C2=A0=C2=A0=C2=A0 return handle_clone_ret(ret);<br>
}<br>
<br>
static void execute_one(void);<br>
<br>
#define WAIT_FLAGS __WALL<br>
<br>
static void loop(void)<br>
{<br>
=C2=A0=C2=A0=C2=A0 int iter =3D 0;<br>
=C2=A0=C2=A0=C2=A0 for (;; iter++) {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int pid =3D fork();<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pid &lt; 0)<br>
=C2=A0=C2=A0=C2=A0 exit(1);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pid =3D=3D 0) {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 setup_te=
st();<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 execute_=
one();<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exit(0);=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int status =3D 0;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t start =3D current_time_=
ms();<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (;;) {<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (wait=
pid(-1, &amp;status, WNOHANG | WAIT_FLAGS) =3D=3D pid)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 break;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sleep_ms=
(1);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (curr=
ent_time_ms() - start &lt; 5000)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 continue;<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kill_and=
_wait(pid, &amp;status);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<b=
r>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
=C2=A0=C2=A0=C2=A0 }<br>
}<br>
<br>
uint64_t r[2] =3D {0xffffffffffffffff, 0x0};<br>
<br>
void execute_one(void)<br>
{<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 intptr_t res =3D 0;<br>
memcpy((void*)0x20000800,=20
&quot;\001\375\256.+\246\214\266?2\0319\224S,|x?Ue[\275\341!\0033\274\&#39;=
#\377\027\233%\363[d=C2=A0
=20
\227\365G\227A\302\330\360Uq\346+\245l\224\v\266\a\027\\\373\004!\344\304\2=
61\262\034\377C;\224Q\r\266}\234\354C\v\317\353\344\232R\345,\202\003\000\0=
31\215\350\306\271\344\264\231\212\031P\270\214x\b\231\004R\005\257\242\352=
5\f\314\032\233\000Uf\245\367\200Tgi\264\300\346\264\357\250i\330\242\322(\=
230\233A\217\023\353\364b/\357!\217\366]-\351k\2662\211gEv\023\364\307\262\=
365\\\027\220\265\246\250\270o\017\342
=20
\347\234$\327\362@\367cdv[\t\000\215\363\3141\r$\036\377\360P\262\227\270\2=
74\353\221\207\213u\277\324\&#39;\377\037\f\0016\235Q\356T\350\bY\000\262\0=
06\246\276l\233.o\276\200\235x\325O\326h\\I\311\215\a\035\311\017\202\333s\=
307\203L\236\242\321\263\254\215\330\264\264\352\220Q\330\307\353%\213Op\03=
2b\226\317\273\025\317\374N\355\000\000\000\000\000\000\000\000\000\000\000=
\000\000s\257\242\024]p+\226\036i|n\332\356\\\256\226*\202*\270j\332\252\02=
4\037\035\370\370\256\374H\304\263j\350\317O\357\016\257e\265*\211\030\262w=
\226\b\033y\352T\335\263g6\274\205\262Y\314v\006\000\000\000\305e\220\3051\=
237\v_#
 \b\245\274P,|\351\326s\037\037\276\323\200\261\250=20
\316|df\2203\v\002\352.\003X\265\344,8\267\255EI\334A\247\314\327\371n\033\=
225\370\021Z\346:\003\316\376\002\214tdy~_oC\236\357\360\242K\351;\216:\001=
\003C\222\353\026\000\000\000\000\314Uxhg\377\344\a\203\246z\377\001\235
 o_{!O\252jU\204=20
\351\2659r\234w\030Z\323\315\016\272\\\333\360\341\206\340\037\373\322\247\=
2040\216\n\275^\005\300\316uC}\250\307\255\206\327\025&amp;\271]1\005J\226\=
360\204\301\f\246p\226\270\002\023pA\031\tf\022\210\310\234\311Cn\324\2447V=
\&#39;+\314\277\r\251\020\035\317\353Klb\345:\000\000\000\000\000\000\000\0=
00\000\000\000\000\000\000\000G\337\273\300_\231F\364n]\024\274\315\323\237=
\237e\305\346\350Mb\306\202\202\314\312Xe\341\242\252\002\206\270\030\342C\=
353\251\027&amp;\001&amp;\&#39;w\241t0\200\360\223\200\237\233\340\237\352\=
271\236D]#V\332\222\312\306\372.\326\3431\376\350\002\353X\220@\352\224\237=
a/\242-E\337\030yoSYua\031\357\363I\001\361\266\222gl7\361\035\027\027\361\=
313\217]\351Z\263q\365N\207\326q\300\320\213\273+\205\v\335n2lV\260]\254T\2=
636J\352\324\236\357L^
 \301\364\374\000\000\000\000\000\000\000\000\000\000\000&quot;, 746);<br>
=C2=A0=C2=A0=C2=A0 res =3D syscall(__NR_memfd_create, /*name=3D*/0x20000800=
ul, /*flags=3D*/5ul);<br>
=C2=A0=C2=A0=C2=A0 if (res !=3D -1)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r[0] =3D res;<br>
=C2=A0=C2=A0=C2=A0 syscall(__NR_mmap, /*addr=3D*/0x20000000ul, /*len=3D*/0x=
4000ul, /*prot=3D*/0xeul, /*flags=3D*/0x12ul, /*fd=3D*/r[0], /*offset=3D*/0=
ul);<br>
=C2=A0=C2=A0=C2=A0 syscall(__NR_socketpair, /*domain=3D*/2ul, /*type=3D*/2u=
l, /*proto=3D*/0, /*fds=3D*/0x200008c0ul);<br>
=C2=A0=C2=A0=C2=A0 res =3D -1;<br>
res =3D syz_clone(/*flags=3D*/0, /*stack=3D*/0, /*stack_len=3D*/0, /*parent=
id=3D*/0, /*childtid=3D*/0, /*tls=3D*/0);<br>
=C2=A0=C2=A0=C2=A0 if (res !=3D -1)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r[1] =3D res;<br>
*(uint64_t*)0x20000f80 =3D 0;<br>
*(uint64_t*)0x20000f88 =3D 0;<br>
=C2=A0=C2=A0=C2=A0 syscall(__NR_process_vm_writev, /*pid=3D*/r[1], /*loc_ve=
c=3D*/0ul,=20
/*loc_vlen=3D*/0ul, /*rem_vec=3D*/0x20000f80ul, /*rem_vlen=3D*/1ul,=20
/*flags=3D*/0ul);<br>
<br>
}<br>
int main(void)<br>
{<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 syscall(__NR_mmap, /*addr=3D*/0x=
1ffff000ul, /*len=3D*/0x1000ul, /*prot=3D*/0ul, /*flags=3D*/0x32ul, /*fd=3D=
*/-1, /*offset=3D*/0ul);<br>
=C2=A0=C2=A0=C2=A0 syscall(__NR_mmap, /*addr=3D*/0x20000000ul, /*len=3D*/0x=
1000000ul, /*prot=3D*/7ul, /*flags=3D*/0x32ul, /*fd=3D*/-1, /*offset=3D*/0u=
l);<br>
=C2=A0=C2=A0=C2=A0 syscall(__NR_mmap, /*addr=3D*/0x21000000ul, /*len=3D*/0x=
1000ul, /*prot=3D*/0ul, /*flags=3D*/0x32ul, /*fd=3D*/-1, /*offset=3D*/0ul);=
<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loop();<=
br>
=C2=A0=C2=A0=C2=A0 return 0;<br>
<p>}</p>
<br>
<p><br>
</p></div>

--000000000000bc64d1060a4051bc--
--000000000000bc64d6060a4051be
Content-Type: text/plain; charset="US-ASCII"; name="repro.txt"
Content-Disposition: attachment; filename="repro.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_lp0w9v1t0>
X-Attachment-Id: f_lp0w9v1t0

cjAgPSBtZW1mZF9jcmVhdGUoJigweDdmMDAwMDAwMDgwMCk9J1x4MDFceGZkXHhhZS4rXHhhNlx4
OGNceGI2PzJceDE5OVx4OTRTLHx4P1VlW1x4YmRceGUxIVx4MDMzXHhiY1wnI1x4ZmZceDE3XHg5
YiVceGYzW2QgIFx4OTdceGY1R1x4OTdBXHhjMlx4ZDhceGYwVXFceGU2K1x4YTVsXHg5NFx2XHhi
NlxhXHgxN1xcXHhmYlx4MDQhXHhlNFx4YzRceGIxXHhiMlx4MWNceGZmQztceDk0UVxyXHhiNn1c
eDljXHhlY0Ncdlx4Y2ZceGViXHhlNFx4OWFSXHhlNSxceDgyXHgwM1x4MDBceDE5XHg4ZFx4ZThc
eGM2XHhiOVx4ZTRceGI0XHg5OVx4OGFceDE5UFx4YjhceDhjeFxiXHg5OVx4MDRSXHgwNVx4YWZc
eGEyXHhlYTVcZlx4Y2NceDFhXHg5Ylx4MDBVZlx4YTVceGY3XHg4MFRnaVx4YjRceGMwXHhlNlx4
YjRceGVmXHhhOGlceGQ4XHhhMlx4ZDIoXHg5OFx4OWJBXHg4Zlx4MTNceGViXHhmNGIvXHhlZiFc
eDhmXHhmNl0tXHhlOWtceGI2Mlx4ODlnRXZceDEzXHhmNFx4YzdceGIyXHhmNVxcXHgxN1x4OTBc
eGI1XHhhNlx4YThceGI4b1x4MGZceGUyIFx4ZTdceDljJFx4ZDdceGYyQFx4ZjdjZHZbXHRceDAw
XHg4ZFx4ZjNceGNjMVxyJFx4MWVceGZmXHhmMFBceGIyXHg5N1x4YjhceGJjXHhlYlx4OTFceDg3
XHg4YnVceGJmXHhkNFwnXHhmZlx4MWZcZlx4MDE2XHg5ZFFceGVlVFx4ZThcYllceDAwXHhiMlx4
MDZceGE2XHhiZWxceDliLm9ceGJlXHg4MFx4OWR4XHhkNU9ceGQ2aFxcSVx4YzlceDhkXGFceDFk
XHhjOVx4MGZceDgyXHhkYnNceGM3XHg4M0xceDllXHhhMlx4ZDFceGIzXHhhY1x4OGRceGQ4XHhi
NFx4YjRceGVhXHg5MFFceGQ4XHhjN1x4ZWIlXHg4Yk9wXHgxYWJceDk2XHhjZlx4YmJceDE1XHhj
Zlx4ZmNOXHhlZFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgw
MFx4MDBzXHhhZlx4YTJceDE0XXArXHg5Nlx4MWVpfG5ceGRhXHhlZVxcXHhhZVx4OTYqXHg4Mipc
eGI4alx4ZGFceGFhXHgxNFx4MWZceDFkXHhmOFx4ZjhceGFlXHhmY0hceGM0XHhiM2pceGU4XHhj
Zk9ceGVmXHgwZVx4YWZlXHhiNSpceDg5XHgxOFx4YjJ3XHg5NlxiXHgxYnlceGVhVFx4ZGRceGIz
ZzZceGJjXHg4NVx4YjJZXHhjY3ZceDA2XHgwMFx4MDBceDAwXHhjNWVceDkwXHhjNTFceDlmXHZf
IyBcYlx4YTVceGJjUCx8XHhlOVx4ZDZzXHgxZlx4MWZceGJlXHhkM1x4ODBceGIxXHhhOCBceGNl
fGRmXHg5MDNcdlx4MDJceGVhLlx4MDNYXHhiNVx4ZTQsOFx4YjdceGFkRUlceGRjQVx4YTdceGNj
XHhkN1x4ZjluXHgxYlx4OTVceGY4XHgxMVpceGU2Olx4MDNceGNlXHhmZVx4MDJceDhjdGR5fl9v
Q1x4OWVceGVmXHhmMFx4YTJLXHhlOTtceDhlOlx4MDFceDAzQ1x4OTJceGViXHgxNlx4MDBceDAw
XHgwMFx4MDBceGNjVXhoZ1x4ZmZceGU0XGFceDgzXHhhNnpceGZmXHgwMVx4OWQgb197IU9ceGFh
alVceDg0IFx4ZTlceGI1OXJceDljd1x4MThaXHhkM1x4Y2RceDBlXHhiYVxcXHhkYlx4ZjBceGUx
XHg4Nlx4ZTBceDFmXHhmYlx4ZDJceGE3XHg4NDBceDhlXG5ceGJkXlx4MDVceGMwXHhjZXVDfVx4
YThceGM3XHhhZFx4ODZceGQ3XHgxNSZceGI5XTFceDA1Slx4OTZceGYwXHg4NFx4YzFcZlx4YTZw
XHg5Nlx4YjhceDAyXHgxM3BBXHgxOVx0Zlx4MTJceDg4XHhjOFx4OWNceGM5Q25ceGQ0XHhhNDdW
XCcrXHhjY1x4YmZcclx4YTlceDEwXHgxZFx4Y2ZceGViS2xiXHhlNTpceDAwXHgwMFx4MDBceDAw
XHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBceDAwXHgwMFx4MDBHXHhkZlx4YmJceGMw
X1x4OTlGXHhmNG5dXHgxNFx4YmNceGNkXHhkM1x4OWZceDlmZVx4YzVceGU2XHhlOE1iXHhjNlx4
ODJceDgyXHhjY1x4Y2FYZVx4ZTFceGEyXHhhYVx4MDJceDg2XHhiOFx4MThceGUyQ1x4ZWJceGE5
XHgxNyZceDAxJlwnd1x4YTF0MFx4ODBceGYwXHg5M1x4ODBceDlmXHg5Ylx4ZTBceDlmXHhlYVx4
YjlceDllRF0jVlx4ZGFceDkyXHhjYVx4YzZceGZhLlx4ZDZceGUzMVx4ZmVceGU4XHgwMlx4ZWJY
XHg5MEBceGVhXHg5NFx4OWZhL1x4YTItRVx4ZGZceDE4eW9TWXVhXHgxOVx4ZWZceGYzSVx4MDFc
eGYxXHhiNlx4OTJnbDdceGYxXHgxZFx4MTdceDE3XHhmMVx4Y2JceDhmXVx4ZTlaXHhiM3FceGY1
Tlx4ODdceGQ2cVx4YzBceGQwXHg4Ylx4YmIrXHg4NVx2XHhkZG4ybFZceGIwXVx4YWNUXHhiMzZK
XHhlYVx4ZDRceDllXHhlZkxeIFx4YzFceGY0XHhmY1x4MDAnLzc0NiwgMHg1KQptbWFwKCYoMHg3
ZjAwMDAwMDAwMDAvMHg0MDAwKT1uaWwsIDB4NDAwMCwgMHhlLCAweDEyLCByMCwgMHgwKQpzb2Nr
ZXRwYWlyJHVuaXgoMHgyLCAweDIsIDB4MCwgJigweDdmMDAwMDAwMDhjMCkpCnIxID0gc3l6X2Ns
b25lKDB4MCwgMHgwLCAweDAsIDB4MCwgMHgwLCAweDApCnByb2Nlc3Nfdm1fd3JpdGV2KHIxLCAw
eDAsIDB4MCwgJigweDdmMDAwMDAwMGY4MCk9W3sweDB9XSwgMHgxLCAweDApCg==
--000000000000bc64d6060a4051be
Content-Type: application/octet-stream; name="repro.c"
Content-Disposition: attachment; filename="repro.c"
Content-Transfer-Encoding: base64
Content-ID: <f_lp0w9v281>
X-Attachment-Id: f_lp0w9v281

Ly8gYXV0b2dlbmVyYXRlZCBieSBzeXprYWxsZXIgKGh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUv
c3l6a2FsbGVyKQoKI2RlZmluZSBfR05VX1NPVVJDRSAKCiNpbmNsdWRlIDxkaXJlbnQuaD4KI2lu
Y2x1ZGUgPGVuZGlhbi5oPgojaW5jbHVkZSA8ZXJybm8uaD4KI2luY2x1ZGUgPGZjbnRsLmg+CiNp
bmNsdWRlIDxzY2hlZC5oPgojaW5jbHVkZSA8c2lnbmFsLmg+CiNpbmNsdWRlIDxzdGRhcmcuaD4K
I2luY2x1ZGUgPHN0ZGJvb2wuaD4KI2luY2x1ZGUgPHN0ZGludC5oPgojaW5jbHVkZSA8c3RkaW8u
aD4KI2luY2x1ZGUgPHN0ZGxpYi5oPgojaW5jbHVkZSA8c3RyaW5nLmg+CiNpbmNsdWRlIDxzeXMv
cHJjdGwuaD4KI2luY2x1ZGUgPHN5cy9zdGF0Lmg+CiNpbmNsdWRlIDxzeXMvc3lzY2FsbC5oPgoj
aW5jbHVkZSA8c3lzL3R5cGVzLmg+CiNpbmNsdWRlIDxzeXMvd2FpdC5oPgojaW5jbHVkZSA8dGlt
ZS5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CgojaWZuZGVmIF9fTlJfbWVtZmRfY3JlYXRlCiNkZWZp
bmUgX19OUl9tZW1mZF9jcmVhdGUgMzE5CiNlbmRpZgoKc3RhdGljIHZvaWQgc2xlZXBfbXModWlu
dDY0X3QgbXMpCnsKCXVzbGVlcChtcyAqIDEwMDApOwp9CgpzdGF0aWMgdWludDY0X3QgY3VycmVu
dF90aW1lX21zKHZvaWQpCnsKCXN0cnVjdCB0aW1lc3BlYyB0czsKCWlmIChjbG9ja19nZXR0aW1l
KENMT0NLX01PTk9UT05JQywgJnRzKSkKCWV4aXQoMSk7CglyZXR1cm4gKHVpbnQ2NF90KXRzLnR2
X3NlYyAqIDEwMDAgKyAodWludDY0X3QpdHMudHZfbnNlYyAvIDEwMDAwMDA7Cn0KCnN0YXRpYyBi
b29sIHdyaXRlX2ZpbGUoY29uc3QgY2hhciogZmlsZSwgY29uc3QgY2hhciogd2hhdCwgLi4uKQp7
CgljaGFyIGJ1ZlsxMDI0XTsKCXZhX2xpc3QgYXJnczsKCXZhX3N0YXJ0KGFyZ3MsIHdoYXQpOwoJ
dnNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksIHdoYXQsIGFyZ3MpOwoJdmFfZW5kKGFyZ3MpOwoJ
YnVmW3NpemVvZihidWYpIC0gMV0gPSAwOwoJaW50IGxlbiA9IHN0cmxlbihidWYpOwoJaW50IGZk
ID0gb3BlbihmaWxlLCBPX1dST05MWSB8IE9fQ0xPRVhFQyk7CglpZiAoZmQgPT0gLTEpCgkJcmV0
dXJuIGZhbHNlOwoJaWYgKHdyaXRlKGZkLCBidWYsIGxlbikgIT0gbGVuKSB7CgkJaW50IGVyciA9
IGVycm5vOwoJCWNsb3NlKGZkKTsKCQllcnJubyA9IGVycjsKCQlyZXR1cm4gZmFsc2U7Cgl9Cglj
bG9zZShmZCk7CglyZXR1cm4gdHJ1ZTsKfQoKc3RhdGljIHZvaWQga2lsbF9hbmRfd2FpdChpbnQg
cGlkLCBpbnQqIHN0YXR1cykKewoJa2lsbCgtcGlkLCBTSUdLSUxMKTsKCWtpbGwocGlkLCBTSUdL
SUxMKTsKCWZvciAoaW50IGkgPSAwOyBpIDwgMTAwOyBpKyspIHsKCQlpZiAod2FpdHBpZCgtMSwg
c3RhdHVzLCBXTk9IQU5HIHwgX19XQUxMKSA9PSBwaWQpCgkJCXJldHVybjsKCQl1c2xlZXAoMTAw
MCk7Cgl9CglESVIqIGRpciA9IG9wZW5kaXIoIi9zeXMvZnMvZnVzZS9jb25uZWN0aW9ucyIpOwoJ
aWYgKGRpcikgewoJCWZvciAoOzspIHsKCQkJc3RydWN0IGRpcmVudCogZW50ID0gcmVhZGRpcihk
aXIpOwoJCQlpZiAoIWVudCkKCQkJCWJyZWFrOwoJCQlpZiAoc3RyY21wKGVudC0+ZF9uYW1lLCAi
LiIpID09IDAgfHwgc3RyY21wKGVudC0+ZF9uYW1lLCAiLi4iKSA9PSAwKQoJCQkJY29udGludWU7
CgkJCWNoYXIgYWJvcnRbMzAwXTsKCQkJc25wcmludGYoYWJvcnQsIHNpemVvZihhYm9ydCksICIv
c3lzL2ZzL2Z1c2UvY29ubmVjdGlvbnMvJXMvYWJvcnQiLCBlbnQtPmRfbmFtZSk7CgkJCWludCBm
ZCA9IG9wZW4oYWJvcnQsIE9fV1JPTkxZKTsKCQkJaWYgKGZkID09IC0xKSB7CgkJCQljb250aW51
ZTsKCQkJfQoJCQlpZiAod3JpdGUoZmQsIGFib3J0LCAxKSA8IDApIHsKCQkJfQoJCQljbG9zZShm
ZCk7CgkJfQoJCWNsb3NlZGlyKGRpcik7Cgl9IGVsc2UgewoJfQoJd2hpbGUgKHdhaXRwaWQoLTEs
IHN0YXR1cywgX19XQUxMKSAhPSBwaWQpIHsKCX0KfQoKc3RhdGljIHZvaWQgc2V0dXBfdGVzdCgp
CnsKCXByY3RsKFBSX1NFVF9QREVBVEhTSUcsIFNJR0tJTEwsIDAsIDAsIDApOwoJc2V0cGdycCgp
OwoJd3JpdGVfZmlsZSgiL3Byb2Mvc2VsZi9vb21fc2NvcmVfYWRqIiwgIjEwMDAiKTsKfQoKI2Rl
ZmluZSBVU0xFRVBfRk9SS0VEX0NISUxEICgzICogNTAgKjEwMDApCgpzdGF0aWMgbG9uZyBoYW5k
bGVfY2xvbmVfcmV0KGxvbmcgcmV0KQp7CglpZiAocmV0ICE9IDApIHsKCQlyZXR1cm4gcmV0OwoJ
fQoJdXNsZWVwKFVTTEVFUF9GT1JLRURfQ0hJTEQpOwoJc3lzY2FsbChfX05SX2V4aXQsIDApOwoJ
d2hpbGUgKDEpIHsKCX0KfQoKc3RhdGljIGxvbmcgc3l6X2Nsb25lKHZvbGF0aWxlIGxvbmcgZmxh
Z3MsIHZvbGF0aWxlIGxvbmcgc3RhY2ssIHZvbGF0aWxlIGxvbmcgc3RhY2tfbGVuLAoJCSAgICAg
IHZvbGF0aWxlIGxvbmcgcHRpZCwgdm9sYXRpbGUgbG9uZyBjdGlkLCB2b2xhdGlsZSBsb25nIHRs
cykKewoJbG9uZyBzcCA9IChzdGFjayArIHN0YWNrX2xlbikgJiB+MTU7Cglsb25nIHJldCA9IChs
b25nKXN5c2NhbGwoX19OUl9jbG9uZSwgZmxhZ3MgJiB+Q0xPTkVfVk0sIHNwLCBwdGlkLCBjdGlk
LCB0bHMpOwoJcmV0dXJuIGhhbmRsZV9jbG9uZV9yZXQocmV0KTsKfQoKc3RhdGljIHZvaWQgZXhl
Y3V0ZV9vbmUodm9pZCk7CgojZGVmaW5lIFdBSVRfRkxBR1MgX19XQUxMCgpzdGF0aWMgdm9pZCBs
b29wKHZvaWQpCnsKCWludCBpdGVyID0gMDsKCWZvciAoOzsgaXRlcisrKSB7CgkJaW50IHBpZCA9
IGZvcmsoKTsKCQlpZiAocGlkIDwgMCkKCWV4aXQoMSk7CgkJaWYgKHBpZCA9PSAwKSB7CgkJCXNl
dHVwX3Rlc3QoKTsKCQkJZXhlY3V0ZV9vbmUoKTsKCQkJZXhpdCgwKTsKCQl9CgkJaW50IHN0YXR1
cyA9IDA7CgkJdWludDY0X3Qgc3RhcnQgPSBjdXJyZW50X3RpbWVfbXMoKTsKCQlmb3IgKDs7KSB7
CgkJCWlmICh3YWl0cGlkKC0xLCAmc3RhdHVzLCBXTk9IQU5HIHwgV0FJVF9GTEFHUykgPT0gcGlk
KQoJCQkJYnJlYWs7CgkJCXNsZWVwX21zKDEpOwoJCQlpZiAoY3VycmVudF90aW1lX21zKCkgLSBz
dGFydCA8IDUwMDApCgkJCQljb250aW51ZTsKCQkJa2lsbF9hbmRfd2FpdChwaWQsICZzdGF0dXMp
OwoJCQlicmVhazsKCQl9Cgl9Cn0KCnVpbnQ2NF90IHJbMl0gPSB7MHhmZmZmZmZmZmZmZmZmZmZm
LCAweDB9OwoKdm9pZCBleGVjdXRlX29uZSh2b2lkKQp7CgkJaW50cHRyX3QgcmVzID0gMDsKbWVt
Y3B5KCh2b2lkKikweDIwMDAwODAwLCAiXDAwMVwzNzVcMjU2LitcMjQ2XDIxNFwyNjY/MlwwMzE5
XDIyNFMsfHg/VWVbXDI3NVwzNDEhXDAwMzNcMjc0XCcjXDM3N1wwMjdcMjMzJVwzNjNbZCAgXDIy
N1wzNjVHXDIyN0FcMzAyXDMzMFwzNjBVcVwzNDYrXDI0NWxcMjI0XHZcMjY2XGFcMDI3XFxcMzcz
XDAwNCFcMzQ0XDMwNFwyNjFcMjYyXDAzNFwzNzdDO1wyMjRRXHJcMjY2fVwyMzRcMzU0Q1x2XDMx
N1wzNTNcMzQ0XDIzMlJcMzQ1LFwyMDJcMDAzXDAwMFwwMzFcMjE1XDM1MFwzMDZcMjcxXDM0NFwy
NjRcMjMxXDIxMlwwMzFQXDI3MFwyMTR4XGJcMjMxXDAwNFJcMDA1XDI1N1wyNDJcMzUyNVxmXDMx
NFwwMzJcMjMzXDAwMFVmXDI0NVwzNjdcMjAwVGdpXDI2NFwzMDBcMzQ2XDI2NFwzNTdcMjUwaVwz
MzBcMjQyXDMyMihcMjMwXDIzM0FcMjE3XDAyM1wzNTNcMzY0Yi9cMzU3IVwyMTdcMzY2XS1cMzUx
a1wyNjYyXDIxMWdFdlwwMjNcMzY0XDMwN1wyNjJcMzY1XFxcMDI3XDIyMFwyNjVcMjQ2XDI1MFwy
NzBvXDAxN1wzNDIgXDM0N1wyMzQkXDMyN1wzNjJAXDM2N2NkdltcdFwwMDBcMjE1XDM2M1wzMTQx
XHIkXDAzNlwzNzdcMzYwUFwyNjJcMjI3XDI3MFwyNzRcMzUzXDIyMVwyMDdcMjEzdVwyNzdcMzI0
XCdcMzc3XDAzN1xmXDAwMTZcMjM1UVwzNTZUXDM1MFxiWVwwMDBcMjYyXDAwNlwyNDZcMjc2bFwy
MzMub1wyNzZcMjAwXDIzNXhcMzI1T1wzMjZoXFxJXDMxMVwyMTVcYVwwMzVcMzExXDAxN1wyMDJc
MzMzc1wzMDdcMjAzTFwyMzZcMjQyXDMyMVwyNjNcMjU0XDIxNVwzMzBcMjY0XDI2NFwzNTJcMjIw
UVwzMzBcMzA3XDM1MyVcMjEzT3BcMDMyYlwyMjZcMzE3XDI3M1wwMjVcMzE3XDM3NE5cMzU1XDAw
MFwwMDBcMDAwXDAwMFwwMDBcMDAwXDAwMFwwMDBcMDAwXDAwMFwwMDBcMDAwXDAwMHNcMjU3XDI0
MlwwMjRdcCtcMjI2XDAzNml8blwzMzJcMzU2XFxcMjU2XDIyNipcMjAyKlwyNzBqXDMzMlwyNTJc
MDI0XDAzN1wwMzVcMzcwXDM3MFwyNTZcMzc0SFwzMDRcMjYzalwzNTBcMzE3T1wzNTdcMDE2XDI1
N2VcMjY1KlwyMTFcMDMwXDI2MndcMjI2XGJcMDMzeVwzNTJUXDMzNVwyNjNnNlwyNzRcMjA1XDI2
MllcMzE0dlwwMDZcMDAwXDAwMFwwMDBcMzA1ZVwyMjBcMzA1MVwyMzdcdl8jIFxiXDI0NVwyNzRQ
LHxcMzUxXDMyNnNcMDM3XDAzN1wyNzZcMzIzXDIwMFwyNjFcMjUwIFwzMTZ8ZGZcMjIwM1x2XDAw
MlwzNTIuXDAwM1hcMjY1XDM0NCw4XDI2N1wyNTVFSVwzMzRBXDI0N1wzMTRcMzI3XDM3MW5cMDMz
XDIyNVwzNzBcMDIxWlwzNDY6XDAwM1wzMTZcMzc2XDAwMlwyMTR0ZHl+X29DXDIzNlwzNTdcMzYw
XDI0MktcMzUxO1wyMTY6XDAwMVwwMDNDXDIyMlwzNTNcMDI2XDAwMFwwMDBcMDAwXDAwMFwzMTRV
eGhnXDM3N1wzNDRcYVwyMDNcMjQ2elwzNzdcMDAxXDIzNSBvX3shT1wyNTJqVVwyMDQgXDM1MVwy
NjU5clwyMzR3XDAzMFpcMzIzXDMxNVwwMTZcMjcyXFxcMzMzXDM2MFwzNDFcMjA2XDM0MFwwMzdc
MzczXDMyMlwyNDdcMjA0MFwyMTZcblwyNzVeXDAwNVwzMDBcMzE2dUN9XDI1MFwzMDdcMjU1XDIw
NlwzMjdcMDI1JlwyNzFdMVwwMDVKXDIyNlwzNjBcMjA0XDMwMVxmXDI0NnBcMjI2XDI3MFwwMDJc
MDIzcEFcMDMxXHRmXDAyMlwyMTBcMzEwXDIzNFwzMTFDblwzMjRcMjQ0N1ZcJytcMzE0XDI3N1xy
XDI1MVwwMjBcMDM1XDMxN1wzNTNLbGJcMzQ1OlwwMDBcMDAwXDAwMFwwMDBcMDAwXDAwMFwwMDBc
MDAwXDAwMFwwMDBcMDAwXDAwMFwwMDBcMDAwXDAwMEdcMzM3XDI3M1wzMDBfXDIzMUZcMzY0bl1c
MDI0XDI3NFwzMTVcMzIzXDIzN1wyMzdlXDMwNVwzNDZcMzUwTWJcMzA2XDIwMlwyMDJcMzE0XDMx
MlhlXDM0MVwyNDJcMjUyXDAwMlwyMDZcMjcwXDAzMFwzNDJDXDM1M1wyNTFcMDI3JlwwMDEmXCd3
XDI0MXQwXDIwMFwzNjBcMjIzXDIwMFwyMzdcMjMzXDM0MFwyMzdcMzUyXDI3MVwyMzZEXSNWXDMz
MlwyMjJcMzEyXDMwNlwzNzIuXDMyNlwzNDMxXDM3NlwzNTBcMDAyXDM1M1hcMjIwQFwzNTJcMjI0
XDIzN2EvXDI0Mi1FXDMzN1wwMzB5b1NZdWFcMDMxXDM1N1wzNjNJXDAwMVwzNjFcMjY2XDIyMmds
N1wzNjFcMDM1XDAyN1wwMjdcMzYxXDMxM1wyMTddXDM1MVpcMjYzcVwzNjVOXDIwN1wzMjZxXDMw
MFwzMjBcMjEzXDI3MytcMjA1XHZcMzM1bjJsVlwyNjBdXDI1NFRcMjYzNkpcMzUyXDMyNFwyMzZc
MzU3TF4gXDMwMVwzNjRcMzc0XDAwMFwwMDBcMDAwXDAwMFwwMDBcMDAwXDAwMFwwMDBcMDAwXDAw
MFwwMDAiLCA3NDYpOwoJcmVzID0gc3lzY2FsbChfX05SX21lbWZkX2NyZWF0ZSwgLypuYW1lPSov
MHgyMDAwMDgwMHVsLCAvKmZsYWdzPSovNXVsKTsKCWlmIChyZXMgIT0gLTEpCgkJclswXSA9IHJl
czsKCXN5c2NhbGwoX19OUl9tbWFwLCAvKmFkZHI9Ki8weDIwMDAwMDAwdWwsIC8qbGVuPSovMHg0
MDAwdWwsIC8qcHJvdD0qLzB4ZXVsLCAvKmZsYWdzPSovMHgxMnVsLCAvKmZkPSovclswXSwgLypv
ZmZzZXQ9Ki8wdWwpOwoJc3lzY2FsbChfX05SX3NvY2tldHBhaXIsIC8qZG9tYWluPSovMnVsLCAv
KnR5cGU9Ki8ydWwsIC8qcHJvdG89Ki8wLCAvKmZkcz0qLzB4MjAwMDA4YzB1bCk7CglyZXMgPSAt
MTsKcmVzID0gc3l6X2Nsb25lKC8qZmxhZ3M9Ki8wLCAvKnN0YWNrPSovMCwgLypzdGFja19sZW49
Ki8wLCAvKnBhcmVudGlkPSovMCwgLypjaGlsZHRpZD0qLzAsIC8qdGxzPSovMCk7CglpZiAocmVz
ICE9IC0xKQoJCXJbMV0gPSByZXM7CioodWludDY0X3QqKTB4MjAwMDBmODAgPSAwOwoqKHVpbnQ2
NF90KikweDIwMDAwZjg4ID0gMDsKCXN5c2NhbGwoX19OUl9wcm9jZXNzX3ZtX3dyaXRldiwgLypw
aWQ9Ki9yWzFdLCAvKmxvY192ZWM9Ki8wdWwsIC8qbG9jX3ZsZW49Ki8wdWwsIC8qcmVtX3ZlYz0q
LzB4MjAwMDBmODB1bCwgLypyZW1fdmxlbj0qLzF1bCwgLypmbGFncz0qLzB1bCk7Cgp9CmludCBt
YWluKHZvaWQpCnsKCQlzeXNjYWxsKF9fTlJfbW1hcCwgLyphZGRyPSovMHgxZmZmZjAwMHVsLCAv
Kmxlbj0qLzB4MTAwMHVsLCAvKnByb3Q9Ki8wdWwsIC8qZmxhZ3M9Ki8weDMydWwsIC8qZmQ9Ki8t
MSwgLypvZmZzZXQ9Ki8wdWwpOwoJc3lzY2FsbChfX05SX21tYXAsIC8qYWRkcj0qLzB4MjAwMDAw
MDB1bCwgLypsZW49Ki8weDEwMDAwMDB1bCwgLypwcm90PSovN3VsLCAvKmZsYWdzPSovMHgzMnVs
LCAvKmZkPSovLTEsIC8qb2Zmc2V0PSovMHVsKTsKCXN5c2NhbGwoX19OUl9tbWFwLCAvKmFkZHI9
Ki8weDIxMDAwMDAwdWwsIC8qbGVuPSovMHgxMDAwdWwsIC8qcHJvdD0qLzB1bCwgLypmbGFncz0q
LzB4MzJ1bCwgLypmZD0qLy0xLCAvKm9mZnNldD0qLzB1bCk7CgkJCWxvb3AoKTsKCXJldHVybiAw
Owp9Cg==
--000000000000bc64d6060a4051be--
