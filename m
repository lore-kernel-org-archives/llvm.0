Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C844D8831
	for <llvm@lists.linux.dev>; Mon, 26 Dec 2022 14:42:34 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id z9-20020a6be009000000b006e0577c3686so3680073iog.0
        for <llvm@lists.linux.dev>; Mon, 26 Dec 2022 06:42:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jbQqDJM7rNEn/w9o07nQo5LxtMxnlWVdv8R6yb+ZPeM=;
        b=MsbGvcMk4DMfRr11NyZSC62ALug+H/WfFkD60nceELDr8V7Rrt0jb6clE86llNzmu+
         5yg97CjxgCo9mxWd6pFwEjycnM6DfpQVEwxEuEluPV8DFtQCbdmu4OkyfOk7VnIv7klO
         Fa3rVv9ysgpC0uyN9qyvq5yx8RDqjoOYxTmRq6qydHladrysrqAAzd82cKuLVCRRmC3O
         XTLlubyPWJZ0UmqROcvc1kj3r6dCf1OObG0SEnpnAg+PBq1Ehsiz1V4VCn+Exu9c/xje
         qNqQcEJ1YRCoLD2BZ4NuceIyDXISLdF+NkosCU8mMbxmuWLZsPHWu8pDrR4fy6P9BaMm
         cAPA==
X-Gm-Message-State: AFqh2ko8Ja22x8IvuC2Py73f+tS4b15VDwfHpINd6nH7I5bg2d90fX0W
	l5cI4v/YxvZVSCwudotSv0XRBWxV+SKViWmZNKlJKtBsD9r3
X-Google-Smtp-Source: AMrXdXujo4kXMZZ00hcXHEAD7vPMaQuPsD2v7cPqIHVy2Q+FaZdct6dJ3Bqv22rtAP/htBOT4TWOoom/vDvS+ww+du0v4XC88bZX
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:da8b:0:b0:302:f62a:53e7 with SMTP id
 u11-20020a92da8b000000b00302f62a53e7mr1598651iln.273.1672065753772; Mon, 26
 Dec 2022 06:42:33 -0800 (PST)
Date: Mon, 26 Dec 2022 06:42:33 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004b7b3a05f0bc25f8@google.com>
Subject: [syzbot] [ntfs3?] kernel panic: stack is corrupted in __lock_acquire (5)
From: syzbot <syzbot+0bc4c0668351ce1cab8f@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a5541c0811a0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1550a5b4480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cbd4e584773e9397
dashboard link: https://syzkaller.appspot.com/bug?extid=0bc4c0668351ce1cab8f
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14fe2b94480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1567f993880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b7702208fb9/disk-a5541c08.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ec0153ec051/vmlinux-a5541c08.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6f8725ad290a/Image-a5541c08.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/bcef00e22a50/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0bc4c0668351ce1cab8f@syzkaller.appspotmail.com

loop3: detected capacity change from 0 to 4096
ntfs3: loop3: Different NTFS' sector size (1024) and media sector size (512)
Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: __lock_acquire+0x3074/0x3084 kernel/locking/lockdep.c:5055
CPU: 1 PID: 7324 Comm: syz-executor176 Not tainted 6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call trace:
 dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:163
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x104/0x16c lib/dump_stack.c:106
 dump_stack+0x1c/0x58 lib/dump_stack.c:113
 panic+0x218/0x508 kernel/panic.c:274
 warn_bogus_irq_restore+0x0/0x40 kernel/panic.c:703
 __lock_acquire+0x3074/0x3084 kernel/locking/lockdep.c:5055
 lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5668
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x54/0x6c kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:350 [inline]
 _atomic_dec_and_lock+0xc8/0x130 lib/dec_and_lock.c:28
 iput+0x50/0x324 fs/inode.c:1765
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
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x00000,040e0108,4c017203
Memory Limit: none
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
