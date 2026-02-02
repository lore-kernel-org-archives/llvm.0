Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EE021CC55;
	Mon,  2 Feb 2026 09:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770025803; cv=none; b=lPtwe6nGcxM0V7P3P+nd339OURBDBmj8gkKarQpY0hKtOXmMqjL/oAocbVR9mFgIj7GMZsorzMgO+NEdDm3Q0dRyLjVph/iMe5iPwn/DrVq+93rzQCBxmG9Ooj9NDh1/xGWc8/ph5tspcjNqRaQk7UkAIjZGWvXsYKHLgbYLfZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770025803; c=relaxed/simple;
	bh=KGmSrfQi/Lnf2xHNhl2wOyJ/ND0MoBJUfB0nmNstbNA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CgK7GvKMQjbgYFqRBa7MqpUkXYFuR7JbsELVu0MkBm707iuQz9/zbrBC7uxlxJqwYkJ21U1ZsDk85M05oixxtOtcxAtwtfqH4JgN+HwUwN4OFgwX1+19SFGDOfw//MghpiMod1IJHazNOG+/lpkbTCbDURhRi54MB34IydWpnJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t8ZyPOTT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t8ZyPOTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0213CC116C6;
	Mon,  2 Feb 2026 09:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770025803;
	bh=KGmSrfQi/Lnf2xHNhl2wOyJ/ND0MoBJUfB0nmNstbNA=;
	h=From:To:Cc:Subject:Date:From;
	b=t8ZyPOTTJI9+AcAIJV3wVR4r7I26deqLnhbpfDX9o5/CrSEy8jyt3dtYP7PlQCsu2
	 s5CBkMGOAXVPCcJPErg86HjsNKNGJHgJWSufNXzpPZ2AJEJVHi00u3M4OFpCEtEXcn
	 bwcxRrL54yeag3XlBZbhY7xgvWPQh/jnESCkoPB3MnRwtuvYfUa1jYILlsuOkvGz63
	 oL1Du3geFVTAUvVNOkmJHV0FvxYOSBhkvmYn9QKVfE6WwMeeVjnEo73VMf/Zo3EALQ
	 KewlkE9Iy7xSXFjDZlDBM+GaP0KWuQ3xpuVGL2A9Z+K4cX5fbjlYDhP40ijoULyhTx
	 aZnczSTfo/Mng==
From: Arnd Bergmann <arnd@kernel.org>
To: Dave Kleikamp <shaggy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Zheng Yu <zheng.yu@northwestern.edu>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Aditya Dutt <duttaditya18@gmail.com>,
	Roman Smirnov <r.smirnov@omp.ru>,
	jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] jfs: avoid -Wtautological-constant-out-of-range-compare warning
Date: Mon,  2 Feb 2026 10:49:53 +0100
Message-Id: <20260202094958.1232478-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

A recent change for the range check started triggering a clang warning:

fs/jfs/jfs_dtree.c:2906:31: error: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
 2906 |                         if (stbl[i] < 0 || stbl[i] >= DTPAGEMAXSLOT) {
      |                                            ~~~~~~~ ^  ~~~~~~~~~~~~~
fs/jfs/jfs_dtree.c:3111:30: error: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
 3111 |                 if (stbl[0] < 0 || stbl[0] >= DTPAGEMAXSLOT) {
      |                                    ~~~~~~~ ^  ~~~~~~~~~~~~~

Both the old and the new check were useless, but the previous version
apparently did not lead to the warning.

Rephrase this again by adding a cast. The check is still always false,
but the compiler shuts up about it.

Fixes: cafc6679824a ("jfs: replace hardcoded magic number with DTPAGEMAXSLOT constant")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/jfs/jfs_dtree.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 0ab83bb7bbdf..e3301e5fa037 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -2903,7 +2903,7 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
 		stbl = DT_GETSTBL(p);
 
 		for (i = index; i < p->header.nextindex; i++) {
-			if (stbl[i] < 0 || stbl[i] >= DTPAGEMAXSLOT) {
+			if (stbl[i] < 0 || (unsigned char)stbl[i] >= DTPAGEMAXSLOT) {
 				jfs_err("JFS: Invalid stbl[%d] = %d for inode %ld, block = %lld",
 					i, stbl[i], (long)ip->i_ino, (long long)bn);
 				free_page(dirent_buf);
@@ -3108,7 +3108,7 @@ static int dtReadFirst(struct inode *ip, struct btstack * btstack)
 		/* get the leftmost entry */
 		stbl = DT_GETSTBL(p);
 
-		if (stbl[0] < 0 || stbl[0] >= DTPAGEMAXSLOT) {
+		if (stbl[0] < 0 || (unsigned char)stbl[0] >= DTPAGEMAXSLOT) {
 			DT_PUTPAGE(mp);
 			jfs_error(ip->i_sb, "stbl[0] out of bound\n");
 			return -EIO;
-- 
2.39.5

