Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C640D58FD09
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 16:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886512; cv=none; b=L557SaLHSDaFrc/2oyNmtARtWLd3dFzYqVccnzhYr9LNfvq3cIO3OZNEzMg/FMNjcQo4KvC6e3ODPpGWReXNfBDpQaqMFGZ96vO5p0fGvG2yFHBrWPF9RF+ux3xphnnI8UV9nDseRckfkb1/r2eNYUk31WeIe8STTETX9nqUW1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886512; c=relaxed/simple;
	bh=3ehJaQwH2cLaqFIB9pK0qax4lQLljQfavu2Lu9R+/sE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QlBBc+WO0RLizsjeDsZTDSVKbI5b8xD8V7l8X654crG+91sWIltacdE9cQG4pfv4cavmeWZI8uNPY9VHs4pl3nsu195zULwoP7tD5chd0IbfOubYOrgH3kkYhh2TONDjZmC2y5YviDFAvnJUVQcfQVMS3qhgRgXHaTz2ZU0d2Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o+fOc0Jg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o+fOc0Jg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b5e50eb70so101925e9.1
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 09:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886508; x=1789491308; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gAVsSzOIvfCvCjIHusXiixu/0awvwiM/FetAo9sODI8=;
        b=o+fOc0Jg1bJ2BxTCnWUtT2xM8BucFz1D4eyjcvCxwdefGMZMr1PWnWKDdzbj/cXHl0
         V44YeO6KwQv1aCz/QuaHEHdFYivURgmMSl1fgPCAk1Z9H653CxUhDYpl7DqTNNm1Bhij
         eDXvHgaqLLk3Tr4KUnsi/Y/I7mtOzIOahiI9rB0QAJQWbKqR6Mc6FExR9ggofYCe0tBG
         zO0jsBD2oj2gnZBy2YIQWtz1IoDfGXiPVYaNhwecDOyo+L3pEYaj7ycwQkiDBgOd6sKP
         PFr8B/ZtzZfdsgk6pK+898LrX1wn/ecaBsNxYxCAfLIaICPSdjPMOMRMWfXwnHHPKPw9
         ZWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886508; x=1789491308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gAVsSzOIvfCvCjIHusXiixu/0awvwiM/FetAo9sODI8=;
        b=bYjdzEbRoot6Zyt5w8gJJqTz1nDYCHntLL7/BI7N0uL9hIwE1AiSsa8HP6nhD43U/f
         9pnMx2oZml7WIO7yoV0ckHiSkOAXs9v/ZgSTpJqaumMzHeTt3fW8OaFAnFnANevfVDGM
         BYkz5w90qpjHrxwx3XvBVEGjACTEsRXRHGOeWYdXIykjqYyP22v82mmvPTEQ43l28nHO
         wnWYyE/1bqsItNmeCGkV6RZLWAe1hYkFXsmtwKAN3XQhbRzhVctgBZktf1lbtQUsCftw
         bWD96DK5UDnRCsHNxZ876HveUj0WCfqxziLTQiwIh4UDz1b8VW8kca1JNRItaGxm6Zkw
         p94A==
X-Forwarded-Encrypted: i=1; AKwUvBxdXbbI61VrdCiM4Gr6Mk7GxjafnyVIdU/2e0wu3EKYO1PYagLiHUyYult+27IGtT2ojEHE@lists.linux.dev
X-Gm-Message-State: AFuF++kw6iPt3u7MePBjJFEYBxdUL9iWBH7/CuiVbzHUJ0cBt8oprj3R
	vRvHBFK9c9KdYnxwvtA8dzYR/SDJSuHeJ4M4HpZOZXga6ZEgS2VGvOQxHDvenTF3qQ==
X-Gm-Gg: AYBFou2u9dajJ8rPovJEDAft1DWzE3fQf7qPgetJhJkNawGYjs79pQJPIiE8aZEfqcm
	xaWUEMTv5loWhUvmH6yJnweBpcL8pu23nrqu9euWsBkghI9cJkmabS5269WBWDDgQcdLMdxX+tP
	qPNfWnnvorLmMhR4fpTlj2IrZ3nLm2E8iB1gogCxgzCsUk4w6pedOoK2oB+cS9lA69NlXyxUSze
	aDSTgQpaGh0rpl6JVDofWLFfMiG4U+ogQzY7aGPsh1/kOnYG6VS8QSKJOtsj9rmhCx01rdYzRv4
	yIdnqCoQBdmkQbt/HdbfyCPx9PLhhjphjHpCdzBgbJx9TAnPsF3BKYaeRLeNwhWds+16KUcssKo
	MgvYAAs32TYSEnALE5D9OtidKCzg9OZk0aPULY3119/tiYWmLtiRSfMuFL0k7teX+LavWOIAapW
	uc5mJFkCh/U8wv7qmlBleLxb0mlNVkWdpK0AQcQA1iEBXDcCM7cTNKDfuL9xw/5VpHv6Q+YlMgt
	qIZx15ub4KGfEwspPmq0OXBW0y7eeumK/uxTZRTCmWw5OMG
X-Received: by 2002:a05:600c:6c4e:b0:49d:3:4a29 with SMTP id 5b1f17b1804b1-49d1f6e324cmr36965e9.7.1788886507196;
        Tue, 08 Sep 2026 09:55:07 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm31989701f8f.9.2026.09.08.09.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:06 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:44 +0200
Subject: [PATCH RFC v3 04/12] kcov: summarize entry/exit while disabled
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-4-dcbc11593e88@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=4851;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=3ehJaQwH2cLaqFIB9pK0qax4lQLljQfavu2Lu9R+/sE=;
 b=1PtG4EdUagp4gP5iDk3jLQFUBtzlXenzTz6y7/KiV9cSp2fcNYAro0JWEvHlVJnfsXgirf9U0
 IcCeVUrYXqfDNWwOh9DTjLf2X9zmbo4yY91FXs59zXa/7XuQH/ggPJ3
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

In case kcov is re-enabled with a different call stack than the one it
was disabled with, emit events that summarize changes to the call stack
so that userspace can continue tracking the call stack across context
switches.

Signed-off-by: Jann Horn <jannh@google.com>
---
 include/linux/kcov.h      | 11 ++---------
 include/uapi/linux/kcov.h |  2 ++
 kernel/kcov.c             | 48 +++++++++++++++++++++++++++++++++++++++++++++--
 3 files changed, 50 insertions(+), 11 deletions(-)

diff --git a/include/linux/kcov.h b/include/linux/kcov.h
index 6c9f0373022f..357f4de8790a 100644
--- a/include/linux/kcov.h
+++ b/include/linux/kcov.h
@@ -35,15 +35,8 @@ enum kcov_mode {
 void kcov_task_init(struct task_struct *t);
 void kcov_task_exit(struct task_struct *t);
 
-#define kcov_prepare_switch(t)			\
-do {						\
-	(t)->kcov_mode |= KCOV_IN_CTXSW;	\
-} while (0)
-
-#define kcov_finish_switch(t)			\
-do {						\
-	(t)->kcov_mode &= ~KCOV_IN_CTXSW;	\
-} while (0)
+void kcov_prepare_switch(struct task_struct *cur);
+void kcov_finish_switch(struct task_struct *cur);
 
 /* See Documentation/dev-tools/kcov.rst for usage details. */
 void kcov_remote_start(u64 handle);
diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index 8d8a233bd61f..75c582784055 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -48,6 +48,8 @@ enum {
 #define KCOV_RECORDFLAG_TYPE_NORMAL 0xf000000000000000
 #define KCOV_RECORDFLAG_TYPE_ENTRY  0x0000000000000000
 #define KCOV_RECORDFLAG_TYPE_EXIT   0x1000000000000000
+/* Summarized entry/exit events that occurred in an untraced region. */
+#define KCOV_RECORDFLAG_TYPE_EESUM  0x2000000000000000
 
 /*
  * The format for the types of collected comparisons.
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 701ad69493bf..712f0f744ec5 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -76,6 +76,8 @@ struct kcov {
 	 * kcov_remote_stop(), see the comment there.
 	 */
 	int			sequence;
+	int			suppressed_stack_delta;
+	int			suppressed_stack_mindelta;
 };
 
 struct kcov_remote_area {
@@ -256,8 +258,12 @@ void notrace __sanitizer_cov_trace_pc_entry(void)
 	 * This hook replaces __sanitizer_cov_trace_pc() for the function entry
 	 * basic block; it should still emit a record even in classic kcov mode.
 	 */
-	if ((kcov_mode & ~KCOV_EXT_FORMAT) != KCOV_MODE_TRACE_PC)
+	if ((kcov_mode & ~(KCOV_EXT_FORMAT|KCOV_IN_CTXSW)) != KCOV_MODE_TRACE_PC)
 		return;
+	if (kcov_mode & KCOV_IN_CTXSW) {
+		cur->kcov->suppressed_stack_delta++;
+		return;
+	}
 	if ((kcov_mode & KCOV_EXT_FORMAT) != 0)
 		record = (record & KCOV_RECORD_IP_MASK) | KCOV_RECORDFLAG_TYPE_ENTRY;
 	kcov_add_pc_record(cur, record);
@@ -266,6 +272,7 @@ void notrace __sanitizer_cov_trace_pc_exit(void)
 {
 	struct task_struct *cur = current;
 	unsigned long record;
+	unsigned int kcov_mode = READ_ONCE(cur->kcov_mode);
 
 	/*
 	 * This hook is not called at the beginning of a basic block; the basic
@@ -274,8 +281,16 @@ void notrace __sanitizer_cov_trace_pc_exit(void)
 	 * So unlike __sanitizer_cov_trace_pc_entry(), this PC should only be
 	 * reported in extended mode, where function exit events are recorded.
 	 */
-	if (READ_ONCE(cur->kcov_mode) != KCOV_MODE_TRACE_PC_EXT)
+	if ((kcov_mode & ~KCOV_IN_CTXSW) != KCOV_MODE_TRACE_PC_EXT)
 		return;
+	if (kcov_mode & KCOV_IN_CTXSW) {
+		struct kcov *kcov = cur->kcov;
+
+		if (kcov->suppressed_stack_mindelta == kcov->suppressed_stack_delta)
+			kcov->suppressed_stack_mindelta--;
+		kcov->suppressed_stack_delta--;
+		return;
+	}
 	record = (canonicalize_ip(_RET_IP_) & KCOV_RECORD_IP_MASK) | KCOV_RECORDFLAG_TYPE_EXIT;
 	kcov_add_pc_record(cur, record);
 }
@@ -399,6 +414,35 @@ void notrace __sanitizer_cov_trace_switch(kcov_u64 val, void *arg)
 EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
 #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
 
+void kcov_prepare_switch(struct task_struct *cur)
+{
+#ifdef CONFIG_KCOV_EXT_RECORDS
+	struct kcov *kcov = cur->kcov;
+
+	if (kcov) {
+		kcov->suppressed_stack_mindelta = 0;
+		kcov->suppressed_stack_delta = 0;
+	}
+#endif
+	cur->kcov_mode |= KCOV_IN_CTXSW;
+}
+
+void kcov_finish_switch(struct task_struct *cur)
+{
+	struct kcov *kcov = cur->kcov;
+	unsigned long record;
+
+	cur->kcov_mode &= ~KCOV_IN_CTXSW;
+	if (!IS_ENABLED(CONFIG_KCOV_EXT_RECORDS))
+		return;
+	if ((cur->kcov_mode & KCOV_EXT_FORMAT) == 0)
+		return;
+	record = KCOV_RECORDFLAG_TYPE_EESUM |
+		(((u16)(s16)kcov->suppressed_stack_mindelta)<<16) |
+		(((u16)(s16)kcov->suppressed_stack_delta)<<16);
+	kcov_add_pc_record(cur, record);
+}
+
 static void kcov_start(struct task_struct *t, struct kcov *kcov,
 			unsigned int size, void *area, unsigned int mode,
 			int sequence)

-- 
2.55.0.979.g7e5102b832-goog

