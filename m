Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0AF641
	for <llvm@lists.linux.dev>; Wed,  5 Oct 2022 09:06:37 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id k6-20020a92c246000000b002f80993e780so12867235ilo.13
        for <llvm@lists.linux.dev>; Wed, 05 Oct 2022 02:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=iF+5J3FjR+ovq4BjVljFTsTmBLDfLUYAsyCh3rezwNE=;
        b=MdoxiQNOOfIL6LRoDStqpcwTJX7i/exBBxH1HmPXZ3J6UzkGitjbSikXki0yrhQ9dR
         2vez64M0WQqkVw37Tq/yVSf+ZCKzo4y39beS42PNiwJOpQmEoz/cGPBvWcL0lenuVtOo
         2/uPJAsNW9zr0ye9U+MbV9mIso5u1hqXAQL2NhdniengxSXuXe31m9h2BBAnb/7C5/iR
         YRJdba7iweS5doLPOEXt3IgYvL9FJ9QoYNTFYtHs+NS+VkfHsKnh/5veTBKhcDarCxtp
         NWd8W/aPSS7dgu5lf9yHFPt89cobfs5M0kggjE13n+e+8A2HkiYChljP2ksjOPalLKWU
         MJ2g==
X-Gm-Message-State: ACrzQf1LKlzFqPH6Qht2eS5uy+wsyLbnT8HvcjyyIsbs9wTbeA/Vvbbp
	IklcnbSzryMLAe+1nh4XVZR/axrMRXdjmSt5ECBnxkr1zA7R
X-Google-Smtp-Source: AMsMyM6cdJeEFqtU+wWYdq7DvQIBFFro05X7K993gQKLKIF1oQizWhIaotrLbIaZA9pwnMx3Lfun1A6GW82a6/0/Y6WZhgrvPU0U
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:c247:0:b0:2fa:16d1:9cc0 with SMTP id
 k7-20020a92c247000000b002fa16d19cc0mr4251404ilo.293.1664960797242; Wed, 05
 Oct 2022 02:06:37 -0700 (PDT)
Date: Wed, 05 Oct 2022 02:06:37 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e27a4205ea45e4d8@google.com>
Subject: [syzbot] kernel panic: stack is corrupted in __might_resched
From: syzbot <syzbot+34cc87acc93740589aa6@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0326074ff465 Merge tag 'net-next-6.1' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10910bbc880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d323d85b1f8a4ed7
dashboard link: https://syzkaller.appspot.com/bug?extid=34cc87acc93740589aa6
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c40d70ae7512/disk-0326074f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3603ce065271/vmlinux-0326074f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+34cc87acc93740589aa6@syzkaller.appspotmail.com

ntfs3: loop4: Different NTFS' sector size (1024) and media sector size (512)
Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: __might_resched+0x6a6/0x6b0
CPU: 1 PID: 16328 Comm: syz-executor.4 Not tainted 6.0.0-syzkaller-02734-g0326074ff465 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x28e lib/dump_stack.c:106
 panic+0x2d6/0x715 kernel/panic.c:274
 __stack_chk_fail+0x12/0x20 kernel/panic.c:706
 __might_resched+0x6a6/0x6b0
 write_inode_now+0x1bb/0x260 fs/fs-writeback.c:2722
 iput_final fs/inode.c:1735 [inline]
 iput+0x3e6/0x760 fs/inode.c:1774
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
RIP: 0033:0x7f0875e8bada
Code: 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f0876f3df88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 00007f0875e8bada
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f0876f3dfe0
RBP: 00007f0876f3e020 R08: 00007f0876f3e020 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000000
R13: 0000000020000100 R14: 00007f0876f3dfe0 R15: 0000000020002900
 </TASK>
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
