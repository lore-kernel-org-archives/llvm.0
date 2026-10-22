Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646250;
	b=Ugu9yReJf/9Ao7OgqxjTUK2qfTIrZvQFm7VkwleTdo705DaHHQdXPE1O6ekH3r5aj7MY
	 IhgXb1rsyZr9nD0HyLcah/d2t7U1Ch2zLnsdV25aJFD/Dz8Q1VpRy8TGcgI2Eq6krPwsd
	 fjaraI/RBJPEOzzmIePefYuialb3tLWGHAqn3Hu1ec0eyyD20a3Cl6wynZMFAyunRPhea
	 8r1QhLHwdraWuBZSR8JQXrCEzj4tQsmexsdq1Gul04vq9k5ooTCF3IpZMt812ycXbcAgg
	 XrCzHV7JqmIeovC2v8Pz33WcIq5x7XcsvwCovK34Dk071+awhHvFAXtNF6FvX/eevPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jtc1fVPemAMqEoN4axaTKj+FevgUODBLdLJA6bSk8XM=;
	b=ZUj9O76GmUlwF5hMXB6XJp/oESaPCsvyTAcLbXby2N7STh0zdZFg8jeRRNn+XLtMAf2j
	 hmEz3ycTG3HziUPjQqOp2PCnD13nxcB0dfna/XLpbfCrCmwoqmdjHozdSO80JodkONAtp
	 7uzzc8ctLXwQG4hp+hT4z10ohDDcFVy3oty7G0GMKd+e7A74qEprdxHJpiZt2FXp00Ik4
	 mr6+eD5g9v8EMOFHEkwnEl9TqOkleQTRXbidWnAO0Vk6OAXPyPg/P3kmpWKodf2UGVo7T
	 SaOgewQxX448f4JK7FrnKsaOgv/3p14C/qJgXrnKg9ZN+Uk0J2whdE3DCF4lWxBaZbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FTSp5NV+;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4E1606A338
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 05:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4E1606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FTSp5NV+
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1e477fe16so8190455e9.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646248; x=1793251048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jtc1fVPemAMqEoN4axaTKj+FevgUODBLdLJA6bSk8XM=;
        b=FTSp5NV+7GIxV0357krb2gCLXc7f1nU5TYcqIFkoe96l2DbF6y1/aE/u0Ll4JiNrGE
         iXWwh6ISSOZbtzBCISt6w3uoSZp7JYzvYI/Y3Z/1dvrAzoirRAjB6MikwL/kqDhiqg3r
         6zmPF0z/MdcDPWXdjxXQeNq3yj9G4VQlhxsEnnPXcL1C09whpd26e/9o1rkC39SQfjvm
         MmDuNlnslnaD4QMl/wyz0CEjKi2SR0pvvkw3Edhi6tEGW8FtNth/rd8/588A26zv1TgP
         qo46bbPpFjufI5xPwGBkWLH25q45x8cwELvKFIgEr6JgBsUxdbsEWTZkElCJ+TFLvzEg
         DnVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646248; x=1793251048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jtc1fVPemAMqEoN4axaTKj+FevgUODBLdLJA6bSk8XM=;
        b=0e5xxUkwxf1t1vxLMgWkI3B44OYYIzeL0qL8S+Wg4gWgJpd7oRC0Bwtbj9OAzM3JeY
         LqlHxS7K3x6i4ib/3CVTPrxLuo49DHc9bq8TZPzYv9YEF7u124Lj/LxVUGiv8/qD1Bh9
         zjoO6YtZ+K2VmVKXhDInibnWUrZ0gdLPpo4QQG5OdmC8jl3yGlDxr9fiXDGZcQYtFcBY
         k2xdR1AuIG4HNLITUK6L8eKMeQqsU4ipJgP57dAU4YFYA5WxagnHMXUvvTIY+lUf6zwu
         8GrjT53c1fn06GMROipOJKtgo3SswenYzjNZLsXXwiqnoJqIZPlNWp3Tao/nEYSnWFv0
         eSFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxF4HtvZ62Ev0+UwdkRqjnWseJBxee4GO6DGcMkJZ1wLyWfTCqEKGlQTgjdnjDRpOFkT3IY@lists.linux.dev
X-Gm-Message-State: AFq9FYL166+f+Yo2stSkwkVKsBCGqgt+nk8KNn3IIkuyUwFe9ghVwdin
	TQBoTweui4Ox27RZVoD44573ftp3TPzjygWRoqB8VPngN/RW9GoelER9
X-Gm-Gg: AYBFou2XxU5crr3PSvk6pWDO3VsyKHnNd7EEBueZJMZp/zfdPKitNo5f/+L3ZVmZLWW
	Pi1WFRzhuVuajCTPkYPi0BeOrIOrJrwWKflaXess3xKjRU+OHTcJ4QZ5ps8hl/tskTKO8O2qEbH
	lK980j94QtYc7rq8hpNOaIRYanweLJhuYifvkSl6ktHOuHkqsLiw8BLY/hJsHalgDsf7T4ggyWw
	NODMx0diS+FE6x9N20HbVDn4iaNq7eBvJetpeOoeLXYjOqSR+PoaR/Qpne2L/P95Sonh2Xr4xe8
	8g18GDBdIQihSNEC5hafpvDUq0jZ8E+C6pXH9WPU5U4tVgZ+gFS/Ii+YF6cJ5j2ziZk+h8HY05o
	LxS9NdxtYqbenyd55LfRu7V6E4z7MfnDnKuAGmv9GksPnl6HU2YJlsPkFm3dfCQLlWbKyGUw+sP
	v5IYPWGa8C5BLW4sBAKY+wY2fIa/UQwDfxO30Yxz/Biwy7m9FvpwDYemK3AnT4+coTYM2zyf+nM
	fHkOH4xX8qx/GALYYUWsTcFNbMWbrvP2ZI0wvyv1HvlRZqcrVMSqUVE4Jkv5vKLFDfzkdaOwea5
	YlAqQZ8EvcrzQYz+3aJLYjN/cQSdEYH/z+mXgZ64nc9dwuk9WUGTfmVqOatdMZrsI0UfCiX2fmd
	li/PrLLogTy8VrXpAwz4lHzsDPks7rUr2gi8yQ4yEg3KrNtMam7Fg1gja8mM=
X-Received: by 2002:a05:600c:1d0f:b0:4a1:fbd5:26b0 with SMTP id 5b1f17b1804b1-4a1fdd15af8mr85822205e9.12.1792646247844;
        Wed, 21 Oct 2026 22:17:27 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:27 -0700 (PDT)
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
Subject: [RFC PATCH 05/12] context_tracking: Split IRQ-exit preparation from the EQS transition
Date: Thu, 22 Oct 2026 07:16:47 +0200
Message-Id: <20261022051654.79224-6-kmehltretter@gmail.com>
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

ct_irq_exit() combines traceable nesting and tracepoint work with the final
transition to an RCU extended quiescent state. A pre-counted ordinary
hardirq return needs to run that preparation before its synthetic hardirq
classification is removed, but it must enter the quiescent state only after
the raw count and lockdep teardown.

Split IRQ exit into prepare and finish phases. The prepare phase validates
and updates interrupt nesting, then emits the tracepoint while RCU is
watching. The finish phase performs the raw quiescent-state transition and
RCU Tasks bookkeeping.

Keep ct_irq_exit() and ct_nmi_exit() as adjacent prepare and finish
wrappers. Existing IRQ and NMI callers retain their ordering and behavior.

Assisted-by: LLM
---
 include/linux/context_tracking_irq.h | 32 +++++++++++-
 kernel/context_tracking.c            | 78 ++++++++++++++++++++++------
 2 files changed, 93 insertions(+), 17 deletions(-)

diff --git a/include/linux/context_tracking_irq.h b/include/linux/context_tracking_irq.h
index 197916ee91a4b..b038cd1249148 100644
--- a/include/linux/context_tracking_irq.h
+++ b/include/linux/context_tracking_irq.h
@@ -2,8 +2,23 @@
 #ifndef _LINUX_CONTEXT_TRACKING_IRQ_H
 #define _LINUX_CONTEXT_TRACKING_IRQ_H
 
+#include <linux/types.h>
+
+/**
+ * struct ct_irq_exit_state - Opaque context-tracking IRQ-exit state
+ * @exit_rcu: The interrupted context was in an RCU extended quiescent state
+ *
+ * This object is filled in by ct_irq_exit_prepare() and must be passed to the
+ * matching ct_irq_exit_finish(). Callers must consider its members private.
+ */
+struct ct_irq_exit_state {
+	bool exit_rcu;
+};
+
 #ifdef CONFIG_CONTEXT_TRACKING_IDLE
 void ct_irq_enter(void);
+struct ct_irq_exit_state ct_irq_exit_prepare(void);
+void ct_irq_exit_finish(struct ct_irq_exit_state state);
 void ct_irq_exit(void);
 void ct_irq_enter_irqson(void);
 void ct_irq_exit_irqson(void);
@@ -11,7 +26,22 @@ void ct_nmi_enter(void);
 void ct_nmi_exit(void);
 #else
 static __always_inline void ct_irq_enter(void) { }
-static __always_inline void ct_irq_exit(void) { }
+static __always_inline struct ct_irq_exit_state ct_irq_exit_prepare(void)
+{
+	return (struct ct_irq_exit_state) { };
+}
+
+static __always_inline void ct_irq_exit_finish(struct ct_irq_exit_state state)
+{
+	(void)state;
+}
+
+static __always_inline void ct_irq_exit(void)
+{
+	struct ct_irq_exit_state state = ct_irq_exit_prepare();
+
+	ct_irq_exit_finish(state);
+}
 static inline void ct_irq_enter_irqson(void) { }
 static inline void ct_irq_exit_irqson(void) { }
 static __always_inline void ct_nmi_enter(void) { }
diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index a743e7ffa6c00..80ed8ec606c6a 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -169,20 +169,10 @@ static void noinstr ct_kernel_enter(bool user, int offset)
 	instrumentation_end();
 }
 
-/**
- * ct_nmi_exit - inform RCU of exit from NMI context
- *
- * If we are returning from the outermost NMI handler that interrupted an
- * RCU-idle period, update ct->state and ct->nmi_nesting
- * to let the RCU grace-period handling know that the CPU is back to
- * being RCU-idle.
- *
- * If you add or remove a call to ct_nmi_exit(), be sure to test
- * with CONFIG_RCU_EQS_DEBUG=y.
- */
-void noinstr ct_nmi_exit(void)
+static struct ct_irq_exit_state noinstr __ct_nmi_exit_prepare(void)
 {
 	struct context_tracking *ct = this_cpu_ptr(&context_tracking);
+	struct ct_irq_exit_state state = { };
 
 	instrumentation_begin();
 	/*
@@ -203,7 +193,7 @@ void noinstr ct_nmi_exit(void)
 		WRITE_ONCE(ct->nmi_nesting, /* No store tearing. */
 			   ct_nmi_nesting() - 2);
 		instrumentation_end();
-		return;
+		return state;
 	}
 
 	/* This NMI interrupted an RCU-idle CPU, restore RCU-idleness. */
@@ -213,6 +203,15 @@ void noinstr ct_nmi_exit(void)
 	// instrumentation for the noinstr ct_kernel_exit_state()
 	instrument_atomic_write(&ct->state, sizeof(ct->state));
 	instrumentation_end();
+	state.exit_rcu = true;
+
+	return state;
+}
+
+static void noinstr __ct_nmi_exit_finish(struct ct_irq_exit_state state)
+{
+	if (!state.exit_rcu)
+		return;
 
 	// RCU is watching here ...
 	ct_kernel_exit_state(CT_RCU_WATCHING);
@@ -222,6 +221,24 @@ void noinstr ct_nmi_exit(void)
 		rcu_task_exit();
 }
 
+/**
+ * ct_nmi_exit - inform RCU of exit from NMI context
+ *
+ * If we are returning from the outermost NMI handler that interrupted an
+ * RCU-idle period, update ct->state and ct->nmi_nesting
+ * to let the RCU grace-period handling know that the CPU is back to
+ * being RCU-idle.
+ *
+ * If you add or remove a call to ct_nmi_exit(), be sure to test
+ * with CONFIG_RCU_EQS_DEBUG=y.
+ */
+void noinstr ct_nmi_exit(void)
+{
+	struct ct_irq_exit_state state = __ct_nmi_exit_prepare();
+
+	__ct_nmi_exit_finish(state);
+}
+
 /**
  * ct_nmi_enter - inform RCU of entry to NMI context
  *
@@ -348,7 +365,35 @@ noinstr void ct_irq_enter(void)
 }
 
 /**
- * ct_irq_exit - inform RCU that current CPU is exiting irq towards idle
+ * ct_irq_exit_prepare - prepare to exit an IRQ towards idle
+ *
+ * Perform the traceable part of an IRQ exit and return an opaque object for
+ * ct_irq_exit_finish(). RCU remains watching until the matching finish call.
+ * The caller must keep interrupts disabled, must not schedule or migrate, and
+ * must invoke ct_irq_exit_finish() exactly once.
+ *
+ * Return: An opaque object to pass to ct_irq_exit_finish().
+ */
+struct ct_irq_exit_state noinstr ct_irq_exit_prepare(void)
+{
+	lockdep_assert_irqs_disabled();
+	return __ct_nmi_exit_prepare();
+}
+
+/**
+ * ct_irq_exit_finish - finish exiting an IRQ towards idle
+ * @state: Return value from the matching ct_irq_exit_prepare()
+ *
+ * Complete a pending transition to an RCU extended quiescent state. Nothing
+ * traceable may run between this function and the low-level return path.
+ */
+void noinstr ct_irq_exit_finish(struct ct_irq_exit_state state)
+{
+	__ct_nmi_exit_finish(state);
+}
+
+/**
+ * ct_irq_exit - inform RCU that current CPU is exiting IRQ towards idle
  *
  * Exit from an interrupt handler, which might possibly result in entering
  * idle mode, in other words, leaving the mode in which read-side critical
@@ -368,8 +413,9 @@ noinstr void ct_irq_enter(void)
  */
 noinstr void ct_irq_exit(void)
 {
-	lockdep_assert_irqs_disabled();
-	ct_nmi_exit();
+	struct ct_irq_exit_state state = ct_irq_exit_prepare();
+
+	ct_irq_exit_finish(state);
 }
 
 /*
-- 
2.39.5 (Apple Git-154)

