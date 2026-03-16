Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62682D879F;
	Mon, 16 Mar 2026 14:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672184; cv=none; b=B5RiZ7g8hIOMgtZdGBL7ERQOuKIBEovGG4rr/Z5cUSogV1oapWcDuk3a500myd8TpFszdCq6L2SjBG8ER8YDubLL7zdNuczlunPFLkbe1nySyjz/fXGcBZzCNLzpil5H1vZkG4UJ9byZXYohiCK2gc+/YghiVQGFoPeedblNe9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672184; c=relaxed/simple;
	bh=EDW+yBDJsgsU2gcrDj2naWv9yAJNNzCokVBKjb0adbc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DrGL/H7NCW48mFbsQ9OZ8s+Mkabi+V+lU8PBxamvuQs1AMY/2CV6wkWnV4QQnDMNEpU/aoI6GDP4Jy74jh8cRfNHe7hh7ziSQSxYmRVfYIuEAYN7Kq7MTDfd2K0nkTC3K+WaIzLdj+BRUDGDJwmpwyJPt7b1PFFaTVLDiuLHF0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HyKxzHzj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HyKxzHzj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02918C2BC87;
	Mon, 16 Mar 2026 14:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773672183;
	bh=EDW+yBDJsgsU2gcrDj2naWv9yAJNNzCokVBKjb0adbc=;
	h=From:To:Cc:Subject:Date:From;
	b=HyKxzHzjbUGlLO9QRvZdkZNs4MhcEG1ci1UwC5VJmvkZ6zQbyUcdEnO16oJ8gyWAb
	 2NpXLHY3il7JorGX79CBPUqo9/WXZ++IPHf2TgAB8ApDgMpE7341+CdcGgwYuyKZb1
	 6RDkrdYvCG3evsEidJBRf5EozWt3H2IPYlL7nswckNBECDJsEhAeSIc9KNvjFuFPXS
	 ikJtFooHMbUyI3JW57AVFZvdRH/ZRcsgjsgOkpebNdkAdvK1I6CAgirn0paMjwyfD7
	 RxaKtMa4QTAAkYp6FbJmxYsHTcm5Vnb3Uve8+pVQbRlmpE8IQqnpskwqYqJjDOL3WQ
	 MKpLGGppaCRgw==
From: Arnd Bergmann <arnd@kernel.org>
To: Dave Kleikamp <shaggy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Yun Zhou <yun.zhou@windriver.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Aditya Dutt <duttaditya18@gmail.com>,
	Zheng Yu <zheng.yu@northwestern.edu>,
	jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] jfs: avoid -Wtautological-constant-out-of-range-compare warning again
Date: Mon, 16 Mar 2026 15:42:51 +0100
Message-Id: <20260316144257.731006-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The comparison of an __s8 value against DTPAGEMAXSLOT is still trivially
true, causing a harmless (default disabled) warning with clang:

fs/jfs/jfs_dtree.c:4419:25: error: result of comparison of constant 128 with expression of type 's8' (aka 'signed char') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
 4419 |                                         p->header.freelist >= DTPAGEMAXSLOT)) {
      |                                         ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~

I previously worked around two of these in commit 7833570dae83 ("jfs: avoid
-Wtautological-constant-out-of-range-compare warning"), but now a new one has
come up, so address the same way by dropping the redundant range check.

Fixes: 119e448bb50a ("jfs: add dtpage integrity check to prevent index/pointer overflows")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/jfs/jfs_dtree.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 7669e268fe35..a32c78d1c416 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -4415,8 +4415,7 @@ bool check_dtpage(dtpage_t *p)
 		/* When there are free slots, freelist must be a valid slot index in
 		 * 1~DTROOTMAXSLOT-1(since slot[0] is occupied by the header).
 		 */
-		if (unlikely(p->header.freelist < 1 ||
-					p->header.freelist >= DTPAGEMAXSLOT)) {
+		if (unlikely(p->header.freelist < 1)) {
 			jfs_err("Bad freelist:%d in dtpage\n", p->header.freelist);
 			return false;
 		}
-- 
2.39.5

