Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAEA15CA
	for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 04:41:09 +0000 (UTC)
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-573a7a3c405so6042612eaf.1
        for <llvm@lists.linux.dev>; Sun, 17 Sep 2023 21:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695012068; x=1695616868;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Njj1cFpFl6P5XczNJtRHj5unyeppmn930r6gY5zCeN0=;
        b=s1XT3igpdUMiY7ju/LcwkpIMxA+79RyPDVXk/Gli3Z2ofcQfp+4/+wMsYpehAszdVr
         8Co0DnpE1VqgK3HMBUPxNoNzdTOz0UwXJt4FGNYjktrnLDTVnaPNZA+oFqHePIc3M0hI
         XlEZOK5EQMy6fGTZGanr8TBE5pbaPA654r2GQCj0YvEBeQWoljqjz++m5+wUudlNmnAZ
         fiaiJyPtDpKlsvjNRQw6PxmRifkZESn974XAzCPQw4a8fiTdcGmhCOjp0VUt800CYijs
         gbFg68BIlZUn7Z3j8mrqxL3V2gKvdbfkOQ+Vbe1OL0k+zXWvCMNZV7dbUAQKN7k0Svyx
         agpg==
X-Gm-Message-State: AOJu0YxuQTkG4oCJGP/cRcvh2Ml63KYxsO0tmUwEQHtiOj9WPc1wY4yy
	u+68wINfj64E+3x8UPWbMC0Rqmbq/cXljSILAaxJ2B+VuRCm
X-Google-Smtp-Source: AGHT+IH36LNEUnGMAeMXmlQNVH5WxS7Mii7fn4raTyMmtgevC5fZjJjZojnKRU5aBVH1N1s8pW7OLTunfCts9ukRd1orioKhlr0A
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a4a:4fd7:0:b0:571:1df7:c13f with SMTP id
 c206-20020a4a4fd7000000b005711df7c13fmr3109792oob.1.1695012068423; Sun, 17
 Sep 2023 21:41:08 -0700 (PDT)
Date: Sun, 17 Sep 2023 21:41:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003a7ffb06059ac0dd@google.com>
Subject: [syzbot] [fs?] [mm?] WARNING in page_copy_sane
From: syzbot <syzbot+c225dea486da4d5592bd@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	mike.kravetz@oracle.com, muchun.song@linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, sidhartha.kumar@oracle.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, willy@infradead.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    98897dc735cf Add linux-next specific files for 20230914
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1548728c680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1502c503717ada5c
dashboard link: https://syzkaller.appspot.com/bug?extid=c225dea486da4d5592bd
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=171fffd8680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17bbbf1c680000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/00e4c0af5a8a/disk-98897dc7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7b54a00eee56/vmlinux-98897dc7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/100094353b8e/bzImage-98897dc7.xz

The issue was bisected to:

commit 591a2520fbfd6565d9a5c732afa53f62228798e6
Author: Sidhartha Kumar <sidhartha.kumar@oracle.com>
Date:   Mon Sep 11 21:53:19 2023 +0000

    mm/filemap: remove hugetlb special casing in filemap.c

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15e15464680000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17e15464680000
console output: https://syzkaller.appspot.com/x/log.txt?x=13e15464680000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c225dea486da4d5592bd@syzkaller.appspotmail.com
Fixes: 591a2520fbfd ("mm/filemap: remove hugetlb special casing in filemap.c")

------------[ cut here ]------------
WARNING: CPU: 1 PID: 5040 at lib/iov_iter.c:463 page_copy_sane+0xc2/0x2c0 lib/iov_iter.c:463
Modules linked in:
CPU: 1 PID: 5040 Comm: syz-executor204 Not tainted 6.6.0-rc1-next-20230914-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/04/2023
RIP: 0010:page_copy_sane+0xc2/0x2c0 lib/iov_iter.c:463
Code: e8 73 db 63 fd 66 90 e8 6c db 63 fd e8 67 db 63 fd 4c 89 ee 48 89 ef e8 6c d6 63 fd 49 39 ed 0f 83 eb 00 00 00 e8 4e db 63 fd <0f> 0b 31 db e8 45 db 63 fd 89 d8 5b 5d 41 5c 41 5d 41 5e 41 5f c3
RSP: 0018:ffffc90003eefa58 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff88807a01d940 RSI: ffffffff84241482 RDI: 0000000000000006
RBP: 0000000000200000 R08: 0000000000000006 R09: 0000000000201000
R10: 0000000000200000 R11: 0000000000000000 R12: 0000000000000009
R13: 0000000000201000 R14: 0000000000000001 R15: ffffea0001fe0000
FS:  0000555556937380(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000200001c0 CR3: 000000002911d000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 copy_page_to_iter+0x35/0x180 lib/iov_iter.c:472
 hugetlbfs_read_iter+0x3d7/0xa60 fs/hugetlbfs/inode.c:385
 call_read_iter include/linux/fs.h:1980 [inline]
 do_iter_readv_writev+0x2f2/0x3c0 fs/read_write.c:733
 do_iter_read+0x315/0x870 fs/read_write.c:795
 vfs_readv+0x12d/0x1a0 fs/read_write.c:915
 do_preadv fs/read_write.c:1007 [inline]
 __do_sys_preadv fs/read_write.c:1057 [inline]
 __se_sys_preadv fs/read_write.c:1052 [inline]
 __x64_sys_preadv+0x228/0x300 fs/read_write.c:1052
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f85cc7932e9
Code: 48 83 c4 28 c3 e8 37 17 00 00 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffda50bbbd8 EFLAGS: 00000246 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 00007ffda50bbdb8 RCX: 00007f85cc7932e9
RDX: 0000000000000002 RSI: 0000000020000180 RDI: 0000000000000003
RBP: 00007f85cc806610 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffda50bbda8 R14: 0000000000000001 R15: 0000000000000001
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
