Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194E2646
	for <llvm@lists.linux.dev>; Wed,  7 Dec 2022 07:00:48 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id h11-20020a6b7a0b000000b006e0004fc167so7255369iom.5
        for <llvm@lists.linux.dev>; Tue, 06 Dec 2022 23:00:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sFoDzixvIOUecSJ5AIeZIidcr9UNIE79oGoDN9IDh+w=;
        b=Z2rapRr9xMVTNbCocOnnpuS614EiRSc95hBM/Lms+Z5M1QRzQPw+4tbW9bE6luhbwO
         61I2k362mrRxwTp0ber2iNb/xGplFzqXeYJ/2bE4UAFL8AC4D7NGE94WRhugklyvHQTo
         UTWny9LqL6BvTrGMOwnnHAQwFmDbjOdpzTZx/4GY+pKWB4f36YVjlQE0froGjUhogfcB
         HxpmhyGYf61hyjmNy2DaEiUVT6j63X3dA+vxwPQPwCxai6SRnEXsc/T8SEgyhIUHo6m+
         kF37EZBifO7+NVk4szF1p5iDrzJb0iJlu7UkD8cKfS0h2On3F+gr9GMhlv+XqeWrKCpT
         he6w==
X-Gm-Message-State: ANoB5pmPmtoL+J82e4nXId6y0U08o8hhyORgw0uQhZdb9j9f9+0hZCN0
	EwyAt1qsJ33a+85L52MXYDintAGdcmhkJnhqXAzSIdTLw2b0
X-Google-Smtp-Source: AA0mqf7mxhK4vGB9fZQVlsP/vUeiIIwUfIOnKwREj+VjbOmFUc2vscxBgVbsgxrUY7JrV6+sbthVKxyjx4DlciMBy+Bk9WumqHvB
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:89:b0:363:9e67:d9d9 with SMTP id
 v9-20020a056638008900b003639e67d9d9mr34521143jao.133.1670396448246; Tue, 06
 Dec 2022 23:00:48 -0800 (PST)
Date: Tue, 06 Dec 2022 23:00:48 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ee924305ef377a61@google.com>
Subject: [syzbot] WARNING: suspicious RCU usage in write_inode_now (2)
From: syzbot <syzbot+5294a9e355351fddb4b2@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a5541c0811a0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1080851d880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cbd4e584773e9397
dashboard link: https://syzkaller.appspot.com/bug?extid=5294a9e355351fddb4b2
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b7702208fb9/disk-a5541c08.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ec0153ec051/vmlinux-a5541c08.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6f8725ad290a/Image-a5541c08.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5294a9e355351fddb4b2@syzkaller.appspotmail.com

=============================
WARNING: suspicious RCU usage
6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0 Not tainted
-----------------------------
kernel/sched/core.c:9870 Illegal context switch in RCU-bh read-side critical section!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
1 lock held by syz-executor.5/19612:
 #0: ffff0001428b30e0 (&type->s_umount_key#94/1){+.+.}-{3:3}, at: alloc_super+0xf8/0x430 fs/super.c:228

stack backtrace:
CPU: 0 PID: 19612 Comm: syz-executor.5 Not tainted 6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
Call trace:
 dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:163
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x104/0x16c lib/dump_stack.c:106
 dump_stack+0x1c/0x58 lib/dump_stack.c:113
 lockdep_rcu_suspicious+0x138/0x154 kernel/locking/lockdep.c:6597
 __might_resched+0x6c/0x218 kernel/sched/core.c:9870
 __might_sleep+0x48/0x78 kernel/sched/core.c:9837
 write_inode_now+0xa4/0xdc fs/fs-writeback.c:2743
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


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
