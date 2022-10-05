Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF37641
	for <llvm@lists.linux.dev>; Wed,  5 Oct 2022 09:05:42 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id i3-20020a056e020d8300b002f90e6fedcfso12790104ilj.12
        for <llvm@lists.linux.dev>; Wed, 05 Oct 2022 02:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=xBN+RL6NTl49ss1Svzbz5ckv5ktE9zOSPGTKX0ptrCg=;
        b=72NqS5pA7NWich/vbKYukLo1LHxLj/ek9xcG5wM+0TMq/cdxvVMZFIq2IMnqll0yd+
         /M/8bzJ7XXQquSIY5Vo0l5vpi4ExVpB3SWcT7vphNhSgwgRRoJaeCafq8+giV8IfximG
         ZgQS6JmYIbFt+B7vlBqjzmPJCld5sIxKQfie03tyVqYEm0zejl/cPRA6WEG4g1XCK0yN
         uJm8YUfTv9ZCD2JbEUxJePewT0l/rXPK8rDkYmC8glPHE2HcYxhn6hlVxpM9pAUSGS2E
         ZkJ1R7oIt/+s5HEuUMZL0puQnpvGh+odBrV4dqPzN2bDTdzk0Y7aQiHfoaduQbrXng4m
         /l9w==
X-Gm-Message-State: ACrzQf3MfKX7zK9RloOpbMYNYthu7Aw85OWTVeSMGhX8Qz+6Mgvhxje/
	RoNUDQSVqa7AXJozWiu5EeSGri170dzRf32oIf29U34TNspC
X-Google-Smtp-Source: AMsMyM4gAzLgmGMfVcoyPFOqYgNOGSmYc+T4LFG8lYn0p/s3SLxyHhcFx409xeLPDCS5UiCZo1tyeBSORKVcKa93H0uyvBJLkzfI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1bed:b0:2f9:fd4e:e79a with SMTP id
 y13-20020a056e021bed00b002f9fd4ee79amr5401790ilv.133.1664960741527; Wed, 05
 Oct 2022 02:05:41 -0700 (PDT)
Date: Wed, 05 Oct 2022 02:05:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000905ada05ea45e13c@google.com>
Subject: [syzbot] WARNING: nested lock was not taken in ntfs_fill_super
From: syzbot <syzbot+b9bd2bf91ab68a2ab30c@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4fe89d07dcc2 Linux 6.0
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13ce7332880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=48b99eaecc2b324f
dashboard link: https://syzkaller.appspot.com/bug?extid=b9bd2bf91ab68a2ab30c
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ce1d9b74a5e0/disk-4fe89d07.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/06e7c02fa7ba/vmlinux-4fe89d07.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b9bd2bf91ab68a2ab30c@syzkaller.appspotmail.com

==================================
WARNING: Nested lock was not taken
6.0.0-syzkaller #0 Not tainted
----------------------------------
syz-executor.3/23677 is trying to lock:
ffff88803d162070 (&sb->s_type->i_lock_key#36){+.+.}-{2:2}, at: spin_lock include/linux/spinlock.h:349 [inline]
ffff88803d162070 (&sb->s_type->i_lock_key#36){+.+.}-{2:2}, at: _atomic_dec_and_lock+0x9d/0x110 lib/dec_and_lock.c:28

but this task is not holding:
general protection fault, probably for non-canonical address 0xdffffc0000000003: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
CPU: 0 PID: 23677 Comm: syz-executor.3 Not tainted 6.0.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
RIP: 0010:print_lock_nested_lock_not_held kernel/locking/lockdep.c:4885 [inline]
RIP: 0010:__lock_acquire+0x1112/0x1f60 kernel/locking/lockdep.c:5044
Code: 3c 30 00 48 8b 5c 24 70 74 12 48 89 df e8 76 b5 72 00 49 be 00 00 00 00 00 fc ff df 48 8b 1b 48 83 c3 18 48 89 d8 48 c1 e8 03 <42> 80 3c 30 00 74 08 48 89 df e8 4f b5 72 00 48 8b 33 45 31 f6 48
RSP: 0000:ffffc900150af828 EFLAGS: 00010006
RAX: 0000000000000003 RBX: 0000000000000018 RCX: e0bee71cabdf0c00
RDX: ffffc90004761000 RSI: 00000000000170e6 RDI: 00000000000170e7
RBP: ffff88807be705e0 R08: ffffffff816bd38d R09: ffffed1017344f14
R10: ffffed1017344f14 R11: 1ffff11017344f13 R12: ffff88807be70848
R13: 08bc104c6bc4a8e0 R14: dffffc0000000000 R15: ffff88807be70000
FS:  00007f83fbf0f700(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f83fb3b0000 CR3: 000000001cc6f000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5666
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x2a/0x40 kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:349 [inline]
 _atomic_dec_and_lock+0x9d/0x110 lib/dec_and_lock.c:28
 iput+0x85/0x760 fs/inode.c:1766
 ntfs_fill_super+0x3af3/0x42a0 fs/ntfs3/super.c:1190
 get_tree_bdev+0x400/0x620 fs/super.c:1323
 vfs_get_tree+0x88/0x270 fs/super.c:1530
 do_new_mount+0x289/0xad0 fs/namespace.c:3040
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f83fae8bada
Code: 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f83fbf0ef88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 00007f83fae8bada
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f83fbf0efe0
RBP: 00007f83fbf0f020 R08: 00007f83fbf0f020 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000000
R13: 0000000020000100 R14: 00007f83fbf0efe0 R15: 0000000020002180
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:print_lock_nested_lock_not_held kernel/locking/lockdep.c:4885 [inline]
RIP: 0010:__lock_acquire+0x1112/0x1f60 kernel/locking/lockdep.c:5044
Code: 3c 30 00 48 8b 5c 24 70 74 12 48 89 df e8 76 b5 72 00 49 be 00 00 00 00 00 fc ff df 48 8b 1b 48 83 c3 18 48 89 d8 48 c1 e8 03 <42> 80 3c 30 00 74 08 48 89 df e8 4f b5 72 00 48 8b 33 45 31 f6 48
RSP: 0000:ffffc900150af828 EFLAGS: 00010006
RAX: 0000000000000003 RBX: 0000000000000018 RCX: e0bee71cabdf0c00
RDX: ffffc90004761000 RSI: 00000000000170e6 RDI: 00000000000170e7
RBP: ffff88807be705e0 R08: ffffffff816bd38d R09: ffffed1017344f14
R10: ffffed1017344f14 R11: 1ffff11017344f13 R12: ffff88807be70848
R13: 08bc104c6bc4a8e0 R14: dffffc0000000000 R15: ffff88807be70000
FS:  00007f83fbf0f700(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f83fb3b0000 CR3: 000000001cc6f000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	3c 30                	cmp    $0x30,%al
   2:	00 48 8b             	add    %cl,-0x75(%rax)
   5:	5c                   	pop    %rsp
   6:	24 70                	and    $0x70,%al
   8:	74 12                	je     0x1c
   a:	48 89 df             	mov    %rbx,%rdi
   d:	e8 76 b5 72 00       	callq  0x72b588
  12:	49 be 00 00 00 00 00 	movabs $0xdffffc0000000000,%r14
  19:	fc ff df
  1c:	48 8b 1b             	mov    (%rbx),%rbx
  1f:	48 83 c3 18          	add    $0x18,%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	48 89 df             	mov    %rbx,%rdi
  34:	e8 4f b5 72 00       	callq  0x72b588
  39:	48 8b 33             	mov    (%rbx),%rsi
  3c:	45 31 f6             	xor    %r14d,%r14d
  3f:	48                   	rex.W


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
