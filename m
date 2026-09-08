Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAB058F071
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886511; cv=none; b=PaRJr5ZjlKKIaa8EhiI8PYdn4qH9VYQOEqUWoQnj7C+bRdptKih0yfTz89y+tkd0dcdWRnPASPZWhLD7PiZt4fcCuu5TRXzcne3+lNWtqt9QvSVDWXXESPGTM8AYpHzeswmjuBjo8A5L9xZcROqHBQEe7TmGoZQvbcyM3nyFuic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886511; c=relaxed/simple;
	bh=vkxeQ7PpkZnIrliC5/UORrRPv5LIO5nBtwshLbwdaTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p8AGLl9oKWZZYV+XgGrtDARylLe8U2tzkDM7RyqwA6NvpOQ9HtKGBrQPS6NNuSJxXsWQlHSNXBN8R9ucwiBuvPtgnvL49uCFUC44B/RSL25a36rJk2KcXdCAXbhgG+o0K0J4Njm0mVDckLinJKbTqHe2TsXKOqpCJEdK3ZAyAE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bWixRPs2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bWixRPs2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cda5e048fso145355e9.0
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 09:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886506; x=1789491306; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qiIZFjtrQa9YVC8NnwzXWfF3N1VkZxLZmC07XgW9jKw=;
        b=bWixRPs2o1Foa5cEpAQskCOHmBIZCriOnhj9AruoJYNYCRffS+plF8GCidA2PlVgXp
         +GcchNA8hAIlUwShEwMl3GYKNuHMofO5DPX5KnRpQrNdVBYsVrpkV53gDROyk4+YIijv
         GxGgCA6/62FS2HrVbcdqIDTNJ91v7xQ0FTbH3SHuCN2VeDXmb5tr1Ty0ZDcDLu7wTwvt
         ON/UWgqdFDeTQYHY3LcL1cpKs6fbHDZImmgwwGuOGBGvqBrX/jVju4v6VUCbhqFjiav2
         hoe0+DS+f5dUsadPiZsq6MfpvLVfEFtKzg8BlMQSqWPVBTIUjOqp8p6EYLF++b5/8LHo
         7oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886506; x=1789491306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiIZFjtrQa9YVC8NnwzXWfF3N1VkZxLZmC07XgW9jKw=;
        b=pXTUsajkrUytIx6b+afJqXgdzsiIRMTsXlOCdkMSrqB3MNOJ7lCVTonXIHO6ord1vj
         SAzPwHLHqRkwzphSLxqrjnBsO0unWcd/7a4iFrBsa78Ox6uf3L+/Ao7I0opDggdceIES
         elupCI2hXwH/TbH0ZNTVlwAAf3+g0FZAqYmaOYco+V1VfRrBmmQN3aoFT7vSabvlRT8Y
         81+CGfqUau63vYWk3OWf4LBRUun7Y1bNQBBFt+k1/+gok/mzSe1ZY1/I4eAw3etPZbFX
         2JL/LzG2+1K+gbYGUB89Jf5w/JZvnh/y9y4MnPXThLQhvBDptwU6CKD+2fiuZawwzLaN
         Cy8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxq2GLRYHOyswo3vXxOJ9R9Ydk+9FkLbNkyS7TRhCjxmX6pXDIZFBUkMSrWGgmQitWTZyWr@lists.linux.dev
X-Gm-Message-State: AFuF++m3fO49rFlVnpk5iiEv7/7ER2UQL/AiKLqAgipSh7/IRebLXTB6
	HSIaqYd/eUrYDdn1wnZcu9o6h7armQx0xGdgzErhNcMetQVpsF+E4LdwexBoe4Yk+Q==
X-Gm-Gg: AYBFou2h8RNAD6nLwx6t4RQhlXwU8rZGfa8r6AEB6V6WLJo47nT9+YwaxkNjTMSK9hb
	J7LxsQzVCt0Nds1g8JwSYgNVnaKVcusspv06zIqMNeCOxf2PqTVnrrDbStS/BW9wBbAuVCbTa+Q
	txuuGJQBvLc6i/tw8dRXz9zl3IbGv9kSxhxOcAGCM2Ia3P8N3yJcmAG/PpIoMptyhE8shScam/0
	MoF0caJRMdkzdVVwsRVwynxzin+MpsTWDrxBaKQ1UWCw/GuqpbK7F23JTmun07ANCM7MnKM4u7D
	JZzCnHpFzugN/fMQIl5sUqyj4afq8LRcPxaYPQSsrDW2405tuM9m1Zf/hqX3avEf71SCpJ4Kz84
	XFxVf2loDGuMlWrWlctuHgj7jIeQbpy17IU7VPlKYE0OSoAFvdxbXBZFTT42/AxuVvm/1L0qNl3
	N25WKgy/Va2ol5/GP1c4wjHMfkrNbSK/J6H2kwHf4UPyYT6gjZHrJsMij6AYC3DWvWIQCX5v23/
	bYHVwS06cLd0ptEXlNYercSggXwmJRGN6/OacEky7k0vazm
X-Received: by 2002:a05:600c:6a97:b0:49c:e41a:4c70 with SMTP id 5b1f17b1804b1-49d0918770cmr2097565e9.6.1788886505314;
        Tue, 08 Sep 2026 09:55:05 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fd5959fsm120175e9.1.2026.09.08.09.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:04 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:43 +0200
Subject: [PATCH RFC v3 03/12] kcov: introduce extended PC coverage
 collection mode
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-3-dcbc11593e88@google.com>
References: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
In-Reply-To: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=5697;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=vkxeQ7PpkZnIrliC5/UORrRPv5LIO5nBtwshLbwdaTk=;
 b=gEpbf8x0BgtqSFhOstHU4jG4bB7vlFxCbBJc1ogoMSuZFEjT6kvAgF5YwRXxop60QwmVplyyS
 xB3JTB88r9ACi20cnFlyo7Xqa/+iuhVLeaiMuWq8EIobrGG7rivZKdF
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
index cd79715db241..6c9f0373022f 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -23,8 +23,15 @@ enum kcov_mode {
 	KCOV_MODE_TRACE_CMP = 3,
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
index 26baccaaefa9..701ad69493bf 100644
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
@@ -228,8 +233,14 @@ void notrace __sanitizer_cov_trace_pc(void)
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
@@ -245,12 +256,28 @@ void notrace __sanitizer_cov_trace_pc_entry(void)
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
 
@@ -373,7 +400,7 @@ EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
 #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
 
 static void kcov_start(struct task_struct *t, struct kcov *kcov,
-			unsigned int size, void *area, enum kcov_mode mode,
+			unsigned int size, void *area, unsigned int mode,
 			int sequence)
 {
 	kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
@@ -590,6 +617,8 @@ static int kcov_get_mode(unsigned long arg)
 #else
 		return -ENOTSUPP;
 #endif
+	else if (arg == KCOV_TRACE_PC_EXT)
+		return IS_ENABLED(CONFIG_KCOV_EXT_RECORDS) ? KCOV_MODE_TRACE_PC_EXT : -ENOTSUPP;
 	else
 		return -EINVAL;
 }
@@ -1098,7 +1127,7 @@ void kcov_remote_stop(void)
 	 * and kcov_remote_stop(), hence the sequence check.
 	 */
 	if (sequence == kcov->sequence && kcov->remote)
-		kcov_move_area(kcov->mode, kcov->area, kcov->size, area);
+		kcov_move_area(kcov->mode & ~KCOV_EXT_FORMAT, kcov->area, kcov->size, area);
 	spin_unlock(&kcov->lock);
 
 	spin_lock(&kcov_remote_lock);

-- 
2.55.0.979.g7e5102b832-goog

