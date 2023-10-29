Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BA1136C
	for <llvm@lists.linux.dev>; Sun, 29 Oct 2023 09:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-3b2e6189e6aso5171082b6e.3
        for <llvm@lists.linux.dev>; Sun, 29 Oct 2023 02:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698571644; x=1699176444;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qso1XSA0QuRFmH2A3BDg6iJYmbyHJYnTJ3GqpiGhhVY=;
        b=eBBHWDo4Duzh+O26rjSN5/CIQITl4KMh32YnpRuuUhMh+1MNjUfZ8EgfMNBw9oYpGg
         qGZAxzmUI3ErwDxyyyl7bkHrvSxTij3kyasrpZbNG5nGoqPlr9xPh3PQNUViqOVegB/+
         k+Fbr6JfnJm6p5Cb/YZ0ZDnEMou5c3UnBpxGF3R5pRVOS6s1mXoej23rJ1OeoN/SnIXt
         8POgEr7ERAur0ZF7pCoR7zABbNLCwlmAf3SqOPIZ1uaEW3PKV9BurSK5Oazetd6mllC6
         6xBh83ucJSdcCgvRYjkNPSLKeEMHamo2jmTCxqsRPkopEv+H0VzZESI3YlgSbHgCnH7Y
         4ciA==
X-Gm-Message-State: AOJu0YyFOlRfbW6JwGX1HpWLMbtwBVn9rHEtJ9mKU/4bNvk9jMgSjxFh
	BwYM++3c4tRpHdy4UeLXaj3eTJ2OM9f0dqnDd7ErvNEwVR3F
X-Google-Smtp-Source: AGHT+IE9lCHWsammt9dgPZ9adunUKQuAUxXugMdhCkbfofOMd2w737M/NaCdLftBsNVc3oq1yC7NSxERTRoLx2Lie6QaMWuaNMdl
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6870:e993:b0:1ea:1bc1:4084 with SMTP id
 r19-20020a056870e99300b001ea1bc14084mr3465353oao.4.1698571644095; Sun, 29 Oct
 2023 02:27:24 -0700 (PDT)
Date: Sun, 29 Oct 2023 02:27:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000078d1e00608d7878b@google.com>
Subject: [syzbot] [mm?] general protection fault in hugetlb_vma_lock_write
From: syzbot <syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, mike.kravetz@oracle.com, 
	muchun.song@linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	riel@surriel.com, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    888cf78c29e2 Merge tag 'iommu-fix-v6.6-rc7' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10cbee95680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9ee601744db6e780
dashboard link: https://syzkaller.appspot.com/bug?extid=6ada951e7c0f7bc8a71e
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10fa2557680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14285b57680000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ca8ad4106267/disk-888cf78c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/aac2e80e0744/vmlinux-888cf78c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b14533456815/bzImage-888cf78c.xz

The issue was bisected to:

commit bf4916922c60f43efaa329744b3eef539aa6a2b2
Author: Rik van Riel <riel@surriel.com>
Date:   Fri Oct 6 03:59:07 2023 +0000

    hugetlbfs: extend hugetlb_vma_lock to private VMAs

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17d7dab5680000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1437dab5680000
console output: https://syzkaller.appspot.com/x/log.txt?x=1037dab5680000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com
Fixes: bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private VMAs")

general protection fault, probably for non-canonical address 0xdffffc000000001d: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x00000000000000e8-0x00000000000000ef]
CPU: 0 PID: 5048 Comm: syz-executor139 Not tainted 6.6.0-rc7-syzkaller-00142-g888cf78c29e2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/09/2023
RIP: 0010:__lock_acquire+0x109/0x5de0 kernel/locking/lockdep.c:5004
Code: 45 85 c9 0f 84 cc 0e 00 00 44 8b 05 c1 1e 42 0b 45 85 c0 0f 84 be 0d 00 00 48 ba 00 00 00 00 00 fc ff df 4c 89 d1 48 c1 e9 03 <80> 3c 11 00 0f 85 e8 40 00 00 49 81 3a a0 d9 5f 90 0f 84 96 0d 00
RSP: 0018:ffffc90003aa7798 EFLAGS: 00010016

RAX: ffff88807a0b9dc0 RBX: 1ffff92000754f23 RCX: 000000000000001d
RDX: dffffc0000000000 RSI: 0000000000000000 RDI: 00000000000000e8
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
R10: 00000000000000e8 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000280 CR3: 00000000758bf000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 lock_acquire kernel/locking/lockdep.c:5753 [inline]
 lock_acquire+0x1ae/0x510 kernel/locking/lockdep.c:5718
 down_write+0x93/0x200 kernel/locking/rwsem.c:1573
 hugetlb_vma_lock_write mm/hugetlb.c:300 [inline]
 hugetlb_vma_lock_write+0xae/0x100 mm/hugetlb.c:291
 __hugetlb_zap_begin+0x1e9/0x2b0 mm/hugetlb.c:5447
 hugetlb_zap_begin include/linux/hugetlb.h:258 [inline]
 unmap_vmas+0x2f4/0x470 mm/memory.c:1733
 exit_mmap+0x1ad/0xa60 mm/mmap.c:3230
 __mmput+0x12a/0x4d0 kernel/fork.c:1349
 mmput+0x62/0x70 kernel/fork.c:1371
 exit_mm kernel/exit.c:567 [inline]
 do_exit+0x9ad/0x2a20 kernel/exit.c:861
 __do_sys_exit kernel/exit.c:991 [inline]
 __se_sys_exit kernel/exit.c:989 [inline]
 __x64_sys_exit+0x42/0x50 kernel/exit.c:989
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7ff2b7a78ab9
Code: Unable to access opcode bytes at 0x7ff2b7a78a8f.
RSP: 002b:00007fff926ea6b8 EFLAGS: 00000246 ORIG_RAX: 000000000000003c
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007ff2b7a78ab9
RDX: 00007ff2b7ab23f3 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 000000000000cfda R08: 0000000000000000 R09: 0000000000000006
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fff926ea6cc
R13: 431bde82d7b634db R14: 0000000000000001 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__lock_acquire+0x109/0x5de0 kernel/locking/lockdep.c:5004
Code: 45 85 c9 0f 84 cc 0e 00 00 44 8b 05 c1 1e 42 0b 45 85 c0 0f 84 be 0d 00 00 48 ba 00 00 00 00 00 fc ff df 4c 89 d1 48 c1 e9 03 <80> 3c 11 00 0f 85 e8 40 00 00 49 81 3a a0 d9 5f 90 0f 84 96 0d 00
RSP: 0018:ffffc90003aa7798 EFLAGS: 00010016
RAX: ffff88807a0b9dc0 RBX: 1ffff92000754f23 RCX: 000000000000001d
RDX: dffffc0000000000 RSI: 0000000000000000 RDI: 00000000000000e8
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
R10: 00000000000000e8 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000280 CR3: 00000000758bf000 CR4: 0000000000350ef0
----------------
Code disassembly (best guess):
   0:	45 85 c9             	test   %r9d,%r9d
   3:	0f 84 cc 0e 00 00    	je     0xed5
   9:	44 8b 05 c1 1e 42 0b 	mov    0xb421ec1(%rip),%r8d        # 0xb421ed1
  10:	45 85 c0             	test   %r8d,%r8d
  13:	0f 84 be 0d 00 00    	je     0xdd7
  19:	48 ba 00 00 00 00 00 	movabs $0xdffffc0000000000,%rdx
  20:	fc ff df
  23:	4c 89 d1             	mov    %r10,%rcx
  26:	48 c1 e9 03          	shr    $0x3,%rcx
* 2a:	80 3c 11 00          	cmpb   $0x0,(%rcx,%rdx,1) <-- trapping instruction
  2e:	0f 85 e8 40 00 00    	jne    0x411c
  34:	49 81 3a a0 d9 5f 90 	cmpq   $0xffffffff905fd9a0,(%r10)
  3b:	0f                   	.byte 0xf
  3c:	84                   	.byte 0x84
  3d:	96                   	xchg   %eax,%esi
  3e:	0d                   	.byte 0xd


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
