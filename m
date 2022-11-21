Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF50EC0
	for <llvm@lists.linux.dev>; Mon, 21 Nov 2022 10:51:47 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id bf14-20020a056602368e00b006ce86e80414so5229147iob.7
        for <llvm@lists.linux.dev>; Mon, 21 Nov 2022 02:51:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlR91O3sKtfJHpoCCZxI4C6b8jSkUV7GoF1cYAWIbwo=;
        b=X9dcBEsUqLNWQZzkqhJdx3bfrSTj6umsxtpqZhsrILJLKAp9bDqOcoRjPoCuMBofa4
         yBMGgcoaKdPCZd/CkIRhBQl0tuiKKfanV1bLOfSrxwupjCdEB8/MH9ZYlPoSBh4SYQOH
         YVuUEToIo8clHB2uJ4ySIiZPVvJQsZToTJieEK3t25NoRQ7LY/9yKXnJWEpx8+LFYwT2
         zE9adglbeL3IRMvKoqsjly/FadzjsCzLw3kCXsHoj+Sy2Pz3GMp/9IXmHx9lziaiLYqj
         R9pXUkZUWIhZQkxrCFgy7xTinux7aYl5hc34SRQ0mohR2rk5rRZj+C+nZG2LRi+nYd2D
         9bow==
X-Gm-Message-State: ANoB5pm5/gYDpCkrowbwsU4h825ZzLFHNOC56/1RIkWkn9GL3CqeQapM
	CxxPp+rRvhoXgYA7MvuBmq31/4fVXC7n9jdSSj77GOQQ6kDJ
X-Google-Smtp-Source: AA0mqf4KmVpqm5fP/UBwUNslxcIGj8Mu1KHRzAz+fhMEpZTVwfT5KpWhUV4VfpC8xDjvT+WdMxulvLVv5YiVXD7uqOZNlK+y2K/t
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:345:b0:363:a7e9:194b with SMTP id
 x5-20020a056638034500b00363a7e9194bmr8213654jap.122.1669027906702; Mon, 21
 Nov 2022 02:51:46 -0800 (PST)
Date: Mon, 21 Nov 2022 02:51:46 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007fd4eb05edf8d74d@google.com>
Subject: [syzbot] WARNING: locking bug in writeback_single_inode
From: syzbot <syzbot+3ac57409fb0bec311927@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9500fc6e9e60 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1143d819880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b25c9f218686dd5e
dashboard link: https://syzkaller.appspot.com/bug?extid=3ac57409fb0bec311927
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17437209880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12c6d64e880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/1363e60652f7/disk-9500fc6e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fcc4da811bb6/vmlinux-9500fc6e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0b554298f1fa/Image-9500fc6e.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/b7cda1fc67db/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3ac57409fb0bec311927@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 8226
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(1)
WARNING: CPU: 1 PID: 30056 at kernel/locking/lockdep.c:231 check_wait_context kernel/locking/lockdep.c:4729 [inline]
WARNING: CPU: 1 PID: 30056 at kernel/locking/lockdep.c:231 __lock_acquire+0x2b0/0x3084 kernel/locking/lockdep.c:5005
Modules linked in:
CPU: 1 PID: 30056 Comm: syz-executor132 Not tainted 6.1.0-rc5-syzkaller-32269-g9500fc6e9e60 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : check_wait_context kernel/locking/lockdep.c:4729 [inline]
pc : __lock_acquire+0x2b0/0x3084 kernel/locking/lockdep.c:5005
lr : hlock_class kernel/locking/lockdep.c:231 [inline]
lr : check_wait_context kernel/locking/lockdep.c:4729 [inline]
lr : __lock_acquire+0x298/0x3084 kernel/locking/lockdep.c:5005
sp : ffff8000141c37c0
x29: ffff8000141c38a0 x28: 0000000000000001 x27: ffff0000cd731a68
x26: ffff0000cabb3a2f x25: ffff0000cd732470 x24: 0000000000000000
x23: 0000000000000000 x22: 0000000000000001 x21: 0000000000000000
x20: 0000000000000000 x19: ffff5600124b28ca x18: 0000000000000202
x17: ffff8001f1cdd000 x16: ffff80000dc18158 x15: ffff0000cd731a40
x14: 0000000000000000 x13: 0000000000000012 x12: ffff80000d96cfd0
x11: ff808000081c6510 x10: ffff80000ddda198 x9 : 24fb2561f6434100
x8 : 0000000000000000 x7 : 4e5241575f534b43 x6 : ffff80000c0b2b74
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000100000001 x0 : 0000000000000016
Call trace:
 check_wait_context kernel/locking/lockdep.c:4729 [inline]
 __lock_acquire+0x2b0/0x3084 kernel/locking/lockdep.c:5005
 lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5668
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x54/0x6c kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:350 [inline]
 writeback_single_inode+0x44/0x54c fs/fs-writeback.c:1676
 write_inode_now+0xb0/0xdc fs/fs-writeback.c:2736
 iput_final fs/inode.c:1734 [inline]
 iput+0x1e4/0x324 fs/inode.c:1773
 ntfs_fill_super+0xc30/0x14a4 fs/ntfs3/super.c:1278
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
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
irq event stamp: 2649
hardirqs last  enabled at (2649): [<ffff800008165fe4>] raw_spin_rq_unlock_irq kernel/sched/sched.h:1366 [inline]
hardirqs last  enabled at (2649): [<ffff800008165fe4>] finish_lock_switch+0x94/0xe8 kernel/sched/core.c:4950
hardirqs last disabled at (2648): [<ffff80000c0afb1c>] __schedule+0x84/0x594 kernel/sched/core.c:6402
softirqs last  enabled at (1848): [<ffff8000080102e4>] _stext+0x2e4/0x37c
softirqs last disabled at (1821): [<ffff800008017c88>] ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:79
---[ end trace 0000000000000000 ]---
Unable to handle kernel NULL pointer dereference at virtual address 00000000000000b8
Mem abort info:
  ESR = 0x0000000096000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000006
  CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=00000001101ea000
[00000000000000b8] pgd=0800000112a3a003, p4d=0800000112a3a003, pud=0800000111e89003, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 PID: 30056 Comm: syz-executor132 Tainted: G        W          6.1.0-rc5-syzkaller-32269-g9500fc6e9e60 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : check_wait_context kernel/locking/lockdep.c:4729 [inline]
pc : __lock_acquire+0x2d0/0x3084 kernel/locking/lockdep.c:5005
lr : hlock_class kernel/locking/lockdep.c:231 [inline]
lr : check_wait_context kernel/locking/lockdep.c:4729 [inline]
lr : __lock_acquire+0x298/0x3084 kernel/locking/lockdep.c:5005
sp : ffff8000141c37c0
x29: ffff8000141c38a0 x28: 0000000000000001 x27: ffff0000cd731a68
x26: ffff0000cabb3a2f x25: ffff0000cd732470 x24: 0000000000000000
x23: 0000000000000000 x22: 0000000000000001 x21: 0000000000000000
x20: 0000000000000000 x19: ffff5600124b28ca x18: 0000000000000202
x17: ffff8001f1cdd000 x16: ffff80000dc18158 x15: ffff0000cd731a40
x14: 0000000000000000 x13: 0000000000000012 x12: ffff80000d96cfd0
x11: ff808000081c6510 x10: ffff80000ddda198 x9 : 00000000000408ca
x8 : 0000000000000000 x7 : 4e5241575f534b43 x6 : ffff80000c0b2b74
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000100000001 x0 : 0000000000000016
Call trace:
 hlock_class kernel/locking/lockdep.c:222 [inline]
 check_wait_context kernel/locking/lockdep.c:4730 [inline]
 __lock_acquire+0x2d0/0x3084 kernel/locking/lockdep.c:5005
 lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5668
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x54/0x6c kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:350 [inline]
 writeback_single_inode+0x44/0x54c fs/fs-writeback.c:1676
 write_inode_now+0xb0/0xdc fs/fs-writeback.c:2736
 iput_final fs/inode.c:1734 [inline]
 iput+0x1e4/0x324 fs/inode.c:1773
 ntfs_fill_super+0xc30/0x14a4 fs/ntfs3/super.c:1278
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
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
Code: d002e1ca 91056210 9106614a b9400329 (3942e114) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	d002e1ca 	adrp	x10, 0x5c3a000
   4:	91056210 	add	x16, x16, #0x158
   8:	9106614a 	add	x10, x10, #0x198
   c:	b9400329 	ldr	w9, [x25]
* 10:	3942e114 	ldrb	w20, [x8, #184] <-- trapping instruction


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
