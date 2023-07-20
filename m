Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F3F18B03
	for <llvm@lists.linux.dev>; Thu, 20 Jul 2023 15:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1689868737;
	bh=pXW60cWQc6IVLFxjVvj7YpZW/1awm7nI8f7WBZ++PB0=;
	h=From:To:Cc:Subject:Date;
	b=i26o7GVBJwmMJ+Y2UgHrVL0dYLp8vOOAu+VIoJyazowe5NCzFiv5SgpQKAfB6KPaI
	 5hOcOgxpaqcVBY3feF11UcllT8uwOJzEW0I2oXuI1mZ5gkkwYdCvjVs4df4BHlYZo9
	 tLuUBL4/mH3Fx7wRHTW/1eCqUrIwyBAQgoTm47ec=
Received: from linkpc.nju.edu.cn ([58.213.8.104])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id C68A9691; Thu, 20 Jul 2023 21:49:40 +0800
X-QQ-mid: xmsmtpt1689860980tn9rzsk4s
Message-ID: <tencent_710619B2865DE8AC059D51A027D919CBD00A@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9MiK9Mh21RRx51oFb4x9WBhNn4UDTn639pc4tGVsSTqKNyRa4Xg
	 Q1QUnzgAW8GPIrMPjjUnEe85hK160jUTPb9nABOIEBtJlWLgTXCc/uXRqv1+odsLuOiU26CKKIDL
	 8JPGv2g1U3n5cZGESqlvHOzHxNsvfeCQmglFwDeaNLCOpnHiAx1AUhagSwsx52l4+hqTxbMLXQP7
	 DSnENmPGvdKp+TCg0BpuxajnNrX79wcQlEDZctavG68QP+XZcZI8x7q4jHOImM26qsO5uLThgYS8
	 PkphtqL5jGTUm9b9ck5ONzAQk0KgWeR5dZIVU3WDrgUnjetA2gahOCYBatd0QSt0942X8bKvVb3Y
	 Y2jr/SctdX8utM+y85pSWJVvlAYmigaEsk6wKZVJ32WwfSK9qporgqi6owFrbnwICKI6OW0yyxJz
	 DWBKfafR0KcGC5KZNlwyom+0lzPt57gaj+BnAWUBIrOxxWkzazmkD4wJdZram93HpiHx51+ohkZS
	 wpdFfD7QJBvLA4sKsGgVXa7Q2TofJFNPKlGTCfUkEBtO1NUtT/D8tT6DRJG/rOXqMP9vf8nFwYyG
	 /a8pzBubKaFlHfLfEY7eD/6478UY1cjGSr5poT9g4ys3KsCMQs0OJaeIzD1JevoUacClx9BJOQnp
	 78XD6o4sf/ZRS9aB9Jdbe9UdVWbim+maRjo9KQScq7PtD1wT8Ub6J+HHIxWtoztUEtJSSRjQiYfS
	 gBuyTCGL9AA3xZPdgJBzpiLTGEwviQY0xTe7IdAQoiJijdm5NWGlZl5gS57uIx1T1pNddlta2Tp2
	 +9u/S8oYkmxxMWNOS98vmfEg1l6IS7UDHyMxv+UsKiEXO7Fo87xrEVBXFA4nQyJnK+hYMaQBwcjT
	 bfhzfJ9WJnqnBN0fEjgywojTlrLwfWl/Oe82aXLwhER0asFz7ysGilw0mJTIbxvEK7gEUBLjfz2u
	 EW26SrvrCflB/+eOvJg2RNnhsA58aeSQcpIBpsra7o2c1jsOOuqSRdhGSpCPGw
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Linke Li <lilinke99@foxmail.com>
To: linux-mm@kvack.org
Cc: mike.kravetz@oracle.com,
	muchun.song@linux.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	dan.carpenter@linaro.org,
	Linke Li <lilinke99@gmail.com>
Subject: [PATCH v2] hugetlbfs: Fix integer overflow check in hugetlbfs_file_mmap()
Date: Thu, 20 Jul 2023 21:49:39 +0800
X-OQ-MSGID: <20230720134939.121783-1-lilinke99@foxmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Linke Li <lilinke99@gmail.com>

```
	vma_len = (loff_t)(vma->vm_end - vma->vm_start);
	len = vma_len + ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
	/* check for overflow */
	if (len < vma_len)
		return -EINVAL;
```

There is a signed integer overflow in the code, which is undefined
behavior according to the C stacnard. Although kernel disables some
optimizations by using the "-fno-strict-overflow" option, there is
still a risk.

Using macro "check_add_overflow" to do the overflow check can
effectively detect integer overflow and avoid any undefined behavior.

Signed-off-by: Linke Li <lilinke99@gmail.com>
---
 fs/hugetlbfs/inode.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 7b17ccfa039d..60f3010b0f71 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -155,9 +155,7 @@ static int hugetlbfs_file_mmap(struct file *file, struct vm_area_struct *vma)
 		return -EINVAL;
 
 	vma_len = (loff_t)(vma->vm_end - vma->vm_start);
-	len = vma_len + ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
-	/* check for overflow */
-	if (len < vma_len)
+    if (check_add_overflow(vma_len, (loff_t)vma->vm_pgoff << PAGE_SHIFT, &len))
 		return -EINVAL;
 
 	inode_lock(inode);
-- 
2.25.1

