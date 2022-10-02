Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A033428F0
	for <llvm@lists.linux.dev>; Sun,  2 Oct 2022 11:18:37 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id h8-20020a056e021b8800b002f9c2e31750so643861ili.1
        for <llvm@lists.linux.dev>; Sun, 02 Oct 2022 04:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=+oGO/iqK0zkJ3WDUp/YwhQsBg1pSztpolfX7crd2mvo=;
        b=RrLqSY/JftZaJibaNYboW0GyYKJ/cP1od9qJoPPL3wLY6DmgE0hI19cHNF8NriUMiY
         PtauACJ4wIVtc9c7UyZx+JAtpw6uF1OlpzF+aOZZBUijSX5/d1lH8tq2Z3oJd6xi4Mef
         Y+e6gbz1/+61AC1lb2HotxUpAbb514NiHH1DpgYuPgTiRiBiETzqH6VhgmZz7s3MX8Ec
         jG5AaB/GZv1yeW3yrmgG2SwZviAJgbZh1tD5dvandEZ41H+e7ScOwyBNhksO+bUQb5at
         sgIRrNKXhSFqgn/S19EQyRqlLX+zdFxVcMV8OU+vzp5UaRU+jcD80C27iigYRTlYU84C
         okaQ==
X-Gm-Message-State: ACrzQf3uk0lA9qw2AZxzmF4M63hNBuQZ+6chOn4wYJSSbReYrs3Qqgcm
	gFoMEYrk4f5teJFSsRpy7Y3ddPaM31otIfyxTYehxMsSwrt2
X-Google-Smtp-Source: AMsMyM4dzSHR1szkx9PpgM/GLZaCMRKtmqavFNlawJBZT/BPb4FYv4NhF/mhXqc7U34aXsvHK5NEokod9XADSrk1p1RczSIln1tI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:270d:b0:35a:6246:ba76 with SMTP id
 m13-20020a056638270d00b0035a6246ba76mr8372607jav.263.1664709516827; Sun, 02
 Oct 2022 04:18:36 -0700 (PDT)
Date: Sun, 02 Oct 2022 04:18:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000067a9d105ea0b6304@google.com>
Subject: [syzbot] WARNING in ntfs_fill_super
From: syzbot <syzbot+33f3faaa0c08744f7d40@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ffb4d94b4314 Merge tag 'drm-fixes-2022-10-01' of git://ano..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=133007c4880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ba0d23aa7e1ffaf5
dashboard link: https://syzkaller.appspot.com/bug?extid=33f3faaa0c08744f7d40
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b74f52232e47/disk-ffb4d94b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b09212ee600a/vmlinux-ffb4d94b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+33f3faaa0c08744f7d40@syzkaller.appspotmail.com

WARNING: CPU: 1 PID: 19148 at mm/page_alloc.c:5525 __alloc_pages+0x30a/0x560 mm/page_alloc.c:5525
Modules linked in:
CPU: 1 PID: 19148 Comm: syz-executor.1 Not tainted 6.0.0-rc7-syzkaller-00220-gffb4d94b4314 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
RIP: 0010:__alloc_pages+0x30a/0x560 mm/page_alloc.c:5525
Code: 5c 24 04 0f 85 f3 00 00 00 44 89 e1 81 e1 7f ff ff ff a9 00 00 04 00 41 0f 44 cc 41 89 cc e9 e3 00 00 00 c6 05 d3 16 29 0c 01 <0f> 0b 83 fb 0a 0f 86 c8 fd ff ff 31 db 48 c7 44 24 20 0e 36 e0 45
RSP: 0000:ffffc900132a78e0 EFLAGS: 00010246
RAX: ffffc900132a7940 RBX: 0000000000000014 RCX: 0000000000000000
RDX: 0000000000000028 RSI: 0000000000000000 RDI: ffffc900132a7968
RBP: ffffc900132a79f0 R08: dffffc0000000000 R09: ffffc900132a7940
R10: fffff52002654f2d R11: 1ffff92002654f28 R12: 0000000000040c40
R13: 1ffff92002654f24 R14: dffffc0000000000 R15: 1ffff92002654f20
FS:  00007f7b48ffe700(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005557f22db668 CR3: 0000000048e99000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 kmalloc_order+0x41/0x140 mm/slab_common.c:933
 kmalloc_order_trace+0x15/0x70 mm/slab_common.c:949
 kmalloc_large include/linux/slab.h:529 [inline]
 __kmalloc+0x26e/0x370 mm/slub.c:4418
 kmalloc include/linux/slab.h:605 [inline]
 ntfs_fill_super+0x351b/0x42a0 fs/ntfs3/super.c:1144
 get_tree_bdev+0x400/0x620 fs/super.c:1323
 vfs_get_tree+0x88/0x270 fs/super.c:1530
 do_new_mount+0x289/0xad0 fs/namespace.c:3040
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f7b4a08bada
Code: 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f7b48ffdf88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 00007f7b4a08bada
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f7b48ffdfe0
RBP: 00007f7b48ffe020 R08: 00007f7b48ffe020 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000000
R13: 0000000020000100 R14: 00007f7b48ffdfe0 R15: 0000000020002580
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
