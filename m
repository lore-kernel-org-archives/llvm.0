Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80AF3D62
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 22:51:27 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id w7-20020a5d9607000000b0067c6030dfb8so1690529iol.10
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 15:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc;
        bh=WAlmKPmwBSHe82ADHwGi4F01afwpPrJl8TMZLAnNCjE=;
        b=DDPMW2NL2CADjHamvNbDTQYpgJ/zJNPxdx1uBIh1yyOYmnZUYmxEAIxl/VpC3+Nnkv
         G2MADnmZo9wkP6wXLVkG5YKV/RCS4AJisnr0j5IsxlXCFToF7mHKxHxBD4ACGvG3s546
         f5p8wWNn7y26ttYWit6cZq3zD//bCzXUBAYHbaL7V8qG56lqg6xh8/DbgaUchTo5o2hY
         NypQDYv5qcbxQfbZvzxUG3evC2GAdUtyVXDbnrQSlo88m4yGGoar9GWuQpmH/sb7adGk
         TSgJ5QUIR15N7UBVmENkhtt41pod1KCWph46ORC4hZvn+NtoJumTCNXPS4Ps0nk20cbv
         IYHw==
X-Gm-Message-State: ACgBeo0iEHXN2Lx3YB3SLxbkv0aumGiJVhoPM+XgJIW06x7b7bpOWk/H
	RqR/x2vuWUoh+imhckBkkX4FI8tKEhzIpwP5K5nwTKmv/H4Z
X-Google-Smtp-Source: AA6agR7gU41h4nNP8i0WnG2uQjguVj0Foa0LIGHbIVShq4fB2hgys5yrqi2HGSm2xspqBFF+AtgXW3Ovdop4vUjyqG5Me+DG5Ndq
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1914:b0:346:c2f5:632f with SMTP id
 p20-20020a056638191400b00346c2f5632fmr5180273jal.296.1661554286947; Fri, 26
 Aug 2022 15:51:26 -0700 (PDT)
Date: Fri, 26 Aug 2022 15:51:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000c73e105e72cc106@google.com>
Subject: [syzbot] BUG: unable to handle kernel NULL pointer dereference in log_replay
From: syzbot <syzbot+8379f446e2ac4365e343@syzkaller.appspotmail.com>
To: almaz.alexandrovich@paragon-software.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
	ntfs3@lists.linux.dev, syzkaller-bugs@googlegroups.com, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a41a877bc12d Merge branch 'for-next/fixes' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=15eebce7080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5cea15779c42821c
dashboard link: https://syzkaller.appspot.com/bug?extid=8379f446e2ac4365e343
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8379f446e2ac4365e343@syzkaller.appspotmail.com

ntfs3: loop4: ino=2, "/" ntfs_iget5
ntfs3: loop4: Mark volume as dirty due to NTFS errors
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
Mem abort info:
  ESR = 0x0000000096000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000006
  CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=000000013af0c000
[0000000000000000] pgd=080000013af11003, p4d=080000013af11003, pud=0800000138a68003, pmd=0000000000000000
Internal error: Oops: 96000006 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 PID: 17646 Comm: syz-executor.4 Not tainted 6.0.0-rc2-syzkaller-16455-ga41a877bc12d #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : log_replay+0x4c/0x3024 fs/ntfs3/fslog.c:3774
lr : log_replay+0x3c/0x3024 fs/ntfs3/fslog.c:3736
sp : ffff80002180b970
x29: ffff80002180ba80 x28: ffff0000f8a8e000 x27: ffff0000dac28000
x26: 0000000000000018 x25: 0000000000000024 x24: ffff80002180baf4
x23: 0000000000000030 x22: ffff00010acaff40 x21: ffff0000f8a8c000
x20: 0000000000000000 x19: ffff0000f8a8e000 x18: 00000000000000c0
x17: ffff80000dd7a698 x16: ffff80000dbb8658 x15: ffff0000f666cf80
x14: 0000000000000120 x13: 00000000ffffffff x12: ffff0000f666cf80
x11: ff80800008bf6e60 x10: 0000000000000000 x9 : ffff800008bf6e60
x8 : ffff0000f666cf80 x7 : ffff8000085f0604 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000001 x1 : ffff80002180baf4 x0 : ffff00010acaff40
Call trace:
 log_replay+0x4c/0x3024 fs/ntfs3/fslog.c:3762
 ntfs_loadlog_and_replay+0x114/0x1ec fs/ntfs3/fsntfs.c:299
 ntfs_fill_super+0xc10/0x14a4 fs/ntfs/super.c:2904
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
 do_el0_svc+0x48/0x154 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:624
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:642
 el0t_64_sync+0x18c/0x190
Code: f9400ed4 a93b7fbf f90047ff b942a2d7 (f9400288) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	f9400ed4 	ldr	x20, [x22, #24]
   4:	a93b7fbf 	stp	xzr, xzr, [x29, #-80]
   8:	f90047ff 	str	xzr, [sp, #136]
   c:	b942a2d7 	ldr	w23, [x22, #672]
* 10:	f9400288 	ldr	x8, [x20] <-- trapping instruction


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
