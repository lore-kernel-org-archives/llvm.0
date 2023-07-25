Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 67ADC110B
	for <llvm@lists.linux.dev>; Tue, 25 Jul 2023 04:34:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id DCCA66032EB7E;
	Tue, 25 Jul 2023 12:34:04 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	Su Hui <suhui@nfschina.com>
Subject: [PATCH v2] ext4: mballoc: avoid garbage value from err
Date: Tue, 25 Jul 2023 12:33:11 +0800
Message-Id: <20230725043310.1227621-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang's static analysis warning: fs/ext4/mballoc.c
line 4178, column 6, Branch condition evaluates to a garbage value.

err is uninitialized and will be judged when 'len <= 0' or
it first enters the loop while the condition "!ext4_sb_block_valid()"
is true. Although this can't make problems now, it's better to
correct it.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
v2:
 - modify commit message

 fs/ext4/mballoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/mballoc.c b/fs/ext4/mballoc.c
index 21b903fe546e..769000c970b0 100644
--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -4084,7 +4084,7 @@ void ext4_mb_mark_bb(struct super_block *sb, ext4_fsblk_t block,
 	struct ext4_sb_info *sbi = EXT4_SB(sb);
 	ext4_group_t group;
 	ext4_grpblk_t blkoff;
-	int i, err;
+	int i, err = 0;
 	int already;
 	unsigned int clen, clen_changed, thisgrp_len;
 
-- 
2.30.2

