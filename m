Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA3B137D
	for <llvm@lists.linux.dev>; Wed,  3 Aug 2022 15:32:33 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id v14-20020a6b5b0e000000b0067bc967a6c0so6976538ioh.5
        for <llvm@lists.linux.dev>; Wed, 03 Aug 2022 08:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc;
        bh=NCQwecGn3xAsWnvGAu1P1ORQUutISsgOm6rWC9dfUm8=;
        b=Y/I78iwkAOaLOCm4w4qNlBTC9JJi5Hpa7C8vKTxSmiHdr9EwYw01FBVxZF2GTcYIu+
         ad23SIZ15bykjIdT6PNbxrSTcdwrpiLBBPfF1vsGhIDqEh4T1j29e4oFjBgZq9mGdfwp
         IsJ/hPXkW2y5NWk1OQ0LJdcL8KIksVHpUiUGOqYbQPi29K1NZPZQl4I7KYsgSZCAlH6T
         UjeZK44KGgxVtY3xC49qmWhmeke3cuu7SeHIF6o1yM5wXPhB3oUUmHOpgTZ8kY+X34Zz
         3Iu51daOHFh6qv8h7/jFOTiA6B+F+MRKs3LTDiRhVPc/3G5xOHQWDdVxmvwMEvL6MOdI
         w66A==
X-Gm-Message-State: AJIora+4YIVfcGInPmasm/+1i9j8xklIHM66vBJwKNYqvdPqsYIeIr38
	cM4A0jNXH52bH0/Afw9JmO/ji6VsoUIYbPiXmDBSjSk/OSzZ
X-Google-Smtp-Source: AGRyM1uylfr03iRWB0jV8Nrfpln7ZEQVnt1BA/lf+cJEAg1cpaxl0KOXF3mAEz66+BbFugtwWpcctxRcrj1S4NShoRABnrdGXwCm
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:6504:0:b0:2dd:8201:fdeb with SMTP id
 z4-20020a926504000000b002dd8201fdebmr10369595ilb.98.1659540752401; Wed, 03
 Aug 2022 08:32:32 -0700 (PDT)
Date: Wed, 03 Aug 2022 08:32:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000098a0105e557f130@google.com>
Subject: [syzbot] WARNING in hugetlb_change_protection
From: syzbot <syzbot+824e71311e757a9689ff@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, mike.kravetz@oracle.com, 
	nathan@kernel.org, ndesaulniers@google.com, songmuchun@bytedance.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e65c6a46df94 Merge tag 'drm-fixes-2022-07-30' of git://ano..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=139cc282080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=26034e6fe0075dad
dashboard link: https://syzkaller.appspot.com/bug?extid=824e71311e757a9689ff
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+824e71311e757a9689ff@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 28745 at include/linux/swapops.h:319 make_pte_marker_entry include/linux/swapops.h:319 [inline]
WARNING: CPU: 1 PID: 28745 at include/linux/swapops.h:319 make_pte_marker include/linux/swapops.h:342 [inline]
WARNING: CPU: 1 PID: 28745 at include/linux/swapops.h:319 hugetlb_change_protection+0xf85/0x1610 mm/hugetlb.c:6392
Modules linked in:
CPU: 1 PID: 28745 Comm: syz-executor.3 Not tainted 5.19.0-rc8-syzkaller-00146-ge65c6a46df94 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
RIP: 0010:make_pte_marker_entry include/linux/swapops.h:319 [inline]
RIP: 0010:make_pte_marker include/linux/swapops.h:342 [inline]
RIP: 0010:hugetlb_change_protection+0xf85/0x1610 mm/hugetlb.c:6392
Code: e8 d0 5a b7 ff 0f b6 94 24 80 00 00 00 48 8b 84 24 98 00 00 00 84 d2 0f 84 ef 02 00 00 49 89 c4 e9 48 fb ff ff e8 ab 5e b7 ff <0f> 0b 48 b9 00 00 00 00 00 fc ff df 48 89 d8 48 c1 e8 03 80 3c 08
RSP: 0018:ffffc90014cc7780 EFLAGS: 00010212
RAX: 000000000000082a RBX: ffff88807750e820 RCX: ffffc90006723000
RDX: 0000000000040000 RSI: ffffffff81c30c25 RDI: 0000000000000007
RBP: ffff888074de5ea0 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000004 R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000004 R15: ffff88801fcc8e00
FS:  0000000000000000(0000) GS:ffff8880b9b00000(0063) knlGS:00000000f7f06b40
CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
CR2: 0000000020000040 CR3: 000000001b84c000 CR4: 00000000003526e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 change_protection+0x96b/0x3ad0 mm/mprotect.c:463
 mwriteprotect_range+0x387/0x5c0 mm/userfaultfd.c:759
 userfaultfd_writeprotect fs/userfaultfd.c:1823 [inline]
 userfaultfd_ioctl+0x438/0x4340 fs/userfaultfd.c:1997
 compat_ptr_ioctl+0x67/0x90 fs/ioctl.c:906
 __do_compat_sys_ioctl+0x1c7/0x290 fs/ioctl.c:968
 do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
 __do_fast_syscall_32+0x65/0xf0 arch/x86/entry/common.c:178
 do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:203
 entry_SYSENTER_compat_after_hwframe+0x70/0x82
RIP: 0023:0xf7f0b549
Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
RSP: 002b:00000000f7f065cc EFLAGS: 00000296 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000c018aa06
RDX: 00000000200000c0 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
----------------
Code disassembly (best guess):
   0:	03 74 c0 01          	add    0x1(%rax,%rax,8),%esi
   4:	10 05 03 74 b8 01    	adc    %al,0x1b87403(%rip)        # 0x1b8740d
   a:	10 06                	adc    %al,(%rsi)
   c:	03 74 b4 01          	add    0x1(%rsp,%rsi,4),%esi
  10:	10 07                	adc    %al,(%rdi)
  12:	03 74 b0 01          	add    0x1(%rax,%rsi,4),%esi
  16:	10 08                	adc    %cl,(%rax)
  18:	03 74 d8 01          	add    0x1(%rax,%rbx,8),%esi
  1c:	00 00                	add    %al,(%rax)
  1e:	00 00                	add    %al,(%rax)
  20:	00 51 52             	add    %dl,0x52(%rcx)
  23:	55                   	push   %rbp
  24:	89 e5                	mov    %esp,%ebp
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
* 2a:	5d                   	pop    %rbp <-- trapping instruction
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	retq
  2e:	90                   	nop
  2f:	90                   	nop
  30:	90                   	nop
  31:	90                   	nop
  32:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  39:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
