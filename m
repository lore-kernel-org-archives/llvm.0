Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BCF8815
	for <llvm@lists.linux.dev>; Wed,  7 Dec 2022 12:38:39 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id i7-20020a056e021b0700b003033a763270so15361862ilv.19
        for <llvm@lists.linux.dev>; Wed, 07 Dec 2022 04:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=23kvg108WdUEBi1jkJtOMn1GxLSK0QOeDhClLWQhrDc=;
        b=k9y565XAAfSgBS3gIvoo0ZVfTea8p/JMmmC44sLTqDSnQe8jYoMWzfXV5IJ4l3DlPo
         ehsdDvuD6Sc2dzZFK8YsCkUylS+MBo9P7J3x7eoVCYpfPcGZsUhLFLOLhzKDV+iDUQKv
         8RaIUGOfryx333OcZnSOgj1WEpMOoU8dqN/6cg957vTrlrW25QFRa/IbGbhw3kUkKObk
         OF84VtIG0fhSRsveIyNygmwQ1CF8xCPa5/CRhh4lfhpUbvs7PenyOpBVdH3QIbrJO68T
         WueMOxDpf/300f6Qs9rAKW8bBOYYqwPoyWoDdPcE93Q/+6YeOUn7O32Vq8UHVHPjWEd4
         5v1g==
X-Gm-Message-State: ANoB5pkeASyOBXHrWFGpYWbfZY0AJFm5G38xvTqfiN9FIVnvZArbLyKh
	d6TufOqE1GHgFNjQNVJcUd9YYTh9lWIUitiJDcVZrUeLhV+H
X-Google-Smtp-Source: AA0mqf41twhg48KpsMAE0NQ4QHItC5y/QQlwIycOwvpXenOsmWbuSWofdvvtXuWAuXDJOnwyI3X032Yybwe6ZHXo5+ktpXptJYyS
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:8e08:0:b0:302:c028:895b with SMTP id
 c8-20020a928e08000000b00302c028895bmr32291956ild.154.1670416718765; Wed, 07
 Dec 2022 04:38:38 -0800 (PST)
Date: Wed, 07 Dec 2022 04:38:38 -0800
In-Reply-To: <000000000000b64f3d05ed6b41fe@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000026278605ef3c33a8@google.com>
Subject: Re: [syzbot] BUG: spinlock bad magic in writeback_single_inode
From: syzbot <syzbot+7b2e428bac8cb2ca2f49@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    a5541c0811a0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=13612929880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cbd4e584773e9397
dashboard link: https://syzkaller.appspot.com/bug?extid=7b2e428bac8cb2ca2f49
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=152b4c7d880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10609433880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b7702208fb9/disk-a5541c08.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ec0153ec051/vmlinux-a5541c08.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6f8725ad290a/Image-a5541c08.gz.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/5b5a3739150f/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/9c0098779f8d/mount_13.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7b2e428bac8cb2ca2f49@syzkaller.appspotmail.com

loop3: detected capacity change from 0 to 4096
ntfs3: loop3: Different NTFS' sector size (1024) and media sector size (512)
BUG: spinlock bad magic on CPU#1, syz-executor406/12278
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000470
Mem abort info:
  ESR = 0x0000000096000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000006
  CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=0000000111fd4000
[0000000000000470] pgd=0800000112c3a003, p4d=0800000112c3a003, pud=0800000111fb7003, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 PID: 12278 Comm: syz-executor406 Not tainted 6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : task_pid_nr include/linux/sched.h:1568 [inline]
pc : spin_dump kernel/locking/spinlock_debug.c:63 [inline]
pc : spin_bug+0x88/0xec kernel/locking/spinlock_debug.c:77
lr : spin_dump kernel/locking/spinlock_debug.c:60 [inline]
lr : spin_bug+0x68/0xec kernel/locking/spinlock_debug.c:77
sp : ffff800016053940
x29: ffff800016053940 x28: 0000000000000000 x27: 0000000000000a00
x26: 0000000000000010 x25: 0000000000000000 x24: 0000000000000001
x23: 0000000000000001 x22: ffff800016053a60 x21: ffffffffffffff00
x20: ffff80000cc04981 x19: ffff0000cff0ea6f x18: 0000000000000387
x17: ffff80000c0cd83c x16: 0000000000000002 x15: 0000000000000000
x14: 0000000000000000 x13: 205d383732323154 x12: 5b5d303535323234
x11: ff808000081c4d64 x10: 0000000000000000 x9 : 35577adde7ee3200
x8 : ffffffffffffff01 x7 : 545b5d3035353232 x6 : ffff80000c091ebc
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 00000000ad4ead00 x1 : 0000000000000001 x0 : 0000000000000037
Call trace:
 spin_bug+0x88/0xec kernel/locking/spinlock_debug.c:77
 debug_spin_lock_before kernel/locking/spinlock_debug.c:85 [inline]
 do_raw_spin_lock+0xb0/0x110 kernel/locking/spinlock_debug.c:114
 __raw_spin_lock include/linux/spinlock_api_smp.h:134 [inline]
 _raw_spin_lock+0x5c/0x6c kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:350 [inline]
 writeback_single_inode+0x44/0x3dc fs/fs-writeback.c:1676
 write_inode_now+0xb0/0xdc fs/fs-writeback.c:2744
 iput_final fs/inode.c:1734 [inline]
 iput+0x1e4/0x324 fs/inode.c:1773
 ntfs_fill_super+0x1254/0x14a4 fs/ntfs3/super.c:1190
 get_tree_bdev+0x1e8/0x2a0 fs/super.c:1324
 ntfs_fs_get_tree+0x28/0x38 fs/ntfs3/super.c:1358
 vfs_get_tree+0x40/0x140 fs/super.c:1531
 do_new_mount+0x1dc/0x4e4 fs/namespace.c:3040
 path_mount+0x358/0x890 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __arm64_sys_mount+0x2c4/0x3c4 fs/namespace.c:3568
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x140 arch/arm64/kernel/syscall.c:197
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
Code: 900259c3 12800004 9120cc63 14000003 (b94572a4) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	900259c3 	adrp	x3, 0x4b38000
   4:	12800004 	mov	w4, #0xffffffff            	// #-1
   8:	9120cc63 	add	x3, x3, #0x833
   c:	14000003 	b	0x18
* 10:	b94572a4 	ldr	w4, [x21, #1392] <-- trapping instruction

