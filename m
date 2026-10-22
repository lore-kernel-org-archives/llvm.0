Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646245;
	b=wVsspaxImwiKxCKjsMUnuWvG/yVExt79Qowf1/c10extqltR2oTOTDZUX2UJZS5+fRu8
	 +NvAq1m98yDjtuMvZ6YIyrA35QtmBX2X5L86cbNEMVtr5YeRGkcNBCtywgDouDEzqTEGj
	 G4NJAKtRiygsn3OXcHSaXgR3+m54vijV0NUeoBITYbZGl6vgRs27XoYwKY31KOm5wBK2T
	 adh/xDq2dl3JICVDLmpCblCf708GF3HrqdwFz0S/SjAm4LynKfrE8JPwRh75zfaK9b1pV
	 Ioh8vwairjlv0+7aPMtPR0sk8ciR5d3kpcqJyg8xPmhaIUtmrDgGF0V22ing2SKxKVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jvd6Ubikpqp7Iwt0RuiwkREVpOrwG8rxrLh+IG+UXJI=;
	b=EyyN1SAglXimb2/oOEcjssPyQFvFrcGVkgsyVSJY3Jimv+klA19I4HNwCTXnVhOEMlZa
	 5BAPX5KV+jGiWi+VW1V7/SIHOxltmWettZgTKF6aMvEIrZdsxic1lQpbwJ8/SFilo11DK
	 K4WhULmJ/ruETUIUh9BUqVlFzVL9kfLxeL5UfoOcHrvRCZDot5bUspANPRrSTUz7/U2R+
	 AsxnppmYNV7RhYS/xfw1T+vodsz6b97TtYkJQg1dMoskiu7Z+IAw02WyXUU4O8qmUuMeI
	 r8R033KkexEdwgnA8kcxxK+kn03WB8Ibf2mVmwoxMGBf08zmonDIC8tlUtGQQzikd3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PYmItdO2;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A76606A33D
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 05:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32A76606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PYmItdO2
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2074a66beso1686535e9.0
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646242; x=1793251042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jvd6Ubikpqp7Iwt0RuiwkREVpOrwG8rxrLh+IG+UXJI=;
        b=PYmItdO2E5qWYXo6o3TxmAiEtKPJXBkHLt/mJ65+LBelEnigrl56of/NWRFfsagThb
         YJlMObyAAPv0R2v4fTZ9Ho7SLQcu0uynJQYSdTLworXdKGvgcPG+MqQcWWcZ+CXSGvcg
         8jvVFIuf8ZJx4VaSWlJ5HTc/9aekmdK7qJ0wqhgLjPUW82j4uo2DGRF25gU+6qO5RsL8
         yid0ldaOGk1V7iFtBmvthvifsMFWyNtwYBIy63ANi8RUeIxucQBIYBfL//3qqTpMjgDf
         RXqLhMQoQwdDg/uFQK3SViMOP/s+ZUDv1HvZOTI9XfA8hxJF6Ti32EqGvWx0DRIgvD0M
         09ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646242; x=1793251042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jvd6Ubikpqp7Iwt0RuiwkREVpOrwG8rxrLh+IG+UXJI=;
        b=RYjLkCowdAEV7nfbjniShH5+WK7pfsibqOznHRgNz1DTRCOs4CKlf1vbE4Qte+xh1A
         ImziRwsU8R4vdpZfEA7fTos5TzK7VWSuS7N3XnNN5wzLto5uVqvIMIh8l64thLrW8ggD
         F9soTFVWVuqvD9vYlpAtpnLcNkmLygfj8EHvMLareqqiWN0HdEhYCh8zuZd/PpSCUsav
         TVOiXCTGBvlZvmiqGpVylsAUV4X0dDmG0uiiOSVNyTdb6IHhzfjUkQl7EWfB1R/CCdvr
         pwUZAK1f0InsZGNlnmc4VOnbaVlRbk6QuX9VeBzKFUAaiOLuw+4SUBIe6DsBrsM7UHCN
         liiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzE4Ld0bOEGxMlKoRg6dxPGaazDj2f04Ezyj2NKGMCo123lW+0q/Gks+MznD180i76n0vV0@lists.linux.dev
X-Gm-Message-State: AFq9FYL+0F3Fr3RHqWkLzJCOYfw78JgDVN9Ok/tPpik1N7As7sKGJ4xf
	cktLbz8c5AiRb0YJ2Sz0/SOnTSsYot5Ln7OZB3BeMYoW9yLASaVA39tl
X-Gm-Gg: AYBFou1l4No+aj3N9MW3rb4OeZUg8hZ6sx+mJHhQA+Hcf6SMb4p2juOvEBKVXC53Q71
	M1QbdUgJgfoMOojGQpols5wwJgy6sa6jG/+Tx6PbQzMMcQVTWKKN7aXFoLhECTzlZcetP9N+gNR
	l22UOG6/isLZmRyup+5AKe0Cm5chIPeYhx+tRhoYyfINC3H1tbS4QQ8efvrgyd/Y4ClDPle8UqB
	Yx1iU7X+V8QkS014kqN9Gx79ErK2gvyfxhL8Fp47Pte7hVZGEa2L26721aNr/myj4qkMPEOIdpt
	lxAxiU8yQknWW+ZCAgOAJv7DHojqGnRutFOfPwF6FsJbRAyuhvlnrhUUSNpwNPCWG1sQ+TVLAmV
	jGcz4m//cFACi23Gcja1sjUsa+qYJ8Alj+mq97QzZO5EXbCP7kOCSikQUSR0s2rGmvwoYSKvQ2X
	mUntutrNuz1/HZohbnSFMgyWhW6WACjD8uUjPkW0gBD2ZJnZc14a74ni/FYNWXgbu0kbdOId3BR
	no0sT/oafj1xdWniKAT/tRX6x4OUqIc2bMA7h5QOw3PPInC2XeQABFkQsvAOJLessBhlPjp3krn
	nYERtILOcH4gshRuLSgV6XMBJb10jb19veQ2S/3BxoHKlL5XiLlOgx2TDxtgBechFxBS7AWrrYG
	EkKsCMM4zHPKz/qIpibXw7tPasL57gyuuj51qQiMdUGVXDeTSit1c6XIBq8Q=
X-Received: by 2002:a05:600c:a15:b0:4a1:c6a2:5566 with SMTP id 5b1f17b1804b1-4a1fdd2fa77mr75428425e9.26.1792646242449;
        Wed, 21 Oct 2026 22:17:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:21 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
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
Subject: [RFC PATCH 03/12] entry: Add the pre-counted ordinary-hardirq entry/exit contract
Date: Thu, 22 Oct 2026 07:16:45 +0200
Message-Id: <20261022051654.79224-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
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

Architectures which identify ordinary hardirqs before generic entry need
to install HARDIRQ_OFFSET before context tracking and tracing callbacks
run. Lockdep hardirq state must agree with that count. On exit, both states
must remain installed until every traceable callback has returned.

Add irqentry_hardirq_enter() to install the raw count and lockdep state
before instrumentable entry work. irq_enter_rcu_preempt_counted() completes
the delayed preempt-count bookkeeping while preserving the existing timer
and hardirq accounting boundary.

Add a retained exit path which runs IRQ-exit processing and instrumentable
teardown preparation before returning to an immediate raw count and lockdep
teardown. This keeps function-graph return callbacks in hardirq context.

A return callback after the final softirq drain can raise regular or
forced-thread timer work while hardirq state still suppresses the usual
wakeup. Recheck ksoftirqd, ktimerd, then ksoftirqd after the last traceable
teardown step. Record wake requests made by the main exit path so the
closure does not repeat them.

Keep the existing entry and exit interfaces unchanged. Architectures opt
in only after distinguishing ordinary hardirqs from NMI-like entry. They
must not place instrumentable code between the retained-exit helper and
raw teardown.

Assisted-by: LLM
---
 include/linux/hardirq.h          |  24 +++++
 include/linux/interrupt.h        |   2 +-
 include/linux/irq-entry-common.h |  31 ++++++-
 include/linux/irqflags.h         |   9 +-
 kernel/entry/common.c            |  30 +++++++
 kernel/softirq.c                 | 148 ++++++++++++++++++++++++++-----
 6 files changed, 215 insertions(+), 29 deletions(-)

diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index 73b48dd9f1354..ad27a06c859a0 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -25,6 +25,30 @@ static __always_inline void rcu_irq_enter_check_tick(void)
 		__rcu_irq_enter_check_tick();
 }
 
+void irq_enter_rcu_preempt_counted(void);
+bool irq_exit_rcu_preempt_counted_prepare(void);
+
+/*
+ * Prepare every potentially instrumentable part of hardirq teardown before
+ * the raw count and lockdep updates. The caller must invoke the matching
+ * finish helper without passing through instrumentable code.
+ */
+static __always_inline bool irqentry_hardirq_exit_prepare(void)
+{
+	bool do_sub;
+
+	do_sub = preempt_count_sub_prepare(HARDIRQ_OFFSET);
+	lockdep_hardirq_exit_prepare();
+	return do_sub;
+}
+
+static __always_inline void irqentry_hardirq_exit_finish(bool do_sub)
+{
+	if (do_sub)
+		__preempt_count_sub(HARDIRQ_OFFSET);
+	lockdep_hardirq_exit_finish();
+}
+
 /*
  * It is safe to do non-atomic ops on ->hardirq_context,
  * because NMI handlers may not preempt and the ops are
diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 3bf969ad8fe07..fda5a29b176b4 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -636,7 +636,7 @@ DECLARE_PER_CPU(struct task_struct *, ktimerd);
 DECLARE_PER_CPU(unsigned long, pending_timer_softirq);
 void raise_ktimers_thread(unsigned int nr);
 
-static inline unsigned int local_timers_pending_force_th(void)
+static __always_inline unsigned int local_timers_pending_force_th(void)
 {
 	return __this_cpu_read(pending_timer_softirq);
 }
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index c74b5c87e10f6..3ee80e926a17a 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -76,8 +76,9 @@ static __always_inline bool arch_in_rcu_eqs(void) { return false; }
 #endif
 
 /**
- * enter_from_user_mode - Establish state when coming from user mode
+ * __enter_from_user_mode - Establish state when coming from user mode
  * @regs:	Pointer to currents pt_regs
+ * @hardirq:	Whether to establish hardirq lockdep context before tracing
  *
  * Syscall/interrupt entry disables interrupts, but user mode is traced as
  * interrupts enabled. Also with NO_HZ_FULL RCU might be idle.
@@ -95,10 +96,13 @@ static __always_inline bool arch_in_rcu_eqs(void) { return false; }
  * done between establishing state and enabling interrupts. The caller must
  * enable interrupts before invoking syscall_enter_from_user_mode_work().
  */
-static __always_inline void enter_from_user_mode(struct pt_regs *regs)
+static __always_inline void __enter_from_user_mode(struct pt_regs *regs,
+						   bool hardirq)
 {
 	arch_enter_from_user_mode(regs);
 	lockdep_hardirqs_off(CALLER_ADDR0);
+	if (hardirq)
+		lockdep_hardirq_enter();
 
 	CT_WARN_ON(__ct_state() != CT_STATE_USER);
 	user_exit_irqoff();
@@ -109,6 +113,11 @@ static __always_inline void enter_from_user_mode(struct pt_regs *regs)
 	instrumentation_end();
 }
 
+static __always_inline void enter_from_user_mode(struct pt_regs *regs)
+{
+	__enter_from_user_mode(regs, false);
+}
+
 /**
  * arch_exit_to_user_mode_work - Architecture specific TIF work for exit
  *				 to user mode.
@@ -341,6 +350,8 @@ typedef struct irqentry_state {
 } irqentry_state_t;
 #endif
 
+irqentry_state_t noinstr irqentry_hardirq_enter(struct pt_regs *regs);
+
 /**
  * irqentry_exit_cond_resched - Conditionally reschedule on return from interrupt
  *
@@ -364,8 +375,9 @@ void dynamic_irqentry_exit_cond_resched(void);
 #endif /* CONFIG_PREEMPT_DYNAMIC */
 
 /**
- * irqentry_enter_from_kernel_mode - Establish state before invoking the irq handler
+ * __irqentry_enter_from_kernel_mode - Establish state before invoking an exception
  * @regs:	Pointer to currents pt_regs
+ * @hardirq:	Whether to establish hardirq lockdep context before tracing
  *
  * Invoked from architecture specific entry code with interrupts disabled.
  * Can only be called when the interrupt entry came from kernel mode. The
@@ -379,7 +391,8 @@ void dynamic_irqentry_exit_cond_resched(void);
  *
  * Returns: An opaque object that must be passed to irqentry_exit_to_kernel_mode().
  */
-static __always_inline irqentry_state_t irqentry_enter_from_kernel_mode(struct pt_regs *regs)
+static __always_inline irqentry_state_t
+__irqentry_enter_from_kernel_mode(struct pt_regs *regs, bool hardirq)
 {
 	irqentry_state_t ret = {
 		.exit_rcu = false,
@@ -416,6 +429,8 @@ static __always_inline irqentry_state_t irqentry_enter_from_kernel_mode(struct p
 		 * as in irqentry_enter_from_user_mode().
 		 */
 		lockdep_hardirqs_off(CALLER_ADDR0);
+		if (hardirq)
+			lockdep_hardirq_enter();
 		ct_irq_enter();
 		instrumentation_begin();
 		kmsan_unpoison_entry_regs(regs);
@@ -433,6 +448,8 @@ static __always_inline irqentry_state_t irqentry_enter_from_kernel_mode(struct p
 	 * in having another one here.
 	 */
 	lockdep_hardirqs_off(CALLER_ADDR0);
+	if (hardirq)
+		lockdep_hardirq_enter();
 	instrumentation_begin();
 	kmsan_unpoison_entry_regs(regs);
 	rcu_irq_enter_check_tick();
@@ -442,6 +459,12 @@ static __always_inline irqentry_state_t irqentry_enter_from_kernel_mode(struct p
 	return ret;
 }
 
+static __always_inline irqentry_state_t
+irqentry_enter_from_kernel_mode(struct pt_regs *regs)
+{
+	return __irqentry_enter_from_kernel_mode(regs, false);
+}
+
 /**
  * irqentry_exit_to_kernel_mode_preempt - Run preempt checks on return to kernel mode
  * @regs:	Pointer to current's pt_regs
diff --git a/include/linux/irqflags.h b/include/linux/irqflags.h
index 5bc179a88e513..e98313a8ad307 100644
--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -64,9 +64,14 @@ do {							\
 do {						\
 	current->hardirq_threaded = 1;		\
 } while (0)
+# define lockdep_hardirq_exit_prepare()	\
+	__this_cpu_preempt_check("add")
+# define lockdep_hardirq_exit_finish()		\
+	raw_cpu_dec(hardirq_context)
 # define lockdep_hardirq_exit()			\
 do {						\
-	__this_cpu_dec(hardirq_context);	\
+	lockdep_hardirq_exit_prepare();		\
+	lockdep_hardirq_exit_finish();		\
 } while (0)
 
 # define lockdep_hrtimer_enter(__hrtimer)		\
@@ -119,6 +124,8 @@ do {						\
 # define lockdep_softirqs_enabled(p)		0
 # define lockdep_hardirq_enter()		do { } while (0)
 # define lockdep_hardirq_threaded()		do { } while (0)
+# define lockdep_hardirq_exit_prepare()	do { } while (0)
+# define lockdep_hardirq_exit_finish()		do { } while (0)
 # define lockdep_hardirq_exit()			do { } while (0)
 # define lockdep_softirq_enter()		do { } while (0)
 # define lockdep_softirq_exit()			do { } while (0)
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 28399c41ebfb1..36c43d3c76eae 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/futex.h>
+#include <linux/hardirq.h>
 #include <linux/highmem.h>
 #include <linux/irq-entry-common.h>
 #include <linux/jump_label.h>
@@ -120,6 +121,35 @@ noinstr irqentry_state_t irqentry_enter(struct pt_regs *regs)
 	return irqentry_enter_from_kernel_mode(regs);
 }
 
+/**
+ * irqentry_hardirq_enter - Establish state for ordinary hardirq entry
+ * @regs: Pointer to the interrupted register state
+ *
+ * Install the raw hardirq count before anything instrumentable can run. Then
+ * establish IRQ-disabled and hardirq lockdep state before context tracking or
+ * irqflag tracing can invoke callbacks. The caller must have distinguished an
+ * ordinary hardirq from NMI-like entry and must complete the delayed
+ * preempt-count bookkeeping with irq_enter_rcu_preempt_counted().
+ *
+ * Returns: An opaque object for the matching irqentry exit operation.
+ */
+noinstr irqentry_state_t irqentry_hardirq_enter(struct pt_regs *regs)
+{
+	__preempt_count_add(HARDIRQ_OFFSET);
+
+	if (user_mode(regs)) {
+		irqentry_state_t ret = {
+			.exit_rcu = false,
+		};
+
+		__enter_from_user_mode(regs, true);
+		rseq_note_user_irq_entry();
+		return ret;
+	}
+
+	return __irqentry_enter_from_kernel_mode(regs, true);
+}
+
 /**
  * arch_irqentry_exit_need_resched - Architecture specific need resched function
  *
diff --git a/kernel/softirq.c b/kernel/softirq.c
index be49e6469f3ad..63427d29cb6d1 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -14,6 +14,7 @@
 #include <linux/kernel_stat.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
+#include <linux/instrumentation.h>
 #include <linux/local_lock.h>
 #include <linux/mm.h>
 #include <linux/notifier.h>
@@ -353,15 +354,18 @@ static inline void ksoftirqd_run_end(void)
 static inline bool softirq_handle_begin(void) { return false; }
 static inline void softirq_handle_end(bool from_irq_exit) { }
 
-static inline bool should_wake_ksoftirqd(void)
+static __always_inline bool should_wake_ksoftirqd(void)
 {
 	return !this_cpu_read(softirq_ctrl.cnt);
 }
 
-static inline void invoke_softirq(void)
+static inline bool invoke_softirq(void)
 {
-	if (should_wake_ksoftirqd())
-		wakeup_softirqd();
+	if (!should_wake_ksoftirqd())
+		return false;
+
+	wakeup_softirqd();
+	return true;
 }
 
 #define SCHED_SOFTIRQ_MASK	BIT(SCHED_SOFTIRQ)
@@ -525,12 +529,12 @@ static inline void ksoftirqd_run_end(void)
 	local_irq_enable();
 }
 
-static inline bool should_wake_ksoftirqd(void)
+static __always_inline bool should_wake_ksoftirqd(void)
 {
 	return true;
 }
 
-static inline void invoke_softirq(void)
+static inline bool invoke_softirq(void)
 {
 	if (!force_irqthreads() || !__this_cpu_read(ksoftirqd)) {
 #ifdef CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK
@@ -548,9 +552,11 @@ static inline void invoke_softirq(void)
 		 */
 		do_softirq_own_stack();
 #endif
-	} else {
-		wakeup_softirqd();
+		return false;
 	}
+
+	wakeup_softirqd();
+	return true;
 }
 
 asmlinkage __visible void do_softirq(void)
@@ -703,13 +709,8 @@ asmlinkage __visible void __softirq_entry __do_softirq(void)
 	handle_softirqs(false);
 }
 
-/**
- * irq_enter_rcu - Enter an interrupt context with RCU watching
- */
-void irq_enter_rcu(void)
+static __always_inline void irq_enter_rcu_common(void)
 {
-	__irq_enter_raw();
-
 	/*
 	 * If this is a nested interrupt that hits the exit_to_user_mode_loop
 	 * where it has enabled interrupts but before it has hit schedule() we
@@ -724,6 +725,28 @@ void irq_enter_rcu(void)
 	account_hardirq_enter(current);
 }
 
+/**
+ * irq_enter_rcu_preempt_counted - Enter hardirq with its count already set
+ *
+ * Complete an early raw hardirq preempt-count update, then establish the
+ * remaining timer and accounting state. The matching lockdep hardirq state
+ * was established by irqentry_hardirq_enter() before entry tracing.
+ */
+void irq_enter_rcu_preempt_counted(void)
+{
+	preempt_count_add_finish(HARDIRQ_OFFSET);
+	irq_enter_rcu_common();
+}
+
+/**
+ * irq_enter_rcu - Enter an interrupt context with RCU watching
+ */
+void irq_enter_rcu(void)
+{
+	__irq_enter_raw();
+	irq_enter_rcu_common();
+}
+
 /**
  * irq_enter - Enter an interrupt context including RCU update
  */
@@ -764,8 +787,56 @@ static inline void wake_timersd(void) { }
 
 #endif
 
-static inline void __irq_exit_rcu(void)
+static __always_inline bool irq_exit_wake_ksoftirqd(void)
 {
+	if (irq_count() != HARDIRQ_OFFSET || !local_softirq_pending() ||
+	    !should_wake_ksoftirqd())
+		return false;
+
+	wakeup_softirqd();
+	return true;
+}
+
+static __always_inline bool irq_exit_wake_timersd(void)
+{
+	if (!IS_ENABLED(CONFIG_IRQ_FORCED_THREADING) || !force_irqthreads() ||
+	    !local_timers_pending_force_th() ||
+	    hardirq_count() != HARDIRQ_OFFSET)
+		return false;
+
+	wake_timersd();
+	return true;
+}
+
+enum irq_exit_wake_flags {
+	IRQ_EXIT_WAKE_KSOFTIRQD	= BIT(0),
+	IRQ_EXIT_WAKE_KTIMERD	= BIT(1),
+};
+
+static __always_inline void
+irq_exit_wake_late_softirqs(unsigned int wake_flags)
+{
+	bool ksoftirqd_wake_requested = wake_flags & IRQ_EXIT_WAKE_KSOFTIRQD;
+	bool ktimerd_wake_requested = wake_flags & IRQ_EXIT_WAKE_KTIMERD;
+
+	/*
+	 * A wakeup can be traced, and its callback can raise work for the other
+	 * worker. Check ksoftirqd, then ktimerd, then ksoftirqd again. Skip a
+	 * worker whose direct wake request was recorded above: it cannot run on
+	 * this CPU before hardirq teardown, so later work remains visible to it.
+	 */
+	if (!ksoftirqd_wake_requested)
+		ksoftirqd_wake_requested = irq_exit_wake_ksoftirqd();
+	if (!ktimerd_wake_requested)
+		ktimerd_wake_requested = irq_exit_wake_timersd();
+	if (!ksoftirqd_wake_requested && ktimerd_wake_requested)
+		irq_exit_wake_ksoftirqd();
+}
+
+static __always_inline unsigned int __irq_exit_rcu(bool keep_hardirq_count)
+{
+	unsigned int wake_flags = 0;
+
 #ifndef __ARCH_IRQ_EXIT_IRQS_DISABLED
 	local_irq_disable();
 #else
@@ -783,20 +854,51 @@ static inline void __irq_exit_rcu(void)
 		 * before enabling interrupts to run softirq.
 		 */
 		hrtimer_rearm_deferred();
-		invoke_softirq();
+		if (invoke_softirq() && keep_hardirq_count)
+			wake_flags |= IRQ_EXIT_WAKE_KSOFTIRQD;
 	}
 
 	/*
 	 * Wake the timer thread even if the interrupt hit a softirq or a
 	 * section with BHs disabled. Only the outermost interrupt can wake it.
 	 */
-	if (IS_ENABLED(CONFIG_IRQ_FORCED_THREADING) && force_irqthreads() &&
-	    local_timers_pending_force_th() &&
-	    hardirq_count() == HARDIRQ_OFFSET)
-		wake_timersd();
+	if (irq_exit_wake_timersd() && keep_hardirq_count)
+		wake_flags |= IRQ_EXIT_WAKE_KTIMERD;
 
 	tick_irq_exit();
-	preempt_count_sub(HARDIRQ_OFFSET);
+	if (!keep_hardirq_count)
+		preempt_count_sub(HARDIRQ_OFFSET);
+
+	return wake_flags;
+}
+
+/**
+ * irq_exit_rcu_preempt_counted_prepare - Process IRQ exit and prepare teardown
+ *
+ * The caller established hardirq state before instrumentable IRQ entry. Keep
+ * that state through every traceable part of IRQ exit, then prepare its raw
+ * teardown. The caller must apply the raw teardown immediately after return.
+ *
+ * Return callbacks can raise regular or forced-thread timer softirqs after
+ * __irq_exit_rcu() performed its final drain and worker wakeups. Recheck both
+ * queues after all traceable preparation. Worker wakeups are traceable too,
+ * so order the rechecks such that a callback which raises work for the other
+ * worker cannot leave it asleep. Do not repeat a direct worker wake
+ * recorded by __irq_exit_rcu(); the worker cannot run on this CPU before
+ * hardirq teardown.
+ */
+bool noinstr irq_exit_rcu_preempt_counted_prepare(void)
+{
+	unsigned int wake_flags;
+	bool do_sub;
+
+	instrumentation_begin();
+	wake_flags = __irq_exit_rcu(true);
+	do_sub = irqentry_hardirq_exit_prepare();
+	irq_exit_wake_late_softirqs(wake_flags);
+	instrumentation_end();
+
+	return do_sub;
 }
 
 /**
@@ -806,7 +908,7 @@ static inline void __irq_exit_rcu(void)
  */
 void irq_exit_rcu(void)
 {
-	__irq_exit_rcu();
+	__irq_exit_rcu(false);
 	 /* must be last! */
 	lockdep_hardirq_exit();
 }
@@ -818,7 +920,7 @@ void irq_exit_rcu(void)
  */
 void irq_exit(void)
 {
-	__irq_exit_rcu();
+	__irq_exit_rcu(false);
 	ct_irq_exit();
 	 /* must be last! */
 	lockdep_hardirq_exit();
-- 
2.39.5 (Apple Git-154)

