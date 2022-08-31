Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E625C367
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 04:32:58 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id fa2so5348246pjb.2;
        Tue, 30 Aug 2022 21:32:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=2wlBh69S5T/T9iHDDZDeIpM5ED2QS1+ze35Ex3GUlR0=;
        b=2UmQl6I6TMXU0tfbT3Fa1ORQeO9UFQMpp1TPePpsYAAqnRBj2AuQpSL3ywMFjQqThw
         hpkLJNH7TW8+NT+N1L75+vp97lvcevWjOYrN2qOdu4CueHAfQosazuIdW9twV4PEkIHF
         MWLqhI+h/VFSV/Xwnxk9G+qqKJg8SxDvT+5thHWzV8WI0+2M+49w4ktNDnaQr9jrEN1R
         jbvQ3MObFUpMd55scWEYWVYmStAYmeRIuozAQEn7VWOwddW4NoFrfsCA1UGEKnFB0XZG
         qkIgCUz+7YyyUVIEzwZ/qwWEkkQ8qWbLFQGRT1L+2cuRM0secTgOYcS8+pYgvBoIBEeZ
         ZURA==
X-Gm-Message-State: ACgBeo1E6Qj0adkrVe8R9sLc2ca3RRnFW+2+T3Ac1PnbPzpKsfZ3mafp
	NBZWc+MLykPBgWp2R7P7sIo=
X-Google-Smtp-Source: AA6agR6GYEh50FxwD7XiaLAuWExdR2R2U+/5DGkH1XMXjpl7KZVFqoEFwzIayr/3o6De0oNi4lzmTA==
X-Received: by 2002:a17:90a:6b0d:b0:1fa:c6fe:db6 with SMTP id v13-20020a17090a6b0d00b001fac6fe0db6mr1382049pjj.99.1661920378185;
        Tue, 30 Aug 2022 21:32:58 -0700 (PDT)
Received: from karthik-strix-linux.karthek.com ([117.241.13.19])
        by smtp.gmail.com with ESMTPSA id d11-20020a62f80b000000b0053624c50d74sm10208149pfh.126.2022.08.30.21.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 21:32:57 -0700 (PDT)
Date: Wed, 31 Aug 2022 10:02:51 +0530
From: Karthik Alapati <mail@karthek.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: =ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] fs/ntfs3: fix memory leak in put_ntfs()
Message-ID: <Yw7kc+eNDImk7+w+@karthik-strix-linux.karthek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

free options in put_ntfs() rather than in ntfs_put_super()

BUG: memory leak
unreferenced object 0xffff8881104f3720 (size 32):
  comm "syz-executor634", pid 3605, jiffies 4294945517 (age 12.630s)
  hex dump (first 32 bytes):
    e0 36 4f 10 81 88 ff ff 80 57 e1 85 ff ff ff ff  .6O......W......
    00 00 00 00 00 00 00 00 c0 ff c0 ff 00 00 00 00  ................
  backtrace:
    [<ffffffff81b23ef2>] kmalloc include/linux/slab.h:600 [inline]
    [<ffffffff81b23ef2>] kzalloc include/linux/slab.h:733 [inline]
    [<ffffffff81b23ef2>] ntfs_init_fs_context+0x22/0x1e0 fs/ntfs3/super.c:1397
    [<ffffffff81650045>] alloc_fs_context+0x225/0x3b0 fs/fs_context.c:290
    [<ffffffff8162bed3>] do_new_mount fs/namespace.c:3025 [inline]
    [<ffffffff8162bed3>] path_mount+0x6f3/0x10d0 fs/namespace.c:3370
    [<ffffffff8162cffe>] do_mount fs/namespace.c:3383 [inline]
    [<ffffffff8162cffe>] __do_sys_mount fs/namespace.c:3591 [inline]
    [<ffffffff8162cffe>] __se_sys_mount fs/namespace.c:3568 [inline]
    [<ffffffff8162cffe>] __x64_sys_mount+0x18e/0x1d0 fs/namespace.c:3568
    [<ffffffff845e4855>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff845e4855>] do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84800087>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff8881104f36e0 (size 32):
  comm "syz-executor634", pid 3605, jiffies 4294945517 (age 12.630s)
  hex dump (first 32 bytes):
    6d 61 63 63 79 72 69 6c 6c 69 63 00 00 00 00 00  maccyrillic.....
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff814c5b1d>] kmemdup_nul+0x2d/0x70 mm/util.c:152
    [<ffffffff8164f66e>] vfs_parse_fs_string+0x6e/0xd0 fs/fs_context.c:178
    [<ffffffff8164f7b0>] generic_parse_monolithic+0xe0/0x130 fs/fs_context.c:224
    [<ffffffff8162c374>] do_new_mount fs/namespace.c:3036 [inline]
    [<ffffffff8162c374>] path_mount+0xb94/0x10d0 fs/namespace.c:3370
    [<ffffffff8162cffe>] do_mount fs/namespace.c:3383 [inline]
    [<ffffffff8162cffe>] __do_sys_mount fs/namespace.c:3591 [inline]
    [<ffffffff8162cffe>] __se_sys_mount fs/namespace.c:3568 [inline]
    [<ffffffff8162cffe>] __x64_sys_mount+0x18e/0x1d0 fs/namespace.c:3568
    [<ffffffff845e4855>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff845e4855>] do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84800087>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

Link: https://syzkaller.appspot.com/bug?id=332ba47915d0e39e94b42a622f195f0804ecb67f
Reported-by: syzbot+9d67170b20e8f94351c8@syzkaller.appspotmail.com
Signed-off-by: Karthik Alapati <mail@karthek.com>
---
 fs/ntfs3/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 47012c9bf505..ffb76a5bfd4f 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -439,6 +439,7 @@ static void init_once(void *foo)
  */
 static noinline void put_ntfs(struct ntfs_sb_info *sbi)
 {
+	put_mount_options(sbi->options);
 	kfree(sbi->new_rec);
 	kvfree(ntfs_put_shared(sbi->upcase));
 	kfree(sbi->def_table);
@@ -482,7 +483,6 @@ static void ntfs_put_super(struct super_block *sb)
 	/* Mark rw ntfs as clear, if possible. */
 	ntfs_set_state(sbi, NTFS_DIRTY_CLEAR);
 
-	put_mount_options(sbi->options);
 	put_ntfs(sbi);
 	sb->s_fs_info = NULL;
 
-- 
2.37.2

