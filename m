Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC2348463
	for <llvm@lists.linux.dev>; Wed, 11 Mar 2026 21:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773263215; cv=none; b=i+/RvZBbkrHWOeZNTbfUxSxs9e+/2oacV/gQrk+5xByiX1Grh1Uzmtc28Z7leo2gZwlOwUtq1Fgo6d7sUBM64G7THH31BKPscVGl4YSIGXR7JVXnzrFV4B9aHWdNObH4xirOt6d82MbmzMVNU9THNeYwf6M0fEbfuZP46t2KbsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773263215; c=relaxed/simple;
	bh=gl1kEdDECICBLTyyKuOyRBl/9O6Rh/+H5tSpq5Vi8UM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t++0ioEQ35+Ll0b1Ki57HB8wfoQ5EvaqLNfR+CpMJcCKz0dFFZl0qpktFeyp11KRiJcEkhVqITbjhDSoNTV0GzAtGJNxo6vaW+C2ay/8RTeGkxKHdzwqEJkOXBPTZGMdRP9Y7pPrUeAenmL7EvQCEL71ej+FsTNg0BkZCx8cowE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gglQkCnA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gglQkCnA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4852ef20fe8so8185e9.1
        for <llvm@lists.linux.dev>; Wed, 11 Mar 2026 14:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773263212; x=1773868012; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjaMhHW49Qnvje+/av4ZyUIAC9q72eON3wvAJYxVTt0=;
        b=gglQkCnAFbuhmjqr5R4wZz/nZpEOLlxyUK9qT/kFX1et3ilngvop5/kL3ku5Cp+g4Q
         ZiGbfO3Fh6l+WRWMs1oHiAqvxTX255OJ4IdbNzd/nITasF/YYExMkqMiXPchjqSZLfuT
         4Etp+yKbCa6jnKj4N5UXtxKlwp1kjPxmzWmXNqnomLOfKZBgDjLryy6gV1WtrjzP14d3
         uhiPCi3Fzi9uj1wsM+A6GWDHc82D5cri5SnhRNCefuVLJKANGYXbARB40xqwr7QaFmWk
         hx91f3+M0dRv2QEh2psA5S2wXmzpP0eX/qSS9lDF2PKbW/3GVZzCGKl/5h/kLzWQ/Phk
         0dKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773263212; x=1773868012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jjaMhHW49Qnvje+/av4ZyUIAC9q72eON3wvAJYxVTt0=;
        b=f5gDSbERtYoaiKPbtbkn3tUB3uPyQYJ7mHEE43l9VoaVbhRj8tL8zjoRJ+iE/bcjvJ
         9CQn4IFG4J1andOY9gvY+cybkZQ+ena/m26mh72f61TMLkgR26QS12tkJDyMg9yCHAA8
         7c9INKD+Ay6JvveKOfW2GmWhWcY+bh0gAn9F6ziMl1s/MEi32gc5JKNFYBx8fmpeDj4v
         QwbTYGE87BOa+Gu3JHgvWGq+vN2S5JF982K6dV5kkGxl7jgp+lEGvYUJ0uwEQM2dzani
         y/nLgMlHOTfh8etxMk5i/jSD8TILt0vZNU0jd3jLzH0mblVHVfLRLBlywipGa7Tov5kV
         96LA==
X-Forwarded-Encrypted: i=1; AJvYcCWVkGl6/a/nOcl6HWlNzSyWvXZvmQEWmtDTwYx2pPbzKd+KLwZ74loLp84NKXZCJaULIbfh@lists.linux.dev
X-Gm-Message-State: AOJu0YzHD8NEA0IcgcBYPS4WA+1rbbaJJLrlhtsyBrMisX1oteU7XZi/
	YzuCxOqTxU5mhu9RM+W4gPKJw/XsRm/T9p3GgKQiUAWWWSU+e7sQfykNJAsB1IinIA==
X-Gm-Gg: ATEYQzw73aJoCtb8XgY1pOKbfL40gcyLagYyYO5WwaD/DFSnuWiPYkHwlfGydOZk2cw
	BPxK48b4LsYpaeIrdYA52JAbzJ7co09CxEPjTs1BhHfnZQVP7OlliEBue696NBaglqVzOnPQfjd
	ddxse4ll3S/NNq9GsNp9Hhtjptcact5pQGWshCOLAl3xTmXNllJcN+YEh0sUQtK+sDbKfYIw7kE
	FkeE0Xkd6550kC4vZdzrXmDGRfuiJlzdbMR+XccirZcO2QBVOZT00o3qYo+DAkJ2KXmDTc6nhQj
	0wWNXSGf00iUkq3m+fJ+BvJ1iarm2fqbu7T6AxdqxFh/qi14bZGdVk04fn8luNDRVrJDgpNrQNW
	xGfQ2GfR8ZxahZ/iMjs46wb1Lfgu5rRj9pfd3bu5Q7plLsyG3G0NY/VZAewKd87/G26BqpmLuD/
	vlBHxkWvtX65AQe8/EG08UCSPYKzpeVR2eRI2E0wGXm0do+cGT84VNk4wE3FFECQ==
X-Received: by 2002:a05:600c:c285:b0:477:86fd:fb47 with SMTP id 5b1f17b1804b1-4854fa1a473mr146295e9.8.1773263211980;
        Wed, 11 Mar 2026 14:06:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:c9d4:528c:7414:ba3a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4854b0b906esm39112635e9.4.2026.03.11.14.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 14:06:51 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Wed, 11 Mar 2026 22:06:16 +0100
Subject: [PATCH 3/3] kcov: introduce extended PC coverage collection mode
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-kcov-extrecord-v1-3-68f03c4a05ad@google.com>
References: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com>
In-Reply-To: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773263202; l=7510;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=gl1kEdDECICBLTyyKuOyRBl/9O6Rh/+H5tSpq5Vi8UM=;
 b=e/rnv3+0v+r78iIlsq75/4nso6BkrQk3V2nDG/iHUsVN7+gvM3C9zbVYQ5KwhdojDxQjkjCZ7
 dQQGF6fxaiPBk56ppaUuFfJ3FRVFPNtBItKr6lDOZo9uaR561Iq3UG/
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

This is the second half of CONFIG_KCOV_EXT_RECORDS.

Introduce a new KCOV mode KCOV_TRACE_PC_EXT which replaces the upper 8 bits
of recorded instruction pointers with metadata. For now, userspace can use
this metadata to distinguish three types of records:

 - function entry
 - function exit
 - normal basic block inside the function

Signed-off-by: Jann Horn <jannh@google.com>
---
 include/linux/sched.h     |  6 ++++--
 include/uapi/linux/kcov.h | 12 ++++++++++++
 kernel/kcov.c             | 46 +++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 57 insertions(+), 7 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index a7b4a980eb2f..9a297d2d2abc 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1519,8 +1519,10 @@ struct task_struct {
 	int				kcov_sequence;
 
 	/* Collect coverage from softirq context: */
-	unsigned int			kcov_softirq;
-#endif
+	unsigned int			kcov_softirq : 1;
+	/* Emit KCOV records in extended format: */
+	unsigned int			kcov_ext_format : 1;
+#endif /* CONFIG_KCOV */
 
 #ifdef CONFIG_MEMCG_V1
 	struct mem_cgroup		*memcg_in_oom;
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
index 2cc48b65384b..3482044a7bd5 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -71,6 +71,8 @@ struct kcov {
 	 * kcov_remote_stop(), see the comment there.
 	 */
 	int			sequence;
+	/* Whether emitted records should have type bits. */
+	unsigned int kcov_ext_format : 1 __guarded_by(&lock);
 };
 
 struct kcov_remote_area {
@@ -97,6 +99,7 @@ struct kcov_percpu_data {
 	void			*saved_area;
 	struct kcov		*saved_kcov;
 	int			saved_sequence;
+	unsigned int		saved_kcov_ext_format : 1;
 };
 
 static DEFINE_PER_CPU(struct kcov_percpu_data, kcov_percpu_data) = {
@@ -235,6 +238,12 @@ static void notrace kcov_add_pc_record(unsigned long record)
  */
 void notrace __sanitizer_cov_trace_pc(void)
 {
+	/*
+	 * No bitops are needed here for setting the record type because
+	 * KCOV_RECORDFLAG_TYPE_NORMAL has the high bits set.
+	 * This relies on userspace not caring about the rest of the top byte
+	 * for KCOV_RECORDFLAG_TYPE_NORMAL records.
+	 */
 	kcov_add_pc_record(canonicalize_ip(_RET_IP_));
 }
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
@@ -244,10 +253,26 @@ void notrace __sanitizer_cov_trace_pc_entry(void)
 {
 	unsigned long record = canonicalize_ip(_RET_IP_);
 
+	/*
+	 * This hook replaces __sanitizer_cov_trace_pc() for the function entry
+	 * basic block; it should still emit a record even in classic kcov mode.
+	 */
+	if (current->kcov_ext_format)
+		record = (record & KCOV_RECORD_IP_MASK) | KCOV_RECORDFLAG_TYPE_ENTRY;
 	kcov_add_pc_record(record);
 }
 void notrace __sanitizer_cov_trace_pc_exit(void)
 {
+	unsigned long record;
+
+	/*
+	 * Unlike __sanitizer_cov_trace_pc_entry(), this PC should only be
+	 * reported in extended mode.
+	 */
+	if (!current->kcov_ext_format)
+		return;
+	record = (canonicalize_ip(_RET_IP_) & KCOV_RECORD_IP_MASK) | KCOV_RECORDFLAG_TYPE_EXIT;
+	kcov_add_pc_record(record);
 }
 #endif
 
@@ -371,7 +396,7 @@ EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
 
 static void kcov_start(struct task_struct *t, struct kcov *kcov,
 			unsigned int size, void *area, enum kcov_mode mode,
-			int sequence)
+			int sequence, unsigned int kcov_ext_format)
 {
 	kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
 	t->kcov = kcov;
@@ -379,6 +404,7 @@ static void kcov_start(struct task_struct *t, struct kcov *kcov,
 	t->kcov_size = size;
 	t->kcov_area = area;
 	t->kcov_sequence = sequence;
+	t->kcov_ext_format = kcov_ext_format;
 	/* See comment in check_kcov_mode(). */
 	barrier();
 	WRITE_ONCE(t->kcov_mode, mode);
@@ -398,6 +424,7 @@ static void kcov_task_reset(struct task_struct *t)
 	kcov_stop(t);
 	t->kcov_sequence = 0;
 	t->kcov_handle = 0;
+	t->kcov_ext_format = 0;
 }
 
 void kcov_task_init(struct task_struct *t)
@@ -570,6 +597,8 @@ static int kcov_get_mode(unsigned long arg)
 #else
 		return -ENOTSUPP;
 #endif
+	else if (arg == KCOV_TRACE_PC_EXT)
+		return IS_ENABLED(CONFIG_KCOV_EXT_RECORDS) ? KCOV_MODE_TRACE_PC : -ENOTSUPP;
 	else
 		return -EINVAL;
 }
@@ -636,8 +665,9 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 			return mode;
 		kcov_fault_in_area(kcov);
 		kcov->mode = mode;
+		kcov->kcov_ext_format = (arg == KCOV_TRACE_PC_EXT);
 		kcov_start(t, kcov, kcov->size, kcov->area, kcov->mode,
-				kcov->sequence);
+				kcov->sequence, kcov->kcov_ext_format);
 		kcov->t = t;
 		/* Put either in kcov_task_exit() or in KCOV_DISABLE. */
 		kcov_get(kcov);
@@ -668,7 +698,8 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 			return -EINVAL;
 		kcov->mode = mode;
 		t->kcov = kcov;
-	        t->kcov_mode = KCOV_MODE_REMOTE;
+		t->kcov_mode = KCOV_MODE_REMOTE;
+		kcov->kcov_ext_format = (remote_arg->trace_mode == KCOV_TRACE_PC_EXT);
 		kcov->t = t;
 		kcov->remote = true;
 		kcov->remote_size = remote_arg->area_size;
@@ -853,6 +884,7 @@ static void kcov_remote_softirq_start(struct task_struct *t)
 		data->saved_area = t->kcov_area;
 		data->saved_sequence = t->kcov_sequence;
 		data->saved_kcov = t->kcov;
+		data->saved_kcov_ext_format = t->kcov_ext_format;
 		kcov_stop(t);
 	}
 }
@@ -865,12 +897,14 @@ static void kcov_remote_softirq_stop(struct task_struct *t)
 	if (data->saved_kcov) {
 		kcov_start(t, data->saved_kcov, data->saved_size,
 				data->saved_area, data->saved_mode,
-				data->saved_sequence);
+				data->saved_sequence,
+				data->saved_kcov_ext_format);
 		data->saved_mode = 0;
 		data->saved_size = 0;
 		data->saved_area = NULL;
 		data->saved_sequence = 0;
 		data->saved_kcov = NULL;
+		data->saved_kcov_ext_format = 0;
 	}
 }
 
@@ -884,6 +918,7 @@ void kcov_remote_start(u64 handle)
 	unsigned int size;
 	int sequence;
 	unsigned long flags;
+	unsigned int kcov_ext_format;
 
 	if (WARN_ON(!kcov_check_handle(handle, true, true, true)))
 		return;
@@ -930,6 +965,7 @@ void kcov_remote_start(u64 handle)
 	 * acquired _after_ kcov->lock elsewhere.
 	 */
 	mode = context_unsafe(kcov->mode);
+	kcov_ext_format = context_unsafe(kcov->kcov_ext_format);
 	sequence = kcov->sequence;
 	if (in_task()) {
 		size = kcov->remote_size;
@@ -958,7 +994,7 @@ void kcov_remote_start(u64 handle)
 		kcov_remote_softirq_start(t);
 		t->kcov_softirq = 1;
 	}
-	kcov_start(t, kcov, size, area, mode, sequence);
+	kcov_start(t, kcov, size, area, mode, sequence, kcov_ext_format);
 
 	local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
 

-- 
2.53.0.473.g4a7958ca14-goog

