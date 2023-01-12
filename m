Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7BD2107
	for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 10:14:41 +0000 (UTC)
Received: by mail-io1-f70.google.com with SMTP id 4-20020a6b1404000000b00704700d919cso2350209iou.11
        for <llvm@lists.linux.dev>; Thu, 12 Jan 2023 02:14:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/ffKwcw5ZgbeDcmL5RENp/3vP2DgASRiUsaB0SqWDY=;
        b=dgQVY2iawmWGT/IsRoK4cUOw1pbDHnenzrsZefxi4Eo3PbcnecxqKmFxk552eKlb35
         80teyMaOn1DYJKLhCA/sxJdpwCnK+WPkwDLkt1nrIURmOQZOd/TPXt0rDgdsJVFyR/4f
         iwH5jQe3bDPJXKGkaKO3t68LjnEZd3upYDaBGAN9IjbVJEOCu8iAiFVGeOaRLK1EOglI
         oZORSVxVAhuK0jlWvX1IxT2RDr76rErtAOtGujlNXIbHWQb/3q6vJaVKgDuATb7IqAeM
         ohY9jpN82LAsyHiOY3R2LKdzt+cYc8yxumQeXDwDC3u00fm0UT3/HeNtTDQXnknDjcQs
         lCHw==
X-Gm-Message-State: AFqh2kpEqBhFp9pgtxkW/2VnbIvB0ZljI0OV1t4ADpiKLYQeWLeRM66j
	sZJwPp3LZERbjdFBV8h0V8dFvXRS79EfDdO/Isqz/OaEtiJI
X-Google-Smtp-Source: AMrXdXvYJAHCDzdQTjTsg1piUN6z3YhSErfrovP09SrrZAHPhIMTSS98eLmtpr9VTgOyRwQGFCCdKjAdbr7p5QneR9KtuiqTZfeT
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:9f08:0:b0:39e:7e02:3df8 with SMTP id
 z8-20020a029f08000000b0039e7e023df8mr2528007jal.229.1673518480933; Thu, 12
 Jan 2023 02:14:40 -0800 (PST)
Date: Thu, 12 Jan 2023 02:14:40 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000094c91b05f20e62c7@google.com>
Subject: [syzbot] [ntfs3?] WARNING: nested lock was not taken in ntfs_set_size
From: syzbot <syzbot+0202624e9a537f906f92@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    72a85e2b0a1e Merge tag 'spi-fix-v6.2-rc1' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=177989f8480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85327a149d5f50f
dashboard link: https://syzkaller.appspot.com/bug?extid=0202624e9a537f906f92
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dd8c11f35e8b/disk-72a85e2b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0c0edcae076b/vmlinux-72a85e2b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/99b7e1cca0d9/bzImage-72a85e2b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0202624e9a537f906f92@syzkaller.appspotmail.com

==================================
WARNING: Nested lock was not taken
6.1.0-syzkaller-14594-g72a85e2b0a1e #0 Not tainted
----------------------------------
syz-executor.1/17928 is trying to lock:
ffff8880734df700 (&ni->ni_lock/4){+.+.}-{3:3}, at: ni_lock fs/ntfs3/ntfs_fs.h:1122 [inline]
ffff8880734df700 (&ni->ni_lock/4){+.+.}-{3:3}, at: ntfs_set_size+0x113/0x220 fs/ntfs3/inode.c:820

but this task is not holding:
general protection fault, probably for non-canonical address 0xdffffc0000000003: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
CPU: 1 PID: 17928 Comm: syz-executor.1 Not tainted 6.1.0-syzkaller-14594-g72a85e2b0a1e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:print_lock_nested_lock_not_held kernel/locking/lockdep.c:4887 [inline]
RIP: 0010:__lock_acquire.cold+0xc5/0x3a7 kernel/locking/lockdep.c:5046
Code: 03 80 3c 02 00 74 0a 48 8b 7c 24 48 e8 86 ad 0f f8 49 8b 5c 24 18 b8 ff ff 37 00 48 c1 e0 2a 48 8d 7b 18 48 89 fa 48 c1 ea 03 <80> 3c 02 00 74 05 e8 62 ad 0f f8 48 8b 73 18 48 c7 c7 c0 7b 4c 8a
RSP: 0018:ffffc9000a9e7230 EFLAGS: 00010016
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000003 RSI: ffffffff8166721c RDI: 0000000000000018
RBP: ffff88802bfbd7c0 R08: 000000000000001e R09: 0000000000000000
R10: 0000000080000001 R11: 7369687420747562 R12: ffff88802bfbe248
R13: ffff88802bfbd7c0 R14: ffffed10057f7c3e R15: 0000000000000000
FS:  00007fcabe825700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3d1d4cc000 CR3: 0000000078dbf000 CR4: 0000000000350ee0
Call Trace:
 <TASK>
 lock_acquire kernel/locking/lockdep.c:5668 [inline]
 lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
 __mutex_lock_common kernel/locking/mutex.c:603 [inline]
 __mutex_lock+0x12f/0x1360 kernel/locking/mutex.c:747
 ni_lock fs/ntfs3/ntfs_fs.h:1122 [inline]
 ntfs_set_size+0x113/0x220 fs/ntfs3/inode.c:820
 ntfs_extend+0x4ac/0x5c0 fs/ntfs3/file.c:337
 ntfs_file_write_iter+0x34b/0x1d70 fs/ntfs3/file.c:1064
 call_write_iter include/linux/fs.h:2186 [inline]
 do_iter_readv_writev+0x20b/0x3b0 fs/read_write.c:735
 do_iter_write+0x182/0x700 fs/read_write.c:861
 vfs_iter_write+0x74/0xa0 fs/read_write.c:902
 iter_file_splice_write+0x745/0xc90 fs/splice.c:686
 do_splice_from fs/splice.c:764 [inline]
 direct_splice_actor+0x114/0x180 fs/splice.c:931
 splice_direct_to_actor+0x335/0x8a0 fs/splice.c:886
 do_splice_direct+0x1ab/0x280 fs/splice.c:974
 do_sendfile+0xb19/0x1270 fs/read_write.c:1255
 __do_sys_sendfile64 fs/read_write.c:1323 [inline]
 __se_sys_sendfile64 fs/read_write.c:1309 [inline]
 __x64_sys_sendfile64+0x1d0/0x210 fs/read_write.c:1309
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fcabda8c0a9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fcabe825168 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007fcabdbac050 RCX: 00007fcabda8c0a9
RDX: 0000000000000000 RSI: 000000000000000a RDI: 0000000000000009
RBP: 00007fcabdae7ae9 R08: 0000000000000000 R09: 0000000000000000
R10: 000080001d00c0d0 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fffe41ceeef R14: 00007fcabe825300 R15: 0000000000022000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:print_lock_nested_lock_not_held kernel/locking/lockdep.c:4887 [inline]
RIP: 0010:__lock_acquire.cold+0xc5/0x3a7 kernel/locking/lockdep.c:5046
Code: 03 80 3c 02 00 74 0a 48 8b 7c 24 48 e8 86 ad 0f f8 49 8b 5c 24 18 b8 ff ff 37 00 48 c1 e0 2a 48 8d 7b 18 48 89 fa 48 c1 ea 03 <80> 3c 02 00 74 05 e8 62 ad 0f f8 48 8b 73 18 48 c7 c7 c0 7b 4c 8a
RSP: 0018:ffffc9000a9e7230 EFLAGS: 00010016
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000003 RSI: ffffffff8166721c RDI: 0000000000000018
RBP: ffff88802bfbd7c0 R08: 000000000000001e R09: 0000000000000000
R10: 0000000080000001 R11: 7369687420747562 R12: ffff88802bfbe248
R13: ffff88802bfbd7c0 R14: ffffed10057f7c3e R15: 0000000000000000
FS:  00007fcabe825700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f3d1d4cc000 CR3: 0000000078dbf000 CR4: 0000000000350ee0
----------------
Code disassembly (best guess):
   0:	03 80 3c 02 00 74    	add    0x7400023c(%rax),%eax
   6:	0a 48 8b             	or     -0x75(%rax),%cl
   9:	7c 24                	jl     0x2f
   b:	48 e8 86 ad 0f f8    	callq  0xf80fad97
  11:	49 8b 5c 24 18       	mov    0x18(%r12),%rbx
  16:	b8 ff ff 37 00       	mov    $0x37ffff,%eax
  1b:	48 c1 e0 2a          	shl    $0x2a,%rax
  1f:	48 8d 7b 18          	lea    0x18(%rbx),%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	74 05                	je     0x35
  30:	e8 62 ad 0f f8       	callq  0xf80fad97
  35:	48 8b 73 18          	mov    0x18(%rbx),%rsi
  39:	48 c7 c7 c0 7b 4c 8a 	mov    $0xffffffff8a4c7bc0,%rdi


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
