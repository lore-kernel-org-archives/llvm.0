Received: from out199-5.us.a.mail.aliyun.com (out199-5.us.a.mail.aliyun.com [47.90.199.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5176580F
	for <llvm@lists.linux.dev>; Fri, 10 Feb 2023 07:44:15 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R411e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VbJGL3p_1676011365;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VbJGL3p_1676011365)
          by smtp.aliyun-inc.com;
          Fri, 10 Feb 2023 14:42:52 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: mcgrof@kernel.org
Cc: chris@chrisdown.name,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] module: Remove the unused function within
Date: Fri, 10 Feb 2023 14:42:43 +0800
Message-Id: <20230210064243.116335-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function within is defined in the main.c file, but not called
elsewhere, so remove this unused function.

kernel/module/main.c:3007:19: warning: unused function 'within'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4035
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 kernel/module/main.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index c598f11e7016..062065568b40 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -3004,11 +3004,6 @@ SYSCALL_DEFINE3(finit_module, int, fd, const char __user *, uargs, int, flags)
 	return load_module(&info, uargs, flags);
 }
 
-static inline int within(unsigned long addr, void *start, unsigned long size)
-{
-	return ((void *)addr >= start && (void *)addr < start + size);
-}
-
 /* Keep in sync with MODULE_FLAGS_BUF_SIZE !!! */
 char *module_flags(struct module *mod, char *buf, bool show_state)
 {
-- 
2.20.1.7.g153144c

