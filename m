Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6342D7ED
	for <llvm@lists.linux.dev>; Sun, 18 Dec 2022 02:59:36 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id s1-20020a056e021a0100b003026adad6a9so4451582ild.18
        for <llvm@lists.linux.dev>; Sat, 17 Dec 2022 18:59:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o3sxPobFu95WIg2hSTWqtDD42PJv52rpCdfLL8JGeSA=;
        b=yub6KmnteKZYM9Y+XuqCMMENPzwaRkecpS+KP4E5kafqTipA6UCQm9ygAdwoZ3yTA+
         /bWM8QRfSe2TO/pBs/Nj28/saaSAQIpNrnA15vOU2BRwvVZSCRzThU07E1pqmrdOvzc1
         nGe9Of3zKSSLEZUL52CxxXrMbDWf3Uz5Dodm2SEcwI1930jJ1ifYloLe1vgkxHZ0nmiG
         6r7mdvFmo54jcyCgkoGa64qiUPrctAjPDP7FIklhcD62y70GQI7sCKKqcrFb0X65Inf8
         s2lQAwLoRDiUIsNBRkkKadu8YLMtBKJtSmZ/x7N9igyAIVpgsBGMfxwkXQMYvz4zLHR4
         /MMg==
X-Gm-Message-State: AFqh2kocxKyNoVapsMA7hkNT7BNqPRtwcuTOzIfXoUykTM9RLLNlIAp3
	cv/RGp36/l5ESFXB/Yg5WfVo/JiTSWd/j4/9Kulo5bHS73kq
X-Google-Smtp-Source: AMrXdXuRkN84AnIoSwA5K89/fsShU8eHqO+cbJgsfH9vaNjspOQ+Y1QYTjgeefARg0LRIRTmfZcsOw/V14q8qNAjmGIpBZ5/dFmI
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:c816:0:b0:390:4cf3:5fc8 with SMTP id
 p22-20020a02c816000000b003904cf35fc8mr664206jao.86.1671332375551; Sat, 17 Dec
 2022 18:59:35 -0800 (PST)
Date: Sat, 17 Dec 2022 18:59:35 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008be6b405f01164f8@google.com>
Subject: [syzbot] KASAN: out-of-bounds Read in ntfs_set_ea
From: syzbot <syzbot+8778f030156c6cd16d72@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    02bf43c7b7f7 Merge tag 'fs.xattr.simple.rework.rbtree.rwlo..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=13b98157880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c59170b68d26a55
dashboard link: https://syzkaller.appspot.com/bug?extid=8778f030156c6cd16d72
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=136b8f57880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=175ca3a3880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/45f211dceffb/disk-02bf43c7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fd0c63aa3713/vmlinux-02bf43c7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/734647e04fd0/bzImage-02bf43c7.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/33f040554a0d/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8778f030156c6cd16d72@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 4096
ntfs3: loop0: Different NTFS' sector size (2048) and media sector size (512)
==================================================================
BUG: KASAN: out-of-bounds in ntfs_set_ea+0xcb5/0x1760 fs/ntfs3/xattr.c:336
Read of size 18446744069414584420 at addr ffff88824a6c8610 by task syz-executor228/3632

CPU: 0 PID: 3632 Comm: syz-executor228 Not tainted 6.1.0-syzkaller-03295-g02bf43c7b7f7 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x28e lib/dump_stack.c:106
 print_address_description+0x74/0x340 mm/kasan/report.c:284
 print_report+0x107/0x1f0 mm/kasan/report.c:395
 kasan_report+0xcd/0x100 mm/kasan/report.c:495
 kasan_check_range+0x2a7/0x2e0 mm/kasan/generic.c:189
 memmove+0x25/0x60 mm/kasan/shadow.c:54
 ntfs_set_ea+0xcb5/0x1760 fs/ntfs3/xattr.c:336
 ntfs_save_wsl_perm+0x1f4/0x490 fs/ntfs3/xattr.c:936
 ntfs3_setattr+0x959/0xb40 fs/ntfs3/file.c:817
 notify_change+0xe50/0x1100 fs/attr.c:482
 chown_common+0x5b6/0x910 fs/open.c:736
 do_fchownat+0x165/0x240 fs/open.c:767
 __do_sys_chown fs/open.c:787 [inline]
 __se_sys_chown fs/open.c:785 [inline]
 __x64_sys_chown+0x7e/0x90 fs/open.c:785
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f474c3a07c9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdedf21528 EFLAGS: 00000246 ORIG_RAX: 000000000000005c
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f474c3a07c9
RDX: 0000000039323420 RSI: 0000000000000000 RDI: 0000000020001d80
RBP: 00007f474c360060 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f474c3600f0
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

Memory state around the buggy address:
BUG: unable to handle page fault for address: ffffed10494d90a0
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 23ffee067 P4D 23ffee067 PUD 13fff4067 PMD 0 
Oops: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 3632 Comm: syz-executor228 Not tainted 6.1.0-syzkaller-03295-g02bf43c7b7f7 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:memcpy_erms+0x6/0x10 arch/x86/lib/memcpy_64.S:56
Code: fe ff ff cc eb 1e 0f 1f 00 48 89 f8 48 89 d1 48 c1 e9 03 83 e2 07 f3 48 a5 89 d1 f3 a4 c3 66 0f 1f 44 00 00 48 89 f8 48 89 d1 <f3> a4 c3 0f 1f 80 00 00 00 00 48 89 f8 48 83 fa 20 72 7e 40 38 fe
RSP: 0018:ffffc90003b2f688 EFLAGS: 00010086
RAX: ffffc90003b2f6a0 RBX: ffff88824a6c8500 RCX: 0000000000000010
RDX: 0000000000000010 RSI: ffffed10494d90a0 RDI: ffffc90003b2f6a0
RBP: ffffc90003b2f700 R08: ffffffff8a8ea68e R09: fffff52000765ed9
R10: fffff52000765ed9 R11: 1ffff92000765ed8 R12: ffffc90003b2f6a0
R13: ffff88824a6c8580 R14: 0000000000000100 R15: ffffc90003b2f6b0
FS:  00005555559cf300(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffed10494d90a0 CR3: 00000000460de000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 print_memory_metadata mm/kasan/report.c:371 [inline]
 print_report+0x191/0x1f0 mm/kasan/report.c:396
 kasan_report+0xcd/0x100 mm/kasan/report.c:495
 kasan_check_range+0x2a7/0x2e0 mm/kasan/generic.c:189
 memmove+0x25/0x60 mm/kasan/shadow.c:54
 ntfs_set_ea+0xcb5/0x1760 fs/ntfs3/xattr.c:336
 ntfs_save_wsl_perm+0x1f4/0x490 fs/ntfs3/xattr.c:936
 ntfs3_setattr+0x959/0xb40 fs/ntfs3/file.c:817
 notify_change+0xe50/0x1100 fs/attr.c:482
 chown_common+0x5b6/0x910 fs/open.c:736
 do_fchownat+0x165/0x240 fs/open.c:767
 __do_sys_chown fs/open.c:787 [inline]
 __se_sys_chown fs/open.c:785 [inline]
 __x64_sys_chown+0x7e/0x90 fs/open.c:785
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f474c3a07c9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdedf21528 EFLAGS: 00000246 ORIG_RAX: 000000000000005c
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f474c3a07c9
RDX: 0000000039323420 RSI: 0000000000000000 RDI: 0000000020001d80
RBP: 00007f474c360060 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f474c3600f0
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Modules linked in:
CR2: ffffed10494d90a0
---[ end trace 0000000000000000 ]---
RIP: 0010:memcpy_erms+0x6/0x10 arch/x86/lib/memcpy_64.S:56
Code: fe ff ff cc eb 1e 0f 1f 00 48 89 f8 48 89 d1 48 c1 e9 03 83 e2 07 f3 48 a5 89 d1 f3 a4 c3 66 0f 1f 44 00 00 48 89 f8 48 89 d1 <f3> a4 c3 0f 1f 80 00 00 00 00 48 89 f8 48 83 fa 20 72 7e 40 38 fe
RSP: 0018:ffffc90003b2f688 EFLAGS: 00010086
RAX: ffffc90003b2f6a0 RBX: ffff88824a6c8500 RCX: 0000000000000010
RDX: 0000000000000010 RSI: ffffed10494d90a0 RDI: ffffc90003b2f6a0
RBP: ffffc90003b2f700 R08: ffffffff8a8ea68e R09: fffff52000765ed9
R10: fffff52000765ed9 R11: 1ffff92000765ed8 R12: ffffc90003b2f6a0
R13: ffff88824a6c8580 R14: 0000000000000100 R15: ffffc90003b2f6b0
FS:  00005555559cf300(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffed10494d90a0 CR3: 00000000460de000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess), 2 bytes skipped:
   0:	ff cc                	dec    %esp
   2:	eb 1e                	jmp    0x22
   4:	0f 1f 00             	nopl   (%rax)
   7:	48 89 f8             	mov    %rdi,%rax
   a:	48 89 d1             	mov    %rdx,%rcx
   d:	48 c1 e9 03          	shr    $0x3,%rcx
  11:	83 e2 07             	and    $0x7,%edx
  14:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
  17:	89 d1                	mov    %edx,%ecx
  19:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
  1b:	c3                   	retq
  1c:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  22:	48 89 f8             	mov    %rdi,%rax
  25:	48 89 d1             	mov    %rdx,%rcx
* 28:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi) <-- trapping instruction
  2a:	c3                   	retq
  2b:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  32:	48 89 f8             	mov    %rdi,%rax
  35:	48 83 fa 20          	cmp    $0x20,%rdx
  39:	72 7e                	jb     0xb9
  3b:	40 38 fe             	cmp    %dil,%sil


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
