Received: from r3-20.sinamail.sina.com.cn (r3-20.sinamail.sina.com.cn [202.108.3.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F387E
	for <llvm@lists.linux.dev>; Sat, 26 Aug 2023 03:58:22 +0000 (UTC)
X-SMAIL-HELO: pek-lxu-l1.wrs.com
Received: from unknown (HELO pek-lxu-l1.wrs.com)([111.198.228.11])
	by sina.com (172.16.97.35) with ESMTP
	id 64E977CA000117E0; Sat, 26 Aug 2023 11:55:55 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 28739312976610
X-SMAIL-UIID: AD8448E5DDE84815AB1AE318A0E7BB97-20230826-115555
From: Edward AD <eadavis@sina.com>
To: syzbot+b3123e6d9842e526de39@syzkaller.appspotmail.com
Cc: adilger.kernel@dilger.ca,
	jack@suse.cz,
	linux-ext4@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	syzkaller-bugs@googlegroups.com,
	trix@redhat.com,
	tytso@mit.edu,
	yi.zhang@huawei.com
Subject: [PATCH] ext4: fix ext4_calculate_overhead use invliad j_inode
Date: Sat, 26 Aug 2023 11:55:54 +0800
Message-ID: <20230826035554.2849316-1-eadavis@sina.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <000000000000b1426e0603bc40b6@google.com>
References: <000000000000b1426e0603bc40b6@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In ext4_calculate_overhead(), ext4_get_journal_inode() returned an invalid inode 
pointer without processing. Here, an invalid pointer judgment condition is added 
to avoid incorrect operation of invalid pointer j_inode.

Reported-by: syzbot+b3123e6d9842e526de39@syzkaller.appspotmail.com
Fixes: 99d6c5d892bf ("ext4: ext4_get_{dev}_journal return proper error value")
Signed-off-by: Edward AD <eadavis@sina.com>
---
 fs/ext4/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 34f5406c08da..0dac00954d25 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -4178,7 +4178,7 @@ int ext4_calculate_overhead(struct super_block *sb)
 	else if (ext4_has_feature_journal(sb) && !sbi->s_journal && j_inum) {
 		/* j_inum for internal journal is non-zero */
 		j_inode = ext4_get_journal_inode(sb, j_inum);
-		if (j_inode) {
+		if (j_inode && !IS_ERR(j_inode)) {
 			j_blocks = j_inode->i_size >> sb->s_blocksize_bits;
 			overhead += EXT4_NUM_B2C(sbi, j_blocks);
 			iput(j_inode);
-- 
2.25.1

