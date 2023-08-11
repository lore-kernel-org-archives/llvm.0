Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338D9A46
	for <llvm@lists.linux.dev>; Fri, 11 Aug 2023 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E982C433C7;
	Fri, 11 Aug 2023 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691759428;
	bh=pcelJUzS2twcARW8O86PiBrVO0sL2055vkOVNT1w1Zw=;
	h=From:To:Cc:Subject:Date:From;
	b=RnT17tLslKfdp5lRCrKNH0H4zXXGnRfEJA/OJumqoa4BDWfwW7/EANNMhLm2fmwvb
	 b7KlU2acWiBhdOz11UGndZ8Mq2ChIveuyJXXztrXQpQGdaxcqxV2gWFHyN2dX91EnD
	 NVh0yTtNaIhF7xGPHhaGib6S5KSLr0sqlJLW+Jg+Qm+/ebYkDx9ltjEg/KbGJpAUjo
	 UpdLWzlYiugW8iIc++pJ5LGXk3snXckvC86U8eTNV9SiHPZagjQPmjF6VFIy6HofX7
	 Edh89b9zE0VM4iPTCuUxgoughC1Ocv65K85n5ksvGG6UsAAY0N1b3Z9T5Euq7gyls6
	 k3pztFNntl00g==
From: Arnd Bergmann <arnd@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peng Zhang <zhangpeng.00@bytedance.com>,
	Rong Tao <rongtao@cestc.cn>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] radix tree: remove unused variable
Date: Fri, 11 Aug 2023 15:10:13 +0200
Message-Id: <20230811131023.2226509-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Recent versions of clang warn about an unused variable, though older
versions saw the 'slot++' as a use and did not warn:

radix-tree.c:1136:50: error: parameter 'slot' set but not used [-Werror,-Wunused-but-set-parameter]

It's clearly not needed any more, so just remove it.

Fixes: 3a08cd52c37c7 ("radix tree: Remove multiorder support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 lib/radix-tree.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/radix-tree.c b/lib/radix-tree.c
index 1a31065b2036a..976b9bd02a1b5 100644
--- a/lib/radix-tree.c
+++ b/lib/radix-tree.c
@@ -1136,7 +1136,6 @@ static void set_iter_tags(struct radix_tree_iter *iter,
 void __rcu **radix_tree_iter_resume(void __rcu **slot,
 					struct radix_tree_iter *iter)
 {
-	slot++;
 	iter->index = __radix_tree_iter_add(iter, 1);
 	iter->next_index = iter->index;
 	iter->tags = 0;
-- 
2.39.2

