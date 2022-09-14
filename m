Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420B83FF9
	for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 17:14:35 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id v20-20020a6b5b14000000b0069fee36308eso9029206ioh.10
        for <llvm@lists.linux.dev>; Wed, 14 Sep 2022 10:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yH99aNpoXPus2YSVzO88ftQqBGTGzN3j5UFnOiT8ikA=;
        b=QWbH6UwdCcj8WO5P1ouL9pMm/ZzXznKsJpusa45OiUGlWw4/CUBn31nvPeIjXOnbeo
         SwyHr2qM2E8WB9bqka5z/6ThI5yXUergK0/yLTbjW0KTo256yoA+vjQuG/YVMpiXlgxv
         f9INjCmtSUgf2PTquRODvVQ504mjLIiFEMtbmcc8lJmSVpdEEF9Uykuu75MBicAEtVSS
         y/qXW/Xd6GVn0MLBZBtVZMTB9DF/75Y3kuZpLfV+FzWdOXAq0qcqjHdZ+ynqsleqUMnb
         VR236c8SqD958MxiWRhoVzWPuEpVA0jC1BHOZi1Zx1h2MHu4fw0iBEFkzL87i46oE/OU
         2x5w==
X-Gm-Message-State: ACgBeo3VA2vZpxgPI8nVQil3VXJRBK/amwnOav3DlfyvtK5lR6/ypIMy
	1N+BYdLBG+kZ+Rm8GgfMvs9oa34YDoCU3h4zEgQaUYLOdfYj
X-Google-Smtp-Source: AA6agR4aaLsjBm25jXwr5vcbxVekdLEqsBZskTYJjP1iud/yGdDv3CTAqBVXA8kNenQig2nwFA8BYorjBCAfVQcr30oaeaP9IziB
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a92:6912:0:b0:2ea:fa2e:462d with SMTP id
 e18-20020a926912000000b002eafa2e462dmr15025303ilc.155.1663175674437; Wed, 14
 Sep 2022 10:14:34 -0700 (PDT)
Date: Wed, 14 Sep 2022 10:14:34 -0700
In-Reply-To: <0000000000000149eb05dd3de8cc@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000462c3d05e8a643e0@google.com>
Subject: Re: [syzbot] KASAN: slab-out-of-bounds Read in ntfs_iget5
From: syzbot <syzbot+b4084c18420f9fad0b4f@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    a6b443748715 Merge branch 'for-next/core', remote-tracking..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=15625dbf080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=14bf9ec0df433b27
dashboard link: https://syzkaller.appspot.com/bug?extid=b4084c18420f9fad0b4f
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1482f778880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10d9e35d080000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b4084c18420f9fad0b4f@syzkaller.appspotmail.com

ntfs3: loop0: Different NTFS' sector size (4096) and media sector size (512)
ntfs3: loop0: RAW NTFS volume: Filesystem size 0.00 Gb > volume size 0.00 Gb. Mount in read-only
Unable to handle kernel paging request at virtual address dead4ead00000010
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004
  CM = 0, WnR = 0
[dead4ead00000010] address between user and kernel address ranges
Internal error: Oops: 96000004 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 PID: 3051 Comm: syz-executor281 Not tainted 6.0.0-rc4-syzkaller-17255-ga6b443748715 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/26/2022
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : ntfs_iget5+0x88/0x138c fs/ntfs3/inode.c:502
lr : ntfs_iget5+0x78/0x138c fs/ntfs3/inode.c:500
sp : ffff80001275ba40
x29: ffff80001275bae0 x28: ffff0000cb374000 x27: ffff0000c90ce000
x26: ffff80001275bb70 x25: 0000000000000024 x24: ffff80000c1300b4
x23: ffff0000cb3761a8 x22: ffff0000ca8c8250 x21: ffff0000ca8c9708
x20: 0000000000000002 x19: ffff0000ca8c1a30 x18: 00000000000000c0
x17: ffff80000dd3a698 x16: ffff80000db78658 x15: ffff0000c71eb500
x14: ffff80000dd3a698 x13: ffff80000db78658 x12: ffff0000c71eb500
x11: ff80800008bf1798 x10: 0000000000000000 x9 : ffff0000c71eb500
x8 : dead4ead00000000 x7 : ffff8000085eb4a0 x6 : 0000000000000000
x5 : 0000000000000020 x4 : ffff80001275b690 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 ntfs_iget5+0x88/0x138c fs/ntfs3/inode.c:502
 ntfs_fill_super+0xbe8/0x14a4 fs/ntfs/super.c:2902
 get_tree_bdev+0x1e8/0x2a0 fs/super.c:1323
 ntfs_fs_get_tree+0x28/0x38 fs/ntfs3/super.c:1358
 vfs_get_tree+0x40/0x140 fs/super.c:1530
 do_new_mount+0x1dc/0x4e4 fs/namespace.c:3040
 path_mount+0x358/0x914 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __arm64_sys_mount+0x2f8/0x408 fs/namespace.c:3568
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:624
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:642
 el0t_64_sync+0x18c/0x190
Code: 37180194 d108c268 f9400108 79400f54 (79402115) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	37180194 	tbnz	w20, #3, 0x30
   4:	d108c268 	sub	x8, x19, #0x230
   8:	f9400108 	ldr	x8, [x8]
   c:	79400f54 	ldrh	w20, [x26, #6]
* 10:	79402115 	ldrh	w21, [x8, #16] <-- trapping instruction

