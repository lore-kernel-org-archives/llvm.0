Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158325;
	b=bVktnzKZ4oTRGVyz5nm+yes9LFBXFTx3AnW/Fwd1Eb7uPLOwKeNUE6E8thMC5Y1T5FhM
	 HnrM9Q0zU2OA/2kgTUK0ndW3Ab82AHmc74Twlzf8rgA90fHLrMGXwCica0nQD1QrgYKBX
	 q+eVAebnuH3g5lx9hgSbLbYea9oDeFGlgXW864OmK+fNcaQf08XNSP5Ad774UNpBK+iAH
	 NizQK6fpAF5466L0a38YvLEy4a6CeTlYexYqUkwsU92QtAUfmTYTYTOAuVhdl8L8Dr5rg
	 tvJq3ZL4osY8QW0OtoxL8vMuHar1gaXHigZ/Yo/ZTg4qvi8T6+lq1Rbwu8rrnBaz98g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jtc1fVPemAMqEoN4axaTKj+FevgUODBLdLJA6bSk8XM=;
	b=Y/1ONtS5DGqyngwA0LmtufacxgeyixSNqTnYsbwl9F6jPCZfpfgzcbEQwg9pOXDikjpi
	 E5xjZPqszcVeoGo05dRbniE7fqJVumAlsZoQ35N3bsG2wtGQxz2Arh+MK2vbolJ12VKoD
	 dQ5peRcuGbovAVmPuCyLXlXOsdJfnoH8EuAhI8hbDITYqQ0/KI4qDBn0wtR/BeejZi+ng
	 G/ofZHnu0sDxSt2CkYG6IPdIL9u18fDX26Xly7xFxW3PFVypWXJ2SdHGotPriXeQzS/CS
	 tXbkL8TiaGzeqdh0GKHoSRu5I2kB18B+ZC/rK+NkFdKsb5cw2+W4HjtgKYTkqyULP5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZlS5Cri;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B91606A327
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 03:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B91606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DZlS5Cri
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso3958875e9.1
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 20:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158322; x=1793763122; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jtc1fVPemAMqEoN4axaTKj+FevgUODBLdLJA6bSk8XM=;
        b=DZlS5Cri/BpN9iTMzyE6Dp/cl862gKoAF/15qieH8ZeDTV76cInsZoGXdaeWl3MldH
         BWqvOsaxe3LptQwq7IDkHVBmhe7b4BNbHePN+byJF00zWAO/ELkTNywk29EP+J68UB20
         zdEh9rYH8hkoCVjPOPgav570Q8RpFJw3Ec1zPemlj7+KncnYp1CKtKDKKUGLPG3+v7rt
         GV5r1GzTPUwXfJw1b8NDd+l6w8fvdJl4bjTs+t6ua57twL6NcIEhbTUYkgNU4MSkwiSv
         BeMhSjiH/AKhIXl51T1INAOOzCaef846oYAg8amkKG2uvpmTOEQJEC7dbkiM6/TYm+7a
         Tnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158322; x=1793763122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jtc1fVPemAMqEoN4axaTKj+FevgUODBLdLJA6bSk8XM=;
        b=DegnDGpu9mhYniGD0Ajn+SQvUV5YA2VXRfKtQWuu/9pUnf9PEnVzwcPZPcEu4VwPoO
         sTh2XKHNilUMz38Dk+xfievpE9jQHU4H82S6+xfgRCEiY2ZEjBpT7hfYiX49WSlklCS/
         WRJrHWMmWYZZVKfuPT5+dsp65OALjAd4NxTaQQm61XUwCptp/WEjSMcocHhjggTZhqaC
         KBCF6c8VlVtNLghV8+WFQkBd6+Nlxp6YX1kTQR6ODo1Mn43opM95z6dfwVC5NxLX+xl5
         c5Vp2g8OBY+7iSe9g0xT9L+LhkMIrgMiJLokLu51vsnX0MlbZcRep31ZIJwES2C5OGe1
         LOEw==
X-Forwarded-Encrypted: i=1; AKwUvByUYMMhFHASNA/YmPq/ZcKysAFvDIFOu79YtHUUG5pHo2351koJtEYP8VOIPWJS3hVbgoHs@lists.linux.dev
X-Gm-Message-State: AFq9FYI/LlmuogITvMK07A46XdY3MzctX/6TSC+XrvKDdFZQICwE6d86
	Z/i7DtWMB+/BLU36iMpQ734qWchPIh6l4MLMw/2wopryLm2vAFeIcBcx
X-Gm-Gg: AYBFou0NbphuepIS1ouJrDN5ucqMWXgd+bUWYVpsuZ/+DAXPcjZHOIYrO5ny6l3V4q/
	clDyBAhIptMbYuOJy8CMMj0KCappNb3VdAlsxS8s1pfHLcSBU7NMaUMuiO/YmbOwYpIgfcZRu2X
	fnO+RC77YE7j6hB9TF1QmMh1Pc6v4wqk26InQJFpCdLpJMosbjy2qVwsqdYgtGDwyHyfUkK8IOd
	KODN1mVO7PpAbSuKSOfy3crEAhZA1z5gk2DhxsFBtPfR4xQe710YWUvJELCDOUhiWnqa0jYg9xY
	UICTxpZ4r6K5Ty0hcOHKk7/BpJQeURj1lQyq61Y8z8m76XYelIm/BV08AOhpKW5rHQX2RmekDH7
	pa5lBGGJvaA6AO1ZD9fyqm5cFopIzLc6hw1b0HjdwMZcTqyJQPnK8aMu/L//yXPS+FbgbBGy8zL
	P+P+6zr54p9ntsiMumWTM2zxWeSjE5G22xgaj4KkvPO7b0cD3Vv0SJad8llU/hr4vmq/xzwkmQ0
	5ez0RV1JhZr7GvEAYbav4u8dDDCyXTb5WGKIFAcYmVNrAMYiQjiO2fCNWvcEv9gELWnQV3WeoAe
	G01wYqI4IDfhN2lqu8Ng35JiVb8B9mgX+bNQijXTm/yLP19RP6ZtdifIisYQo3BWZhTyd+xfxPD
	ISG9l36EClaXetC2N2rtUPkaSY8XNPk1zTDbJqn/v1NSEOyKQq/Oa19lR++Rcg5C0gsgbZllsMW
	BJOYiTwU7tHKy87gvueCbtjH7t3dlRQsdZ
X-Received: by 2002:a05:600c:a314:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4a96b29d208mr13460435e9.18.1793158322397;
        Tue, 27 Oct 2026 20:32:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:01 -0700 (PDT)
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
Subject: [RFC PATCH v2 07/13] context_tracking: Split IRQ-exit preparation from the EQS transition
Date: Wed, 28 Oct 2026 04:31:21 +0100
Message-Id: <20261028033127.82193-8-kmehltretter@gmail.com>
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

