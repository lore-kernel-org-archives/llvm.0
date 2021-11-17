Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com [47.88.44.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092AE2C83
	for <llvm@lists.linux.dev>; Wed, 17 Nov 2021 07:03:32 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Ux0WBIM_1637132585;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0Ux0WBIM_1637132585)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 17 Nov 2021 15:03:07 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: richard@nod.at
Cc: nathan@kernel.org,
	ndesaulniers@google.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] ubifs: Fix kernel-doc
Date: Wed, 17 Nov 2021 15:03:04 +0800
Message-Id: <1637132584-52066-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Fix function name in fs/ubifs/io.c kernel-doc comment
to remove some warnings found by clang(make W=1 LLVM=1).

fs/ubifs/io.c:497: warning: expecting prototype for
wbuf_timer_callback(). Prototype was for wbuf_timer_callback_nolock()
instead
fs/ubifs/io.c:513: warning: expecting prototype for new_wbuf_timer().
Prototype was for new_wbuf_timer_nolock() instead
fs/ubifs/io.c:538: warning: expecting prototype for cancel_wbuf_timer().
Prototype was for cancel_wbuf_timer_nolock() instead

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 fs/ubifs/io.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index 789a781..1dbee23 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -488,7 +488,7 @@ void ubifs_prep_grp_node(struct ubifs_info *c, void *node, int len, int last)
 }
 
 /**
- * wbuf_timer_callback - write-buffer timer callback function.
+ * wbuf_timer_callback_nolock - write-buffer timer callback function.
  * @timer: timer data (write-buffer descriptor)
  *
  * This function is called when the write-buffer timer expires.
@@ -505,7 +505,7 @@ static enum hrtimer_restart wbuf_timer_callback_nolock(struct hrtimer *timer)
 }
 
 /**
- * new_wbuf_timer - start new write-buffer timer.
+ * new_wbuf_timer_nolock - start new write-buffer timer.
  * @c: UBIFS file-system description object
  * @wbuf: write-buffer descriptor
  */
@@ -531,7 +531,7 @@ static void new_wbuf_timer_nolock(struct ubifs_info *c, struct ubifs_wbuf *wbuf)
 }
 
 /**
- * cancel_wbuf_timer - cancel write-buffer timer.
+ * cancel_wbuf_timer_nolock - cancel write-buffer timer.
  * @wbuf: write-buffer descriptor
  */
 static void cancel_wbuf_timer_nolock(struct ubifs_wbuf *wbuf)
-- 
1.8.3.1

