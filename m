Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCF740148A
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851238; cv=none; b=XrxQJZ8KTG4+9uLuCSA7m9uEJkEEgLTzrrxECwE4D1r5ObKMfLrMLz2y9Z3q48Vl82i3F0rZWHByfK1UijgR7yKasQ9MWC16H0OcJhg0BABPlLBVLBTuGXc8C0j/rxN/PSVl+D7FdmIlkXZDpRgThLnGa5/fxPEgA5XOASfeW4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851238; c=relaxed/simple;
	bh=YPl8dC+FWNYbig6FC8CWhTRlpJIuO11/DPHxoh5KsiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dTGEMg4YL8aXRiJRRgxz0tcDdvD3uEj2ct14Jx5CUedXqqTSh+AgV0dRzcyzeObBdLA4Y4o1XAlkYrW/Frf4/5bgdAh74p+ysHtIUjbKilaSfLneU0x7Lg7Dmo0zPQAtgj4TkEL7t7mLr2t705lzeKHm5W1tLbM133+44ylF+As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uuc36/Kx; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uuc36/Kx"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852ef20fe8so79055e9.1
        for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 09:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773851230; x=1774456030; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qmw4vC+CxZDBjEx/J8ylpMl/Lh1zLUYRQxMntaRS6nI=;
        b=uuc36/Kx5ezql3BCzwQzmovR5iEayD1JrvirNK3WgafhEp6SxwZ799gy+f8skplbj4
         40MFGUxFQ4Ee1Fov45K8WBXdV8wJ3PuDAO3OEJFURumOizUZOPobRoFUWlHj0GpbqGxn
         K7an02L4ZvQ1sEVvRaGhj3kvm9t1jkMh6UjVx11b7WVdkw/i7qlNvPzO35YRUx1uqBuM
         taoec/HxVwZdBrur3LzekWFUtRxK/S2RS0y2UcBlLqS9NtvkH675yiVMd+UYc8XLSbnm
         DhcKUjEXkOF5AUXtOI+qAOFxEHZE7ebgWLy7wD11WBzUaupjyw+3Pkx7oGj5Jvu503rY
         UowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773851230; x=1774456030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qmw4vC+CxZDBjEx/J8ylpMl/Lh1zLUYRQxMntaRS6nI=;
        b=hHmG9KbtG4R1Di+x99djT+YnT/dBLoaY4+nkCvpRiO8QROH/Z55E4VyYcCVqnDySvt
         m2e7dCIm2V//Bbf7kayY1fg7ODJ6dpnYFma/NGNx6rgBupNBrjC1g4HMEkNrH5Qv3a+8
         HxIMJbREaGeLAqbnXnIvt9ROc5MpVTRlqwzbz74fdt44AL67n2pEVPVi59XgrdP4OQ0W
         wrGOA1Sv6ncYpVIuFUDtrdP20Ls+KugZKIDGgta9yig9RHgEkx4EoI4JU7qVFyDJqKV2
         3xmXsGPx02RiE7oH/QWTfI5mIr6EISAjwoK6PpPCjfHe7l2k2O2skRRcM0sx4FRClIrp
         +GXw==
X-Forwarded-Encrypted: i=1; AJvYcCV9bwh3FZ0+XF4qDtFH/B6sZ4YiYjiw5f4IksbsF8qR6E5bfPuLwBNBrjVmjg2HhDT1lt/y@lists.linux.dev
X-Gm-Message-State: AOJu0Ywv1uq+T4dZa05MCXpVCGC4GBWH02U+9uc3IDjeo1LBRCGap8FB
	M0OR/UxomJsWM2TcJgZDFYYhLhCRLb89M6XAyX6mooO1R0QQjwgXslrZ30A4WIyFwaaMQ7TOB2n
	Ge3wwABri
X-Gm-Gg: ATEYQzyqB4hAjSLGfh1Qu2hYd3HKi0+Tq0eofNTjxJR42v+5l2fKHqf28LHDX5Q4bIX
	TFO/AnhitTq2ZCeeBjDAHY1n8cWRHbsno+tZ1+CchDOtNAaQP5WARRm1dj9cbO4A9hgokG5uxOI
	cdP3862VN8kfAO9nLxBHi+S9JCvqCdnRDg4G93YlWWwQSGBi19tvURwdDYn7cmhW8DgmKU5W+vD
	wqWi0Oyaz3IKTrqROmcuCuxPO0bSO5Y38OALWnQ50HeOLcZtuP5eP262wKt4zeN4SIgxl9uk/D2
	VPq5eHrdr2/STPAvFPPrVTaVW3XUfvZ4LPzlgfy12lLMIfta3Qqu+lEiNQB6v0VrsEWK9u/x7LL
	BvEETVTZUD48aw+mGwY2cF9bqcAg8tratI1bSJqH4x2SERArl4H4PYrhodpfqW3jYXk1SwndIfX
	Brll4gqpMpH3XZ/t67UTl/sznZ2zD8t842C2BjNxs1a9hGghIl151egX72HUEQ
X-Received: by 2002:a05:600c:8a4:b0:47b:e29f:c63f with SMTP id 5b1f17b1804b1-486f4ce8202mr780975e9.11.1773851229587;
        Wed, 18 Mar 2026 09:27:09 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:c66d:1e51:595a:925])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43b51852ab3sm9280149f8f.12.2026.03.18.09.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:27:09 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Wed, 18 Mar 2026 17:26:58 +0100
Subject: [PATCH v2 1/4] sched: Ensure matching stack state for kcov
 disable/enable on switch
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-kcov-extrecord-v2-1-2522da6fcd3f@google.com>
References: <20260318-kcov-extrecord-v2-0-2522da6fcd3f@google.com>
In-Reply-To: <20260318-kcov-extrecord-v2-0-2522da6fcd3f@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773851224; l=1827;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=YPl8dC+FWNYbig6FC8CWhTRlpJIuO11/DPHxoh5KsiM=;
 b=hiUxadU509ZAxL1hocvzwSwvDRdcyHk3+StHxZdd86Fp+GpZ8sfNB5SkrMjXjtjneFMJtxF9p
 H2PQmiAQWOaA5WPKypgYfFOvA7+Dj5DZOPpGlWaNRzQqx0U00Q8wSHu
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
2.53.0.851.ga537e3e6e9-goog

