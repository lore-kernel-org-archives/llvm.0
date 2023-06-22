Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059B7171BA
	for <llvm@lists.linux.dev>; Thu, 22 Jun 2023 12:01:45 +0000 (UTC)
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-34245536f58so44047775ab.2
        for <llvm@lists.linux.dev>; Thu, 22 Jun 2023 05:01:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687435305; x=1690027305;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1cxu0iAoPZS1HY5aOwRamdOMX95U6KeklcxbDcJhB8=;
        b=gGzRvG6+Xvpk4G1jKSRPLkH7RjyUMLM7jB5ChHjdIcDfahh32TeYbb9P5T9/XGUhIi
         Y1JkmxDYcYmuDIBLCLdEIm7/f9XP4EJTvPesJ4MjPVmjeesTX1O0sXxayQ8NMHJvn2+K
         Y8L8TX7tVoQPCru9lKDLGON3FqwDGAw1eGd+9OTHtrmDT66ZW/hBOVkgqqEvDg51hacn
         PNZGdym2NnKk9S/Uk8VIp2tGgHuZAzXE8VCfaB26JuP4qTveV47YRDx9Bh6Ft9dEBU4d
         sZJy1WRGmdDvBozTV3zhv/LAcpVBSWIeVS5bFWU4t4wtYxdGZu3U1DJYkJo13FG/zOpy
         14Rg==
X-Gm-Message-State: AC+VfDyhTBEMKko97aNDtozNtEx8gwjBviAIUQaWLsg4oVPiR1R2q+9k
	ngthV9/xY1YX/jYt95670H5leSL1r3+AheTIQ0cIEE7/Dbjb
X-Google-Smtp-Source: ACHHUZ5VA9fpHn051cyL3FqA2cB/6o0LMEt0X/lJxekftRL5iu/OUPfMv/9LEpV9hv+xsKY91s7dnx/kb2X4WxARq4AOFydQFyPn
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:541:b0:341:e2fe:bddd with SMTP id
 i1-20020a056e02054100b00341e2febdddmr7424038ils.3.1687435304888; Thu, 22 Jun
 2023 05:01:44 -0700 (PDT)
Date: Thu, 22 Jun 2023 05:01:44 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000edf08305feb6a5f6@google.com>
Subject: [syzbot] [ext4?] UBSAN: shift-out-of-bounds in ext4_handle_clustersize
From: syzbot <syzbot+f4cf49c6365d87eb8e0e@syzkaller.appspotmail.com>
To: adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, tytso@mit.edu
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1b29d271614a Merge tag 'staging-6.4-rc7' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15fefd03280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7ff8f87c7ab0e04e
dashboard link: https://syzkaller.appspot.com/bug?extid=f4cf49c6365d87eb8e0e
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bd5aafc3a720/disk-1b29d271.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6689979a4ad9/vmlinux-1b29d271.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7f1acb11ce85/bzImage-1b29d271.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f4cf49c6365d87eb8e0e@syzkaller.appspotmail.com

UBSAN: shift-out-of-bounds in fs/ext4/super.c:4401:27
shift exponent 374 is too large for 32-bit type 'int'
CPU: 0 PID: 27421 Comm: syz-executor.0 Not tainted 6.4.0-rc6-syzkaller-00269-g1b29d271614a #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/27/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
 ubsan_epilogue lib/ubsan.c:217 [inline]
 __ubsan_handle_shift_out_of_bounds+0x3c3/0x420 lib/ubsan.c:387
 ext4_handle_clustersize+0x592/0x5c0 fs/ext4/super.c:4401
 __ext4_fill_super fs/ext4/super.c:5279 [inline]
 ext4_fill_super+0x3a66/0x6c60 fs/ext4/super.c:5672
 get_tree_bdev+0x405/0x620 fs/super.c:1303
 vfs_get_tree+0x8c/0x270 fs/super.c:1510
 do_new_mount+0x28f/0xae0 fs/namespace.c:3039
 do_mount fs/namespace.c:3382 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f7e1888d8ba
Code: 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7e195cef88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 000000000000043c RCX: 00007f7e1888d8ba
RDX: 0000000020000440 RSI: 0000000020000180 RDI: 00007f7e195cefe0
RBP: 00007f7e195cf020 R08: 00007f7e195cf020 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000440
R13: 0000000020000180 R14: 00007f7e195cefe0 R15: 00000000200001c0
 </TASK>
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
