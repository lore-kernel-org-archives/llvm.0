Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0412F2D
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 08:39:23 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id bb13-20020a056602380d00b006849ed2e8a2so5576811iob.0
        for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 01:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc;
        bh=3F94oICmWCDWUulfqYiU++BfIXaXsChc7TIeYe2T9OI=;
        b=o20dUGR6qmzLfJfGuak87yOxXfDHH2O8iMfR5o0GzWlupqxZ2kYZnHwoBD7D+vAbjY
         kSLPK8vLgTggXxEPe5Mbqw0pZOeuPYZMzVntn8LJXLGAHqoF51vRLYMackLQ9Xompcsq
         AiR1+ENXcjuBf0Z1W2Sc5WTvqXJHAG1xPhi6WJ76O08UEzGeEAnOZh5s4Y6ksKdGJBsW
         6T84ddYgyYg0zl+40oLpE40o8vbpi26x8E8MWzlZRe7hu30C2/4bIh7psrxOrM6Du+j/
         Ik+DIQ+Ybf6QD+/ydIoZN/l7eisgyjiDlOnwrjfKgPwr8aPnsH3L+kQM+sW0tP1HV6TZ
         oe0g==
X-Gm-Message-State: ACgBeo2yhW8UPlSGx7bzOi7ueGmDnpYFOsKTlphu1P7MAgZftG2rFowD
	XDWfzcCvK2b1coXad+rICsNzhERngzfT2nka159x0fG4I5hj
X-Google-Smtp-Source: AA6agR68w5QeoJEHatLxiQsYYVW/IqV+vOr/RfxLHn375quqwzYIaWdjiAyFEulGSEhIfYMHi1iZNZvM0nrDuYG+euMzh2BbyrlG
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:8e1:b0:2e3:34cf:2519 with SMTP id
 n1-20020a056e0208e100b002e334cf2519mr9529574ilt.70.1660639162545; Tue, 16 Aug
 2022 01:39:22 -0700 (PDT)
Date: Tue, 16 Aug 2022 01:39:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000623d9a05e657af56@google.com>
Subject: [syzbot] upstream boot error: WARNING: locking bug in __anon_vma_prepare
From: syzbot <syzbot+80f7b10866c848183bb6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4a9350597aff Merge tag 'sound-fix-6.0-rc1' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=106daf73080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4757943c2b26daff
dashboard link: https://syzkaller.appspot.com/bug?extid=80f7b10866c848183bb6
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+80f7b10866c848183bb6@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(1)
WARNING: CPU: 0 PID: 1099 at kernel/locking/lockdep.c:231 check_wait_context kernel/locking/lockdep.c:4727 [inline]
WARNING: CPU: 0 PID: 1099 at kernel/locking/lockdep.c:231 __lock_acquire+0xac2/0x1f60 kernel/locking/lockdep.c:5003
Modules linked in:
CPU: 0 PID: 1099 Comm: kworker/u4:5 Not tainted 5.19.0-syzkaller-14090-g4a9350597aff #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
RIP: 0010:hlock_class kernel/locking/lockdep.c:231 [inline]
RIP: 0010:check_wait_context kernel/locking/lockdep.c:4727 [inline]
RIP: 0010:__lock_acquire+0xac2/0x1f60 kernel/locking/lockdep.c:5003
Code: bc 0c 00 0f 85 2b fa ff ff 31 db 48 c7 c7 60 74 ad 8a 48 c7 c6 00 77 ad 8a 31 c0 e8 98 12 e8 ff 48 ba 00 00 00 00 00 fc ff df <0f> 0b e9 25 fa ff ff e8 22 c7 c8 02 85 c0 0f 84 b1 06 00 00 48 c7
RSP: 0000:ffffc9000468f528 EFLAGS: 00010046
RAX: cd292025beaed200 RBX: 0000000000000000 RCX: ffff888020338000
RDX: dffffc0000000000 RSI: 0000000080000001 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff816d56dd R09: fffff520008d1e21
R10: fffff520008d1e21 R11: 1ffff920008d1e20 R12: 0000000000040000
R13: ffff888020338000 R14: 00000000000413c1 R15: ffff888020338ae8
FS:  0000000000000000(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffff88823ffff000 CR3: 000000000ca8e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 lock_acquire+0x1a7/0x400 kernel/locking/lockdep.c:5666
 __raw_spin_lock include/linux/spinlock_api_smp.h:133 [inline]
 _raw_spin_lock+0x2a/0x40 kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:349 [inline]
 __anon_vma_prepare+0x198/0x400 mm/rmap.c:209
 anon_vma_prepare include/linux/rmap.h:156 [inline]
 do_anonymous_page+0xe4e/0x1150 mm/memory.c:4082
 handle_pte_fault mm/memory.c:4909 [inline]
 __handle_mm_fault mm/memory.c:5053 [inline]
 handle_mm_fault+0x186b/0x35c0 mm/memory.c:5151
 faultin_page mm/gup.c:955 [inline]
 __get_user_pages+0x516/0x1230 mm/gup.c:1195
 __get_user_pages_locked mm/gup.c:1399 [inline]
 __get_user_pages_remote+0x1c2/0x750 mm/gup.c:2109
 get_arg_page fs/exec.c:222 [inline]
 copy_string_kernel+0x286/0x510 fs/exec.c:639
 kernel_execve+0x5cb/0xa00 fs/exec.c:1993
 call_usermodehelper_exec_async+0x262/0x3b0 kernel/umh.c:112
 ret_from_fork+0x1f/0x30
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
