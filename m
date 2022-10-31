Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA84E7E
	for <llvm@lists.linux.dev>; Mon, 31 Oct 2022 15:44:41 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id a13so18079604edj.0
        for <llvm@lists.linux.dev>; Mon, 31 Oct 2022 08:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8qnWhdk0VieEk7vh40EvWTR4LqDHki8+24nSogRUOBk=;
        b=AKmfodvpGGhDyczCVn0UzETDdsnhtuif8sA89BFNygohnecF4CxxpHdmxfIDUBGoeI
         4JNPGcP7IUPqjUSX4cykw42mYx44Uju1O/th/tux5SxK0JFNUykJDiAsKHswqky5Hty0
         o3LxnxwEA5/DAzMlqwM+yFEJU7Mv+JCMUuRv10NXZOb7Ao3WIAgkOClE3ZkLTnYWAWSJ
         /1vAhqVflV1v6V2piKbPOBIBOxARk1dswLFb3BSHWneKfXlmt7FXQz0MSXvwe1dM0kHH
         jQkeuE2agWCT47tCj4JpzhYp+5SqaC73275F9AIVLi9KMBNLTdiXySPeFxfKwmBW/gIp
         230g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8qnWhdk0VieEk7vh40EvWTR4LqDHki8+24nSogRUOBk=;
        b=lqSt9HiH391Uis4ACnkTrzJrLB5ABhF+zvhN4+EK8yMuYUTIiaWcmROXT96U7Fbuwb
         Q8ht1tL77PKp+Amluh89P5R6Hvbf4te0E9XErgWhL5bEagPIeLqE/Y5OouE4JR5MKlgr
         LDixGaGBBUusnMhFotEFRO/dtEDFrl5LuLjBuyaNwVneWFHo7ZTlcYl/lB2gs9uhzPiB
         /4LUsH65OcuChXwflHN2wC+36ic1fmlvpdWrgWdbxZaR39u5Kk82irm+xudAoxINMyNF
         oM0eIIz0DKsDxVkWRN+DopanteKZdDIiXbWGV/vehy9cgNlCn5IFx13Z9ZJ8YXVuHN2W
         XSng==
X-Gm-Message-State: ACrzQf0dmm7P9LPk8Xljev6QVFBaKry+wqnjaoxnCeznJXiM+1mKuCgd
	wZrz78dIJKupGwU5INHjvWcMflk91S0Iv7ps3Sc=
X-Google-Smtp-Source: AMsMyM4iTooOaldZ34X1S42+O4GreKSu6ywKipaEwi2Teo6hZUOtkY+bKKL1EcMIc2KUw7+Rp1WFYByAFgYnD9N8aKc=
X-Received: by 2002:a05:6402:f2a:b0:461:eff7:bae8 with SMTP id
 i42-20020a0564020f2a00b00461eff7bae8mr14300620eda.322.1667231080002; Mon, 31
 Oct 2022 08:44:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221030162223.25970-1-yin31149@gmail.com> <Y1/lvgHE4JKvxsi8@localhost.localdomain>
In-Reply-To: <Y1/lvgHE4JKvxsi8@localhost.localdomain>
From: Hawkins Jiawei <yin31149@gmail.com>
Date: Mon, 31 Oct 2022 23:44:28 +0800
Message-ID: <CAKrof1NNK=BAUoTb0cP+8N+68NsSRfHuJ7k47UVv_h-hW_GKGA@mail.gmail.com>
Subject: Re: [PATCH] btrfs: update bytes_may_use in btrfs_free_reserved_bytes()
To: Josef Bacik <josef@toxicpanda.com>
Cc: Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 18801353760@163.com, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	syzbot+dde7e853812ed57835ea@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Josef,

On Mon, 31 Oct 2022 at 23:12, Josef Bacik <josef@toxicpanda.com> wrote:
>
> On Mon, Oct 31, 2022 at 12:22:24AM +0800, Hawkins Jiawei wrote:
> > Syzkaller reports warning as follows:
> > =====================================
> > WARNING: CPU: 0 PID: 3612 at fs/btrfs/space-info.h:122
> >   btrfs_space_info_free_bytes_may_use fs/btrfs/space-info.h:154 [inline]
> > WARNING: CPU: 0 PID: 3612 at fs/btrfs/space-info.h:122
> >   block_rsv_release_bytes fs/btrfs/block-rsv.c:151 [inline]
> > WARNING: CPU: 0 PID: 3612 at fs/btrfs/space-info.h:122
> >   btrfs_block_rsv_release+0x5d1/0x730 fs/btrfs/block-rsv.c:295
> > Modules linked in:
> > [...]
> > RIP: 0010:btrfs_space_info_update_bytes_may_use
> >   fs/btrfs/space-info.h:122 [inline]
> > RIP: 0010:btrfs_space_info_free_bytes_may_use
> >   fs/btrfs/space-info.h:154 [inline]
> > RIP: 0010:block_rsv_release_bytes
> >   fs/btrfs/block-rsv.c:151 [inline]
> > RIP: 0010:btrfs_block_rsv_release+0x5d1/0x730
> >   fs/btrfs/block-rsv.c:295
> > [...]
> > Call Trace:
> >  <TASK>
> >  btrfs_release_global_block_rsv+0x2f/0x250 fs/btrfs/block-rsv.c:463
> >  btrfs_free_block_groups+0xb67/0xfd0 fs/btrfs/block-group.c:4053
> >  close_ctree+0x6c5/0xbde fs/btrfs/disk-io.c:4710
> >  generic_shutdown_super+0x130/0x310 fs/super.c:491
> >  kill_anon_super+0x36/0x60 fs/super.c:1085
> >  btrfs_kill_super+0x3d/0x50 fs/btrfs/super.c:2441
> >  deactivate_locked_super+0xa7/0xf0 fs/super.c:331
> >  cleanup_mnt+0x4ce/0x560 fs/namespace.c:1186
> >  task_work_run+0x146/0x1c0 kernel/task_work.c:177
> >  ptrace_notify+0x29a/0x340 kernel/signal.c:2354
> >  ptrace_report_syscall include/linux/ptrace.h:420 [inline]
> >  ptrace_report_syscall_exit include/linux/ptrace.h:482 [inline]
> >  syscall_exit_work+0x8c/0xe0 kernel/entry/common.c:249
> >  syscall_exit_to_user_mode_prepare+0x63/0xc0 kernel/entry/common.c:276
> >  __syscall_exit_to_user_mode_work kernel/entry/common.c:281 [inline]
> >  syscall_exit_to_user_mode+0xa/0x60 kernel/entry/common.c:294
> >  do_syscall_64+0x49/0xb0 arch/x86/entry/common.c:86
> >  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> >  [...]
> >  </TASK>
> > =====================================
> >
> > In btrfs_new_extent_direct(), kernel will reserves space for extent
> > by btrfs_reserve_extent(), and frees those space by
> > btrfs_free_reserved_extent() if btrfs_create_dio_extent() fails.
> >
> > Yet the problem is that, it may not update the space
> > info correctly. To be more specific, kernel will
> > converts space from ->bytes_may_use to ->bytes_reserved, in
> > btrfs_add_reserved_bytes() when reserving space.
> > But when freeing those space in btrfs_free_reserved_bytes(),
> > kernel does not convert space from ->bytes_reserved back to
> > ->bytes_may_use, which triggers the above warning.
> >
> > This patch solves it by converting space from ->bytes_reserved
> > back to ->bytes_may_use in btrfs_free_reserved_bytes().
> >
>
> This isn't correct.  I haven't looked at the code yet, but reservations go into
> ->bytes_may_use, and then when we reserve the space we subtract the reservation
> from ->bytes_may_use and add it to ->bytes_reserved.  If we free the reserved
> extent we only have to update ->bytes_reserved.  What may be happening here is
> we're failing to free the rest of our ->bytes_may_use resrvation, and that part
> needs to be addressed.  This fix as it stands however is incorrect.  Thanks,
Thanks for your explanation! I will re-analyse this bug in the way you
suggested.

>
> Josef
