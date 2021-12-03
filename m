Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com [47.88.44.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227F068
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 02:45:17 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0UzEPBeF_1638499489;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UzEPBeF_1638499489)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 03 Dec 2021 10:44:51 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: mdf@kernel.org
Cc: hao.wu@intel.com,
	yilun.xu@intel.com,
	trix@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	linux-fpga@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] fpga: region: fix kernel-doc
Date: Fri,  3 Dec 2021 10:44:47 +0800
Message-Id: <1638499487-74388-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Fix function name in of-fpga-region.c kernel-doc comment
to remove a warning found by clang(make W=1 LLVM=1).

drivers/fpga/of-fpga-region.c:451: warning: expecting prototype for
fpga_region_init(). Prototype was for of_fpga_region_init() instead.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/fpga/of-fpga-region.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fpga/of-fpga-region.c b/drivers/fpga/of-fpga-region.c
index 9c662db..50b8305 100644
--- a/drivers/fpga/of-fpga-region.c
+++ b/drivers/fpga/of-fpga-region.c
@@ -444,7 +444,7 @@ static int of_fpga_region_remove(struct platform_device *pdev)
 };
 
 /**
- * fpga_region_init - init function for fpga_region class
+ * of_fpga_region_init - init function for fpga_region class
  * Creates the fpga_region class and registers a reconfig notifier.
  */
 static int __init of_fpga_region_init(void)
-- 
1.8.3.1

