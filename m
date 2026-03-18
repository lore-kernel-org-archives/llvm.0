Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9463ED5C3
	for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 16:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773851241; cv=none; b=k900ya3pDMiay1Pr113d0G3DBoTp51yOpzc+Yx60PES2H/xdRm6As3MNythO4le4bgvCU+Rnl6uZwaAZQ+ImhJWt8XCqoOM9wkRmDeiWIe08avCvY3gJcH87cGWAMcamv1PeCvLfskGsjOsr/4ERthx/gJ0DCuajxRLO/fWm6J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773851241; c=relaxed/simple;
	bh=GMMooYTgIpzRxthzUDxwLp4xKLUvtXfQIrOtNj3xG6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D14/vkAmPrIgpxl3S2mCZFFWS6RWEtMvZW84ihU+tOZ9zAwQG1xlSOgHyAlP24ksIKVMaPYZSEjBT4i1BA4aQDwoJD8UMbkD3C5PJYdTSm1jYAE7uG6l0zwiZvM2SG/W8xfDkfuM1T25WXfXkyc2P0sizHmhl21lck6AmJzz2qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HYxB2Fjg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HYxB2Fjg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-485317b6bd0so75695e9.1
        for <llvm@lists.linux.dev>; Wed, 18 Mar 2026 09:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773851232; x=1774456032; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dtxI/fRNoncwbjqdAgIYMkpAprTLieZuCkxTIw4n0A=;
        b=HYxB2FjgapAPGWUaHtmOvgXGw04dyTQus06rQ8Kt34gI6NTNPJxL8+6Pzt+lAFprZG
         NdubiKvRW3Eqv7Eas4CjSm+VRGB8gsilZFTubVzLNxLQWDrmapijvskBCd2m2v5eqw83
         1fwr1UiKcTSscmX7uSCVw0546+5aaCwmZXeRe83Mb9lDPB3pbv3tGa1O2QevvwXJhJEI
         14Qf8zw1LXWN9QrJwkEqKK6AVGnPsor/umRFIUKhL+LmyCRfsgJAG0vFGdBAZNV9qVNA
         s8r2IVS5d7Q41EP1ziUujoLJ6efARPmtwD0VRHS/t3i9m8QN0DBTknbUSwK1PyWktW0o
         7XSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773851232; x=1774456032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6dtxI/fRNoncwbjqdAgIYMkpAprTLieZuCkxTIw4n0A=;
        b=Yv1oBQZiJo9hAiUqdIfyLWuOCBXwpEkGJM7iSe3s7qhWkWanEtD3tchJdPHVnPUv+N
         0EWYQxvNqKLZZ2p1/0DGKlg/V+y3RR2gPr9IkIgZ/6VHPOMUzfIpX8lP88iEJVXUUeh9
         le326sX+HprLT9pbVM01WjFhcQ6LpLmDHQpVnDK/8vc2heoTwxUOleAkt+vFnY6CEwJ7
         xHOJCfiOwiY3Fl1+nLoeZ800VhF+erq+XFl9yRMLnm065PUPM0IfQZfs1tC7Y0ipEmvV
         d1vliTX/vJkRPzYtyUWd/1Eu668LIj+J4poZJm3cfymHAoznG+gunBNquhBXZR2ptulm
         e1og==
X-Forwarded-Encrypted: i=1; AJvYcCUUbkiCbDIiTdtRdfI8+70oV6UpQVw94BHDKmOX93qSN1yAdmUCGBz6A8hwZ26utxYqXNej@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx0CvXavXU3TsVnHXm1/O5LO7uS+OJB/20pQB+Q5P9V8fLiObC
	sxNKeLw25FvJmUQBHZNzIjt21tBxjjZ9L7L9RbFTdd2ml6Si0HujIWXquYCq1WHMoA==
X-Gm-Gg: ATEYQzwlpeCcs90pK0a0LKPwbjrJQYCPDnM+e2vc9JUT4oxDqeBvPXBz0oM63X/FyuA
	mEAfUi5z95W4pQcouBSR5QuFPml3KKnlg2l1cQI+eU7UvCnocrPTqcbcYn5UjGEkD6f5Pl0tkJM
	lxNtAuEjBxWdRoZrpbnVSKu8/oeTcx/W+3KMEMVjcJk/HFG2LQbaK0g6vQPxCQpQLDxhBec33ee
	2lOzlaEYMjBXGbdD4rDgx905vg0Z11wMf1dvrqsCU5MvxoX14DHAu2Bz+CpXeWpgu0yg1K+1WKs
	PZf34oBW/y9xXXj83ERYQ7xbsGt4SbZGswvPLf7uvwF4QELXpaOLZsiCGb6GtX42N/E2SPDKsU4
	MbZTtTOdxXgMLSKkZS+JFoiIEUlwKyJaICe1tgyXk5qratzBSX3sQ4tGWpQE68UE+ysN15SRYu2
	EEo5f5zEORyvfXVS45JE7Zc9Ml+B+fGDFiK1JAjS0uyVGYyQXaicPrdX8DWp2O
X-Received: by 2002:a05:600c:c05b:b0:477:2f6f:44db with SMTP id 5b1f17b1804b1-486f4ce23a1mr586235e9.5.1773851231932;
        Wed, 18 Mar 2026 09:27:11 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:c66d:1e51:595a:925])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43b51899617sm9479049f8f.31.2026.03.18.09.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 09:27:11 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Wed, 18 Mar 2026 17:27:00 +0100
Subject: [PATCH v2 3/4] kcov: refactor mode check out of check_kcov_mode()
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-kcov-extrecord-v2-3-2522da6fcd3f@google.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773851224; l=4314;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=GMMooYTgIpzRxthzUDxwLp4xKLUvtXfQIrOtNj3xG6o=;
 b=ubeizWU7XosiwCUKAEAZUXL1Q5MjoVYWTgMWVezx+AP3JNdQUC7UZ2ZhqtSoXWoWtZVUY+Iq1
 IX5YDd6rFdVAEaAA4kXAvWENoyBRDOrwWqpuLocf+KNg0Hfew97r04r
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

The following patch will need to check t->kcov_mode in different ways at
different check_kcov_mode() call sites. In preparation for that, move the
mode check up the call hierarchy.

Signed-off-by: Jann Horn <jannh@google.com>
---
 kernel/kcov.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 86b681c7865c..7edb39e18bfe 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -171,10 +171,8 @@ static __always_inline bool in_softirq_really(void)
 	return in_serving_softirq() && !in_hardirq() && !in_nmi();
 }
 
-static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_struct *t)
+static notrace bool check_kcov_context(struct task_struct *t)
 {
-	unsigned int mode;
-
 	/*
 	 * We are interested in code coverage as a function of a syscall inputs,
 	 * so we ignore code executed in interrupts, unless we are in a remote
@@ -182,7 +180,6 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_stru
 	 */
 	if (!in_task() && !(in_softirq_really() && t->kcov_softirq))
 		return false;
-	mode = READ_ONCE(t->kcov_mode);
 	/*
 	 * There is some code that runs in interrupts but for which
 	 * in_interrupt() returns false (e.g. preempt_schedule_irq()).
@@ -191,7 +188,7 @@ static notrace bool check_kcov_mode(enum kcov_mode needed_mode, struct task_stru
 	 * kcov_start().
 	 */
 	barrier();
-	return mode == needed_mode;
+	return true;
 }
 
 static notrace unsigned long canonicalize_ip(unsigned long ip)
@@ -202,14 +199,12 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
 	return ip;
 }
 
-static __always_inline void notrace kcov_add_pc_record(unsigned long record)
+static __always_inline void notrace kcov_add_pc_record(struct task_struct *t, unsigned long record)
 {
-	struct task_struct *t;
 	unsigned long *area;
 	unsigned long pos;
 
-	t = current;
-	if (!check_kcov_mode(KCOV_MODE_TRACE_PC, t))
+	if (!check_kcov_context(t))
 		return;
 
 	area = t->kcov_area;
@@ -217,7 +212,7 @@ static __always_inline void notrace kcov_add_pc_record(unsigned long record)
 	pos = READ_ONCE(area[0]) + 1;
 	if (likely(pos < t->kcov_size)) {
 		/* Previously we write pc before updating pos. However, some
-		 * early interrupt code could bypass check_kcov_mode() check
+		 * early interrupt code could bypass check_kcov_context() check
 		 * and invoke __sanitizer_cov_trace_pc(). If such interrupt is
 		 * raised between writing pc and updating pos, the pc could be
 		 * overitten by the recursive __sanitizer_cov_trace_pc().
@@ -235,20 +230,28 @@ static __always_inline void notrace kcov_add_pc_record(unsigned long record)
  */
 void notrace __sanitizer_cov_trace_pc(void)
 {
-	kcov_add_pc_record(canonicalize_ip(_RET_IP_));
+	struct task_struct *cur = current;
+
+	if (READ_ONCE(cur->kcov_mode) != KCOV_MODE_TRACE_PC)
+		return;
+	kcov_add_pc_record(cur, canonicalize_ip(_RET_IP_));
 }
 EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
 
 #ifdef CONFIG_KCOV_EXT_RECORDS
 void notrace __sanitizer_cov_trace_pc_entry(void)
 {
+	struct task_struct *cur = current;
 	unsigned long record = canonicalize_ip(_RET_IP_);
+	unsigned int kcov_mode = READ_ONCE(cur->kcov_mode);
 
 	/*
 	 * This hook replaces __sanitizer_cov_trace_pc() for the function entry
 	 * basic block; it should still emit a record even in classic kcov mode.
 	 */
-	kcov_add_pc_record(record);
+	if (kcov_mode != KCOV_MODE_TRACE_PC)
+		return;
+	kcov_add_pc_record(cur, record);
 }
 void notrace __sanitizer_cov_trace_pc_exit(void)
 {
@@ -263,7 +266,7 @@ static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
 	u64 count, start_index, end_pos, max_pos;
 
 	t = current;
-	if (!check_kcov_mode(KCOV_MODE_TRACE_CMP, t))
+	if (READ_ONCE(t->kcov_mode) != KCOV_MODE_TRACE_CMP || !check_kcov_context(t))
 		return;
 
 	ip = canonicalize_ip(ip);
@@ -383,7 +386,7 @@ static void kcov_start(struct task_struct *t, struct kcov *kcov,
 	t->kcov_size = size;
 	t->kcov_area = area;
 	t->kcov_sequence = sequence;
-	/* See comment in check_kcov_mode(). */
+	/* See comment in check_kcov_context(). */
 	barrier();
 	WRITE_ONCE(t->kcov_mode, mode);
 }

-- 
2.53.0.851.ga537e3e6e9-goog

