Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605E81872;
	Thu, 28 Sep 2023 02:11:48 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-502e7d66c1eso20136871e87.1;
        Wed, 27 Sep 2023 19:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695867106; x=1696471906; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZurDiihYeBEb6euOcaX72OaY/1OzMXvZpw017YFgpQ4=;
        b=bYYQIO+TAPH4AE8daVQ0fkPGM/2owgYZMQWH8f0V1XjTEEGV4aQUikZ6XGjz/iN9gv
         410dZdAC4QgxHzcD9rUyrUsVqedRoTYH1GIXcvd+JlgiTernsWVbflqPmYtfOVvOM8kl
         tGuUB7D4TLzMJJRl/BpWMSqxOF1as+imfBLc9zTIG7/swlCQZZCwZiiLWyC1+RfcS53p
         hSH2tHznb8fXDP8inzwnEXlS4c2E9k4mveEDEGKOpiYplyWFjzV8pxmCKVodo0iOsRUy
         LaBmj8/HJdQ+tXEsotITQTYSZMnF+bt3ZJbYxmCg7z5FaPZvrwfoeiK1QPbDQWdDGb+X
         mWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695867106; x=1696471906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZurDiihYeBEb6euOcaX72OaY/1OzMXvZpw017YFgpQ4=;
        b=PfYp6rYUIk9ukWWy3eudhhjEVEO2g7j6Tm4HyRD3Wt4p5Uy8gDxw6jNoKAxwUQvk4w
         0sr7L8WpLLzbQTfuk1ueHxK+v2Ff7XrQEjUUB6G14B6LB9ZgIRTauvDC9vqQkEh+BRhu
         m7gRFVjbnDQ34rXghCfib00rohPHYM1wqb0nmkkuHhZp0PsNzETsaBj3xJexrJXj+rCF
         6MixumGh580IvIZqZ7BZygmQUNkO/3WXwrp458uyktJ5QVDEFvaLzA/9uT74LuOaSP8D
         8FaBSCI3EUSIXKm8Tekzk8TdExVMpqGSriCFkIzqyjUyhSMCdwWiTpuI4kDfvfrnidzS
         ly9g==
X-Gm-Message-State: AOJu0YyAYzvZNLuhqrgj6/SleOLRAxhUWbQdyEPuKNN/FQIbUzT68Zk0
	HGIJlgkmBco4+QTqz2cLkB6CNV61VMHxLIPysn4=
X-Google-Smtp-Source: AGHT+IHQD+rHIqu9zhjhIaM1C52Fhli7irg3V1PFzW584N8BP/du9SuFalOts6lYF6bTq9MhjTaghVB5AEKxuRk3EvI=
X-Received: by 2002:ac2:5bc4:0:b0:500:9a45:636 with SMTP id
 u4-20020ac25bc4000000b005009a450636mr3011546lfn.13.1695867105788; Wed, 27 Sep
 2023 19:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Yikebaer Aizezi <yikebaer61@gmail.com>
Date: Thu, 28 Sep 2023 10:11:32 +0800
Message-ID: <CALcu4rYs22Cwv-AHDoi3WyKR7G1Qmd3Go_kHDCp8FpRBgnvPBg@mail.gmail.com>
Subject: KASAN: use-after-free Read in ntfs_fill_super
To: almaz.alexandrovich@paragon-software.com, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, ndesaulniers@google.com, ntfs3@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, trix@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

When using Healer to fuzz the Linux-6.6-rc3,  the following crash
was triggered.

HEAD commit: 6465e260f48790807eef06b583b38ca9789b6072 ( Linux 6.6-rc3=EF=BC=
=89
git tree: upstream

console output:
https://drive.google.com/file/d/14zDfIyAsjQCpH0zabOdBjRJQZ9GBtJWw/view?usp=
=3Ddrive_link
kernel config:https://drive.google.com/file/d/1oKaREUPOoblQEtQKZlpZVu5e73K5=
YZax/view?usp=3Ddrive_link
C reproducer:https://drive.google.com/file/d/14JoSaYEf4plS_A-l1YDXs8IDq3IFX=
lHH/view?usp=3Ddrive_link
Syzlang reproducer:
https://drive.google.com/file/d/1Bz3AdsAhfaebAI4kaqg-pRbj2dyBQlMB/view?usp=
=3Ddrive_link

My local Linux repository is a few commits behind the main branch, so
I pulled the latest branch and validated the crash on it. The issue
still persists.

If you fix this issue, please add the following tag to the commit:
Reported-by: Yikebaer Aizezi <yikebaer61@gmail.com>

ntfs3: loop3: RAW NTFS volume: Filesystem size 1073741824.00 Gb >
volume size 0.00 Gb. Mount in read-only.
ntfs3: loop3: NTFS 1073741824.00 Gb is too big to use 32 bits per cluster.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: use-after-free in memcmp+0x16f/0x1c0 lib/string.c:681
Read of size 8 at addr ffff888126da1002 by task syz-executor.3/28440

CPU: 1 PID: 28440 Comm: syz-executor.3 Not tainted 6.6.0-rc3-g6465e260f487 =
#2
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd5/0x150 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:364 [inline]
 print_report+0xc1/0x5e0 mm/kasan/report.c:475
 kasan_report+0xba/0xf0 mm/kasan/report.c:588
 memcmp+0x16f/0x1c0 lib/string.c:681
 memcmp include/linux/fortify-string.h:728 [inline]
 ntfs_init_from_boot fs/ntfs3/super.c:858 [inline]
 ntfs_fill_super+0x80a/0x4110 fs/ntfs3/super.c:1139
 get_tree_bdev+0x3b0/0x610 fs/super.c:1577
 vfs_get_tree+0x8d/0x370 fs/super.c:1750
 do_new_mount fs/namespace.c:3335 [inline]
 path_mount+0x671/0x1e40 fs/namespace.c:3662
 do_mount fs/namespace.c:3675 [inline]
 __do_sys_mount fs/namespace.c:3884 [inline]
 __se_sys_mount fs/namespace.c:3861 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3861
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fc5db490abe
Code: 48 c7 c0 ff ff ff ff eb aa e8 be 0d 00 00 66 2e 0f 1f 84 00 00
00 00 00 0f 1f 40 00 f3 0f 1e fa 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fc5dc1c1e38 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000020bc2 RCX: 00007fc5db490abe
RDX: 00000000200017c0 RSI: 0000000020020c00 RDI: 00007fc5dc1c1e90
RBP: 00007fc5dc1c1ed0 R08: 00007fc5dc1c1ed0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00000000200017c0
R13: 0000000020020c00 R14: 00007fc5dc1c1e90 R15: 0000000020000500
 </TASK>

The buggy address belongs to the physical page:
page:ffffea00049b6840 refcount:0 mapcount:0 mapping:0000000000000000
index:0x1 pfn:0x126da1
flags: 0x57ff00000000000(node=3D1|zone=3D2|lastcpupid=3D0x7ff)
page_type: 0xffffffff()
raw: 057ff00000000000 ffffea0004844ac8 ffffea00045be708 0000000000000000
raw: 0000000000000001 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as freed
page last allocated via order 0, migratetype Movable, gfp_mask
0x148c48(GFP_NOFS|__GFP_NOFAIL|__GFP_COMP|__GFP_HARDWALL|__GFP_MOVABLE),
pid 8088, tgid 8088 (syz-executor.1), ts 305088168123, free_ts
305131700913
 prep_new_page mm/page_alloc.c:1543 [inline]
 get_page_from_freelist+0xf09/0x2c50 mm/page_alloc.c:3170
 __alloc_pages+0x1c7/0x490 mm/page_alloc.c:4426
 alloc_pages+0x1a6/0x270 mm/mempolicy.c:2298
 folio_alloc+0x1c/0x70 mm/mempolicy.c:2308
 filemap_alloc_folio+0x3d5/0x480 mm/filemap.c:976
 __filemap_get_folio+0x575/0xb90 mm/filemap.c:1936
 grow_dev_page fs/buffer.c:1058 [inline]
 grow_buffers fs/buffer.c:1118 [inline]
 __getblk_slow+0x1fc/0x730 fs/buffer.c:1145
 __getblk_gfp+0x6e/0x80 fs/buffer.c:1439
 sb_getblk include/linux/buffer_head.h:344 [inline]
 ntfs_update_mftmirr+0x48a/0x6a0 fs/ntfs3/fsntfs.c:871
 ntfs_sync_fs+0x174/0x400 fs/ntfs3/super.c:732
 sync_filesystem fs/sync.c:56 [inline]
 sync_filesystem+0x105/0x280 fs/sync.c:30
 generic_shutdown_super+0x7a/0x3c0 fs/super.c:666
 kill_block_super+0x38/0x70 fs/super.c:1646
 ntfs3_kill_sb+0x3c/0xf0 fs/ntfs3/super.c:1727
 deactivate_locked_super+0x94/0x170 fs/super.c:481
 deactivate_super+0xad/0xd0 fs/super.c:514
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1136 [inline]
 free_unref_page_prepare+0x450/0xa30 mm/page_alloc.c:2312
 free_unref_page_list+0xec/0xac0 mm/page_alloc.c:2451
 release_pages+0xca9/0x1350 mm/swap.c:1042
 __folio_batch_release+0x73/0xd0 mm/swap.c:1062
 folio_batch_release include/linux/pagevec.h:83 [inline]
 truncate_inode_pages_range+0x2e7/0xfc0 mm/truncate.c:371
 kill_bdev block/bdev.c:76 [inline]
 blkdev_flush_mapping+0x156/0x320 block/bdev.c:630
 blkdev_put_whole+0xb9/0xe0 block/bdev.c:661
 blkdev_put+0x40a/0x8a0 block/bdev.c:898
 blkdev_release+0x7e/0xa0 block/fops.c:604
 __fput+0x406/0xa70 fs/file_table.c:384
 __fput_sync+0x41/0x50 fs/file_table.c:465
 __do_sys_close fs/open.c:1572 [inline]
 __se_sys_close fs/open.c:1557 [inline]
 __x64_sys_close+0x87/0x110 fs/open.c:1557
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Memory state around the buggy address:
 ffff888126da0f00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff888126da0f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff888126da1000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
                   ^
 ffff888126da1080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff888126da1100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
