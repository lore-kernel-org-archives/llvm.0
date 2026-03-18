Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BFE402456
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 16:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851243; cv=none; b=HrhzILVZL9SRjOrzgucauLcLmDSCD4+cL0gvl/TkH9XOcNwJp6JxGlCLs0Hs10jiWW6GCfk1wO3twna3XVBuokDeMwmnuHxz4d9ETa14qisMgKDl+40msTWAWqgt85lecfUalKxm6DEiJoC/SJHCgxgxY8kBgTRBUmgOuUfHk8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851243; c=relaxed/simple;
	bh=52RZwge2HiHzFPyKFZk5GPDAZYf3/NA1Sia8icDS9Tc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m61zA6noWSVw+DzLz4oFUlO1WcTZ9xKTBgdjJQf7Q4PVDjNiqTzciGvCt4MtDcb0NfBHn+T9CrqSd9ylAqrP9UhhcupRIuAnZAlUYShaPV9NTX/pin/Y2VEs5rP8itO5F3Cyi6Ii+vkzuJg8xUXIzsbs1iyt1V+Ipin6nJp3HRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vVV+ZB1z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vVV+ZB1z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852af55981so96055e9.0
        for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 09:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773851235; x=1774456035; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQZ6ddyBeM1zS1Zg0ooxydiW5suttBWB2nJPekIy2YI=;
        b=vVV+ZB1zOQD2d/+slXR5lezN6AcH1q+uSDn8dwIqryOHehZ8dXZFi+ividc+oCL2SW
         PJhMP6fw9MhHQTSfL2U2gVyikx1yHwdJGnvbhb643zN3FR68wg+8w/xMSnafa3qial4r
         EHMkMji1kDgObkdK4KdRYYOniLNHYroIxQ1HtiJN/P9GbUMmriashkDLnqja9D6E0hBX
         R5sgNujldZn5fo4vaUuDvqTW9A3Ysn904JPjSBzXYu844Xppn5pJQjIQ2SuNWsDS2Stc
         XxmjMeHRneSIg9JK6mbK9e86nI8ekUziUNivGJ/mvl2MJ8aJC71B6N4dZJK26qbFU13F
         QmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773851235; x=1774456035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vQZ6ddyBeM1zS1Zg0ooxydiW5suttBWB2nJPekIy2YI=;
        b=tNXdCtQs6dihofidtaZXs75Ca4OWoAPfZ8xFtryfJtir8nR4rZrMboA26dQxj+ZXiz
         jTP47IXxvBD1zl4g7RChSfpKzz8D56CUH908MirwS3/3kJ3vwTe52v68XsNPmUtnbGcD
         ggWnaxPwl6lOmsQBYRxz2adyaotn+zUDffg5a6B5DlS5LLmi5uWfJIkJwcTHWKfY3xu4
         lH+d2Y8XK+ew+B+va1Caa/0kB/a2cCIm0jhTigjAkmwZ8zh0iDfE5wu2GuCOD2W1Uxcn
         CsJr96u5UEEeI2kiGyuApIC6KvBgIGuLhhL5speDAu5cksUsTSAuMZwGd40JYkrOW2pb
         TBRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc26HC6SL1yjYWvrdQl9qzs/xNxzf+PnmlRPQEf4+dZozE3lKaf/E81HqQBnhNQ/NDlYOv@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5+kjwq5Alc67ZvSdXNgLbkzYzwYFSRYJsDfucUMD79ULoaqg+
	iAQu+XcLFfDzEPVzOs24XoiK0hYj5l5T3Tsf5hxwdDZh8GLq+i/PchP00PfG+Z3+1kMNLjUU6hM
	YoVc2cjj3
X-Gm-Gg: ATEYQzzbdu1wNnHsMZaJGjnApTsVtEmPqh1gjpGektyvqxhRa7zGA8Ao6cxdVgUR8LY
	44kTqYKoytpYLKBnRUX3fdEwavWiXeOMUOrqhbN8vN+z1wXHaMGIVpQoMD4p3NlHrfs2m6HSUme
	yhsa7wSNFOhabRGJ/CJq1UU/tIOYFo9uEshcpCD+P3EFHe+3ZjVQafKD7U7UOwwn7ShGtnpm8dv
	dND+gLC51YS/Z+cKYXZ2ahB3hItWc7nSiUv2VEUJ+4bsry4KLvykRwcUQHCQExo/6jnVwyeo9lv
	Qgry9bwWOlRJ9WYNY7xVeiYgK8JTbMvc+JqV1Mjw3GD8ImvvlSuLRB91C2h9+bpqyu/LUkgM0JM
	yFmqDfiSarsuZIRYGWes7uZYnseemJHeLolMCHBLR2eKuQOq2hMMCT9w9y93XePQJfBF1QH6YHS
	gj85ms9slI5mbyEmxx4dQbQ961e63uDbhgooRRD0Aq5+0q6YR1GA==
X-Received: by 2002:a05:600c:8889:10b0:483:6f85:b16e with SMTP id 5b1f17b1804b1-486f4ce23ecmr596355e9.3.1773851234397;
        Wed, 18 Mar 2026 09:27:14 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:c66d:1e51:595a:925])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-486f4b9bb2esm20905255e9.20.2026.03.18.09.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:27:13 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Wed, 18 Mar 2026 17:27:01 +0100
Subject: [PATCH v2 4/4] kcov: introduce extended PC coverage collection
 mode
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-kcov-extrecord-v2-4-2522da6fcd3f@google.com>
References: <20260318-kcov-extrecord-v2-0-2522da6fcd3f@google.com>
In-Reply-To: <20260318-kcov-extrecord-v2-0-2522da6fcd3f@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773851224; l=5681;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=52RZwge2HiHzFPyKFZk5GPDAZYf3/NA1Sia8icDS9Tc=;
 b=tLZgiv8MkBfdhi/W3flmRalK3OU9W4IRmqGFBLRSj8kDcwSh7Nei0AFtOSJwz3H/1nqGUg3dn
 dDZNtgFXJmxB6aSRsbo3EwV8RxFRYsCND/pdn97snaexZB7ADSu8WBA
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

This is the second half of CONFIG_KCOV_EXT_RECORDS.

Introduce a new KCOV mode KCOV_TRACE_PC_EXT which replaces the upper 8 bits
of recorded instruction pointers with metadata. For now, userspace can use
this metadata to distinguish three types of records:

 - function entry
 - function exit
 - normal basic block inside the function

Internally, this new mode is represented as a variant of
KCOV_MODE_TRACE_PC, distinguished with the flag KCOV_EXT_FORMAT.
Store this flag as part of the mode in task_struct::kcov_mode and in
kcov::mode to avoid having to pass it around separately everywhere.

Signed-off-by: Jann Horn <jannh@google.com>
---
 include/linux/kcov.h      |  7 +++++++
 include/uapi/linux/kcov.h | 12 ++++++++++++
 kernel/kcov.c             | 39 ++++++++++++++++++++++++++++++++++-----
 3 files changed, 53 insertions(+), 5 deletions(-)

diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index e5502d674029..455302b1cd1c 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -25,8 +25,15 @@ enum kcov_mode {
 	KCOV_MODE_REMOTE = 4,
 };
 
+/*
+ * Modifier for KCOV_MODE_TRACE_PC to record function entry/exit marked with
+ * metadata bits.
+ */
+#define KCOV_EXT_FORMAT	(1 << 29)
 #define KCOV_IN_CTXSW	(1 << 30)
 
+#define KCOV_MODE_TRACE_PC_EXT (KCOV_MODE_TRACE_PC | KCOV_EXT_FORMAT)
+
 void kcov_task_init(struct task_struct *t);
 void kcov_task_exit(struct task_struct *t);
 
diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index ed95dba9fa37..8d8a233bd61f 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -35,8 +35,20 @@ enum {
 	KCOV_TRACE_PC = 0,
 	/* Collecting comparison operands mode. */
 	KCOV_TRACE_CMP = 1,
+	/*
+	 * Extended PC coverage collection mode.
+	 * In this mode, the top byte of the PC is replaced with flag bits
+	 * (KCOV_RECORDFLAG_*).
+	 */
+	KCOV_TRACE_PC_EXT = 2,
 };
 
+#define KCOV_RECORD_IP_MASK         0x00ffffffffffffff
+#define KCOV_RECORDFLAG_TYPEMASK    0xf000000000000000
+#define KCOV_RECORDFLAG_TYPE_NORMAL 0xf000000000000000
+#define KCOV_RECORDFLAG_TYPE_ENTRY  0x0000000000000000
+#define KCOV_RECORDFLAG_TYPE_EXIT   0x1000000000000000
+
 /*
  * The format for the types of collected comparisons.
  *
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 7edb39e18bfe..3cd4ee4cc310 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -55,7 +55,12 @@ struct kcov {
 	refcount_t		refcount;
 	/* The lock protects mode, size, area and t. */
 	spinlock_t		lock;
-	enum kcov_mode		mode __guarded_by(&lock);
+	/*
+	 * Mode, consists of:
+	 *  - enum kcov_mode
+	 *  - flag KCOV_EXT_FORMAT
+	 */
+	unsigned int		mode __guarded_by(&lock);
 	/* Size of arena (in long's). */
 	unsigned int		size __guarded_by(&lock);
 	/* Coverage buffer shared with user space. */
@@ -232,8 +237,14 @@ void notrace __sanitizer_cov_trace_pc(void)
 {
 	struct task_struct *cur = current;
 
-	if (READ_ONCE(cur->kcov_mode) != KCOV_MODE_TRACE_PC)
+	if ((READ_ONCE(cur->kcov_mode) & ~KCOV_EXT_FORMAT) != KCOV_MODE_TRACE_PC)
 		return;
+	/*
+	 * No bitops are needed here for setting the record type because
+	 * KCOV_RECORDFLAG_TYPE_NORMAL has the high bits set.
+	 * This relies on userspace not caring about the rest of the top byte
+	 * for KCOV_RECORDFLAG_TYPE_NORMAL records.
+	 */
 	kcov_add_pc_record(cur, canonicalize_ip(_RET_IP_));
 }
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
@@ -249,12 +260,28 @@ void notrace __sanitizer_cov_trace_pc_entry(void)
 	 * This hook replaces __sanitizer_cov_trace_pc() for the function entry
 	 * basic block; it should still emit a record even in classic kcov mode.
 	 */
-	if (kcov_mode != KCOV_MODE_TRACE_PC)
+	if ((kcov_mode & ~KCOV_EXT_FORMAT) != KCOV_MODE_TRACE_PC)
 		return;
+	if ((kcov_mode & KCOV_EXT_FORMAT) != 0)
+		record = (record & KCOV_RECORD_IP_MASK) | KCOV_RECORDFLAG_TYPE_ENTRY;
 	kcov_add_pc_record(cur, record);
 }
 void notrace __sanitizer_cov_trace_pc_exit(void)
 {
+	struct task_struct *cur = current;
+	unsigned long record;
+
+	/*
+	 * This hook is not called at the beginning of a basic block; the basic
+	 * block from which the hook was invoked is already covered by a
+	 * preceding hook call.
+	 * So unlike __sanitizer_cov_trace_pc_entry(), this PC should only be
+	 * reported in extended mode, where function exit events are recorded.
+	 */
+	if (READ_ONCE(cur->kcov_mode) != KCOV_MODE_TRACE_PC_EXT)
+		return;
+	record = (canonicalize_ip(_RET_IP_) & KCOV_RECORD_IP_MASK) | KCOV_RECORDFLAG_TYPE_EXIT;
+	kcov_add_pc_record(cur, record);
 }
 #endif
 
@@ -377,7 +404,7 @@ EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
 #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
 
 static void kcov_start(struct task_struct *t, struct kcov *kcov,
-			unsigned int size, void *area, enum kcov_mode mode,
+			unsigned int size, void *area, unsigned int mode,
 			int sequence)
 {
 	kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
@@ -577,6 +604,8 @@ static int kcov_get_mode(unsigned long arg)
 #else
 		return -ENOTSUPP;
 #endif
+	else if (arg == KCOV_TRACE_PC_EXT)
+		return IS_ENABLED(CONFIG_KCOV_EXT_RECORDS) ? KCOV_MODE_TRACE_PC_EXT : -ENOTSUPP;
 	else
 		return -EINVAL;
 }
@@ -1089,7 +1118,7 @@ void kcov_remote_stop(void)
 	 * and kcov_remote_stop(), hence the sequence check.
 	 */
 	if (sequence == kcov->sequence && kcov->remote)
-		kcov_move_area(kcov->mode, kcov->area, kcov->size, area);
+		kcov_move_area(kcov->mode & ~KCOV_EXT_FORMAT, kcov->area, kcov->size, area);
 	spin_unlock(&kcov->lock);
 
 	if (in_task()) {

-- 
2.53.0.851.ga537e3e6e9-goog

