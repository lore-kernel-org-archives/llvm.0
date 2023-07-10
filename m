Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F02320A
	for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 08:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1688979534;
	bh=4i5QUV9T4fYpJF6lWkKhhD0RINkSEU8kNV+b+l4tVlA=;
	h=From:To:Cc:Subject:Date;
	b=HlQa6iAvxfQfJamuak7G6V3WVO+PpFo0QwR78szUQxQ2wQKMAOgxFEfgTFxd/zrRK
	 lPnDH1XluKGpL+XgKy14ArcWyPRen26RoA1w7YIJ5CbKhnLbOAFYmJDMnB0J0no/vY
	 zp1SEC7P+2bPM4xvQxPCARruAYES2TNNRXIcPAYc=
Received: from linkpc.nju.edu.cn ([58.213.8.104])
	by newxmesmtplogicsvrszb1-0.qq.com (NewEsmtp) with SMTP
	id 83499E43; Mon, 10 Jul 2023 16:32:52 +0800
X-QQ-mid: xmsmtpt1688977972t1gkhqqnj
Message-ID: <tencent_8D245D1A87D17619EA8475E8F005A151000A@qq.com>
X-QQ-XMAILINFO: Mm/8i8/T4yneOrBZtagOMB8w0L2ShAiZqzSQ/bHu49QVA1pORfWXS7M7rYN/CM
	 e6rtjTlwdslgyDuWLoLnI0E5IHuudYTHD6QFQIHOMzSJIGwmtUircgSkDZTNdeM5pUSGt22VPbhc
	 rSt5jVEcgkxbJLkade6H0Bj1p2/aDsQxlXJg+A637oIy0Qfz4W0bnrqJhivxa/4i/kuSGwHv7xwA
	 5ljq2N37ypI19ydKu17puAGgj0MLLriNJWEWzfz1K0QSWJVrcYYFS2vSK490Sw/EyfkJ94mFZ0s2
	 qXlV0pGd4q4gxKJgEq+WPs1YvLQGrG5QuPyn51yUdf+itd00NFsX6HaX13MWIfCLyZJaLatmf3FL
	 Ovbr+ElmyaRToLSQQUXecqYKPbkaCxfNPvRsCJe6geXAjLkkVT6nS9KzctTGxxWgMneDEVz9yJwH
	 17rH3UWR349vCdvpSgwM+IghZ696uSmQChIwMuSy3sIlqq/sjiH2/BJOrOr56y/tGZZMeJrTrMxg
	 lndMeRWab0uiZ2Q+zDkgG5AzUet9CKFAPscKFm/vWwabmU9u837ysuvpPnZDEIY+xELzzG2mrFji
	 EbsouKNafflkGw4EXcPzhrPmJjtoBd/OZhjs725gW+KVUgT+5w5QIU4fcGk7SdgCGaCly8BA4/MQ
	 17i7sBijoVRSZh4IFYiGJOiya4b1HtkWnU7sogL2qHob0ATPCz5yRuQ6jcGT/8b5asfq/MCa4zTK
	 wUAyzR3M+Ty9t8D9/xAZ2MbpL+Py88bdDKbGJSRPBXNUeRK6hAgCbh2Ai+2OBCu0wvQsrXtbeK7F
	 DU6TdmHiVeGWmpW3Xn6fioOQWf/50Mt4x0KqSf5VgkIDyiliYbtpi6ezO5WUgY5EbRXRnShOb/BR
	 HiYetc7gt0m2Hgdl0fbE9TV8RaCVON9QLLeHaTmjTPpOyLdnaK1OmW/ln378vkbgl6GEoZv45+I1
	 5/5fGG4AHf7BHs/WwKT5jVjZDLk6zBbrrt1n0JermUPVYr6t3lNZKN+F1N2a1oW5MjgfjCjDE=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Linke Li <lilinke99@foxmail.com>
To: linux-mm@kvack.org
Cc: llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	trix@redhat.com,
	ndesaulniers@google.com,
	nathan@kernel.org,
	muchun.song@linux.dev,
	mike.kravetz@oracle.com,
	Linke Li <lilinke99@gmail.com>
Subject: [PATCH] hugetlbfs: Fix integer overflow check in  hugetlbfs_file_mmap()
Date: Mon, 10 Jul 2023 16:32:40 +0800
X-OQ-MSGID: <20230710083240.512379-1-lilinke99@foxmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Linke Li <lilinke99@gmail.com>

	vma_len = (loff_t)(vma->vm_end - vma->vm_start);
	len = vma_len + ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
	/* check for overflow */
	if (len < vma_len)
		return -EINVAL;

The existing code includes an integer overflow check, which indicates
that the variable len has the potential to overflow, leading to undefined
 behavior according to the C standard. However, both GCC and Clang
compilers may eliminate this overflow check based on the assumption
that there will be no undefined behavior. Although the Linux kernel
disables these optimizations by using the -fno-strict-overflow option,
there is still a risk if the compilers make mistakes in the future.

To address this potential issue, this patch introduces a new check
that effectively prevents integer overflow. This check ensures the
safe operation of the code even when the Linux kernel is compiled
without the -fno-strict-overflow option, providing an added layer
of protection against potential issues caused by compiler behavior.

Signed-off-by: Linke Li <lilinke99@gmail.com>
---
 fs/hugetlbfs/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 7b17ccfa039d..1b4648a8e296 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -157,7 +157,7 @@ static int hugetlbfs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	vma_len = (loff_t)(vma->vm_end - vma->vm_start);
 	len = vma_len + ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
 	/* check for overflow */
-	if (len < vma_len)
+	if (vma_len > LLONG_MAX - ((loff_t)vma->vm_pgoff << PAGE_SHIFT))
 		return -EINVAL;
 
 	inode_lock(inode);
-- 
2.25.1

