Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113A72BEFEF;
	Mon,  2 Feb 2026 20:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770065037; cv=none; b=UCROJ91l3jeJcwMGJQW9KVn5CJdpK92Rbo9FT+B5Uh/ld9PqSty+E+xzuwpn4PT3DJw7CY3tF7ZR7tSMYEG6bpoeaUyOHc69hlv678q8Rsvdseu0+kzzMwdBt5tXUeVst1bl3G5oixY8s1BGZYi/Daa4+J5rCjPRCwOlTX0U+Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770065037; c=relaxed/simple;
	bh=H+vxRtqXYUbLYHIhSNNFvOS0z0tBjan7nM1QpxKjW/w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lUJDFA+WlwXc65JBsgKVjjfS1apFSmVZgyP+RuFwAv1xqK+Mn+ivMstzhM9CnJIbZMv1TSRQAoA29PUSCT73xZ9mWKTvqkyGGEyf4HgBEahZ1vtBboRq+iRvYneOLI2A1KbbvFGWXbF7ZpXe/SbZ5recWAjIETr5AVryvWDxzbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chslCmoX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chslCmoX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A096C116C6;
	Mon,  2 Feb 2026 20:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770065036;
	bh=H+vxRtqXYUbLYHIhSNNFvOS0z0tBjan7nM1QpxKjW/w=;
	h=From:To:Cc:Subject:Date:From;
	b=chslCmoXpvFF3T1UZ09jLPKnO65kuWAprczD4zgUzHq8uj+IbQL4xHUON4fpobgnq
	 1eWrb0F1S0yALNla/5/t9LlD9zGy/ChALoWqhQ4GOiynBX1WgfW9wf5W7fbYc+ET7s
	 tRvRFpg7gCg8PoqXQ9CACe0ACfyLANs6K0JZ2O9NlTw82q2iG1jFtNYawq9j7XSSIB
	 RL+cDwDHI43jmXk8WXNNa6IQgTxmn3BMTX02bspD33417ih0M2SuxO++Tkidp0RFn0
	 wMDi2NFrKT8fL6Q8gVIETKILwlcNnmCRg5UjSe32RKWpbVhpZn6QYnU2bv9Kt9hVwI
	 3SkTMmfW/FPFg==
From: Arnd Bergmann <arnd@kernel.org>
To: Dave Kleikamp <shaggy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Zheng Yu <zheng.yu@northwestern.edu>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Roman Smirnov <r.smirnov@omp.ru>,
	Aditya Dutt <duttaditya18@gmail.com>,
	jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] [v2] jfs: avoid -Wtautological-constant-out-of-range-compare warning
Date: Mon,  2 Feb 2026 21:43:45 +0100
Message-Id: <20260202204351.2174384-1-arnd@kernel.org>
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

Remove the extraneous range check for simplicity.

Fixes: cafc6679824a ("jfs: replace hardcoded magic number with DTPAGEMAXSLOT constant")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: drop the check instead of shutting up the warning
---
 fs/jfs/jfs_dtree.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 0ab83bb7bbdf..9ab3f2fc61d1 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -2903,7 +2903,7 @@ int jfs_readdir(struct file *file, struct dir_context *ctx)
 		stbl = DT_GETSTBL(p);
 
 		for (i = index; i < p->header.nextindex; i++) {
-			if (stbl[i] < 0 || stbl[i] >= DTPAGEMAXSLOT) {
+			if (stbl[i] < 0) {
 				jfs_err("JFS: Invalid stbl[%d] = %d for inode %ld, block = %lld",
 					i, stbl[i], (long)ip->i_ino, (long long)bn);
 				free_page(dirent_buf);
@@ -3108,7 +3108,7 @@ static int dtReadFirst(struct inode *ip, struct btstack * btstack)
 		/* get the leftmost entry */
 		stbl = DT_GETSTBL(p);
 
-		if (stbl[0] < 0 || stbl[0] >= DTPAGEMAXSLOT) {
+		if (stbl[0] < 0) {
 			DT_PUTPAGE(mp);
 			jfs_error(ip->i_sb, "stbl[0] out of bound\n");
 			return -EIO;
-- 
2.39.5

