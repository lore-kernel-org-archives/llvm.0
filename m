Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1683214;
	Fri, 17 Mar 2023 14:30:32 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id x13so21184220edd.1;
        Fri, 17 Mar 2023 07:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679063431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xytjjE5myxOfjkZ4GExR989+SsHyYu7LM3zVntLwGFc=;
        b=p23Nr9BCXPxuZwi4crQ4QYUt1eIhvqbs080JAnzA6zEFZaAPSMrivXlX3IGlxVgXIu
         TYJgNY9AIqlgNwXW8GL85JJVYl10mb1UOwLDuF0jaXGgyIJ4aNGNWEWQUFnCfIlF39Bu
         wfIn85VcKyU99mu6GfanUYwK/ULrDxTsBSvLk+lahM5gkvDSTADkeONSe7b/P4lABQeM
         oBZ6F9a93uLPgs8hvkIhpHWqLPFZpQznImfYGqMH7rdVDL13qDPr5+3zSxhLJS9DEf4l
         Nb12bmlZlZYiKQIRa6u5gxc4kRBJLmnc0LnMCHK3VFYRaxAcQxTk0ehhO6qanJhYEeC8
         /Ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679063431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xytjjE5myxOfjkZ4GExR989+SsHyYu7LM3zVntLwGFc=;
        b=dACFEQtBWz1fB4ueuT/qwnFOYy2ob63ACsPCuyTzayFFtG4MUAcA6bVyN33toMJwP7
         nOXzDm3CgehMUUWGKjT5c1aQJvwqy6VRwbGSCjFpeIWWC3+a7qDMFSPuqLLThrMObbap
         Ejk9Jl9vw1XwegIV1NGIORUDZid2gfEVITYcC9CTX+YxnGu5eCpW8mbYz+4OR46gRyEw
         NZPiMcyZrr+DSsCNIfOR+dG1tD+5JjXI73hmcci0ddK92a1Z7YoCwzmUx+BHbzeJzn6X
         /VKdnkEFP1budQRBRev+Go1PmAsA5ompJ8AELphHaq1I3dtKCd1UYp1TRZls7fBqcJr3
         37wA==
X-Gm-Message-State: AO0yUKU3R6+v62FQNbu9/mZeW26Eqe28F3j1RMH3ki4dLA27c4oHRP5s
	plWfYRXy6XzdIhPyIs0ANTI=
X-Google-Smtp-Source: AK7set8R1vLe16PzktpZ3wXVITKGYxosfQOkPCFOvvd5FS/kxiRdi6Qi1M4i1AUbzSL854Bj3JNNSg==
X-Received: by 2002:a05:6402:524e:b0:4fd:298d:4f26 with SMTP id t14-20020a056402524e00b004fd298d4f26mr7631606edd.3.1679063430629;
        Fri, 17 Mar 2023 07:30:30 -0700 (PDT)
Received: from ivan-HLYL-WXX9.. ([37.252.81.68])
        by smtp.gmail.com with ESMTPSA id e25-20020a50d4d9000000b004c10b4f9ebesm1155058edj.15.2023.03.17.07.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 07:30:30 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: almaz.alexandrovich@paragon-software.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	skhan@linuxfoundation.org,
	himadrispandya@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	syzbot+478c1bf0e6bf4a8f3a04@syzkaller.appspotmail.com
Subject: [PATCH] FS: NTFS3: Fix UBSAN shift-out-of-bounds in ntfs_fill_super
Date: Fri, 17 Mar 2023 18:29:58 +0400
Message-Id: <20230317142958.5566-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzkaller reported the following issue:

UBSAN: shift-out-of-bounds in fs/ntfs3/super.c:777:25
shift exponent 128 is too large for 32-bit type 'unsigned int'
CPU: 0 PID: 5928 Comm: syz-executor258 Not tainted 6.2.0-syzkaller-18300-g2ebd1fbb946d #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/21/2023
Call trace:
 dump_backtrace+0x1c8/0x1f4 arch/arm64/kernel/stacktrace.c:158
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:165
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd0/0x124 lib/dump_stack.c:106
 dump_stack+0x1c/0x28 lib/dump_stack.c:113
 ubsan_epilogue lib/ubsan.c:151 [inline]
 __ubsan_handle_shift_out_of_bounds+0x2f4/0x36c lib/ubsan.c:321
 ntfs_init_from_boot fs/ntfs3/super.c:777 [inline]
 ntfs_fill_super+0x2544/0x3b9c fs/ntfs3/super.c:970
 get_tree_bdev+0x360/0x54c fs/super.c:1282
 ntfs_fs_get_tree+0x28/0x38 fs/ntfs3/super.c:1408
 vfs_get_tree+0x90/0x274 fs/super.c:1489
 do_new_mount+0x25c/0x8c8 fs/namespace.c:3145
 path_mount+0x590/0xe58 fs/namespace.c:3475
 do_mount fs/namespace.c:3488 [inline]
 __do_sys_mount fs/namespace.c:3697 [inline]
 __se_sys_mount fs/namespace.c:3674 [inline]
 __arm64_sys_mount+0x45c/0x594 fs/namespace.c:3674
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall+0x98/0x2c0 arch/arm64/kernel/syscall.c:52
 el0_svc_common+0x138/0x258 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x64/0x198 arch/arm64/kernel/syscall.c:193
 el0_svc+0x58/0x168 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:591

This issue is caused by the left shift in 'ntfs_init_from_boot'
function, which uses the absolute value of 'index_size' field as
an exponent in case it is negative. If 'index_size' absolute value
is larger than 30, the issue occurs.

Absolute value of 'index_size' can't be larger than 31, because in case
it is negative it is used as a shift exponent to compute the superblock
index_size (which is a 32-bit unsigned integer). So we need to check this.
If it is larger than 31, the superblock index_size will be zero (because it
will be equal to 1u << (>31))

Additionally, if the absolute value of index_size is equal to 31 it is
correct, and we need to process it correctly. The result of 2U << 31
calculation will be 0, which will cause the ntfs_init_from_boot to
return an error. So let's shift the 2UL instead of 2U to avoid this issue.

We need to do the same with boot record_size as well, because it works in
the similar way.

Tested via syzbot.

Reported-by: syzbot+478c1bf0e6bf4a8f3a04@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?id=00a7d35a2790926d5b91a5279462e0cb958cc689
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 fs/ntfs3/super.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index ef4ea3f21905..9097cf2081df 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -766,15 +766,23 @@ static int ntfs_init_from_boot(struct super_block *sb, u32 sector_size,
 		goto out;
 
 	/* Check MFT record size. */
+	if (boot->record_size < 0 &&
+		-boot->record_size > 31)
+		goto out;
+
 	if ((boot->record_size < 0 &&
-	     SECTOR_SIZE > (2U << (-boot->record_size))) ||
+	     SECTOR_SIZE > (2UL << (-boot->record_size))) ||
 	    (boot->record_size >= 0 && !is_power_of_2(boot->record_size))) {
 		goto out;
 	}
 
 	/* Check index record size. */
+	if (boot->index_size < 0 &&
+		-boot->index_size > 31)
+		goto out;
+
 	if ((boot->index_size < 0 &&
-	     SECTOR_SIZE > (2U << (-boot->index_size))) ||
+	     SECTOR_SIZE > (2UL << (-boot->index_size))) ||
 	    (boot->index_size >= 0 && !is_power_of_2(boot->index_size))) {
 		goto out;
 	}
-- 
2.34.1

