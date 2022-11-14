Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246532591
	for <llvm@lists.linux.dev>; Mon, 14 Nov 2022 09:56:44 +0000 (UTC)
Received: by mail-io1-f71.google.com with SMTP id c14-20020a5ea80e000000b006d6e9b05e58so5610923ioa.23
        for <llvm@lists.linux.dev>; Mon, 14 Nov 2022 01:56:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QhmCtMXD13ueqkEPZREgdJx37AC/Qnw0CsLe+089Zis=;
        b=thHS8PYO1PcB5T4DjMbEpq1tP8AvJIW8avOQPYKdxQYoNoxUzUjXQW9UPaX0WwietB
         Ai+BW3MK12fcISioGLDHzWetkyg2E9ef+mQW2oMwdGfoU1iABu/CJ/zNapwddvLBXRqs
         JD8PeRpQsGrunFR69lXfpGV++LpfqRyUQCbjfnLOekGb3L4+rjv7/m7Y3U5MfD0K1Wiv
         sZmMuY38A7i8kGTvdKrgywqIRv+1DsQb5QbtxN38wKwM/psv6HlRMV7h4xgRS1pRFVf/
         ntmiqJrYU/soR9Ix5i808Ypz+LnNuFadGgUeq4kBaH0zHiPPg0Khn5G91rxM50eQTANn
         QcrQ==
X-Gm-Message-State: ANoB5plImA1kasyx6rnOvEysMAqzxah/A65cAqSMwgRTTx1PUE8d3IxG
	Hi6Z5qUn11l7+DG0sgS2YSsZRH1QPBgCq05tCqYcJmTj0dgi
X-Google-Smtp-Source: AA0mqf7L+JTal+ITZw6aDxmWMgHo8rXeseo7JGoiFTBUi14IZ00prgBvc40QzRHCQc4WSwwZZj1SPZs8+/si6JrSSNmAEcS6r0yc
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a02:2121:0:b0:363:b82d:d510 with SMTP id
 e33-20020a022121000000b00363b82dd510mr5198968jaa.112.1668419803302; Mon, 14
 Nov 2022 01:56:43 -0800 (PST)
Date: Mon, 14 Nov 2022 01:56:43 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b64f3d05ed6b41fe@google.com>
Subject: [syzbot] BUG: spinlock bad magic in writeback_single_inode
From: syzbot <syzbot+7b2e428bac8cb2ca2f49@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1621b6eaebf7 Merge branch 'for-next/fixes' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=155d51fe880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=606e57fd25c5c6cc
dashboard link: https://syzkaller.appspot.com/bug?extid=7b2e428bac8cb2ca2f49
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13289456880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/82aa7741098d/disk-1621b6ea.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f6be08c4e4c2/vmlinux-1621b6ea.xz
kernel image: https://storage.googleapis.com/syzbot-assets/296b6946258a/Image-1621b6ea.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/3d4302e293b8/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7b2e428bac8cb2ca2f49@syzkaller.appspotmail.com

ntfs3: loop5: Different NTFS' sector size (1024) and media sector size (512)
BUG: spinlock bad magic on CPU#0, syz-executor.5/5077
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000470
Mem abort info:
  ESR = 0x0000000096000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000006
  CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=000000011343b000
[0000000000000470] pgd=0800000112346003, p4d=0800000112346003, pud=08000001135b3003, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 PID: 5077 Comm: syz-executor.5 Not tainted 6.1.0-rc4-syzkaller-31872-g1621b6eaebf7 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : task_pid_nr include/linux/sched.h:1568 [inline]
pc : spin_dump kernel/locking/spinlock_debug.c:63 [inline]
pc : spin_bug+0x88/0xec kernel/locking/spinlock_debug.c:77
lr : spin_dump kernel/locking/spinlock_debug.c:60 [inline]
lr : spin_bug+0x68/0xec kernel/locking/spinlock_debug.c:77
sp : ffff800016e73940
x29: ffff800016e73940 x28: ffffffffffffffff x27: 0000000000000140
x26: 0000000000000002 x25: 0000000000000000 x24: 0000000000000001
x23: ffff800016e73a60 x22: 0000000000000000 x21: ffffffffffffff00
x20: ffff80000cb4a08d x19: ffff0000d12af157 x18: 00000000000000c0
x17: ffff80000dcdc198 x16: 0000000000000002 x15: 0000000000000000
x14: 0000000000000000 x13: 205d373730355420 x12: 5b5d343333323131
x11: ff808000081c06c8 x10: 0000000000000000 x9 : 824be9ae2b942600
x8 : ffffffffffffff01 x7 : 205b5d3433333231 x6 : ffff80000c01775c
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 00000000ad4ead00 x1 : 0000000000000001 x0 : 0000000000000035
Call trace:
 spin_bug+0x88/0xec kernel/locking/spinlock_debug.c:77
 debug_spin_lock_before kernel/locking/spinlock_debug.c:85 [inline]
 do_raw_spin_lock+0xb0/0x110 kernel/locking/spinlock_debug.c:114
 __raw_spin_lock include/linux/spinlock_api_smp.h:134 [inline]
 _raw_spin_lock+0x5c/0x6c kernel/locking/spinlock.c:154
 spin_lock include/linux/spinlock.h:350 [inline]
 writeback_single_inode+0x44/0x54c fs/fs-writeback.c:1676
 write_inode_now+0xb0/0xdc fs/fs-writeback.c:2736
 iput_final fs/inode.c:1734 [inline]
 iput+0x1e4/0x324 fs/inode.c:1773
 ntfs_fill_super+0x1254/0x14a4 fs/ntfs3/super.c:1190
 get_tree_bdev+0x1e8/0x2a0 fs/super.c:1324
 ntfs_fs_get_tree+0x28/0x38 fs/ntfs3/super.c:1358
 vfs_get_tree+0x40/0x140 fs/super.c:1531
 do_new_mount+0x1dc/0x4e4 fs/namespace.c:3040
 path_mount+0x358/0x890 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __arm64_sys_mount+0x2c4/0x3c4 fs/namespace.c:3568
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
Code: b0025463 12800004 91238c63 14000003 (b94572a4) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	b0025463 	adrp	x3, 0x4a8d000
   4:	12800004 	mov	w4, #0xffffffff            	// #-1
   8:	91238c63 	add	x3, x3, #0x8e3
   c:	14000003 	b	0x18
* 10:	b94572a4 	ldr	w4, [x21, #1392] <-- trapping instruction


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
