Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D492F1850
	for <llvm@lists.linux.dev>; Sun, 13 Nov 2022 15:36:29 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id p10-20020a9d76ca000000b0066d6c6bce58so2342154otl.7
        for <llvm@lists.linux.dev>; Sun, 13 Nov 2022 07:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8jMpH0slBrBteGul7kGoeVvlEd2fVZdAF3SawMaAYyA=;
        b=A7+qFJsHdmaTkQjct4bPYiP1EBxPhyVI3l4w1W3mNJRZnYEBccqdkdt2BEmRC1um6C
         F0KZeoa1vgbUOyQ9s0684oMooCTM/rKdDGrZLz3GOz2LSumzisy4hdGsGJEilllbux92
         G+4shJ16+RoZ7h1JbSm5Iq3KwWY8dU0vAcDXVczf2B0dZxMIRfw9aBOTlUC6VUTpplyZ
         Uyl0ceCufcYVEPmsjx743/BztUfE/rqJsgOnDG9iT4xyIEuixUJdLbKJO4PR5B3E6ev3
         fiPgrRLqVFwbShMByEn2s8aaHZbEHawvDMO1t1bWHqAmFHCN+2KtHX0ct2vHK0ipTPXG
         K/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jMpH0slBrBteGul7kGoeVvlEd2fVZdAF3SawMaAYyA=;
        b=59TOAWzWV9MsDMHvbhsDH+WQ09GCNWLt8MkGJLfeSrLWg2qU9m1XJ6J+9QKAj84wsc
         YEi6QRLoFdJK2EAHCZWLQuE0rtYKO3/fXNcs+kYOHoNNQ2dn4xWzxzNZ+UfpfDNNVxL+
         39tHdv8POhrIarruAb2Lj+5btw0K+210XDVAovrP7W5vuTGk/66c1a7dK0z2nIB/KMk4
         E6G2Uq++2VRAK0XZ08rXSRbVprHKxAwFbwc6xUl6vgllOvwsM11d6Lj86GVFyGIv9+v/
         dOcRH/qFbVbUU3KPTtbJD2yLopIOKfDnbuHmwYwABc/bUVHzJJQESdl6kOwBwZ0JA8ng
         BT1w==
X-Gm-Message-State: ANoB5pk6iTG5Llajkc8wGNrXOjUUgH7mGbWeb+wiXaqG/f8UzBrp/uXd
	jUy2oYXmOiNy44VCC7Pee3YxnfiM2Ck8jmofKFXVuA==
X-Google-Smtp-Source: AA0mqf5bLKtyaYTWgmP4QZuu+IPsXw11SKDzmD0UeA3oJYTjOMtbFPFd2asSukKUsXZiwqYaCOhaU/WjQaggAymhR+g=
X-Received: by 2002:a05:6830:43:b0:66c:9e9a:1f82 with SMTP id
 d3-20020a056830004300b0066c9e9a1f82mr4652871otp.269.1668353788556; Sun, 13
 Nov 2022 07:36:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0000000000009586e205ed4679f4@google.com>
In-Reply-To: <0000000000009586e205ed4679f4@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Sun, 13 Nov 2022 16:36:17 +0100
Message-ID: <CACT4Y+apC6o7jB+nbsZiUua=P76vAT7wVK4GeCfM-hVtWj=scg@mail.gmail.com>
Subject: Re: [syzbot] WARNING: locking bug in hugetlb_no_page
To: syzbot <syzbot+d07c65298d2c15eafcb0@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, llvm@lists.linux.dev, mike.kravetz@oracle.com, 
	nathan@kernel.org, ndesaulniers@google.com, songmuchun@bytedance.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com, 
	Hillf Danton <hdanton@sina.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 12 Nov 2022 at 15:03, syzbot
<syzbot+d07c65298d2c15eafcb0@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    1621b6eaebf7 Merge branch 'for-next/fixes' into for-kernelci
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=13bd511e880000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=606e57fd25c5c6cc
> dashboard link: https://syzkaller.appspot.com/bug?extid=d07c65298d2c15eafcb0
> compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13315856880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=173614d1880000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/82aa7741098d/disk-1621b6ea.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/f6be08c4e4c2/vmlinux-1621b6ea.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/296b6946258a/Image-1621b6ea.gz.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+d07c65298d2c15eafcb0@syzkaller.appspotmail.com

This may have the same root cause as:

possible deadlock in hugetlb_fault
https://lore.kernel.org/all/CACT4Y+ZWNV6ApzEv0UrsF2T8JWmXez_-H-EGMii-S_2JbXv07Q@mail.gmail.com/

and there is a potential explanation as to what may be the problem.

> ------------[ cut here ]------------
> DEBUG_LOCKS_WARN_ON(!test_bit(class_idx, lock_classes_in_use))
> WARNING: CPU: 1 PID: 3290 at kernel/locking/lockdep.c:5025 __lock_acquire+0x2758/0x3084
> Modules linked in:
> CPU: 1 PID: 3290 Comm: syz-executor317 Not tainted 6.1.0-rc4-syzkaller-31872-g1621b6eaebf7 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
> pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : __lock_acquire+0x2758/0x3084
> lr : __lock_acquire+0x2754/0x3084 kernel/locking/lockdep.c:5025
> sp : ffff800012e3b3e0
> x29: ffff800012e3b4c0 x28: 0000000000000001 x27: ffff0000cb891a68
> x26: ffff0000cb892450 x25: ffff0000cb892470 x24: ffff0000cb892470
> x23: 00000000000000c0 x22: 0000000000000001 x21: 0000000000000000
> x20: ffff0000cb891a40 x19: aaaaaa0000fb22ca x18: 0000000000000358
> x17: ffff80000c04d83c x16: 0000000000000000 x15: 0000000000000000
> x14: 0000000000000000 x13: 0000000000000012 x12: ffff80000d86ff30
> x11: ff808000081c06c8 x10: 0000000000000000 x9 : ddc86c2f228f9600
> x8 : ddc86c2f228f9600 x7 : 4e5241575f534b43 x6 : ffff80000c01775c
> x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
> x2 : 0000000000000000 x1 : 0000000100000000 x0 : 0000000000000000
> Call trace:
>  __lock_acquire+0x2758/0x3084
>  reacquire_held_locks+0x120/0x1c0 kernel/locking/lockdep.c:5193
>  __lock_release kernel/locking/lockdep.c:5382 [inline]
>  lock_release+0x148/0x2b4 kernel/locking/lockdep.c:5688
>  __mutex_unlock_slowpath+0x44/0x1cc kernel/locking/mutex.c:907
>  mutex_unlock+0x24/0x30 kernel/locking/mutex.c:543
>  hugetlb_no_page+0x284/0xe1c mm/hugetlb.c:5771
>  hugetlb_fault+0x3a0/0xdfc mm/hugetlb.c:5874
>  handle_mm_fault+0x904/0xa48 mm/memory.c:5216
>  __do_page_fault arch/arm64/mm/fault.c:506 [inline]
>  do_page_fault+0x428/0x79c arch/arm64/mm/fault.c:606
>  do_translation_fault+0x78/0x194 arch/arm64/mm/fault.c:689
>  do_mem_abort+0x54/0x130 arch/arm64/mm/fault.c:825
>  el1_abort+0x3c/0x5c arch/arm64/kernel/entry-common.c:367
>  el1h_64_sync_handler+0x60/0xac arch/arm64/kernel/entry-common.c:427
>  el1h_64_sync+0x64/0x68 arch/arm64/kernel/entry.S:579
>  __arch_copy_from_user+0x24/0x1f4 arch/arm64/lib/copy_from_user.S:77
>  __import_iovec+0x60/0x248 lib/iov_iter.c:1773
>  import_iovec+0x6c/0x88 lib/iov_iter.c:1838
>  vfs_writev fs/read_write.c:931 [inline]
>  do_writev+0xf8/0x234 fs/read_write.c:977
>  __do_sys_writev fs/read_write.c:1050 [inline]
>  __se_sys_writev fs/read_write.c:1047 [inline]
>  __arm64_sys_writev+0x28/0x38 fs/read_write.c:1047
>  __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
>  invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
>  el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
>  do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
>  el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
>  el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
>  el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
> irq event stamp: 941
> hardirqs last  enabled at (941): [<ffff80000c01c86c>] __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
> hardirqs last  enabled at (941): [<ffff80000c01c86c>] _raw_spin_unlock_irq+0x3c/0x70 kernel/locking/spinlock.c:202
> hardirqs last disabled at (940): [<ffff80000c01c66c>] __raw_spin_lock_irq include/linux/spinlock_api_smp.h:117 [inline]
> hardirqs last disabled at (940): [<ffff80000c01c66c>] _raw_spin_lock_irq+0x34/0x9c kernel/locking/spinlock.c:170
> softirqs last  enabled at (744): [<ffff80000801c38c>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
> softirqs last disabled at (742): [<ffff80000801c358>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
> ---[ end trace 0000000000000000 ]---
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this issue, for details see:
> https://goo.gl/tpsmEJ#testing-patches
