Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14FD259B
	for <llvm@lists.linux.dev>; Mon,  7 Nov 2022 08:34:43 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id bf14-20020a056602368e00b006ce86e80414so6661675iob.7
        for <llvm@lists.linux.dev>; Mon, 07 Nov 2022 00:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4dhM167qDUDFvkC7KReo/7Zl6ufN9cwSkSj/ZA1YBw=;
        b=TMx70J9ktC24aN0o2h5jlcGbsA6cjetPoPVxid6c8Mttgf5LaSVh2ZXla/rYmbG6Hn
         TxqHf2Ykqf/H6jq2mVjNOL4WI/BBxWPggwsnM05LS/lEp/tubMizZMB4ePjTnpCQtv9k
         4Rf/fH9PLxwi1teWq+2qB9EG3d97VMPMKX5PJeglIicDbaMd2D2TZ5fxPWJ26vOsRKqW
         dccjKM4bA6XpSiF9vaCAHfigqsiDUoaAV7q65wB7ah29cRFTHU2kiSpclNPITjMp3mCN
         2Wv7sGfiX1qR64IpWBb2bJbr2toi4S5LQjZ6U325DYW3rQM27Zfb96DmedJePYqRIqoU
         uj/g==
X-Gm-Message-State: ACrzQf12G4dTdT8sfuCe+MbqX53bX41ocXk5JL+/s/BuUuI3utJg2AeI
	Ae2jiJlrEuDedPvAG2FH1l1Sdvi4lwlFZamRBGFhUvrVQ+sc
X-Google-Smtp-Source: AMsMyM7rpWrlEzjb5uKwbac5QnvRv6DRftQmuDOBzLsBrTamz68xqWTKBpsqW56qwGBRN62zXiPzwDQd6IhuaOB+bSvi70NtOuWs
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:26d2:b0:6a3:f044:a942 with SMTP id
 g18-20020a05660226d200b006a3f044a942mr29373909ioo.50.1667810082893; Mon, 07
 Nov 2022 00:34:42 -0800 (PST)
Date: Mon, 07 Nov 2022 00:34:42 -0800
In-Reply-To: <00000000000057abae05eaaccf58@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008b356505ecdd4b93@google.com>
Subject: Re: [syzbot] WARNING: locking bug in evict
From: syzbot <syzbot+0cebf0474baedad38dc5@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    bbed346d5a96 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=16044c99880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3a4a45d2d827c1e
dashboard link: https://syzkaller.appspot.com/bug?extid=0cebf0474baedad38dc5
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11ce4505880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e8e91bc79312/disk-bbed346d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c1cb3fb3b77e/vmlinux-bbed346d.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/af5e4ec0c8db/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0cebf0474baedad38dc5@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 24392 at kernel/locking/lockdep.c:466 lockdep_recursion_finish kernel/locking/lockdep.c:467 [inline]
WARNING: CPU: 0 PID: 24392 at kernel/locking/lockdep.c:466 lock_acquire+0x1cc/0x1f8 kernel/locking/lockdep.c:5668
Modules linked in:
CPU: 0 PID: 24392 Comm: syz-executor.0 Not tainted 6.0.0-rc7-syzkaller-18095-gbbed346d5a96 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
pstate: 204000c5 (nzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : lockdep_recursion_finish kernel/locking/lockdep.c:467 [inline]
pc : lock_acquire+0x1cc/0x1f8 kernel/locking/lockdep.c:5668
lr : lockdep_recursion_finish kernel/locking/lockdep.c:466 [inline]
lr : lock_acquire+0x10c/0x1f8 kernel/locking/lockdep.c:5668
sp : ffff8000136639f0
x29: ffff800013663a30 x28: 0000000000000000 x27: 0000000000000000
x26: ffff80000d260cbf x25: 0000000000000000 x24: 0000000000000001
x23: 0000000000000000 x22: ffff0000d13369d8 x21: ffff8000085ed654
x20: 0000000000000000 x19: 0000000000000000 x18: 00000000000000f3
x17: 0000000000000000 x16: ffff80000db49158 x15: ffff0000d1951a80
x14: 0000000000000008 x13: 00000000ffffffff x12: ffff0000d1951a80
x11: ff808000095d19c0 x10: 0000000000000000 x9 : 00000000000000ff
x8 : ffff8001f1d5e000 x7 : ffff8000085ed654 x6 : 0000000000000000
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
irq event stamp: 4160
hardirqs last  enabled at (4159): [<ffff80000bfb8138>] __exit_to_kernel_mode arch/arm64/kernel/entry-common.c:84 [inline]
hardirqs last  enabled at (4159): [<ffff80000bfb8138>] exit_to_kernel_mode+0xe8/0x118 arch/arm64/kernel/entry-common.c:94
hardirqs last disabled at (4160): [<ffff80000bfb5fbc>] el1_dbg+0x24/0x5c arch/arm64/kernel/entry-common.c:404
softirqs last  enabled at (3076): [<ffff8000080102e4>] _stext+0x2e4/0x37c
softirqs last disabled at (2999): [<ffff800008017c14>] ____do_softirq+0x14/0x20 arch/arm64/kernel/irq.c:79
---[ end trace 0000000000000000 ]---

