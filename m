Received: from xmbg7.mail.qq.com (xmbg7.mail.qq.com [101.226.139.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A969210959
	for <llvm@lists.linux.dev>; Wed,  1 Nov 2023 10:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ofa3NVzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1698836150; bh=zxqHnohc3QyJrgxGAuUHLvaz9znCZcodlirDuVlrNpM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ofa3NVzXzs3crsQxdMJ2dHJOHmIK19JCNs4cS3B8agEZmZ7ghmPOra0sh5mxcvdR7
	 ZQYmZniBfQ4rJcDGyqUgF05l6mXP/zHDMbXqkGSfB0adpjMu6xGnYTw+zXKQBclH1U
	 /6WOkmpewqoRD2vrfN7eaaz8eFnK5e3t01qcQ6YE=
Received: from pek-lxu-l1.wrs.com ([111.198.228.56])
	by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
	id 91B9DCF2; Wed, 01 Nov 2023 14:36:27 +0800
X-QQ-mid: xmsmtpt1698820587tde3qiqyj
Message-ID: <tencent_2A675773C6D47370E36A4966A3BA2444F705@qq.com>
X-QQ-XMAILINFO: OQhZ3T0tjf0a+b8I3cORjzHL+H/8FU8R7w8dJCyK3z2URSWah7YLo9RJnN4/WI
	 syAzRfBv810nwruBwejekSLAQjoJc3QYkMW0DRB4hiAwPdcyryXuoDUdXNHvxyWfasUkzoPZPNNt
	 ugL+xHvYNQ+XrpdgR7zybZNVHk98jxaK7RUqcUSI1aeG6R11IpOrXzALy7A+imeWf194F7d1isgV
	 31rnFam1/ZO+sxbAGWMR3GJA7ddJ2uNkhBbXjVQN2/qAdVTmEl0t7Cao+R+Kw2f8jMHLHUhk86ym
	 tuH3EhyISbRQLOOq2xq0kUggpU8qPxoPWqHsY9doCFOraZbIeaa3nI+GNV3DnkJQcrVrDcYO1+nP
	 7iEU7A5EuTX4UbmCNuoR9Yzmhjz0sXG6wvKnPfogXHK3LPOOafmPPeYSUlAGtmKKEYRJY+E5bwWt
	 HSmdredtQ5UdNLa8+uRtFzikZeT8eHxZXL93ynjfALbNTtZItNzZc7/ek9tXYGyOMhhB4MIj6phz
	 DsKH96ZjoVqhqfkVQ2IzjTd+//YFBqL1ABZg5CzRWoj/3CG9Nv815TM6kLS/h6kAwrgfUQYl9s94
	 oujGAs/d155okzcB8IH0wiZAf0+pYWLshsDruHtbHbPnuQ/hV2pd6L2Ifj5FglZWIhdP2tCcp41w
	 zO7tqkFfLTUT1/j6LFn2SUEHOk/4jPkcG+uKG36ZbYi852dshCMOLiTBWD9wDJjodD45s6aH68ds
	 WsTLv6F1VEfxWgJvlL4kVaVUnoqEWaErwoH3Rr1nZ3VIZlU64tZDbpSkmhXD21gzmvxxWWOkph/1
	 EE6MhfEekSIJlZ/AA91XOgvkq9drc4AZnsAQNl2EPxnEYyRVgeNP/W6YmXPtDqZBGl9WIs47YJ6E
	 s+i+zawRYQx3d7xHw11R48cggonCj51LS3oI0EwXsQBgN9Wo/bRrzP0TVnvwNV4g==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	mike.kravetz@oracle.com,
	muchun.song@linux.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	riel@surriel.com,
	syzkaller-bugs@googlegroups.com,
	trix@redhat.com
Subject: [PATCH] mm/hugetlb: fix null ptr defer in hugetlb_vma_lock_write
Date: Wed,  1 Nov 2023 14:36:28 +0800
X-OQ-MSGID: <20231101063627.3545950-2-eadavis@qq.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <00000000000078d1e00608d7878b@google.com>
References: <00000000000078d1e00608d7878b@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When obtaining resv_map from vma, it is necessary to simultaneously determine
the flag HPAGE_RESV_OWNER of vm_private_data.
Only when they are met simultaneously, resv_map is valid.

Reported-and-tested-by: syzbot+6ada951e7c0f7bc8a71e@syzkaller.appspotmail.com
Fixes: bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private VMAs")
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 include/linux/hugetlb.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 47d25a5e1933..1a3ec1aee1a3 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -1265,9 +1265,11 @@ static inline bool __vma_shareable_lock(struct vm_area_struct *vma)
 	return (vma->vm_flags & VM_MAYSHARE) && vma->vm_private_data;
 }
 
+#define HPAGE_RESV_OWNER    (1UL << 0)
 static inline bool __vma_private_lock(struct vm_area_struct *vma)
 {
-	return (!(vma->vm_flags & VM_MAYSHARE)) && vma->vm_private_data;
+	return (!(vma->vm_flags & VM_MAYSHARE)) && vma->vm_private_data && 
+		((unsigned long)vma->vm_private_data & HPAGE_RESV_OWNER);
 }
 
 /*
-- 
2.25.1

