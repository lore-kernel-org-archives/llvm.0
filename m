Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB65333FF
	for <llvm@lists.linux.dev>; Tue,  3 Jan 2023 12:45:51 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id i20-20020a056e021d1400b0030c306598c6so7243949ila.9
        for <llvm@lists.linux.dev>; Tue, 03 Jan 2023 04:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MynO4leFA2w1GPk1xqqPyeqjfOjx4gAYINSVbjhYAM=;
        b=vCpQQmY0v9ohDu9Z68PORutvLGAN/YQKKvsRtMApH+EkYSCWnfWLEa0rQ8Ze8PI6wr
         9qpwRdIE+qi+WWBZjcpjdey5XiZI0oJq1/ETZS3z7lNsWC5B47LjqbO53NnNkrokyAJ7
         fR9EQlVZjB8O/CR1ti0Zer1EYW+ZvUTjKbRAZK95fH0Nk3JYVW6CTuApo29k+EfgDN9/
         wyefVI6fxDQywdUSeypLLBgTC9WW/MBYXETMv90ebO+nZpLM9nz6mrbTBFftnBqj2eRy
         /0bKIPi5Rw5ypglPm5SoCmfVqSGf/mwDuMMFXkcMbx0V6A6PvzKkOSnn65PKLRuxmc7y
         mbAQ==
X-Gm-Message-State: AFqh2kqhcgQxD3PWpAB6Cp5maJeIXkCfrHmIM5ncxxoDcOKxXw2AOzE3
	yQrAb8T9JklfPLDcH626ZLSKJa5Acad6VgfNx2GaZh/JWFYz
X-Google-Smtp-Source: AMrXdXvv8lzplegQVVEUG26Ou9yTdSFrFpt8PznM38pG9PwEleavOKPYN1GQaOukHlroxx3nfxqj+NaMePr3+iUsxTVG2h5z8K94
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:d0c:0:b0:30b:f63e:306e with SMTP id
 12-20020a920d0c000000b0030bf63e306emr3429955iln.137.1672749950813; Tue, 03
 Jan 2023 04:45:50 -0800 (PST)
Date: Tue, 03 Jan 2023 04:45:50 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009dceeb05f15b726e@google.com>
Subject: [syzbot] [ntfs3?] possible deadlock in ntfs_mark_rec_free
From: syzbot <syzbot+f83f0dbef763c426e3cf@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    69b41ac87e4a Merge tag 'for-6.2-rc2-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14d88034480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=affadc28955d87c3
dashboard link: https://syzkaller.appspot.com/bug?extid=f83f0dbef763c426e3cf
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f83f0dbef763c426e3cf@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.2.0-rc2-syzkaller-00010-g69b41ac87e4a #0 Not tainted
------------------------------------------------------
kworker/u17:4/9698 is trying to acquire lock:
ffff888073da4120 (&wnd->rw_lock/1){+.+.}-{3:3}, at: ntfs_mark_rec_free+0x229/0x310 fs/ntfs3/fsntfs.c:741

but task is already holding lock:
ffff8880765ba920 (&ni->ni_lock){+.+.}-{3:3}, at: ni_trylock fs/ntfs3/ntfs_fs.h:1142 [inline]
ffff8880765ba920 (&ni->ni_lock){+.+.}-{3:3}, at: ni_write_inode+0x1c2/0x3120 fs/ntfs3/frecord.c:3255

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (&ni->ni_lock){+.+.}-{3:3}:
       __mutex_lock_common kernel/locking/mutex.c:603 [inline]
       __mutex_lock+0x12f/0x1360 kernel/locking/mutex.c:747
       ntfs_set_state fs/ntfs3/fsntfs.c:946 [inline]
       ntfs_set_state+0x1d5/0x6b0 fs/ntfs3/fsntfs.c:921
       attr_set_size+0x134e/0x2ac0 fs/ntfs3/attrib.c:867
       ntfs_extend_mft+0x296/0x430 fs/ntfs3/fsntfs.c:526
       ntfs_look_free_mft+0x548/0xe60 fs/ntfs3/fsntfs.c:589
       ni_create_attr_list+0xbce/0x12b0 fs/ntfs3/frecord.c:873
       ni_ins_attr_ext+0x3ca/0xba0 fs/ntfs3/frecord.c:968
       ni_insert_attr+0x3ee/0x850 fs/ntfs3/frecord.c:1135
       ni_insert_resident+0xd9/0x3a0 fs/ntfs3/frecord.c:1519
       ntfs_set_ea+0xa28/0x1310 fs/ntfs3/xattr.c:432
       ntfs_save_wsl_perm+0x123/0x3b0 fs/ntfs3/xattr.c:962
       ntfs3_setattr+0xb07/0xd30 fs/ntfs3/file.c:722
       notify_change+0xca7/0x1420 fs/attr.c:482
       chown_common+0x60a/0x6f0 fs/open.c:736
       do_fchownat+0x12a/0x1e0 fs/open.c:767
       __do_sys_fchownat fs/open.c:782 [inline]
       __se_sys_fchownat fs/open.c:779 [inline]
       __x64_sys_fchownat+0xbe/0x160 fs/open.c:779
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #1 (&ni->file.run_lock#2){++++}-{3:3}:
       down_write+0x94/0x220 kernel/locking/rwsem.c:1562
       ntfs_extend_mft+0x127/0x430 fs/ntfs3/fsntfs.c:510
       ntfs_look_free_mft+0x548/0xe60 fs/ntfs3/fsntfs.c:589
       ni_create_attr_list+0xbce/0x12b0 fs/ntfs3/frecord.c:873
       ni_ins_attr_ext+0x3ca/0xba0 fs/ntfs3/frecord.c:968
       ni_insert_attr+0x3ee/0x850 fs/ntfs3/frecord.c:1135
       ni_insert_resident+0xd9/0x3a0 fs/ntfs3/frecord.c:1519
       ntfs_set_ea+0xa28/0x1310 fs/ntfs3/xattr.c:432
       ntfs_save_wsl_perm+0x123/0x3b0 fs/ntfs3/xattr.c:962
       ntfs3_setattr+0xb07/0xd30 fs/ntfs3/file.c:722
       notify_change+0xca7/0x1420 fs/attr.c:482
       chown_common+0x60a/0x6f0 fs/open.c:736
       do_fchownat+0x12a/0x1e0 fs/open.c:767
       __do_sys_fchownat fs/open.c:782 [inline]
       __se_sys_fchownat fs/open.c:779 [inline]
       __x64_sys_fchownat+0xbe/0x160 fs/open.c:779
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (&wnd->rw_lock/1){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3097 [inline]
       check_prevs_add kernel/locking/lockdep.c:3216 [inline]
       validate_chain kernel/locking/lockdep.c:3831 [inline]
       __lock_acquire+0x2a43/0x56d0 kernel/locking/lockdep.c:5055
       lock_acquire kernel/locking/lockdep.c:5668 [inline]
       lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
       down_write_nested+0x98/0x220 kernel/locking/rwsem.c:1672
       ntfs_mark_rec_free+0x229/0x310 fs/ntfs3/fsntfs.c:741
       ni_write_inode+0x10a8/0x3120 fs/ntfs3/frecord.c:3348
       write_inode fs/fs-writeback.c:1451 [inline]
       __writeback_single_inode+0xcfc/0x1440 fs/fs-writeback.c:1663
       writeback_sb_inodes+0x54d/0xf90 fs/fs-writeback.c:1889
       wb_writeback+0x2c5/0xd70 fs/fs-writeback.c:2063
       wb_do_writeback fs/fs-writeback.c:2206 [inline]
       wb_workfn+0x2e0/0x12f0 fs/fs-writeback.c:2246
       process_one_work+0x9bf/0x1710 kernel/workqueue.c:2289
       worker_thread+0x669/0x1090 kernel/workqueue.c:2436
       kthread+0x2e8/0x3a0 kernel/kthread.c:376
       ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308

other info that might help us debug this:

Chain exists of:
  &wnd->rw_lock/1 --> &ni->file.run_lock#2 --> &ni->ni_lock

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&ni->ni_lock);
                               lock(&ni->file.run_lock#2);
                               lock(&ni->ni_lock);
  lock(&wnd->rw_lock/1);

 *** DEADLOCK ***

3 locks held by kworker/u17:4/9698:
 #0: ffff888042906938 ((wq_completion)writeback){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff888042906938 ((wq_completion)writeback){+.+.}-{0:0}, at: arch_atomic_long_set include/linux/atomic/atomic-long.h:41 [inline]
 #0: ffff888042906938 ((wq_completion)writeback){+.+.}-{0:0}, at: atomic_long_set include/linux/atomic/atomic-instrumented.h:1280 [inline]
 #0: ffff888042906938 ((wq_completion)writeback){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:636 [inline]
 #0: ffff888042906938 ((wq_completion)writeback){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:663 [inline]
 #0: ffff888042906938 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work+0x86d/0x1710 kernel/workqueue.c:2260
 #1: ffffc90003917da8 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work+0x8a1/0x1710 kernel/workqueue.c:2264
 #2: ffff8880765ba920 (&ni->ni_lock){+.+.}-{3:3}, at: ni_trylock fs/ntfs3/ntfs_fs.h:1142 [inline]
 #2: ffff8880765ba920 (&ni->ni_lock){+.+.}-{3:3}, at: ni_write_inode+0x1c2/0x3120 fs/ntfs3/frecord.c:3255

stack backtrace:
CPU: 2 PID: 9698 Comm: kworker/u17:4 Not tainted 6.2.0-rc2-syzkaller-00010-g69b41ac87e4a #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Workqueue: writeback wb_workfn (flush-7:2)
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd1/0x138 lib/dump_stack.c:106
 check_noncircular+0x25f/0x2e0 kernel/locking/lockdep.c:2177
 check_prev_add kernel/locking/lockdep.c:3097 [inline]
 check_prevs_add kernel/locking/lockdep.c:3216 [inline]
 validate_chain kernel/locking/lockdep.c:3831 [inline]
 __lock_acquire+0x2a43/0x56d0 kernel/locking/lockdep.c:5055
 lock_acquire kernel/locking/lockdep.c:5668 [inline]
 lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
 down_write_nested+0x98/0x220 kernel/locking/rwsem.c:1672
 ntfs_mark_rec_free+0x229/0x310 fs/ntfs3/fsntfs.c:741
 ni_write_inode+0x10a8/0x3120 fs/ntfs3/frecord.c:3348
 write_inode fs/fs-writeback.c:1451 [inline]
 __writeback_single_inode+0xcfc/0x1440 fs/fs-writeback.c:1663
 writeback_sb_inodes+0x54d/0xf90 fs/fs-writeback.c:1889
 wb_writeback+0x2c5/0xd70 fs/fs-writeback.c:2063
 wb_do_writeback fs/fs-writeback.c:2206 [inline]
 wb_workfn+0x2e0/0x12f0 fs/fs-writeback.c:2246
 process_one_work+0x9bf/0x1710 kernel/workqueue.c:2289
 worker_thread+0x669/0x1090 kernel/workqueue.c:2436
 kthread+0x2e8/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
