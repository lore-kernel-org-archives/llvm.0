Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158326;
	b=x0z6+OAfaYBK86BApFmfLMXtvNP87ig695O+Ci1lz6ZPRsbUUfmLVveJ2v9AnZcMKzmp
	 ABDuElRzOJDDaNrKnbIR9B5Nf9akv2sJuqoYvnCCDAs8dFIQbVjyePdDAInbTVwE90hc5
	 Y5q1QGfo+6PH3CuKtTTd0lilMwG5laJjmAqsWCBJBlH2YrTNyvKInrPrbfiWqxiuELUY8
	 HJrv82YF5WytEJmBt/1quP+nXWQ6WHmwzvfNXIA5J/z3HzQ4ypgDAVXLJQv0mEmXBHxCB
	 uDK3wwljRXwntlujB2Mgm+lEISLU/8OCcRm+THuJPqw22YMuFtfmSGd2VoPL500HccA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A8EkBHzSkpvWMyA+KA0OYUqo4zY3bIhhFtk/YpfILDM=;
	b=l5W1hSzREYvO+6qZUD5z/vlRvneMAYTjUmS84vEV2Rua40Qfsh8/h+o14UQ7fQ2HIcvk
	 95kYDJD6zxDPIBUPSWBLN/OeL7HbiPkX5Yml7m6rEXbitImtZu1l9xCgaMrt/kE5Le49T
	 U91Le1iZ43UzOv2LycPGNPdKd6yIYnZYVTSio+OsxMkFBJjINrI3fy5p63lDn06MvHDv3
	 lTdXM72Bs+LdDx6CGhLt6jivg9fWCzESHYlPukecVDEElWBJKZcBHz+w9ImRgvQbUd+ZE
	 +2JxkKr2asiA2a1SfgGoYos4VZLl+xqcNBlCI9xpBDqjIaTwqJrgSKhtpZBbxg03xeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BuH5zdiy;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA95606A324
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 03:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA95606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BuH5zdiy
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e09aa5264so217582f8f.2
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 20:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158324; x=1793763124; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8EkBHzSkpvWMyA+KA0OYUqo4zY3bIhhFtk/YpfILDM=;
        b=BuH5zdiyb49gZAfIBJQoFonucYo9zkYx4yUeBXZYRwTfdMOmBUy0bDUydb4cjfkMou
         YGgUX9djDQ1tOAEUcKph5fvH6UZD58n6DYvGMXrul5kIVGwvc1wi7ykM6s7jdL4I6Nj3
         cPxarY9/PjJFPFeaBpuZl6nT3duTiobu9dTuLaxAiKUr8E/8Y2RsLb2q1vgRuImklfdw
         35S8ZGcZwKG3jNsfQzDnktW/kYDcYDoqSQJwgMmpPYBQfgQUienyxNrFw1gRjkRIqJVJ
         0iHm6vI4P34cbx6QnDKbMicxH2+ZM+1la8tN/mD8noF/oUvQtP0LqKzAssDB0+mD8H1G
         ErNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158324; x=1793763124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8EkBHzSkpvWMyA+KA0OYUqo4zY3bIhhFtk/YpfILDM=;
        b=xI0QfQs6aPkTbwHcSvFM6jxM/E6LOypddbnxg81cKH3CIqs0/4tOXMmgH9pF8Oq7WX
         sr8Itrdl91c3a7e3ppwxeWP5hx/sYwxiIrn+lwjlb1YVV/wcu6vnLlK9pR7rRgZJIewH
         w0yyHkLul/9pDV6rsJLjhO6MEqtisbL7c40cnvc7cpssqjn8rncImrXDCMft1ud6JAB/
         NSfomZzCbNKfcZFCX0dFtlYHmTp54vF0DPW+LcEZXgt3OH1sLDCg+YOD7LhHiWsJCgWW
         q0dTTAvh9NF4PM7N4e83lwm9zVu9n/h8XgN+WUsuYnVGrATcUdod3a13H1r+McyfYpgh
         TqOw==
X-Forwarded-Encrypted: i=1; AKwUvBzXhu4lOBbD693oIiYDeOcG/sQ/xQyTGPqsMZ+XKXF2386s7sBe1fk85uUn0ZgnYTGhddQ6@lists.linux.dev
X-Gm-Message-State: AFq9FYLANA7/bztzA7P81miCEQRx1GPdkfz9JibjKWP2qmY1y9bz7dMN
	81OKW0JWs92JsYPdlAV/fSXDRsccIn+abVQuDT+qHIPP4o2TZU+gFGO3
X-Gm-Gg: AYBFou2GO2GHrYxuuyJg9uoia2jKqdaE96MruMdneE3jYfgSw5lfMHLmBy5DIZeqGDA
	S0v8juBnmz9rvqHTEWh0qcc7l0e/shtBn7ctBMUBmm6dVofynBAuVGVYrSc7jE0lobuGu+N+HDe
	HWTzMd10193Gttz9JrM+fzPs767X6/tppkjYDx4u/mayx9Irj8ElWAdHs3Qz9YI84DMZ2TI7G+c
	b1BBkZLBrlENgNo4SRea+XYzo29lxp0TVWNwAngfPccrwuJUht+007V9JShUbKOFCiU00GzkSXg
	8+9IPUc9/vW/mj2CVFA3hD0JjCcGFINQLmKg6+D9TOT9oxABEj2O5fk/jOxvn3NHvsHCgrh1Ef4
	tOQPIoF0OCbDAkyJO6pAza/5ZC3EQZP8uk/LuOri3H2Fq6JrUw+5X6EM+pysW1UkcZ3UTDNV4BA
	BtedUh9EACBRAFZ6pAyjWGtZFZaMYvGtfrSZaSONR2R7PD7/jCyYDl425J22bifRF5lBAz07fkB
	WS5bpJ5nzJyCD1eQTFA2J4DoVe6aOkpbMSD2AAkyItbM0e9psKhsd09aW0ko/ivQ68VkAI9U+TQ
	CU8OBsNKoVKIfWUHSrrXAAfi2YP6XorGgdAIyKhTo042cwd7z3Nl1b9bnu/iKyGD3x2v9bjKqht
	mGiEXQ0omaD0RyOZDnN1DOQKX+gaI9wPzopuDXM/Q0Ejy158gHlxxNRUqBKGfSGeGraxrj6N+hR
	kbtMB88d3gjhgHoJrc+S1d9IB+6CexPo4o
X-Received: by 2002:a05:6000:46d9:b0:48d:fa9c:7838 with SMTP id ffacd0b85a97d-48e5d567dd3mr1945784f8f.2.1793158324146;
        Tue, 27 Oct 2026 20:32:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 08/13] lockdep: Prepare IRQ-on state from a hardirq return tail
Date: Wed, 28 Oct 2026 04:31:22 +0100
Message-Id: <20261028033127.82193-9-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lockdep_hardirqs_on_prepare() rejects any live hardirq context. An ordinary
hardirq return tail needs to retain synthetic hardirq nesting through
traceable IRQ-on preparation. This keeps callbacks classified as hardirq
work.

Factor the common preparation and add a return-tail variant which requires
the synthetic hardirq context to be present. An interrupted outer hardirq
can contribute additional nesting. Keep the ordinary helper restricted to
zero. Neither helper changes IRQ or hardirq state. The caller must remove
the tail context before lockdep_hardirqs_on().

Assisted-by: LLM
---
 include/linux/irqflags.h |  2 ++
 kernel/locking/lockdep.c | 43 +++++++++++++++++++++++++++++-----------
 2 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index e98313a8ad307..c7601a173e55b 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -25,6 +25,7 @@ struct task_struct;
   extern void lockdep_softirqs_on(unsigned long ip);
   extern void lockdep_softirqs_off(unsigned long ip);
   extern void lockdep_hardirqs_on_prepare(void);
+void lockdep_hardirqs_on_prepare_irqtail(void);
   extern void lockdep_hardirqs_on(unsigned long ip);
   extern void lockdep_hardirqs_off(unsigned long ip);
   extern void lockdep_cleanup_dead_cpu(unsigned int cpu,
@@ -33,6 +34,7 @@ struct task_struct;
   static inline void lockdep_softirqs_on(unsigned long ip) { }
   static inline void lockdep_softirqs_off(unsigned long ip) { }
   static inline void lockdep_hardirqs_on_prepare(void) { }
+static inline void lockdep_hardirqs_on_prepare_irqtail(void) { }
   static inline void lockdep_hardirqs_on(unsigned long ip) { }
   static inline void lockdep_hardirqs_off(unsigned long ip) { }
   static inline void lockdep_cleanup_dead_cpu(unsigned int cpu,
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 01dba8fb32a90..2ecd506715fa7 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -4395,15 +4395,7 @@ static void __trace_hardirqs_on_caller(void)
 		mark_held_locks(curr, LOCK_ENABLED_SOFTIRQ);
 }
 
-/**
- * lockdep_hardirqs_on_prepare - Prepare for enabling interrupts
- *
- * Invoked before a possible transition to RCU idle from exit to user or
- * guest mode. This ensures that all RCU operations are done before RCU
- * stops watching. After the RCU transition lockdep_hardirqs_on() has to be
- * invoked to set the final state.
- */
-void lockdep_hardirqs_on_prepare(void)
+static void __lockdep_hardirqs_on_prepare(bool expect_hardirq)
 {
 	if (unlikely(!debug_locks))
 		return;
@@ -4442,10 +4434,11 @@ void lockdep_hardirqs_on_prepare(void)
 		return;
 
 	/*
-	 * Can't allow enabling interrupts while in an interrupt handler,
-	 * that's general bad form and such. Recursion, limited stack etc..
+	 * Ordinary IRQ enable requires no hardirq context. The interrupt return
+	 * tail variant requires its synthetic context, possibly nested inside
+	 * an interrupted outer hardirq.
 	 */
-	if (DEBUG_LOCKS_WARN_ON(lockdep_hardirq_context()))
+	if (DEBUG_LOCKS_WARN_ON(!!lockdep_hardirq_context() != expect_hardirq))
 		return;
 
 	current->hardirq_chain_key = current->curr_chain_key;
@@ -4454,8 +4447,34 @@ void lockdep_hardirqs_on_prepare(void)
 	__trace_hardirqs_on_caller();
 	lockdep_recursion_finish();
 }
+
+/**
+ * lockdep_hardirqs_on_prepare - Prepare for enabling interrupts
+ *
+ * Invoked before a possible transition to RCU idle from exit to user or
+ * guest mode. This ensures that all RCU operations are done before RCU
+ * stops watching. After the RCU transition lockdep_hardirqs_on() has to be
+ * invoked to set the final state.
+ */
+void lockdep_hardirqs_on_prepare(void)
+{
+	__lockdep_hardirqs_on_prepare(false);
+}
 EXPORT_SYMBOL_GPL(lockdep_hardirqs_on_prepare);
 
+/**
+ * lockdep_hardirqs_on_prepare_irqtail - Prepare an interrupt return tail
+ *
+ * Like lockdep_hardirqs_on_prepare(), but invoked while the synthetic lockdep
+ * hardirq context covering an interrupt return tail is still active. An
+ * interrupted outer hardirq can contribute additional nesting. The caller
+ * must remove the tail context before lockdep_hardirqs_on().
+ */
+void lockdep_hardirqs_on_prepare_irqtail(void)
+{
+	__lockdep_hardirqs_on_prepare(true);
+}
+
 void noinstr lockdep_hardirqs_on(unsigned long ip)
 {
 	struct irqtrace_events *trace = &current->irqtrace;
-- 
2.39.5 (Apple Git-154)

