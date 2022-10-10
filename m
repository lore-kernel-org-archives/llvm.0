Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CD928E8
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 11:53:38 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id j29-20020a056e02219d00b002f9b13c40c5so8618732ila.21
        for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 04:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oJa6JFnGidCwwDiUXszZ9mnPVPTzom4JRT9+MTxKoQg=;
        b=sa8yp//iOa3eO+xMxo4rApzcs9ykZGUI6q5+3cA+ryLt02NmROW355y63WEPngiX1J
         hMrWL5SjLdlH5UTbIdEiLAtbLLOlND/hAdfn1UepwlLDNPk+gzlqkEuvDMldNCiVpNSa
         JKq0YY3eUzJnFAIZHtwBwQPvPlamNK8R3lqfoUQsPfskYbJFcoRrx612vdeyNHRqi4sP
         gnf07MH5yz30W3wn6R5InBleeheBgmYarE1x6uyEGBq3SCixUVCH3nharDHI74W9dLk2
         OvIdwrUjf1Sd/FE4PnE8aSUGaBk/qC4SQJpT3fA7t+8sk4ob7qwlg3CMOYaggLu9Oobr
         jYGA==
X-Gm-Message-State: ACrzQf2LQokcv2BC4KPfxv5tmrDWSuNkIrFNGKTx5XoH2McDhAFiXiOH
	x78jJYB5QheIH9AbpNKsh1Z5SuC9o9guLMFyi8yr2/duaQsk
X-Google-Smtp-Source: AMsMyM5iE+XVrwBzJpqEmg8DF3sCGm1fSlvuY6yZWXlhjlPu1wRzumGLSa68oTlegjgcONkYaSfUir2cFSXE5qTeX9osoH1XAfoL
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:e43:b0:2f5:739f:7d4d with SMTP id
 l3-20020a056e020e4300b002f5739f7d4dmr9023387ilk.100.1665402817455; Mon, 10
 Oct 2022 04:53:37 -0700 (PDT)
Date: Mon, 10 Oct 2022 04:53:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000057abae05eaaccf58@google.com>
Subject: [syzbot] WARNING: locking bug in evict
From: syzbot <syzbot+0cebf0474baedad38dc5@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bbed346d5a96 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=14109b24880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3a4a45d2d827c1e
dashboard link: https://syzkaller.appspot.com/bug?extid=0cebf0474baedad38dc5
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e8e91bc79312/disk-bbed346d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c1cb3fb3b77e/vmlinux-bbed346d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0cebf0474baedad38dc5@syzkaller.appspotmail.com

loop5: detected capacity change from 0 to 4096
ntfs3: loop5: Different NTFS' sector size (1024) and media sector size (512)
------------[ cut here ]------------
WARNING: CPU: 1 PID: 3553 at kernel/locking/lockdep.c:466 lockdep_recursion_finish kernel/locking/lockdep.c:467 [inline]
WARNING: CPU: 1 PID: 3553 at kernel/locking/lockdep.c:466 lock_acquire+0x1cc/0x1f8 kernel/locking/lockdep.c:5668
Modules linked in:
CPU: 1 PID: 3553 Comm: syz-executor.5 Not tainted 6.0.0-rc7-syzkaller-18095-gbbed346d5a96 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
pstate: 204000c5 (nzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : lockdep_recursion_finish kernel/locking/lockdep.c:467 [inline]
pc : lock_acquire+0x1cc/0x1f8 kernel/locking/lockdep.c:5668
lr : lockdep_recursion_finish kernel/locking/lockdep.c:466 [inline]
lr : lock_acquire+0x10c/0x1f8 kernel/locking/lockdep.c:5668
sp : ffff80001398b9f0
x29: ffff80001398ba30 x28: 0000000000000000 x27: 0000000000000000
x26: ffff80000d260cbf x25: 0000000000000000 x24: 0000000000000001
x23: 0000000000000000 x22: ffff0000fee439d8 x21: ffff8000085ed654
x20: 0000000000000000 x19: 0000000000000000 x18: 00000000000003b7
x17: ffff80000bffd6bc x16: ffff80000db49158 x15: ffff0000c5d1cf80
x14: 0000000000000008 x13: 00000000ffffffff x12: 0000000000040000
x11: 000000000002557f x10: ffff800012a4d000 x9 : 00000000000000ff
x8 : ffff8001f1d7d000 x7 : ffff8000085ed654 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000008 x1 : ffff80000cb431b1 x0 : ffff80000ce4fec5
Call trace:
 lockdep_recursion_finish kernel/locking/lockdep.c:467 [inline]
 lock_acquire+0x1cc/0x1f8 kernel/locking/lockdep.c:5668
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x54/0x6c kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:349 [inline]
 inode_sb_list_del fs/inode.c:503 [inline]
 evict+0x90/0x334 fs/inode.c:654
 iput_final fs/inode.c:1748 [inline]
 iput+0x2c4/0x324 fs/inode.c:1774
 ntfs_fill_super+0x1254/0x14a4 fs/ntfs3/super.c:1190
 get_tree_bdev+0x1e8/0x2a0 fs/super.c:1323
 ntfs_fs_get_tree+0x28/0x38 fs/ntfs3/super.c:1358
 vfs_get_tree+0x40/0x140 fs/super.c:1530
 do_new_mount+0x1dc/0x4e4 fs/namespace.c:3040
 path_mount+0x358/0x914 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __arm64_sys_mount+0x2c4/0x3c4 fs/namespace.c:3568
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:636
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
 el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581
irq event stamp: 4746
hardirqs last  enabled at (4745): [<ffff800008161dac>] raw_spin_rq_unlock_irq kernel/sched/sched.h:1367 [inline]
hardirqs last  enabled at (4745): [<ffff800008161dac>] finish_lock_switch+0x94/0xe8 kernel/sched/core.c:4942
hardirqs last disabled at (4746): [<ffff80000bfb5fbc>] el1_dbg+0x24/0x5c arch/arm64/kernel/entry-common.c:404
softirqs last  enabled at (3572): [<ffff80000801c33c>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (3570): [<ffff80000801c308>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
---[ end trace 0000000000000000 ]---
ntfs3: loop5: Mark volume as dirty due to NTFS errors


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
