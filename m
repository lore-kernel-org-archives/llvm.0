Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231052F26
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 08:39:23 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id j5-20020a056e02218500b002de1cf2347bso6576527ila.2
        for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 01:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc;
        bh=LIRrM9Er52tS0cvVvdY5Sbdd6KgSVNZLH72A832Pq5s=;
        b=jAH8jq0eAYH1zPSeRZbKfmCrADvlH50pOi58IQSLM18oZjzEjf2yH4KH1NJ+SIp3ry
         jALcVD0uHrV1W/s5jP76Dyjb+Sgqc+nbNfRsFVM0KGfZA4TRZHUDyGjSwbXFrjWkm3T4
         i3xBKx4cYhDqWiK3w1yWVOIIOJa8rbITP5kNqxy/Ms4sL45R+ItA5cAZ+esNZqPktCTA
         k7JDhgqQHuynXKImlI2BIV9pUgmKVUCP3YeEzP1JRa1D0RySVVTjIBroocCBzLBcV7CT
         UGP5Zd7Y8uze6aPmNucAyl/dYN+/mYdm4OOH/HxZfqHorBY2giDIZTb4QFxeZjeuPj6I
         L/bg==
X-Gm-Message-State: ACgBeo0K/spDe8jLvUK3PmfEbq772IESmlkroOuWG8ypQassqOlPRgn8
	+xGq24xPuap+q+6UPpwoUR3gGAOv5c5r7ZaT1dVR4QjlNN55
X-Google-Smtp-Source: AA6agR5shgoxwqRTco3PC25nkmTsDzI/3TYQ1SSIQwdJv+o5Pi+qaVILR1CWQMOqYebZ9T+1kkGpssIkklEp2o1Uoir5WMFP/4j+
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:14ca:b0:346:a62f:cc9f with SMTP id
 l10-20020a05663814ca00b00346a62fcc9fmr1436694jak.163.1660639162312; Tue, 16
 Aug 2022 01:39:22 -0700 (PDT)
Date: Tue, 16 Aug 2022 01:39:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005eae9a05e657afc9@google.com>
Subject: [syzbot] upstream boot error: general protection fault in dup_fd
From: syzbot <syzbot+0bd8bc660debfdbd190d@syzkaller.appspotmail.com>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4a9350597aff Merge tag 'sound-fix-6.0-rc1' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=169a15dd080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4757943c2b26daff
dashboard link: https://syzkaller.appspot.com/bug?extid=0bd8bc660debfdbd190d
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0bd8bc660debfdbd190d@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xffff0000000001a0: 0000 [#1] PREEMPT SMP KASAN
KASAN: maybe wild-memory-access in range [0xfff8200000000d00-0xfff8200000000d07]
CPU: 1 PID: 46 Comm: kworker/u4:3 Not tainted 5.19.0-syzkaller-14090-g4a9350597aff #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
Workqueue: events_unbound call_usermodehelper_exec_work

RIP: 0010:slab_alloc mm/slub.c:3251 [inline]
RIP: 0010:__kmem_cache_alloc_lru mm/slub.c:3258 [inline]
RIP: 0010:kmem_cache_alloc+0x12d/0x310 mm/slub.c:3268
Code: 84 1c 01 00 00 48 83 78 10 00 0f 84 11 01 00 00 49 8b 3f 40 f6 c7 0f 0f 85 e3 01 00 00 45 84 c0 0f 84 dc 01 00 00 41 8b 47 28 <49> 8b 5c 05 00 48 8d 4a 08 4c 89 e8 65 48 0f c7 0f 0f 94 c0 a8 01
RSP: 0000:ffffc90000b775c8 EFLAGS: 00010202
RAX: 00000000000001a0 RBX: 0000000000000cc0 RCX: 0000000000000000
RDX: 0000000000000b51 RSI: 0000000000000cc0 RDI: 0000000000040a00
RBP: ffffffff81f3d035 R08: dffffc0000000001 R09: fffffbfff1c4ad5e
R10: fffffbfff1c4ad5e R11: 1ffffffff1c4ad5d R12: ffffc90000b77720
R13: ffff000000000000 R14: ffffffff81f3d035 R15: ffff888140006640
FS:  0000000000000000(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000ca8e000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 dup_fd+0x75/0xb90 fs/file.c:324
 copy_files+0xe6/0x200 kernel/fork.c:1623
 copy_process+0x18b6/0x4010 kernel/fork.c:2244
 kernel_clone+0x22f/0x7a0 kernel/fork.c:2673
 user_mode_thread+0x12d/0x190 kernel/fork.c:2742
 call_usermodehelper_exec_work+0x57/0x220 kernel/umh.c:174
 process_one_work+0x81c/0xd10 kernel/workqueue.c:2289
 worker_thread+0xb14/0x1330 kernel/workqueue.c:2436
 kthread+0x266/0x300 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30
 </TASK>
Modules linked in:
----------------
Code disassembly (best guess):
   0:	84 1c 01             	test   %bl,(%rcx,%rax,1)
   3:	00 00                	add    %al,(%rax)
   5:	48 83 78 10 00       	cmpq   $0x0,0x10(%rax)
   a:	0f 84 11 01 00 00    	je     0x121
  10:	49 8b 3f             	mov    (%r15),%rdi
  13:	40 f6 c7 0f          	test   $0xf,%dil
  17:	0f 85 e3 01 00 00    	jne    0x200
  1d:	45 84 c0             	test   %r8b,%r8b
  20:	0f 84 dc 01 00 00    	je     0x202
  26:	41 8b 47 28          	mov    0x28(%r15),%eax
* 2a:	49 8b 5c 05 00       	mov    0x0(%r13,%rax,1),%rbx <-- trapping instruction
  2f:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  33:	4c 89 e8             	mov    %r13,%rax
  36:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
  3b:	0f 94 c0             	sete   %al
  3e:	a8 01                	test   $0x1,%al


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
