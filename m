Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D92E2F261C
	for <llvm@lists.linux.dev>; Wed, 11 Mar 2026 21:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773263211; cv=none; b=BPvYCcxyDLOEMmsJB3IieAcI+Bsr7L/P4qtVRlMocBik08ZfbI6uxlSXczb3n0amDCL5NBq2/UHlO7nvTC6VuuTQs2C0pfxf+6QvA0l/Z3pOiSMvfTATlBLbHiYCEwB5EF9D4OKPt4/yYJ+igjti6Rt96ixFqX4AlhM1TAL6ceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773263211; c=relaxed/simple;
	bh=Rn/uhAEizGU7xZ5aEfF2VvvEfAV/mBrSUtHKuGh1e2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OIay9aa/NBPPa0uVktShtdwID/wsRFXphu7cEjR1UC8g3NDg+f0aZedESNLK16IpVcl7/9CV/vzphyA9kF0YXQKodX2w86YOlZCF/FS4nVLntAXAWL0r/pCrR34Bn16l5s4VbDcHUffdmnp9Y1SnQP0iGJQwI46DEYXed5hGboU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L4r5FzFd; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L4r5FzFd"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-485317b6bd0so9055e9.1
        for <llvm@lists.linux.dev>; Wed, 11 Mar 2026 14:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773263209; x=1773868009; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jq184yv6qhyq5he4JEdx2+D4Atx68RIlmhXc/nCq5F8=;
        b=L4r5FzFdpsVUE5iUs4z50wHz2LOHO/BRfCshoRoOaFPY0XN0LLw9CHYt5voPXOtwQy
         uxqxdIpcWJ5dC1M+Men3TlXLzqFG6sD7vjCmO12HsMmbV7hXZYttk8BnM7YFH9ExUpXZ
         aXF9U7cXRmcTHy68CRa7aBYOidG09vQBviESdZ6BXQWmr0syZMNiF2NneMCCQz7Ibsz4
         DIAZ8uhNXp2dy7JgukCfhNwe1ssJaKTS/U4PCxiNY56rVS9AvSaLtgWdMYbxNtkPEpR/
         F+K78xFp3qS3fmEPWnXZaLlN10xBC/h0Mqoju+5Wi/IFd2+B1nJSdkbCRTMGqfqIi/UC
         o7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773263209; x=1773868009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jq184yv6qhyq5he4JEdx2+D4Atx68RIlmhXc/nCq5F8=;
        b=cclSqsM31tKzXLeHNs2ywFvz43a/pWv6pYloGtyW4j5PPmRkA1ifapzg1b0ABZWbqi
         TX1lvWGFBN33PmN78aoFRYEIZhZEY3ynaPXUnyGb1EdVlh3GywWOScFgHn1QDk34YCFu
         U3tdupeGZuv+mhRPHiJbS0QWM0LUTKsZmxX25H7FwFhoAc7fz86MycUuBqUhZz+T/Xgy
         TAZ/FOGNJzEmytlFi3shihjaMTz0JGjvuzw7+dh98m5gA4vTRV5x2U8OT03qLwYMjW+C
         lynWKqJM5XH5BrRM9wYd7JZbbPXIQP+ScF8kM6hJ3cmlXGjTph0X7cYuKLrT17mqEB8o
         6P5g==
X-Forwarded-Encrypted: i=1; AJvYcCWqQ9czbj8A6qS9eGft/KNR220aBOumfoTak/1KhsUKeG8lCWYPEqBIPPVY5ALcXcJMlnrA@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+WDrKtrRUvf6Sgf9Dvm8Yl9x4YoGvDearXcOwS+FddfPryDHh
	0eUx1TpdEp6s40RyAZzDsGh5H6Ld0WhGNhAVwQx8wDi2SM0sfeSvsYNRfIbnxFMiig==
X-Gm-Gg: ATEYQzwYizF3kQAXkJ6BSmkR9MULqO+eTrmg097HZ+wlNcgRyn+gvZDBAxBNSjKxxtc
	/XpEroKZFsZDw9DABTSK7xxPREYuBkA7frZWm4xNulRcQhoMLQptmZnhaOzw550CNY+dejaf8kK
	cwenBSWZUAIQnNmaqVlmxEiPVaEuU6/ZLg9EHgg4vi9O0O27vfSMZfcs6SNle1sO0WlYgS6ycgj
	Rv4q2xtuK4PAdNgR9eThEtnhxM67+JuDrHKSWA7NyMOxcf5kjd3HMPvFVBWcg0U/KfYkRpEOKNn
	oSxtDXKW+KrLoFzkk/xkJsTGRzGXLAT3zJioehUQVtfIL/KbpoSS+h0EZ2KT/7E8pSAkf6plExQ
	XL3uK0oD34jk9IYdQU3qs48DH7tKLkmpmf1qCP8AtYM+RnLViXoL+Hcc2OMWM8kGVOoVaRV+sJq
	rnpMSy/x1Nzw8eIeQnDtS/OGQSTafnNTrrtjHiHqd7y742J7hhiAzPw9XyIAoMEg==
X-Received: by 2002:a05:600c:4688:b0:483:1093:f29b with SMTP id 5b1f17b1804b1-4854fa11e50mr229415e9.8.1773263208180;
        Wed, 11 Mar 2026 14:06:48 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:c9d4:528c:7414:ba3a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-439fe219c41sm1949038f8f.29.2026.03.11.14.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 14:06:47 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Wed, 11 Mar 2026 22:06:14 +0100
Subject: [PATCH 1/3] sched: Ensure matching stack state for kcov
 disable/enable on switch
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-kcov-extrecord-v1-1-68f03c4a05ad@google.com>
References: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com>
In-Reply-To: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773263202; l=1827;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=Rn/uhAEizGU7xZ5aEfF2VvvEfAV/mBrSUtHKuGh1e2Y=;
 b=nT5u7hSmk+peI4Z70WnnNJltIQzTqQK/FPRXLCAfr/CfAZI5TfWDbVdHNATBPrJE8rscRMwNT
 pAw0yBbVLkOAnpe1QwRXRzw27rZhNYJFgCMi0/mSGW/bPY0IR7FtcjT
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Ensure that kcov is disabled and enabled with the same call stack.
This will be relied on by subsequent patches for recording function
entry/exit records via kcov.

This patch should not affect compilation of normal kernels without KCOV
(though it changes "inline" to "__always_inline").

To: Ingo Molnar <mingo@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Jann Horn <jannh@google.com>
---
 kernel/sched/core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index b7f77c165a6e..c470f0a669ec 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5072,8 +5072,10 @@ static inline void kmap_local_sched_in(void)
  *
  * prepare_task_switch sets up locking and calls architecture specific
  * hooks.
+ *
+ * Must be inlined for kcov_prepare_switch().
  */
-static inline void
+static __always_inline void
 prepare_task_switch(struct rq *rq, struct task_struct *prev,
 		    struct task_struct *next)
 	__must_hold(__rq_lockp(rq))
@@ -5149,7 +5151,6 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	tick_nohz_task_switch();
 	finish_lock_switch(rq);
 	finish_arch_post_lock_switch();
-	kcov_finish_switch(current);
 	/*
 	 * kmap_local_sched_out() is invoked with rq::lock held and
 	 * interrupts disabled. There is no requirement for that, but the
@@ -5295,7 +5296,13 @@ context_switch(struct rq *rq, struct task_struct *prev,
 	switch_to(prev, next, prev);
 	barrier();
 
-	return finish_task_switch(prev);
+	rq = finish_task_switch(prev);
+	/*
+	 * This has to happen outside finish_task_switch() to ensure that
+	 * entry/exit records are balanced.
+	 */
+	kcov_finish_switch(current);
+	return rq;
 }
 
 /*

-- 
2.53.0.473.g4a7958ca14-goog

