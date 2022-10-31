Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5AF7E
	for <llvm@lists.linux.dev>; Mon, 31 Oct 2022 15:12:01 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id s20so1329942qkg.5
        for <llvm@lists.linux.dev>; Mon, 31 Oct 2022 08:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h27W0FT/ugzBLrc16eV9CQNjbwVdmAY1+AcTMKKACFg=;
        b=CEkDu6tl0j48q3IJbmrZqErAeQc9k4pQh9oCFC94BWFr0g1V1n/GnkXKvg58WmJiWn
         iyfOaRmlMRu83gNUJzUMLUnuSZKPkDBZ5hv+q9wlkiNUc2UQQX25bYyogM22kXo0e9YZ
         CcXZ2y2lKrIiDXgWld6T8n6jBLXY4jSgHVma4aDUy0Q7cGbcoPYj4y1TN+uiuPL7sGL8
         +I6kAg8aLm97kEL/wsxd14eJO5932uwMiSHPhwFMg8SkoAP0GX0qmD8RNfdKmeTsfVtk
         FEyQmGB0/P2kngaRoVWwnGe//uXRvkTbzJiaSPkhBCvs/2D5zorcxBgSDGZrxlj1Usrx
         13VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h27W0FT/ugzBLrc16eV9CQNjbwVdmAY1+AcTMKKACFg=;
        b=jAHV+miJ0kg/Aaegyzd0sUA1wxk5bk/v7mx6YQwQQsV/imx4o1eSjZnT0R0mgFqZa+
         fF7P4TL/KPPTnChsJ2ExOG0W7uo7sZ3RW55igaORGkE+LuZJnVuu86bY3Cz0FyrMwCtL
         Muq4UWaWLBQdLqHhE3Y2glVN49qU4QqU839wvvhyAnazVCE2TatQi2ZPQMMUNVl/uOZy
         iCKmzF2NPztcNBLYE+iBeLNiwNaWje1iU8U3dSNnPC2Ta0qaG7D7IBxZYGthHFO3wPQT
         t1ZNof2uRxob2RiNvqPxIxqm7/HaHFkkthWHu73/YHfgEvZ0gp5IiipKlWU9BtMckx1c
         +/MA==
X-Gm-Message-State: ACrzQf1Z+agqV6fQJw9v+ARn7KVFpcnBVGg8rmBv6ejUwV1P1fcX2d4k
	1Cc+PeObKGpdDrupqB1fDx3RyQ==
X-Google-Smtp-Source: AMsMyM7H17pBtcUq6Yq1CZY0M19fhsLhOiJFk6Pqta7tCC+NpZwc8p4bd5EEpUfpyGuQGritATK85Q==
X-Received: by 2002:a05:620a:2403:b0:6ee:c92c:c292 with SMTP id d3-20020a05620a240300b006eec92cc292mr9541689qkn.395.1667229119975;
        Mon, 31 Oct 2022 08:11:59 -0700 (PDT)
Received: from localhost (cpe-174-109-170-245.nc.res.rr.com. [174.109.170.245])
        by smtp.gmail.com with ESMTPSA id d14-20020a05620a240e00b006e07228ed53sm4904371qkn.18.2022.10.31.08.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 08:11:59 -0700 (PDT)
Date: Mon, 31 Oct 2022 11:11:58 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Hawkins Jiawei <yin31149@gmail.com>
Cc: Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
	18801353760@163.com, linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	nathan@kernel.org, ndesaulniers@google.com,
	syzbot+dde7e853812ed57835ea@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com, trix@redhat.com
Subject: Re: [PATCH] btrfs: update bytes_may_use in
 btrfs_free_reserved_bytes()
Message-ID: <Y1/lvgHE4JKvxsi8@localhost.localdomain>
References: <20221030162223.25970-1-yin31149@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221030162223.25970-1-yin31149@gmail.com>

On Mon, Oct 31, 2022 at 12:22:24AM +0800, Hawkins Jiawei wrote:
> Syzkaller reports warning as follows:
> =====================================
> WARNING: CPU: 0 PID: 3612 at fs/btrfs/space-info.h:122
>   btrfs_space_info_free_bytes_may_use fs/btrfs/space-info.h:154 [inline]
> WARNING: CPU: 0 PID: 3612 at fs/btrfs/space-info.h:122
>   block_rsv_release_bytes fs/btrfs/block-rsv.c:151 [inline]
> WARNING: CPU: 0 PID: 3612 at fs/btrfs/space-info.h:122
>   btrfs_block_rsv_release+0x5d1/0x730 fs/btrfs/block-rsv.c:295
> Modules linked in:
> [...]
> RIP: 0010:btrfs_space_info_update_bytes_may_use
>   fs/btrfs/space-info.h:122 [inline]
> RIP: 0010:btrfs_space_info_free_bytes_may_use
>   fs/btrfs/space-info.h:154 [inline]
> RIP: 0010:block_rsv_release_bytes
>   fs/btrfs/block-rsv.c:151 [inline]
> RIP: 0010:btrfs_block_rsv_release+0x5d1/0x730
>   fs/btrfs/block-rsv.c:295
> [...]
> Call Trace:
>  <TASK>
>  btrfs_release_global_block_rsv+0x2f/0x250 fs/btrfs/block-rsv.c:463
>  btrfs_free_block_groups+0xb67/0xfd0 fs/btrfs/block-group.c:4053
>  close_ctree+0x6c5/0xbde fs/btrfs/disk-io.c:4710
>  generic_shutdown_super+0x130/0x310 fs/super.c:491
>  kill_anon_super+0x36/0x60 fs/super.c:1085
>  btrfs_kill_super+0x3d/0x50 fs/btrfs/super.c:2441
>  deactivate_locked_super+0xa7/0xf0 fs/super.c:331
>  cleanup_mnt+0x4ce/0x560 fs/namespace.c:1186
>  task_work_run+0x146/0x1c0 kernel/task_work.c:177
>  ptrace_notify+0x29a/0x340 kernel/signal.c:2354
>  ptrace_report_syscall include/linux/ptrace.h:420 [inline]
>  ptrace_report_syscall_exit include/linux/ptrace.h:482 [inline]
>  syscall_exit_work+0x8c/0xe0 kernel/entry/common.c:249
>  syscall_exit_to_user_mode_prepare+0x63/0xc0 kernel/entry/common.c:276
>  __syscall_exit_to_user_mode_work kernel/entry/common.c:281 [inline]
>  syscall_exit_to_user_mode+0xa/0x60 kernel/entry/common.c:294
>  do_syscall_64+0x49/0xb0 arch/x86/entry/common.c:86
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
>  [...]
>  </TASK>
> =====================================
> 
> In btrfs_new_extent_direct(), kernel will reserves space for extent
> by btrfs_reserve_extent(), and frees those space by
> btrfs_free_reserved_extent() if btrfs_create_dio_extent() fails.
> 
> Yet the problem is that, it may not update the space
> info correctly. To be more specific, kernel will
> converts space from ->bytes_may_use to ->bytes_reserved, in
> btrfs_add_reserved_bytes() when reserving space.
> But when freeing those space in btrfs_free_reserved_bytes(),
> kernel does not convert space from ->bytes_reserved back to
> ->bytes_may_use, which triggers the above warning.
> 
> This patch solves it by converting space from ->bytes_reserved
> back to ->bytes_may_use in btrfs_free_reserved_bytes().
> 

This isn't correct.  I haven't looked at the code yet, but reservations go into
->bytes_may_use, and then when we reserve the space we subtract the reservation
from ->bytes_may_use and add it to ->bytes_reserved.  If we free the reserved
extent we only have to update ->bytes_reserved.  What may be happening here is
we're failing to free the rest of our ->bytes_may_use resrvation, and that part
needs to be addressed.  This fix as it stands however is incorrect.  Thanks,

Josef
