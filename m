Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56116648
	for <llvm@lists.linux.dev>; Thu, 13 Apr 2023 04:24:42 +0000 (UTC)
Received: by mail-il1-f206.google.com with SMTP id b9-20020a923409000000b00326156e3a8bso3378335ila.3
        for <llvm@lists.linux.dev>; Wed, 12 Apr 2023 21:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681359881; x=1683951881;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lPLBYJZCaSbvGJr6SFGCV+03ZFiIAG6k72Q9uMQoEvI=;
        b=lQT0keSy3Ezw65NmY5OxT3fs1KECeCqAFVRqDFB53eJHvGKrtl+1XaT5od/R6QFkvN
         XEho4LWoPldKDP4kWDUp0dCdYwYtoF7wu1dzKCH2D49rtdE/4nssmszljLewqYUeX0oZ
         eGbro0xL/1OL68JqdMQsmeBkpmrY3kQudng6l7DjQhwj0MaJ/BhqInlDaxYabybDhQcZ
         6CNXjuUte4r3hBSCiEn1ERwG0SDEEQTKLmqSfiEp6QrMV3yIjIjSaE5GYcRNllku2gkC
         uk2clYoYpnECo55o6zX65xLF4N+fiGX2pCztHGsWVZ2GJDeNAWuWVPcwlOZ2lKmGCV7/
         CfPA==
X-Gm-Message-State: AAQBX9d9lf1z3gJsAwUEh9SxmPCnWMTrS88BoDfpT7emiKhZwAqI84Jw
	bQ1Hk4QUtfQndBQMRSfwb8/n9mOt/jlNQn5adm1gU/j9/3ca
X-Google-Smtp-Source: AKy350an4a6gao3vrP+GzViBgy1z7wGEjpvaG+UrUfB4G/F3m36OvoxO1OC5JXju3jdtNaCO1LVB8BtRLGRL6zZVePhENaCxKMq+
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:7314:0:b0:3f6:657a:e922 with SMTP id
 y20-20020a027314000000b003f6657ae922mr138404jab.5.1681359881464; Wed, 12 Apr
 2023 21:24:41 -0700 (PDT)
Date: Wed, 12 Apr 2023 21:24:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000079737805f9301a86@google.com>
Subject: [syzbot] [ntfs3?] INFO: trying to register non-static key in ntfs3_setattr
From: syzbot <syzbot+2bc11770a01ccf77388f@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, nathan@kernel.org, 
	ndesaulniers@google.com, ntfs3@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a79d5c76f705 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1646f4adc80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5666fa6aca264e42
dashboard link: https://syzkaller.appspot.com/bug?extid=2bc11770a01ccf77388f
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/adf61ecd5810/disk-a79d5c76.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8192876ea15a/vmlinux-a79d5c76.xz
kernel image: https://storage.googleapis.com/syzbot-assets/80c6e54ddbe7/bzImage-a79d5c76.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2bc11770a01ccf77388f@syzkaller.appspotmail.com

ntfs3: loop3: ino=0, ntfs_iget5
INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 1 PID: 18325 Comm: syz-executor.3 Not tainted 6.3.0-rc5-syzkaller-00202-ga79d5c76f705 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/30/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
 assign_lock_key+0x222/0x230 kernel/locking/lockdep.c:982
 register_lock_class+0x28e/0x990 kernel/locking/lockdep.c:1295
 __lock_acquire+0xd3/0x1f80 kernel/locking/lockdep.c:4935
 lock_acquire+0x1e1/0x520 kernel/locking/lockdep.c:5669
 down_write+0x3a/0x50 kernel/locking/rwsem.c:1573
 ntfs_truncate fs/ntfs3/file.c:397 [inline]
 ntfs3_setattr+0x53a/0xb80 fs/ntfs3/file.c:696
 notify_change+0xc8b/0xf40 fs/attr.c:482
 do_truncate+0x220/0x300 fs/open.c:66
 handle_truncate fs/namei.c:3219 [inline]
 do_open fs/namei.c:3564 [inline]
 path_openat+0x294e/0x3170 fs/namei.c:3715
 do_file_open_root+0x376/0x7c0 fs/namei.c:3767
 file_open_root+0x247/0x2a0 fs/open.c:1328
 do_handle_open+0x582/0x960 fs/fhandle.c:232
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7ff798c8c169
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff799a61168 EFLAGS: 00000246 ORIG_RAX: 0000000000000130
RAX: ffffffffffffffda RBX: 00007ff798dabf80 RCX: 00007ff798c8c169
RDX: 0000000000000300 RSI: 0000000020000040 RDI: 0000000000000004
RBP: 00007ff798ce7ca1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffe1d3f0f7f R14: 00007ff799a61300 R15: 0000000000022000
 </TASK>
------------[ cut here ]------------
DEBUG_RWSEMS_WARN_ON(sem->magic != sem): count = 0x1, magic = 0x0, owner = 0xffff88801c879d40, curr 0xffff88801c879d40, list not empty
WARNING: CPU: 0 PID: 18325 at kernel/locking/rwsem.c:1364 __up_write kernel/locking/rwsem.c:1364 [inline]
WARNING: CPU: 0 PID: 18325 at kernel/locking/rwsem.c:1364 up_write+0x40a/0x580 kernel/locking/rwsem.c:1626
Modules linked in:
CPU: 0 PID: 18325 Comm: syz-executor.3 Not tainted 6.3.0-rc5-syzkaller-00202-ga79d5c76f705 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/30/2023
RIP: 0010:__up_write kernel/locking/rwsem.c:1364 [inline]
RIP: 0010:up_write+0x40a/0x580 kernel/locking/rwsem.c:1626
Code: 48 c7 c7 e0 71 ea 8a 48 c7 c6 80 73 ea 8a 48 89 da 48 8b 4c 24 20 4c 8b 44 24 30 4c 8b 4c 24 28 50 e8 5a f9 e8 ff 48 83 c4 08 <0f> 0b e9 c0 fc ff ff 0f 0b e9 36 fd ff ff 48 89 5c 24 30 c6 05 0c
RSP: 0018:ffffc900163874c0 EFLAGS: 00010296
RAX: 2c2e1a283ac27d00 RBX: 0000000000000001 RCX: 0000000000040000
RDX: ffffc90003d71000 RSI: 000000000003ffff RDI: 0000000000040000
RBP: ffffc90016387590 R08: ffffffff81528012 R09: fffff52002c70e51
R10: 0000000000000000 R11: dffffc0000000001 R12: ffff8880739717b8
R13: ffff888073971760 R14: 1ffff92002c70ea0 R15: dffffc0000000000
FS:  00007ff799a61700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555556344708 CR3: 000000002ac7c000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ntfs_truncate fs/ntfs3/file.c:400 [inline]
 ntfs3_setattr+0x5e9/0xb80 fs/ntfs3/file.c:696
 notify_change+0xc8b/0xf40 fs/attr.c:482
 do_truncate+0x220/0x300 fs/open.c:66
 handle_truncate fs/namei.c:3219 [inline]
 do_open fs/namei.c:3564 [inline]
 path_openat+0x294e/0x3170 fs/namei.c:3715
 do_file_open_root+0x376/0x7c0 fs/namei.c:3767
 file_open_root+0x247/0x2a0 fs/open.c:1328
 do_handle_open+0x582/0x960 fs/fhandle.c:232
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7ff798c8c169
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff799a61168 EFLAGS: 00000246 ORIG_RAX: 0000000000000130
RAX: ffffffffffffffda RBX: 00007ff798dabf80 RCX: 00007ff798c8c169
RDX: 0000000000000300 RSI: 0000000020000040 RDI: 0000000000000004
RBP: 00007ff798ce7ca1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffe1d3f0f7f R14: 00007ff799a61300 R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
